From: Debian User <h.vanberkum@chello.nl>
Date: Wed, 25 Feb 2004 22:08:03 +0000
Subject: [Kernel-janitors] serial.c cli() patch
Message-Id: <403D1CC3.6080906@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I tried to remove the cli() calls from serial.c. I just used a global 
spin_lock_t serial_lock, to replace the cli() calls with 
spin_lock_irqsave().
Can someone tell me when I do need multiple spinlocks variables instead 
of one global one?

Richard

--- linux-2.6.3/arch/cris/arch-v10/drivers/serial.c	2004-02-18 
04:58:40.000000000 +0100
+++ linux-2.6.3b/arch/cris/arch-v10/drivers/serial.c	2004-02-25 
22:49:09.000000000 +0100
@@ -436,6 +436,9 @@
  #include "serial.h"
  #include <asm/fasttimer.h>

+
+spinlock_t serial_lock;
+
  #ifdef CONFIG_ETRAX_SERIAL_FAST_TIMER
  #ifndef CONFIG_ETRAX_FAST_TIMER
  #error "Enable FAST_TIMER to use SERIAL_FAST_TIMER"
@@ -1227,12 +1230,12 @@
  	{
  		unsigned long flags;

-		save_flags(flags);
-		cli();
+		//spin_lock_irqsave(&serial_lock, flags);
+		//spinlock already accuired by calling function
  		*e100_modem_pins[info->line].dtr_shadow &= ~mask;
  		*e100_modem_pins[info->line].dtr_shadow |= (set ? 0 : mask);
  		*e100_modem_pins[info->line].dtr_port = 
*e100_modem_pins[info->line].dtr_shadow;
-		restore_flags(flags);
+		//spin_unlock_irqrestore(&serial_lock, flags);
  	}
  	
  #ifdef SERIAL_DEBUG_IO
@@ -1270,12 +1273,11 @@
  		unsigned char mask = e100_modem_pins[info->line].ri_mask;
  		unsigned long flags;

-		save_flags(flags);
-		cli();
+		spin_lock_irqsave(&serial_lock, flags);
  		*e100_modem_pins[info->line].ri_shadow &= ~mask;
  		*e100_modem_pins[info->line].ri_shadow |= (set ? 0 : mask);
  		*e100_modem_pins[info->line].ri_port = 
*e100_modem_pins[info->line].ri_shadow;
-		restore_flags(flags);
+		spin_unlock_irqrestore(&serial_lock, flags);
  	}
  #endif
  }
@@ -1288,12 +1290,11 @@
  		unsigned char mask = e100_modem_pins[info->line].cd_mask;
  		unsigned long flags;

-		save_flags(flags);
-		cli();
+		spin_lock_irqsave(&serial_lock, flags);
  		*e100_modem_pins[info->line].cd_shadow &= ~mask;
  		*e100_modem_pins[info->line].cd_shadow |= (set ? 0 : mask);
  		*e100_modem_pins[info->line].cd_port = 
*e100_modem_pins[info->line].cd_shadow;
-		restore_flags(flags);
+		spin_unlock_irqrestore(&serial_lock, flags);
  	}
  #endif
  }
@@ -1366,8 +1367,8 @@
  	/* Disable output DMA channel for the serial port in question
  	 * ( set to something other then serialX)
  	 */
-	save_flags(flags);
-	cli();
+	
+	spin_lock(&serial_lock, flags);
  	if (info->line = 0) {
  		genconfig_shadow &=  ~IO_MASK(R_GEN_CONFIG, dma6);
  		genconfig_shadow |= IO_STATE(R_GEN_CONFIG, dma6, unused);
@@ -1382,7 +1383,7 @@
  		genconfig_shadow |= IO_STATE(R_GEN_CONFIG, dma4, par1);
  	}
  	*R_GEN_CONFIG = genconfig_shadow;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&serial_lock, flags);
  }


@@ -1390,9 +1391,8 @@
  e100_enable_txdma_channel(struct e100_serial *info)
  {
  	unsigned long flags;
-
-	save_flags(flags);
-	cli();
+
+	spin_lock_irqsave(&serial_lock, flags);
  	/* Enable output DMA channel for the serial port in question */
  	if (info->line = 0) {
  		genconfig_shadow &=  ~IO_MASK(R_GEN_CONFIG, dma6);
@@ -1408,7 +1408,7 @@
  		genconfig_shadow |= IO_STATE(R_GEN_CONFIG, dma4, serial3);
  	}
  	*R_GEN_CONFIG = genconfig_shadow;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&serial_lock, flags);
  }


@@ -1514,7 +1514,7 @@
  		unsigned long flags;
  		unsigned long xoff;
  		
-		save_flags(flags); cli();
+		spin_lock_irqsave(&serial_lock, flags);
  		xoff = IO_FIELD(R_SERIAL0_XOFF, xoff_char, STOP_CHAR(info->tty));
  		xoff |= IO_STATE(R_SERIAL0_XOFF, tx_stop, stop);
  		if (tty->termios->c_iflag & IXON ) {
@@ -1522,7 +1522,7 @@
  		}
  	
  		*((unsigned long *)&info->port[REG_XOFF]) = xoff;
