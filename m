From: james4765@verizon.net
Date: Thu, 16 Dec 2004 05:45:39 +0000
Subject: [KJ] [PATCH] riscom8: replace cli()/sti() with
Message-Id: <20041216054601.1132.86099.47902@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81446021730251861=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============81446021730251861==

This is an attempt to get the riscom8 driver working on SMP.  I think I did it
properly (per what Documentation/cli-sti-removal.txt details).

Compile tested.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.10-rc3-original/drivers/char/Kconfig linux-2.6.10-rc3/drivers/char/Kconfig
--- linux-2.6.10-rc3-original/drivers/char/Kconfig	2004-12-03 16:52:14.000000000 -0500
+++ linux-2.6.10-rc3/drivers/char/Kconfig	2004-12-16 00:19:09.123767065 -0500
@@ -251,7 +251,7 @@
 
 config RISCOM8
 	tristate "SDL RISCom/8 card support"
-	depends on SERIAL_NONSTANDARD && BROKEN_ON_SMP
+	depends on SERIAL_NONSTANDARD
 	help
 	  This is a driver for the SDL Communications RISCom/8 multiport card,
 	  which gives you many serial ports. You would need something like
diff -urN --exclude='*~' linux-2.6.10-rc3-original/drivers/char/riscom8.c linux-2.6.10-rc3/drivers/char/riscom8.c
--- linux-2.6.10-rc3-original/drivers/char/riscom8.c	2004-12-03 16:53:46.000000000 -0500
+++ linux-2.6.10-rc3/drivers/char/riscom8.c	2004-12-16 00:38:16.885815085 -0500
@@ -78,6 +78,8 @@
 
 #define RS_EVENT_WRITE_WAKEUP	0
 
+static spinlock_t riscom_lock = SPIN_LOCK_UNLOCKED;
+
 static struct riscom_board * IRQ_to_board[16];
 static struct tty_driver *riscom_driver;
 static unsigned char * tmp_buf;
@@ -232,13 +234,13 @@
 {
 	unsigned long flags;
 	
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	rc_out(bp, RC_CTOUT, 0);     	           /* Clear timeout             */
 	rc_wait_CCR(bp);			   /* Wait for CCR ready        */
 	rc_out(bp, CD180_CCR, CCR_HARDRESET);      /* Reset CD180 chip          */
-	sti();
+	spin_unlock_irqrestore(&riscom_lock, flags);
 	rc_long_delay(HZ/20);                      /* Delay 0.05 sec            */
-	cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	rc_out(bp, CD180_GIVR, RC_ID);             /* Set ID for this chip      */
 	rc_out(bp, CD180_GICR, 0);                 /* Clear all bits            */
 	rc_out(bp, CD180_PILR1, RC_ACK_MINT);      /* Prio for modem intr       */
@@ -249,7 +251,7 @@
 	rc_out(bp, CD180_PPRH, (RC_OSCFREQ/(1000000/RISCOM_TPS)) >> 8);
 	rc_out(bp, CD180_PPRL, (RC_OSCFREQ/(1000000/RISCOM_TPS)) & 0xff);
 	
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 }
 
 /* Main probing routine, also sets irq. */
@@ -861,7 +863,7 @@
 		port->xmit_buf = (unsigned char *) tmp;
 	}
 		
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 		
 	if (port->tty) 
 		clear_bit(TTY_IO_ERROR, &port->tty->flags);
@@ -873,7 +875,7 @@
 	rc_change_speed(bp, port);
 	port->flags |= ASYNC_INITIALIZED;
 		
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 	return 0;
 }
 
@@ -984,19 +986,19 @@
 	 */
 	retval = 0;
 	add_wait_queue(&port->open_wait, &wait);
-	cli();
+	spin_lock_irq(&riscom_lock);
 	if (!tty_hung_up_p(filp))
 		port->count--;
