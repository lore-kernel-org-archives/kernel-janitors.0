From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 21:29:03 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 30/33] char/synclinkmp: replace
Message-Id: <20040916212903.GX1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4824464749629862=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4824464749629862==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/synclinkmp.c	2004-09-09 23:05:40.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/synclinkmp.c	2004-09-10 11:33:59.000000000 -0700
@@ -856,8 +856,7 @@ static void close(struct tty_struct *tty
 
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	}
@@ -1142,8 +1141,7 @@ static void wait_until_sent(struct tty_s
 
 	if ( info->params.mode == MGSL_MODE_HDLC ) {
 		while (info->tx_active) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(char_time);
+			msleep_interruptible(jiffies_to_msecs(char_time));
 			if (signal_pending(current))
 				break;
 			if (timeout && time_after(jiffies, orig_jiffies + timeout))
@@ -1153,8 +1151,7 @@ static void wait_until_sent(struct tty_s
 		//TODO: determine if there is something similar to USC16C32
 		// 	TXSTATUS_ALL_SENT status
 		while ( info->tx_active && info->tx_enabled) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(char_time);
+			msleep_interruptible(jiffies_to_msecs(char_time));
 			if (signal_pending(current))
 				break;
 			if (timeout && time_after(jiffies, orig_jiffies + timeout))
@@ -5203,8 +5200,7 @@ int irq_test(SLMP_INFO *info)
 
 	timeout=100;
 	while( timeout-- && !info->irq_occurred ) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(msecs_to_jiffies(10));
+		msleep_interruptible(10);
 	}
 
 	spin_lock_irqsave(&info->lock,flags);
@@ -5354,8 +5350,7 @@ int loopback_test(SLMP_INFO *info)
 	/* wait for receive complete */
 	/* Set a timeout for waiting for interrupt. */
 	for ( timeout = 100; timeout; --timeout ) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(msecs_to_jiffies(10));
+		msleep_interruptible(10);
 
 		if (rx_get_frame(info)) {
 			rc = TRUE;

--===============4824464749629862==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4824464749629862==--