-		restore_flags(flags);
+		spin_unlock_irqrestore(&serial_lock, flags);
  	}
  }

@@ -1534,7 +1534,7 @@
  		unsigned long flags;
  		unsigned long xoff;

-		save_flags(flags); cli();
+		spin_lock_irqsave(&serial_lock, flags);
  		xoff = IO_FIELD(R_SERIAL0_XOFF, xoff_char, STOP_CHAR(tty));
  		xoff |= IO_STATE(R_SERIAL0_XOFF, tx_stop, enable);
  		if (tty->termios->c_iflag & IXON ) {
@@ -1543,7 +1543,7 @@
  	
  		*((unsigned long *)&info->port[REG_XOFF]) = xoff;
  		
-		restore_flags(flags);
+		spin_unlock_irqrestore(&serial_lock, flags);
  	}
  }

@@ -1712,9 +1712,9 @@
  static void flush_timeout_function(unsigned long data);
  #define START_FLUSH_FAST_TIMER(info, string) {\
    unsigned long timer_flags; \
-  save_flags(timer_flags); \
-  cli(); \
-  if (fast_timers[info->line].function = NULL) { \
+
+    spin_lock_irqsave(&serial_lock, timer_flags); \
+    if (fast_timers[info->line].function = NULL) { \
      serial_fast_timer_started++; \
      TIMERD(DEBUG_LOG(info->line, "start_timer %i ", info->line)); \
      TIMERD(DEBUG_LOG(info->line, "num started: %i\n", 
serial_fast_timer_started)); \
@@ -1727,7 +1727,7 @@
    else { \
      TIMERD(DEBUG_LOG(info->line, "timer %i already running\n", 
info->line)); \
    } \
-  restore_flags(timer_flags); \
+  spin_lock_irqrestore(&serial_lock, timer_flags); \
  }

  #else
@@ -1754,9 +1754,7 @@
  {
  	unsigned long flags;

-	save_flags(flags);
-	cli();
-
+	spin_lock_irqsave(&serial_lock, flags);
  	if (!info->first_recv_buffer)
  		info->first_recv_buffer = buffer;
  	else
@@ -1768,7 +1766,7 @@
  	if (info->recv_cnt > info->max_recv_cnt)
  		info->max_recv_cnt = info->recv_cnt;

-	restore_flags(flags);
+	spin_unlock_irqrestore(&serial_lock, flags);
  }

  static int
@@ -2134,11 +2132,10 @@
  	if (!info->first_recv_buffer)
  		return;

-	save_flags(flags);
-	cli();
-
+	spin_lock_irqsave(&serial_lock, flags);
+	
  	if (!(tty = info->tty)) {
-		restore_flags(flags);
+		spin_lock_irqrestore(&serial_lock, flags);
  		return;
  	}

@@ -2172,8 +2169,7 @@

  	tty->flip.count = length;

-	restore_flags(flags);
-
+	spin_unlock_irqrestore(&serial_lock, flags);
  	/* this includes a check for low-latency */
  	tty_flip_buffer_push(tty);
  }
@@ -2472,13 +2468,12 @@
  	if (!xmit_page)
  		return -ENOMEM;

-	save_flags(flags);
-	cli();
-
+	spin_lock_irqsave(&serial_lock, flags);
+	
  	/* if it was already initialized, skip this */

  	if (info->flags & ASYNC_INITIALIZED) {
-		restore_flags(flags);
+		spin_unlock_irqrestore(&serial_lock, flags);
  		free_page(xmit_page);
  		return 0;
  	}
@@ -2588,7 +2583,7 @@
  	
  	info->flags |= ASYNC_INITIALIZED;
  	
-	restore_flags(flags);
+	spin_lock_irqrestore(&serial_lock, flags);
  	return 0;
  }

@@ -2631,8 +2626,7 @@
  	       info->irq);
  #endif
  	
-	save_flags(flags);
-	cli(); /* Disable interrupts */
+	spin_lock_irqsave(&serial_lock, flags);
  	
  	if (info->xmit.buf) {
  		free_page((unsigned long)info->xmit.buf);
@@ -2656,7 +2650,7 @@
  		set_bit(TTY_IO_ERROR, &info->tty->flags);
  	
  	info->flags &= ~ASYNC_INITIALIZED;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&serial_lock, flags);
  }


@@ -2780,10 +2774,9 @@
  	
  	/* this protection might not exactly be necessary here */
  	
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&serial_lock, flags);
  	start_transmit(info);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&serial_lock, flags);
  }

  extern inline int
@@ -2810,7 +2803,6 @@
  	SIMCOUT(buf, count);
  	return count;
  #endif
