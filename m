From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 18:53:43 +0000
Subject: [KJ] [PATCH] serial/68328serial: replace schedule_timeout() with
Message-Id: <20050303185343.GL11600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44479626020313034=="
List-Id: <kernel-janitors.vger.kernel.org>
To: rmk+serial@arm.linux.org.uk
Cc: Kernel-Janitors <kernel-janitors@lists.osdl.org>, linux-serial@vger.kernel.org

--===============44479626020313034==
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


--- 2.6.11-kj-v/drivers/serial/68328serial.c	2005-03-01 23:38:32.000000000 -0800
+++ 2.6.11-kj/drivers/serial/68328serial.c	2005-03-03 10:51:12.000000000 -0800
@@ -992,18 +992,17 @@ static int get_lsr_info(struct m68k_seri
 /*
  * This routine sends a break character out the serial port.
  */
-static void send_break(	struct m68k_serial * info, int duration)
+static void send_break(struct m68k_serial * info, unsigned int duration)
 {
 	m68328_uart *uart = &uart_addr[info->line];
         unsigned long flags;
         if (!info->port)
                 return;
-        set_current_state(TASK_INTERRUPTIBLE);
         save_flags(flags);
         cli();
 #ifdef USE_INTS	
 	uart->utx.w |= UTX_SEND_BREAK;
-        schedule_timeout(duration);
+	msleep_interruptible(duration);
 	uart->utx.w &= ~UTX_SEND_BREAK;
 #endif		
         restore_flags(flags);
@@ -1033,14 +1032,14 @@ static int rs_ioctl(struct tty_struct *t
 				return retval;
 			tty_wait_until_sent(tty, 0);
 			if (!arg)
-				send_break(info, HZ/4);	/* 1/4 second */
+				send_break(info, 250);	/* 1/4 second */
 			return 0;
 		case TCSBRKP:	/* support for POSIX tcsendbreak() */
 			retval = tty_check_change(tty);
 			if (retval)
 				return retval;
 			tty_wait_until_sent(tty, 0);
-			send_break(info, arg ? arg*(HZ/10) : HZ/4);
+			send_break(info, arg ? arg*(100) : 250);
 			return 0;
 		case TIOCGSOFTCAR:
 			error = put_user(C_CLOCAL(tty) ? 1 : 0,

--===============44479626020313034==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44479626020313034==--
