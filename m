From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 18:54:11 +0000
Subject: [KJ] [PATCH] serial/68360serial: replace schedule_timeout() with
Message-Id: <20050303185411.GM11600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81069510548614643=="
List-Id: <kernel-janitors.vger.kernel.org>
To: rmk+serial@arm.linux.org.uk
Cc: Kernel-Janitors <kernel-janitors@lists.osdl.org>, linux-serial@vger.kernel.org

--===============81069510548614643==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Russell, sorry if you are not responsible for this driver, but I figure
the more eyes the better.

Thanks,
Nish


Please consider applying.

Description: Use msleep_interruptible() instead of schedule_timeout() in
send_break() to guarantee the task delays as expected. Change
@duration's units to milliseconds, and modify arguments in callers
appropriately.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-kj-v/drivers/serial/68360serial.c	2005-03-01 23:38:26.000000000 -0800
+++ 2.6.11-kj/drivers/serial/68360serial.c	2005-03-02 14:40:38.000000000 -0800
@@ -1394,14 +1394,13 @@ static void end_break(ser_info_t *info)
 /*
  * This routine sends a break character out the serial port.
  */
-static void send_break(ser_info_t *info, int duration)
+static void send_break(ser_info_t *info, unsigned int duration)
 {
-	set_current_state(TASK_INTERRUPTIBLE);
 #ifdef SERIAL_DEBUG_SEND_BREAK
 	printk("rs_send_break(%d) jiff=%lu...", duration, jiffies);
 #endif
 	begin_break(info);
-	schedule_timeout(duration);
+	msleep_interruptible(duration);
 	end_break(info);
 #ifdef SERIAL_DEBUG_SEND_BREAK
 	printk("done jiffies=%lu\n", jiffies);
@@ -1436,7 +1435,7 @@ static int rs_360_ioctl(struct tty_struc
 			if (signal_pending(current))
 				return -EINTR;
 			if (!arg) {
-				send_break(info, HZ/4);	/* 1/4 second */
+				send_break(info, 250);	/* 1/4 second */
 				if (signal_pending(current))
 					return -EINTR;
 			}
@@ -1448,7 +1447,7 @@ static int rs_360_ioctl(struct tty_struc
 			tty_wait_until_sent(tty, 0);
 			if (signal_pending(current))
 				return -EINTR;
-			send_break(info, arg ? arg*(HZ/10) : HZ/4);
+			send_break(info, arg ? arg*100 : 250);
 			if (signal_pending(current))
 				return -EINTR;
 			return 0;

--===============81069510548614643==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81069510548614643==--