-	sti();
+	spin_unlock_irq(&riscom_lock);
 	port->blocked_open++;
 	while (1) {
-		cli();
+		spin_lock_irq(&riscom_lock);
 		rc_out(bp, CD180_CAR, port_No(port));
 		CD = rc_in(bp, CD180_MSVR) & MSVR_CD;
 		rc_out(bp, CD180_MSVR, MSVR_RTS);
 		bp->DTR &= ~(1u << port_No(port));
 		rc_out(bp, RC_DTR, bp->DTR);
-		sti();
+		spin_unlock_irq(&riscom_lock);
 		set_current_state(TASK_INTERRUPTIBLE);
 		if (tty_hung_up_p(filp) ||
 		    !(port->flags & ASYNC_INITIALIZED)) {
@@ -1069,7 +1071,7 @@
 	if (!port || rc_paranoia_check(port, tty->name, "close"))
 		return;
 	
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	if (tty_hung_up_p(filp))
 		goto out;
 	
@@ -1136,7 +1138,7 @@
 	}
 	port->flags &= ~(ASYNC_NORMAL_ACTIVE|ASYNC_CLOSING);
 	wake_up_interruptible(&port->close_wait);
-out:	restore_flags(flags);
+out:	spin_unlock_irqrestore(&riscom_lock, flags);
 }
 
 static int rc_write(struct tty_struct * tty, 
@@ -1155,34 +1157,30 @@
 	if (!tty || !port->xmit_buf || !tmp_buf)
 		return 0;
 
-	save_flags(flags);
+	spin_lock_irqsave(&riscom_lock, flags);
 	while (1) {
-		cli();		
 		c = min_t(int, count, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
 					  SERIAL_XMIT_SIZE - port->xmit_head));
 		if (c <= 0) {
-			restore_flags(flags);
 			break;
 		}
 
 		memcpy(port->xmit_buf + port->xmit_head, buf, c);
 		port->xmit_head = (port->xmit_head + c) & (SERIAL_XMIT_SIZE-1);
 		port->xmit_cnt += c;
-		restore_flags(flags);
 
 		buf += c;
 		count -= c;
 		total += c;
 	}
 
-	cli();
 	if (port->xmit_cnt && !tty->stopped && !tty->hw_stopped &&
 	    !(port->IER & IER_TXRDY)) {
 		port->IER |= IER_TXRDY;
 		rc_out(bp, CD180_CAR, port_No(port));
 		rc_out(bp, CD180_IER, port->IER);
 	}
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 
 	return total;
 }
@@ -1198,7 +1196,7 @@
 	if (!tty || !port->xmit_buf)
 		return;
 
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	
 	if (port->xmit_cnt >= SERIAL_XMIT_SIZE - 1)
 		goto out;
@@ -1206,7 +1204,7 @@
 	port->xmit_buf[port->xmit_head++] = ch;
 	port->xmit_head &= SERIAL_XMIT_SIZE - 1;
 	port->xmit_cnt++;
-out:	restore_flags(flags);
+out:	spin_unlock_irqrestore(&riscom_lock, flags);
 }
 
 static void rc_flush_chars(struct tty_struct * tty)
@@ -1221,11 +1219,11 @@
 	    !port->xmit_buf)
 		return;
 
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	port->IER |= IER_TXRDY;
 	rc_out(port_Board(port), CD180_CAR, port_No(port));
 	rc_out(port_Board(port), CD180_IER, port->IER);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 }
 
 static int rc_write_room(struct tty_struct * tty)
@@ -1260,9 +1258,9 @@
 	if (rc_paranoia_check(port, tty->name, "rc_flush_buffer"))
 		return;
 
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	port->xmit_cnt = port->xmit_head = port->xmit_tail = 0;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 	
 	wake_up_interruptible(&tty->write_wait);
 	tty_wakeup(tty);
@@ -1280,11 +1278,11 @@
 		return -ENODEV;
 
 	bp = port_Board(port);
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	rc_out(bp, CD180_CAR, port_No(port));
 	status = rc_in(bp, CD180_MSVR);
 	result = rc_in(bp, RC_RI) & (1u << port_No(port)) ? 0 : TIOCM_RNG;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 	result |= ((status & MSVR_RTS) ? TIOCM_RTS : 0)
 		| ((status & MSVR_DTR) ? TIOCM_DTR : 0)
 		| ((status & MSVR_CD)  ? TIOCM_CAR : 0)
