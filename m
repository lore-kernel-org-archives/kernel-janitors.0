From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:03:13 +0000
Subject: [Kernel-janitors] [PATCH] pcmcia/ds: replace schedule_timeout()
Message-Id: <20040727220313.GY3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63929172070291296=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63929172070291296==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/pcmcia/ds.c	2004-06-16 05:19:44.000000000 +0000
+++ linux-dev/drivers/pcmcia/ds.c	2004-07-15 23:12:40.000000000 +0000
@@ -50,6 +50,7 @@
 #include <linux/poll.h>
 #include <linux/pci.h>
 #include <linux/list.h>
+#include <linux/delay.h>
 #include <linux/workqueue.h>
 
 #include <asm/atomic.h>
@@ -1078,8 +1079,7 @@ static int __devinit pcmcia_bus_add_sock
 	 * Ugly. But we want to wait for the socket threads to have started up.
 	 * We really should let the drivers themselves drive some of this..
 	 */
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(HZ/4);
+	msleep(250);
 
 	init_waitqueue_head(&s->queue);
 	init_waitqueue_head(&s->request);

--===============63929172070291296==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63929172070291296==--
