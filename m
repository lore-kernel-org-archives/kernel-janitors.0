From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 02:59:18 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/cdrom/mcdx.c: replace
Message-Id: <20051023025918.GF2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94881500502313787=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94881500502313787==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/cdrom/mcdx.c: replace interruptible_sleep_on() with
wait_event_interruptible() and schedule_timeout_interruptible(). Removed
sleepq wait_queue, since it's no longer needed. Reordered some conditional
prints because wait_event_interruptible_timeout() returns -ERESTARTSYS when
interrupted by a signal.

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/cdrom/mcdx.c mod/drivers/cdrom/mcdx.c
--- 2.6.14-rc5/drivers/cdrom/mcdx.c	2005-09-16 20:02:12.000000000 -0500
+++ mod/drivers/cdrom/mcdx.c	2005-10-22 21:30:09.000000000 -0500
@@ -155,7 +155,6 @@ struct s_drive_stuff {
 	/* waitqueues */
 	wait_queue_head_t busyq;
 	wait_queue_head_t lockq;
-	wait_queue_head_t sleepq;
 
 	/* flags */
 	volatile int introk;	/* status of last irq operation */
@@ -838,8 +837,8 @@ static void mcdx_delay(struct s_drive_st
 	if (jifs < 0)
 		return;
 
-	xtrace(SLEEP, "*** delay: sleepq\n");
-	interruptible_sleep_on_timeout(&stuff->sleepq, jifs);
+	xtrace(SLEEP, "*** delay: %ld jiffies\n", jifs);
+	schedule_timeout_interruptible(jifs);
 	xtrace(SLEEP, "delay awoken\n");
 	if (signal_pending(current)) {
 		xtrace(SLEEP, "got signal\n");
@@ -909,7 +908,7 @@ static int mcdx_talk(struct s_drive_stuf
 
 	while (stuffp->lock) {
 		xtrace(SLEEP, "*** talk: lockq\n");
-		interruptible_sleep_on(&stuffp->lockq);
+		wait_event_interruptible(stuffp->lockq, !stuffp->lock);
 		xtrace(SLEEP, "talk: awoken\n");
 	}
 
@@ -1115,7 +1114,6 @@ static int __init mcdx_init_drive(int dr
 
 	init_waitqueue_head(&stuffp->busyq);
 	init_waitqueue_head(&stuffp->lockq);
-	init_waitqueue_head(&stuffp->sleepq);
 
 	/* check if i/o addresses are available */
 	if (!request_region(stuffp->wreg_data, MCDX_IO_SIZE, "mcdx")) {
@@ -1335,7 +1333,7 @@ static int mcdx_xfer(struct s_drive_stuf
 	}
 
 	while (stuffp->lock) {
-		interruptible_sleep_on(&stuffp->lockq);
+		wait_event_interruptible(stuffp->lockq, !stuffp->lock);
 	}
 
 	if (stuffp->valid && (sector >= stuffp->pending)
@@ -1360,16 +1358,16 @@ static int mcdx_xfer(struct s_drive_stuf
 			while (stuffp->busy) {
 
 				timeout =
-				    interruptible_sleep_on_timeout
-				    (&stuffp->busyq, 5 * HZ);
+				    wait_event_interruptible_timeout
+				    (stuffp->busyq, !stuffp->busy, 5 * HZ);
 
 				if (!stuffp->introk) {
 					xtrace(XFER,
 					       "error via interrupt\n");
-				} else if (!timeout) {
-					xtrace(XFER, "timeout\n");
 				} else if (signal_pending(current)) {
 					xtrace(XFER, "signal\n");
+				} else if (!timeout) {
+					xtrace(XFER, "timeout\n");
 				} else
 					continue;
 
 



--===============94881500502313787==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94881500502313787==--