-	save_flags(flags);
  	
  	/* the cli/restore_flags pairs below are needed because the
  	 * DMA interrupt handler moves the info->xmit values. the memcpy
@@ -2837,7 +2829,7 @@
  					ret = -EFAULT;
  				break;
  			}
-			cli();
+			spin_lock_irqsave(&serial_lock, flags);
  			c1 = CIRC_SPACE_TO_END(info->xmit.head,
  					       info->xmit.tail,
  					       SERIAL_XMIT_SIZE);
@@ -2846,14 +2838,14 @@
  			memcpy(info->xmit.buf + info->xmit.head, tmp_buf, c);
  			info->xmit.head = ((info->xmit.head + c) &
  					   (SERIAL_XMIT_SIZE-1));
-			restore_flags(flags);
+			spin_lock_irqrestore(&serial_lock, flags);
  			buf += c;
  			count -= c;
  			ret += c;
  		}
  		up(&tmp_buf_sem);
  	} else {
-		cli();	
+		spin_lock_irqsave(&serial_lock, flags);
  		while (1) {
  			c = CIRC_SPACE_TO_END(info->xmit.head,
  					      info->xmit.tail,
@@ -2871,7 +2863,7 @@
  			count -= c;
  			ret += c;
  		}
-		restore_flags(flags);
+		spin_unlock_irqrestore(&serial_lock, flags);
  	}
  	
  	/* enable transmitter if not running, unless the tty is stopped
@@ -2987,11 +2979,9 @@
  	struct e100_serial *info = (struct e100_serial *)tty->driver_data;
  	unsigned long flags;
  	
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&serial_lock_irqsave, flags);
  	info->xmit.head = info->xmit.tail = 0;
-	restore_flags(flags);
-
+	spin_lock_irqrestore(&serial_lock, flags);
  	wake_up_interruptible(&tty->write_wait);

  	if ((tty->flags & (1 << TTY_DO_WRITE_WAKEUP)) &&
@@ -3045,10 +3035,9 @@
  	/* Do RTS before XOFF since XOFF might take some time */
  	if (tty->termios->c_cflag & CRTSCTS) {
  		/* Turn off RTS line (do this atomic) */
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave(&serial_lock, flags);
  		e100_rts(info, 0);
-		restore_flags(flags);
+		spin_unlock_irqrestore(&serial_lock, flags);
  	}
  	if (I_IXOFF(tty))
  		rs_send_xchar(tty, STOP_CHAR(tty));
@@ -3070,10 +3059,9 @@
  	/* Do RTS before XOFF since XOFF might take some time */
  	if (tty->termios->c_cflag & CRTSCTS) {
  		/* Assert RTS line (do this atomic) */
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave(serial_lock, flags);
  		e100_rts(info, 1);
-		restore_flags(flags);
+		spin_lock_irqrestore(&serial_lock, flags);
  	}

  	if (I_IXOFF(tty)) {
@@ -3335,8 +3323,7 @@
  	if (!info->port)
  		return;
  	
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&serial_lock, flags);
  	if (break_state = -1) {
  		/* Go to manual mode and set the txd pin to 0 */
  		info->tx_ctrl &= 0x3F; /* Clear bit 7 (txd) and 6 (tr_enable) */
@@ -3344,7 +3331,7 @@
  		info->tx_ctrl |= (0x80 | 0x40); /* Set bit 7 (txd) and 6 (tr_enable) */
  	}
  	info->port[REG_TR_CTRL] = info->tx_ctrl;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&serial_lock, flags);
  }

  static int
@@ -3447,11 +3434,9 @@

  	/* interrupts are disabled for this entire function */

-	save_flags(flags);
-	cli();
-
+ 	spin_lock_irqsave(&serial_lock, flags);
  	if (tty_hung_up_p(filp)) {
-		restore_flags(flags);
+		spin_unlock_irqrestore(&serial_lock, flags);
  		return;
  	}

@@ -3478,7 +3463,7 @@
  		info->count = 0;
  	}
  	if (info->count) {
-		restore_flags(flags);
+		spin_unlock_irqrestore(&serial_lock, flags);
  		return;
  	}
  	info->flags |= ASYNC_CLOSING;
@@ -3528,8 +3513,8 @@
  	}
  	info->flags &= ~(ASYNC_NORMAL_ACTIVE|ASYNC_CLOSING);
  	wake_up_interruptible(&info->close_wait);
-	restore_flags(flags);
-
+	spin_unlock_irqrestore(&serial_lock, flags);
+	
  	/* port closed */

  #if defined(CONFIG_ETRAX_RS485)
@@ -3662,12 +3647,11 @@
  	restore_flags(flags);
  	info->blocked_open++;
  	while (1) {
-		save_flags(flags);
-		cli();
-                /* assert RTS and DTR */
+                spin_lock_irqsave(&serial_lock, flags);
+		/* assert RTS and DTR */
  		e100_rts(info, 1);
  		e100_dtr(info, 1);
-		restore_flags(flags);
+		spin_unlock_irqrestore(&serial_lock, flags);
  		set_current_state(TASK_INTERRUPTIBLE);
  		if (tty_hung_up_p(filp) ||
  		    !(info->flags & ASYNC_INITIALIZED)) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
