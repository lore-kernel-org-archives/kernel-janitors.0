From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:17:37 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/6] serial/68360serial: replace
Message-Id: <20040927211737.GC1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55043741570948734=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============55043741570948734==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.
Use set_current_state() instead of direct assignment of current->state.

--- 2.6.9-rc2-vanilla/drivers/serial/68360serial.c	2004-09-13 17:15:52.000000000 -0700
+++ 2.6.9-rc2/drivers/serial/68360serial.c	2004-09-14 10:18:21.000000000 -0700
@@ -1411,7 +1411,7 @@ static void end_break(ser_info_t *info)
  */
 static void send_break(ser_info_t *info, int duration)
 {
-	current->state = TASK_INTERRUPTIBLE;
+	set_current_state(TASK_INTERRUPTIBLE);
 #ifdef SERIAL_DEBUG_SEND_BREAK
 	printk("rs_send_break(%d) jiff=%lu...", duration, jiffies);
 #endif
@@ -1723,8 +1723,7 @@ static void rs_360_close(struct tty_stru
 	info->tty = 0;
 	if (info->blocked_open) {
 		if (info->close_delay) {
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(info->close_delay);
+			msleep_interruptible(jiffies_to_msecs(info->close_delay));
 		}
 		wake_up_interruptible(&info->open_wait);
 	}
@@ -1777,9 +1776,8 @@ static void rs_360_wait_until_sent(struc
 #ifdef SERIAL_DEBUG_RS_WAIT_UNTIL_SENT
 		printk("lsr = %d (jiff=%lu)...", lsr, jiffies);
 #endif
-		current->state = TASK_INTERRUPTIBLE;
 /*		current->counter = 0;	 make us low-priority */
-		schedule_timeout(char_time);
+		msleep_interruptible(jiffies_to_msecs(char_time));
 		if (signal_pending(current))
 			break;
 		if (timeout && ((orig_jiffies + timeout) < jiffies))

--===============55043741570948734==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55043741570948734==--
