From: Kristen Carlson <kristenc@cs.pdx.edu>
Date: Wed, 07 Jul 2004 21:59:13 +0000
Subject: Re: [Kernel-janitors] [PATCH] remove check_region specialix
Message-Id: <200407072159.i67LxDPv028513@sirius.cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10672101556158631=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
In-Reply-To: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============10672101556158631==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ok, here's another try:


--- linux-2.6.7-kc/drivers/char/specialix.c.orig	2004-07-07 12:56:03.000000000 +0000
+++ linux-2.6.7-kc/drivers/char/specialix.c	2004-07-07 13:52:05.000000000 +0000
@@ -118,6 +118,13 @@
 #undef SX_REPORT_OVERRUN
 
 
+#ifdef  SPECIALIX_DEBUG
+static int debug = SPECIALIX_DEBUG;
+#define dprintk(level, fmt, arg...) do { if (level >= debug) printk(KERN_DEBUG "%s: %s: " fmt , MY_NAME , __FUNCTION__ , ## arg); } while (0)
+#else
+static int debug = 0;
+#define dprintk(level, fmt, arg...)
+#endif
 
 #ifdef CONFIG_SPECIALIX_RTSCTS
 #define SX_CRTSCTS(bla) 1
@@ -284,16 +291,9 @@ static inline void sx_wait_CCR_off(struc
 /*
  *  specialix IO8+ IO range functions.
  */
-
-static inline int sx_check_io_range(struct specialix_board * bp)
+static inline int sx_request_io_range(struct specialix_board * bp)
 {
-	return check_region (bp->base, SX_IO_SPACE);
-}
-
-
-static inline void sx_request_io_range(struct specialix_board * bp)
-{
-	request_region(bp->base, 
+	return request_region(bp->base, 
 	               bp->flags&SX_BOARD_IS_PCI?SX_PCI_IO_SPACE:SX_IO_SPACE,
 	               "specialix IO8+" );
 }
@@ -419,14 +419,11 @@ void missed_irq (unsigned long data)
 static int sx_probe(struct specialix_board *bp)
 {
 	unsigned char val1, val2;
-#if 0
-	int irqs = 0;
-	int retries;
-#endif
 	int rev;
 	int chip;
+	int err;
 
-	if (sx_check_io_range(bp)) 
+	if (!sx_request_io_region(bp))
 		return 1;
 
 	/* Are the I/O ports here ? */
@@ -442,17 +439,16 @@ static int sx_probe(struct specialix_boa
 	if ((val1 != 0x5a) || (val2 != 0xa5)) {
 		printk(KERN_INFO "sx%d: specialix IO8+ Board at 0x%03x not found.\n",
 		       board_No(bp), bp->base);
-		return 1;
+		err = 1;
+		goto probe_err;
 	}
 
 	/* Check the DSR lines that Specialix uses as board 
 	   identification */
 	val1 = read_cross_byte (bp, CD186x_MSVR, MSVR_DSR);
 	val2 = read_cross_byte (bp, CD186x_MSVR, MSVR_RTS);
-#ifdef SPECIALIX_DEBUG
-	printk (KERN_DEBUG "sx%d: DSR lines are: %02x, rts lines are: %02x\n", 
+	dprintk ("sx%d: DSR lines are: %02x, rts lines are: %02x\n", 
 	        board_No(bp),  val1, val2);
-#endif
 	/* They managed to switch the bit order between the docs and
 	   the IO8+ card. The new PCI card now conforms to old docs.
 	   They changed the PCI docs to reflect the situation on the
@@ -461,57 +457,16 @@ static int sx_probe(struct specialix_boa
 	if (val1 != val2) {
 		printk(KERN_INFO "sx%d: specialix IO8+ ID %02x at 0x%03x not found (%02x).\n",
 		       board_No(bp), val2, bp->base, val1);
-		return 1;
+		err = 1;
+		goto probe_err;
 	}
 
-
-#if 0
-	/* It's time to find IRQ for this board */
-	for (retries = 0; retries < 5 && irqs <= 0; retries++) {
-		irqs = probe_irq_on();
-		sx_init_CD186x(bp);	       		/* Reset CD186x chip       */
-		sx_out(bp, CD186x_CAR, 2);               /* Select port 2          */
-		sx_wait_CCR(bp);
-		sx_out(bp, CD186x_CCR, CCR_TXEN);        /* Enable transmitter     */
-		sx_out(bp, CD186x_IER, IER_TXRDY);       /* Enable tx empty intr   */
-		sx_long_delay(HZ/20);	       		
-		irqs = probe_irq_off(irqs);
-
-#if SPECIALIX_DEBUG > 2
-		printk (KERN_DEBUG "SRSR = %02x, ",  sx_in(bp, CD186x_SRSR));
-		printk (           "TRAR = %02x, ",  sx_in(bp, CD186x_TRAR));
-		printk (           "GIVR = %02x, ",  sx_in(bp, CD186x_GIVR));
-		printk (           "GICR = %02x, ",  sx_in(bp, CD186x_GICR));
-		printk (           "\n");
-#endif
-		/* Reset CD186x again      */
-		if (!sx_init_CD186x(bp)) {
-			/* Hmmm. This is dead code anyway. */
-		}
-#if SPECIALIX_DEBUG > 2
-		printk (KERN_DEBUG "val1 = %02x, val2 = %02x, val3 = %02x.\n", 
-		        val1, val2, val3); 
-#endif
-	
-	}
-	
-#if 0
-	if (irqs <= 0) {
-		printk(KERN_ERR "sx%d: Can't find IRQ for specialix IO8+ board at 0x%03x.\n",
-		       board_No(bp), bp->base);
-		return 1;
-	}
-#endif
-	printk (KERN_INFO "Started with irq=%d, but now have irq=%d.\n", bp->irq, irqs);
-	if (irqs > 0)
-		bp->irq = irqs;
-#endif
 	/* Reset CD186x again  */
 	if (!sx_init_CD186x(bp)) {
-		return -EIO;
+		err = -EIO;
+		goto probe_err;
 	}
 
-	sx_request_io_range(bp);
 	bp->flags |= SX_BOARD_PRESENT;
 	
 	/* Chip           revcode   pkgtype
@@ -532,9 +487,7 @@ static int sx_probe(struct specialix_boa
 	default:chip=-1;rev='x';
 	}
 
-#if SPECIALIX_DEBUG > 2
-	printk (KERN_DEBUG " GFCR = 0x%02x\n", sx_in_off(bp, CD186x_GFRCR) );
-#endif
+	dprintk(2, " GFCR = 0x%02x\n", sx_in_off(bp, CD186x_GFRCR) );
 
 #ifdef SPECIALIX_TIMER
 	init_timer (&missed_irq_timer);
@@ -550,6 +503,10 @@ static int sx_probe(struct specialix_boa
 	       chip, rev);
 
 	return 0;
+
+ probe_err:
+	sx_release_io_range(bp);
+	return err;
 }
 
 /* 
@@ -604,10 +561,8 @@ static inline void sx_receive_exc(struct
 	status = sx_in(bp, CD186x_RCSR);
 	if (status & RCSR_OE) {
 		port->overrun++;
-#if SPECIALIX_DEBUG 
-		printk(KERN_DEBUG "sx%d: port %d: Overrun. Total %ld overruns.\n", 
-		       board_No(bp), port_No(port), port->overrun);
-#endif		
+		dprintk(debug, "sx%d: port %d: Overrun. Total %ld overruns.\n", 
+		       board_No(bp), port_No(port), port->overrun);		
 	}
 	status &= port->mark_mask;
 #else	
@@ -623,10 +578,8 @@ static inline void sx_receive_exc(struct
 		return;
 		
 	} else if (status & RCSR_BREAK) {
-#ifdef SPECIALIX_DEBUG
-		printk(KERN_DEBUG "sx%d: port %d: Handling break...\n",
+		dprintk(debug, "sx%d: port %d: Handling break...\n",
 		       board_No(bp), port_No(port));
-#endif
 		*tty->flip.flag_buf_ptr++ = TTY_BREAK;
 		if (port->flags & ASYNC_SAK)
 			do_SAK(tty);
@@ -756,9 +709,8 @@ static inline void sx_check_modem(struct
 	struct tty_struct *tty;
 	unsigned char mcr;
 
-#ifdef SPECIALIX_DEBUG
-	printk (KERN_DEBUG "Modem intr. ");
-#endif
+	dprintk (debug, "Modem intr. ");
+
 	if (!(port = sx_get_port(bp, "Modem")))
 		return;
 	
@@ -768,18 +720,12 @@ static inline void sx_check_modem(struct
 	printk ("mcr = %02x.\n", mcr);
 
 	if ((mcr & MCR_CDCHG)) {
-#ifdef SPECIALIX_DEBUG 
-		printk (KERN_DEBUG "CD just changed... ");
-#endif
+		dprintk (debug, "CD just changed... ");
 		if (sx_in(bp, CD186x_MSVR) & MSVR_CD) {
-#ifdef SPECIALIX_DEBUG
-			printk ( "Waking up guys in open.\n");
-#endif
+			dprintk (debug, "Waking up guys in open.\n");
 			wake_up_interruptible(&port->open_wait);
 		} else {
-#ifdef SPECIALIX_DEBUG
-			printk ( "Sending HUP.\n");
-#endif
+			dprintk (debug, "Sending HUP.\n");
 			schedule_work(&port->tqueue_hangup);
 		}
 	}
@@ -828,9 +774,7 @@ static irqreturn_t sx_interrupt(int irq,
 	bp = dev_id;
 	
 	if (!bp || !(bp->flags & SX_BOARD_ACTIVE)) {
-#ifdef SPECIALIX_DEBUG 
-		printk (KERN_DEBUG "sx: False interrupt. irq %d.\n", irq);
-#endif
+		dprintk (debug, "sx: False interrupt. irq %d.\n", irq);
 		return IRQ_NONE;
 	}
 
@@ -933,9 +877,8 @@ static inline void sx_shutdown_board(str
 	
 	bp->flags &= ~SX_BOARD_ACTIVE;
 	
-#if SPECIALIX_DEBUG > 2
-	printk ("Freeing IRQ%d for board %d.\n", bp->irq, board_No (bp));
-#endif
+	dprintk (3, "Freeing IRQ%d for board %d.\n", bp->irq, board_No (bp));
+
 	free_irq(bp->irq, bp);
 
 	turn_ints_off (bp);
@@ -970,9 +913,7 @@ static void sx_change_speed(struct speci
 		port->MSVR = MSVR_DTR | (sx_in(bp, CD186x_MSVR) & MSVR_RTS);
 	else
 		port->MSVR =  (sx_in(bp, CD186x_MSVR) & MSVR_RTS);
-#ifdef DEBUG_SPECIALIX
-	printk (KERN_DEBUG "sx: got MSVR=%02x.\n", port->MSVR);
-#endif
+	dprintk(debug, "sx: got MSVR=%02x.\n", port->MSVR);
 	baud = C_BAUD(tty);
 	
 	if (baud & CBAUDEX) {
@@ -992,17 +933,13 @@ static void sx_change_speed(struct speci
 	
 	if (!baud_table[baud]) {
 		/* Drop DTR & exit */
-#ifdef SPECIALIX_DEBUG
-		printk (KERN_DEBUG "Dropping DTR...  Hmm....\n");
-#endif
+		dprintk(debug, "Dropping DTR...  Hmm....\n");
 		if (!SX_CRTSCTS (tty)) {
 			port -> MSVR &= ~ MSVR_DTR;
 			sx_out(bp, CD186x_MSVR, port->MSVR );
 		} 
-#ifdef DEBUG_SPECIALIX
 		else
-			printk (KERN_DEBUG "Can't drop DTR: no DTR.\n");
-#endif
+			dprintk (debug, "Can't drop DTR: no DTR.\n");
 		return;
 	} else {
 		/* Set DTR on */
@@ -1147,9 +1084,7 @@ static void sx_change_speed(struct speci
 	sx_wait_CCR(bp);
 	sx_out(bp, CD186x_CCR, CCR_CORCHG1 | CCR_CORCHG2 | CCR_CORCHG3);
 	/* Setting up modem option registers */
-#ifdef DEBUG_SPECIALIX
-	printk ("Mcor1 = %02x, mcor2 = %02x.\n", mcor1, mcor2);
-#endif
+	dprintk (debug, "Mcor1 = %02x, mcor2 = %02x.\n", mcor1, mcor2);
 	sx_out(bp, CD186x_MCOR1, mcor1);
 	sx_out(bp, CD186x_MCOR2, mcor2);
 	/* Enable CD186x transmitter & receiver */
@@ -1372,10 +1307,8 @@ static int sx_open(struct tty_struct * t
 	bp = &sx_board[board];
 	port = sx_port + board * SX_NPORT + SX_PORT(tty->index);
 
-#ifdef DEBUG_SPECIALIX
-	printk (KERN_DEBUG "Board = %d, bp = %p, port = %p, portno = %d.\n", 
+	dprintk (debug, "Board = %d, bp = %p, port = %p, portno = %d.\n", 
 	        board, bp, port, SX_PORT(tty->index));
-#endif
 
 	if (sx_paranoia_check(port, tty->name, "sx_open"))
 		return -ENODEV;
@@ -1669,11 +1602,10 @@ static int sx_tiocmget(struct tty_struct
 	sx_out(bp, CD186x_CAR, port_No(port));
 	status = sx_in(bp, CD186x_MSVR);
 	restore_flags(flags);
-#ifdef DEBUG_SPECIALIX
-	printk (KERN_DEBUG "Got msvr[%d] = %02x, car = %d.\n", 
+	dprintk (debug, "Got msvr[%d] = %02x, car = %d.\n", 
 		port_No(port), status, sx_in (bp, CD186x_CAR));
-	printk (KERN_DEBUG "sx_port = %p, port = %p\n", sx_port, port);
-#endif
+	dprintk (debug, "sx_port = %p, port = %p\n", sx_port, port);
+
 	if (SX_CRTSCTS(port->tty)) {
 		result  = /*   (status & MSVR_RTS) ? */ TIOCM_DTR /* : 0) */ 
 		          |   ((status & MSVR_DTR) ? TIOCM_RTS : 0)
-- 
WWXD (What Would Xena Do?) 


--===============10672101556158631==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10672101556158631==--