@@ -1305,7 +1303,7 @@
 
 	bp = port_Board(port);
 
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	if (set & TIOCM_RTS)
 		port->MSVR |= MSVR_RTS;
 	if (set & TIOCM_DTR)
@@ -1319,7 +1317,7 @@
 	rc_out(bp, CD180_CAR, port_No(port));
 	rc_out(bp, CD180_MSVR, port->MSVR);
 	rc_out(bp, RC_DTR, bp->DTR);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 	return 0;
 }
 
@@ -1328,7 +1326,7 @@
 	struct riscom_board *bp = port_Board(port);
 	unsigned long flags;
 	
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	port->break_length = RISCOM_TPS / HZ * length;
 	port->COR2 |= COR2_ETC;
 	port->IER  |= IER_TXRDY;
@@ -1338,7 +1336,7 @@
 	rc_wait_CCR(bp);
 	rc_out(bp, CD180_CCR, CCR_CORCHG2);
 	rc_wait_CCR(bp);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 }
 
 static inline int rc_set_serial_info(struct riscom_port * port,
@@ -1381,9 +1379,9 @@
 		port->closing_wait = tmp.closing_wait;
 	}
 	if (change_speed)  {
-		save_flags(flags); cli();
+		spin_lock_irqsave(&riscom_lock, flags);
 		rc_change_speed(bp, port);
-		restore_flags(flags);
+		spin_unlock_irqrestore(&riscom_lock, flags);
 	}
 	return 0;
 }
@@ -1464,7 +1462,7 @@
 	
 	bp = port_Board(port);
 	
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	port->MSVR &= ~MSVR_RTS;
 	rc_out(bp, CD180_CAR, port_No(port));
 	if (I_IXOFF(tty))  {
@@ -1473,7 +1471,7 @@
 		rc_wait_CCR(bp);
 	}
 	rc_out(bp, CD180_MSVR, port->MSVR);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 }
 
 static void rc_unthrottle(struct tty_struct * tty)
@@ -1487,7 +1485,7 @@
 	
 	bp = port_Board(port);
 	
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	port->MSVR |= MSVR_RTS;
 	rc_out(bp, CD180_CAR, port_No(port));
 	if (I_IXOFF(tty))  {
@@ -1496,7 +1494,7 @@
 		rc_wait_CCR(bp);
 	}
 	rc_out(bp, CD180_MSVR, port->MSVR);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 }
 
 static void rc_stop(struct tty_struct * tty)
@@ -1510,11 +1508,11 @@
 	
 	bp = port_Board(port);
 	
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	port->IER &= ~IER_TXRDY;
 	rc_out(bp, CD180_CAR, port_No(port));
 	rc_out(bp, CD180_IER, port->IER);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 }
 
 static void rc_start(struct tty_struct * tty)
@@ -1528,13 +1526,13 @@
 	
 	bp = port_Board(port);
 	
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	if (port->xmit_cnt && port->xmit_buf && !(port->IER & IER_TXRDY))  {
 		port->IER |= IER_TXRDY;
 		rc_out(bp, CD180_CAR, port_No(port));
 		rc_out(bp, CD180_IER, port->IER);
 	}
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 }
 
 /*
@@ -1586,9 +1584,9 @@
 	    tty->termios->c_iflag == old_termios->c_iflag)
 		return;
 
-	save_flags(flags); cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	rc_change_speed(port_Board(port), port);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 
 	if ((old_termios->c_cflag & CRTSCTS) &&
 	    !(tty->termios->c_cflag & CRTSCTS)) {
@@ -1684,12 +1682,11 @@
 {
 	unsigned long flags;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&riscom_lock, flags);
 	free_page((unsigned long)tmp_buf);
 	tty_unregister_driver(riscom_driver);
 	put_tty_driver(riscom_driver);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&riscom_lock, flags);
 }
 
 #ifndef MODULE

--===============81446021730251861==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81446021730251861==--
