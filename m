From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 22:12:26 +0000
Subject: [KJ] [PATCH 16/20] cdrom/mcdx: remove
Message-Id: <20050202221226.GV2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69789400516919198=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69789400516919198==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Remove deprecated interruptible_sleep_on_timeout() function calls
and replace with direct wait-queue usage or wait_event() as appropriate. The
former replacements result in the same code. The latter change the tasks from
interruptible to uninterruptible, as signals were not being checked in the
current code. The corresponding wake_up() calls were fixed as well. This patch
will result in some slightly different debug output (for instance, one output
instead of one per iteration). Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/cdrom/mcdx.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/cdrom/mcdx.c	2005-02-01 14:29:00.000000000 -0800
@@ -68,6 +68,7 @@ static const char *mcdx_c_version
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/init.h>
+#include <linux/wait.h>
 #include <asm/io.h>
 #include <asm/current.h>
 #include <asm/uaccess.h>
@@ -841,8 +842,11 @@ static void mcdx_delay(struct s_drive_st
 	if (jifs < 0)
 		return;
 
+	DEFINE_WAIT(wait);
 	xtrace(SLEEP, "*** delay: sleepq\n");
-	interruptible_sleep_on_timeout(&stuff->sleepq, jifs);
+	prepare_to_wait(&stuff->sleepq, &wait, TASK_INTERRUPTIBLE);
+	schedule_timeout(jifs);
+	finish_wait(&stuff->sleepq, &wait);
 	xtrace(SLEEP, "delay awoken\n");
 	if (signal_pending(current)) {
 		xtrace(SLEEP, "got signal\n");
@@ -910,11 +914,9 @@ static int mcdx_talk(struct s_drive_stuf
 	if ((discard = (buffer == NULL)))
 		buffer = &c;
 
-	while (stuffp->lock) {
-		xtrace(SLEEP, "*** talk: lockq\n");
-		interruptible_sleep_on(&stuffp->lockq);
-		xtrace(SLEEP, "talk: awoken\n");
-	}
+	xtrace(SLEEP, "*** talk: lockq\n");
+	wait_event(stuffp->lockq, !stuffp->lock);
+	xtrace(SLEEP, "talk: awoken\n");
 
 	stuffp->lock = 1;
 
@@ -1001,7 +1003,7 @@ static int mcdx_talk(struct s_drive_stuf
 #endif
 
 	stuffp->lock = 0;
-	wake_up_interruptible(&stuffp->lockq);
+	wake_up(&stuffp->lockq);
 
 	xtrace(TALK, "talk() done with 0x%02x\n", st);
 	return st;
@@ -1327,6 +1329,7 @@ static int mcdx_xfer(struct s_drive_stuf
 	Return:	-1 on timeout or other error
 			else status byte (as in stuff->st) */
 {
+	DEFINE_WAIT(wait);
 	int border;
 	int done = 0;
 	long timeout;
@@ -1341,9 +1344,7 @@ static int mcdx_xfer(struct s_drive_stuf
 		return -1;
 	}
 
-	while (stuffp->lock) {
-		interruptible_sleep_on(&stuffp->lockq);
-	}
+	wait_event(stuffp->lockq, !stuffp->lock);
 
 	if (stuffp->valid && (sector >= stuffp->pending)
 	    && (sector < stuffp->low_border)) {
@@ -1365,10 +1366,10 @@ static int mcdx_xfer(struct s_drive_stuf
 		do {
 
 			while (stuffp->busy) {
-
-				timeout =
-				    interruptible_sleep_on_timeout
-				    (&stuffp->busyq, 5 * HZ);
+				prepare_to_wait(&stuffp->busyq, &wait,
+						TASK_INTERRUPTIBLE);
+				timeout = schedule_timeout(5*HZ);
+				finish_wait(&stuffp->busyq, &wait);
 
 				if (!stuffp->introk) {
 					xtrace(XFER,
@@ -1384,7 +1385,7 @@ static int mcdx_xfer(struct s_drive_stuf
 				stuffp->busy = 0;
 				stuffp->valid = 0;
 
-				wake_up_interruptible(&stuffp->lockq);
+				wake_up(&stuffp->lockq);
 				xtrace(XFER, "transfer() done (-1)\n");
 				return -1;
 			}
@@ -1420,7 +1421,7 @@ static int mcdx_xfer(struct s_drive_stuf
 		} while (++(stuffp->pending) < border);
 
 		stuffp->lock = 0;
-		wake_up_interruptible(&stuffp->lockq);
+		wake_up(&stuffp->lockq);
 
 	} else {
 

--===============69789400516919198==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69789400516919198==--
