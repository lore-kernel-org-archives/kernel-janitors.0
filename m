From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 19:35:29 +0000
Subject: [KJ] [PATCH] net/ibmtr: remove sleep_on*() usage
Message-Id: <20050126193529.GC3593@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88248248403653684=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88248248403653684==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Directly use wait-queues instead of the deprecated
sleep_on_timeout(). Since the sleep in this function is unconditional,
wait_event_timeout() does not appear to be appropriate.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc2-kj-v/drivers/net/tokenring/ibmtr.c	2005-01-26 11:19:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/net/tokenring/ibmtr.c	2005-01-26 10:44:07.000000000 -0800
@@ -109,6 +109,7 @@ in the event that chatty debug messages 
 
 #include <linux/module.h>
 #include <linux/delay.h>
+#include <linux/wait.h>
 
 #ifdef PCMCIA		/* required for ibmtr_cs.c to build */
 #undef MODULE		/* yes, really */
@@ -847,6 +848,7 @@ static int __devinit trdev_init(struct n
 
 static int tok_init_card(struct net_device *dev)
 {
+	DEFINE_WAIT(wait);
 	struct tok_info *ti;
 	short PIOaddr;
 	unsigned long i;
@@ -867,7 +869,9 @@ static int tok_init_card(struct net_devi
 		writeb(SRPR_ENABLE_PAGING,ti->mmio+ACA_OFFSET+ACA_RW+SRPR_EVEN);
 #endif
 	writeb(INT_ENABLE, ti->mmio + ACA_OFFSET + ACA_SET + ISRP_EVEN);
-	i = sleep_on_timeout(&ti->wait_for_reset, 4 * HZ);
+	prepare_to_wait(&ti->wait_for_reset, &wait, TASK_UNINTERRUPTIBLE);
+	i = schedule_timeout(4*HZ);
+	finish_wait(&ti->wait_for_reset, &wait);
 	return i? 0 : -EAGAIN;
 }
 

--===============88248248403653684==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88248248403653684==--
