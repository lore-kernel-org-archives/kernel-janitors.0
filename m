From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 21:28:26 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 29/33] char/synclink_cs: replace
Message-Id: <20040916212826.GW1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25529688879503043=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============25529688879503043==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/pcmcia/synclink_cs.c	2004-09-09 23:05:40.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/pcmcia/synclink_cs.c	2004-09-10 11:09:53.000000000 -0700
@@ -2584,8 +2584,7 @@ static void mgslpc_close(struct tty_stru
 	
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	}
@@ -2640,8 +2639,7 @@ static void mgslpc_wait_until_sent(struc
 		
 	if (info->params.mode == MGSL_MODE_HDLC) {
 		while (info->tx_active) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(char_time);
+			msleep_interruptible(jiffies_to_msecs(char_time));
 			if (signal_pending(current))
 				break;
 			if (timeout && time_after(jiffies, orig_jiffies + timeout))
@@ -2650,8 +2648,7 @@ static void mgslpc_wait_until_sent(struc
 	} else {
 		while ((info->tx_count || info->tx_active) &&
 			info->tx_enabled) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(char_time);
+			msleep_interruptible(jiffies_to_msecs(char_time));
 			if (signal_pending(current))
 				break;
 			if (timeout && time_after(jiffies, orig_jiffies + timeout))
@@ -4108,8 +4105,7 @@ BOOLEAN irq_test(MGSLPC_INFO *info)
 
 	end_time=100;
 	while(end_time-- && !info->irq_occurred) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(msecs_to_jiffies(10));
+		msleep_interruptible(10);
 	}
 	
 	info->testing_irq = FALSE;

--===============25529688879503043==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25529688879503043==--
