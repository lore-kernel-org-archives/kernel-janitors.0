From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 21:27:26 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 28/33] char/synclink: replace
Message-Id: <20040916212726.GV1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59725705457134448=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============59725705457134448==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/synclink.c	2004-09-13 17:15:49.000000000 -0700
+++ 2.6.9-rc2/drivers/char/synclink.c	2004-09-16 14:23:54.000000000 -0700
@@ -82,6 +82,7 @@
 #include <linux/ioport.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 
 #include <linux/netdevice.h>
 
@@ -3246,8 +3247,7 @@ static void mgsl_close(struct tty_struct
 	
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	}
@@ -3313,8 +3313,7 @@ static void mgsl_wait_until_sent(struct 
 	if ( info->params.mode == MGSL_MODE_HDLC ||
 		info->params.mode == MGSL_MODE_RAW ) {
 		while (info->tx_active) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(char_time);
+			msleep_interruptible(jiffies_to_msecs(char_time));
 			if (signal_pending(current))
 				break;
 			if (timeout && time_after(jiffies, orig_jiffies + timeout))
@@ -3323,8 +3322,7 @@ static void mgsl_wait_until_sent(struct 
 	} else {
 		while (!(usc_InReg(info,TCSR) & TXSTATUS_ALL_SENT) &&
 			info->tx_enabled) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(char_time);
+			msleep_interruptible(jiffies_to_msecs(char_time));
 			if (signal_pending(current))
 				break;
 			if (timeout && time_after(jiffies, orig_jiffies + timeout))
@@ -7193,8 +7191,7 @@ BOOLEAN mgsl_irq_test( struct mgsl_struc
 
 	EndTime=100;
 	while( EndTime-- && !info->irq_occurred ) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(msecs_to_jiffies(10));
+		msleep_interruptible(10);
 	}
 	
 	spin_lock_irqsave(&info->irq_spinlock,flags);

--===============59725705457134448==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59725705457134448==--
