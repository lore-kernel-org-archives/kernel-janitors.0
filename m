From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 21:28:42 +0000
Subject: [KJ] [PATCH 8/22] char/hvsi: use wait_event_timeout()
Message-Id: <20050117212842.GJ24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2781807777887968=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2781807777887968==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. This is my first wait-queue related patch, so comments
are very welcome.

Description: Use wait_event_timeout() in place of custom wait-queue code. The
code is not changed in any way (I don't think), but is cleaned up quite a bit
(will get expanded to almost identical code).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/char/hvsi.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/char/hvsi.c	2005-01-17 13:26:09.000000000 -0800
@@ -44,6 +44,7 @@
 #include <linux/sysrq.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
+#include <linux/wait.h>
 #include <asm/hvcall.h>
 #include <asm/hvconsole.h>
 #include <asm/prom.h>
@@ -631,28 +632,11 @@ static int __init poll_for_state(struct 
 /* wait for irq handler to change our state */
 static int wait_for_state(struct hvsi_struct *hp, int state)
 {
-	unsigned long end_jiffies = jiffies + HVSI_TIMEOUT;
-	unsigned long timeout;
 	int ret = 0;
 
-	DECLARE_WAITQUEUE(myself, current);
-	set_current_state(TASK_INTERRUPTIBLE);
-	add_wait_queue(&hp->stateq, &myself);
-
-	for (;;) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		if (hp->state == state)
-			break;
-		timeout = end_jiffies - jiffies;
-		if (time_after(jiffies, end_jiffies)) {
-			ret = -EIO;
-			break;
-		}
-		schedule_timeout(timeout);
-	}
-	remove_wait_queue(&hp->stateq, &myself);
-	set_current_state(TASK_RUNNING);
-
+	if(!wait_event_timeout(hp->stateq, (hp->state == state), jiffies + HVSI_TIMEOUT))
+		ret = -EIO;
+	
 	return ret;
 }
 
@@ -868,24 +852,7 @@ static int hvsi_open(struct tty_struct *
 /* wait for hvsi_write_worker to empty hp->outbuf */
 static void hvsi_flush_output(struct hvsi_struct *hp)
 {
-	unsigned long end_jiffies = jiffies + HVSI_TIMEOUT;
-	unsigned long timeout;
-
-	DECLARE_WAITQUEUE(myself, current);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	add_wait_queue(&hp->emptyq, &myself);
-
-	for (;;) {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		if (hp->n_outbuf <= 0)
-			break;
-		timeout = end_jiffies - jiffies;
-		if (time_after(jiffies, end_jiffies))
-			break;
-		schedule_timeout(timeout);
-	}
-	remove_wait_queue(&hp->emptyq, &myself);
-	set_current_state(TASK_RUNNING);
+	wait_event_timeout(hp->emptyq, (hp->n_outbuf <= 0), jiffies + HVSI_TIMEOUT);
 
 	/* 'writer' could still be pending if it didn't see n_outbuf = 0 yet */
 	cancel_delayed_work(&hp->writer);

--===============2781807777887968==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2781807777887968==--
