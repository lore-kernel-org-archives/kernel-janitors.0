From: james4765@verizon.net
Date: Fri, 17 Dec 2004 00:12:47 +0000
Subject: [KJ] [PATCH] digiepca: replace cli()/sti() with
Message-Id: <20041217001308.13972.3832.34371@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51854560396496718=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51854560396496718==

This is an attempt to make the digiepca driver SMP-correct.

Compile tested.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.10-rc3-original/drivers/char/epca.c linux-2.6.10-rc3/drivers/char/epca.c
--- linux-2.6.10-rc3-original/drivers/char/epca.c	2004-12-03 16:53:57.000000000 -0500
+++ linux-2.6.10-rc3/drivers/char/epca.c	2004-12-16 18:59:19.435134749 -0500
@@ -81,6 +81,8 @@
 
 /* ----------------- Begin global definitions ------------------- */
 
+static spinlock_t epca_lock = SPIN_LOCK_UNLOCKED;
+
 static char mesg[100];
 static int nbdevs, num_cards, liloconfig;
 static int digi_poller_inhibited = 1 ;
@@ -501,13 +503,11 @@
 	if ((ch = verifyChannel(tty)) != NULL) 
 	{ /* Begin if ch != NULL */
 
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave (&epca_lock, flags);
 
 		if (tty_hung_up_p(filp)) 
 		{
-			restore_flags(flags);
-			return;
+			goto close_exit;
 		}
 
 		/* Check to see if the channel is open more than once */
@@ -519,8 +519,7 @@
 				the channel.
 			---------------------------------------------------------------- */
 
-			restore_flags(flags);
-			return;
+			goto close_exit;
 		} /* End channel is open more than once */
 
 		/* Port open only once go ahead with shutdown & reset */
@@ -573,10 +572,12 @@
 		wake_up_interruptible(&ch->close_wait);
 
 
-		restore_flags(flags);
+close_exit:	spin_unlock_irqrestore(&epca_lock, flags);
 
 	} /* End if ch != NULL */
 
+	return;
+
 } /* End pc_close */ 
 
 /* ------------------ Begin shutdown  ------------------------- */
@@ -591,8 +592,7 @@
 	if (!(ch->asyncflags & ASYNC_INITIALIZED)) 
 		return;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 	globalwinon(ch);
 
 	bc = ch->brdchan;
@@ -628,7 +628,7 @@
 	/* Prevent future Digi programmed interrupts from coming active */
 
 	ch->asyncflags &= ~ASYNC_INITIALIZED;
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 } /* End shutdown */
 
@@ -649,8 +649,7 @@
 
 		unsigned long flags;
 
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave (&epca_lock, flags);
 		if (tty->driver->flush_buffer)
 			tty->driver->flush_buffer(tty);
 		tty_ldisc_flush(tty);
@@ -659,7 +658,7 @@
 		ch->tty   = NULL;
 		ch->event = 0;
 		ch->count = 0;
-		restore_flags(flags);
+		spin_unlock_irqrestore (&epca_lock, flags);
 		ch->asyncflags &= ~(ASYNC_NORMAL_ACTIVE | ASYNC_INITIALIZED);
 		wake_up_interruptible(&ch->open_wait);
 
@@ -708,8 +707,7 @@
 	size = ch->txbufsize;
 
 	amountCopied = 0;
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 
 	globalwinon(ch);
 
@@ -785,7 +783,7 @@
 		bc->ilow = 1;
 	}
 	memoff(ch);
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 	return(amountCopied);
 
@@ -822,8 +820,7 @@
 
 	if ((ch = verifyChannel(tty)) != NULL) 
 	{
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave (&epca_lock, flags);
 		globalwinon(ch);
 
 		bc   = ch->brdchan;
@@ -844,7 +841,7 @@
 			bc->ilow = 1;
 		}
 		memoff(ch);
-		restore_flags(flags);
+		spin_unlock_irqrestore (&epca_lock, flags);
 	}
 
 	/* Return how much room is left on card */
@@ -873,8 +870,7 @@
 	if ((ch = verifyChannel(tty)) == NULL)
 		return(0);
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 	globalwinon(ch);
 
 	bc = ch->brdchan;
@@ -915,7 +911,7 @@
 	} /* End if some space on the card has been used */
 
 	memoff(ch);
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 	/* Return number of characters residing on card. */
 	return(chars);
@@ -941,8 +937,7 @@
 	if ((ch = verifyChannel(tty)) == NULL)
 		return;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 
 	globalwinon(ch);
 
@@ -954,7 +949,7 @@
 	fepcmd(ch, STOUT, (unsigned) tail, 0, 0, 0);
 
 	memoff(ch);
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 	wake_up_interruptible(&tty->write_wait);
 	tty_wakeup(tty);
@@ -977,8 +972,7 @@
 	{
 		unsigned long flags;
 
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave (&epca_lock, flags);
 
 		/* ----------------------------------------------------------------
 			If not already set and the transmitter is busy setup an event
@@ -988,7 +982,7 @@
 		if ((ch->statusflags & TXBUSY) && !(ch->statusflags & EMPTYWAIT))
 			setup_empty_event(tty,ch);
 
-		restore_flags(flags);
+		spin_unlock_irqrestore (&epca_lock, flags);
 	}
 
 } /* End pc_flush_chars */
@@ -1047,15 +1041,14 @@
 	
 	retval = 0;
 	add_wait_queue(&ch->open_wait, &wait);
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 
 
 	/* We dec count so that pc_close will know when to free things */
 	if (!tty_hung_up_p(filp))
 		ch->count--;
 
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 	ch->blocked_open++;
 
@@ -1096,10 +1089,10 @@
 
 	current->state = TASK_RUNNING;
 	remove_wait_queue(&ch->open_wait, &wait);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 	if (!tty_hung_up_p(filp))
 		ch->count++;
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 	ch->blocked_open--;
 
@@ -1200,8 +1193,7 @@
 		the tty->termios struct otherwise let pc_close handle it.
 	-------------------------------------------------------------------- */
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 
 	globalwinon(ch);
 	ch->statusflags = 0;
@@ -1228,7 +1220,7 @@
 	ch->asyncflags |= ASYNC_INITIALIZED;
 	memoff(ch);
 
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 	retval = block_til_ready(tty, filp, ch);
 	if (retval)
@@ -1242,15 +1234,14 @@
 	--------------------------------------------------------------- */
 	ch->tty = tty;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 	globalwinon(ch);
 
 	/* Enable Digi Data events */
 	bc->idata = 1;
 
 	memoff(ch);
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 	return 0;
 
@@ -1262,12 +1253,11 @@
 
 	unsigned long	flags;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 
 	pc_init();
 
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 	return(0);
 }
@@ -1292,15 +1282,13 @@
 
 	del_timer_sync(&epca_timer);
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 
 	if ((tty_unregister_driver(pc_driver)) ||  
 	    (tty_unregister_driver(pc_info)))
 	{
 		printk(KERN_WARNING "<Error> - DIGI : cleanup_module failed to un-register tty driver\n");
-		restore_flags(flags);
-		return;
+		goto mod_exit;
 	}
 	put_tty_driver(pc_driver);
 	put_tty_driver(pc_info);
@@ -1313,7 +1301,7 @@
 		if (!bd)
 		{ /* Begin sanity check */
 			printk(KERN_ERR "<Error> - Digi : cleanup_module failed\n");
-			return;
+			goto mod_exit;
 		} /* End sanity check */
 
 		ch = card_ptr[crd]; 
@@ -1335,7 +1323,10 @@
 	pci_unregister_driver (&epca_driver);
 #endif
 
-	restore_flags(flags);
+mod_exit:
+	spin_unlock_irqrestore (&epca_lock, flags);
+
+	return;
 
 }
 module_exit(epca_module_exit);
@@ -1499,8 +1490,7 @@
 	tty_set_operations(pc_info, &info_ops);
 
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 
 	for (crd = 0; crd < num_cards; crd++) 
 	{ /* Begin for each card */
@@ -1635,7 +1625,7 @@
 	epca_timer.function = epcapoll;
 	mod_timer(&epca_timer, jiffies + HZ/25);
 
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 	return 0;
 
@@ -1943,8 +1933,7 @@
 		buffer empty) and acts on those events.
 	----------------------------------------------------------------------- */
 	
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 
 	for (crd = 0; crd < num_cards; crd++) 
 	{ /* Begin for each card */
@@ -1984,7 +1973,7 @@
 
 	mod_timer(&epca_timer, jiffies + (HZ / 25));
 
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 } /* End epcapoll */
 
 /* --------------------- Begin doevent  ------------------------ */
@@ -2762,12 +2751,11 @@
 		return(-EINVAL);
 	}
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 	globalwinon(ch);
 	mstat = bc->mstat;
 	memoff(ch);
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 	if (mstat & ch->m_dtr)
 		mflag |= TIOCM_DTR;
@@ -2801,8 +2789,7 @@
 		return(-EINVAL);
 	}
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 	/*
 	 * I think this modemfake stuff is broken.  It doesn't
 	 * correctly reflect the behaviour desired by the TIOCM*
@@ -2834,7 +2821,7 @@
 
 	epcaparam(tty,ch);
 	memoff(ch);
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 	return 0;
 }
 
@@ -2859,8 +2846,6 @@
 		return(-EINVAL);
 	}
 
-	save_flags(flags);
-
 	/* -------------------------------------------------------------------
 		For POSIX compliance we need to add more ioctls.  See tty_ioctl.c
 		in /usr/src/linux/drivers/char for a good example.  In particular 
@@ -2936,20 +2921,20 @@
 
 		case TIOCSDTR:
 			ch->omodem |= ch->m_dtr;
-			cli();
+			spin_lock_irqsave (&epca_lock, flags);
 			globalwinon(ch);
 			fepcmd(ch, SETMODEM, ch->m_dtr, 0, 10, 1);
 			memoff(ch);
-			restore_flags(flags);
+			spin_unlock_irqrestore (&epca_lock, flags);
 			break;
 
 		case TIOCCDTR:
 			ch->omodem &= ~ch->m_dtr;
-			cli();
+			spin_lock_irqsave (&epca_lock, flags);
 			globalwinon(ch);
 			fepcmd(ch, SETMODEM, 0, ch->m_dtr, 10, 1);
 			memoff(ch);
-			restore_flags(flags);
+			spin_unlock_irqrestore (&epca_lock, flags);
 			break;
 
 		case DIGI_GETA:
@@ -2990,7 +2975,7 @@
 				ch->dsr = ch->m_dsr;
 			}
 		
-			cli();
+			spin_lock_irqsave (&epca_lock, flags);
 			globalwinon(ch);
 
 			/* -----------------------------------------------------------------
@@ -3000,12 +2985,12 @@
 
 			epcaparam(tty,ch);
 			memoff(ch);
-			restore_flags(flags);
+			spin_unlock_irqrestore (&epca_lock, flags);
 			break;
 
 		case DIGI_GETFLOW:
 		case DIGI_GETAFLOW:
-			cli();	
+			spin_lock_irqsave (&epca_lock, flags);	
 			globalwinon(ch);
 			if ((cmd) == (DIGI_GETFLOW)) 
 			{
@@ -3018,7 +3003,7 @@
 				dflow.stopc = bc->stopca;
 			}
 			memoff(ch);
-			restore_flags(flags);
+			spin_unlock_irqrestore (&epca_lock, flags);
 
 			if (copy_to_user(argp, &dflow, sizeof(dflow)))
 				return -EFAULT;
@@ -3042,7 +3027,7 @@
 
 			if (dflow.startc != startc || dflow.stopc != stopc) 
 			{ /* Begin  if setflow toggled */
-				cli();
+				spin_lock_irqsave (&epca_lock, flags);
 				globalwinon(ch);
 
 				if ((cmd) == (DIGI_SETFLOW)) 
@@ -3062,7 +3047,7 @@
 					pc_start(tty);
 
 				memoff(ch);
-				restore_flags(flags);
+				spin_unlock_irqrestore (&epca_lock, flags);
 
 			} /* End if setflow toggled */
 			break;
@@ -3092,8 +3077,7 @@
 	if ((ch = verifyChannel(tty)) != NULL) 
 	{ /* Begin if channel valid */
 
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave (&epca_lock, flags);
 		globalwinon(ch);
 		epcaparam(tty, ch);
 		memoff(ch);
@@ -3106,7 +3090,7 @@
 			 (tty->termios->c_cflag & CLOCAL))
 			wake_up_interruptible(&ch->open_wait);
 
-		restore_flags(flags);
+		spin_unlock_irqrestore (&epca_lock, flags);
 
 	} /* End if channel valid */
 
@@ -3163,8 +3147,7 @@
 	if ((ch = verifyChannel(tty)) != NULL) 
 	{ /* Begin if valid channel */
 
-		save_flags(flags); 
-		cli();
+		spin_lock_irqsave (&epca_lock, flags);
 
 		if ((ch->statusflags & TXSTOPPED) == 0) 
 		{ /* Begin if transmit stop requested */
@@ -3180,7 +3163,7 @@
 
 		} /* End if transmit stop requested */
 
-		restore_flags(flags);
+		spin_unlock_irqrestore (&epca_lock, flags);
 
 	} /* End if valid channel */
 
@@ -3203,8 +3186,7 @@
 
 		unsigned long flags;
 
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave (&epca_lock, flags);
 
 		/* Just in case output was resumed because of a change in Digi-flow */
 		if (ch->statusflags & TXSTOPPED) 
@@ -3226,7 +3208,7 @@
 
 		} /* End transmit resume requested */
 
-		restore_flags(flags);
+		spin_unlock_irqrestore (&epca_lock, flags);
 
 	} /* End if channel valid */
 
@@ -3257,8 +3239,7 @@
 	{ /* Begin if channel valid */
 
 
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave (&epca_lock, flags);
 
 		if ((ch->statusflags & RXSTOPPED) == 0)
 		{
@@ -3268,7 +3249,7 @@
 			ch->statusflags |= RXSTOPPED;
 			memoff(ch);
 		}
-		restore_flags(flags);
+		spin_unlock_irqrestore (&epca_lock, flags);
 
 	} /* End if channel valid */
 
@@ -3294,8 +3275,7 @@
 
 
 		/* Just in case output was resumed because of a change in Digi-flow */
-		save_flags(flags);
-		cli();
+		spin_lock_irqsave (&epca_lock, flags);
 
 		if (ch->statusflags & RXSTOPPED) 
 		{
@@ -3307,7 +3287,7 @@
 			ch->statusflags &= ~RXSTOPPED;
 			memoff(ch);
 		}
-		restore_flags(flags);
+		spin_unlock_irqrestore (&epca_lock, flags);
 
 	} /* End if channel valid */
 
@@ -3320,8 +3300,7 @@
 
 	unsigned long flags;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 	globalwinon(ch);
 
 	/* -------------------------------------------------------------------- 
@@ -3335,7 +3314,7 @@
 	fepcmd(ch, SENDBREAK, msec, 0, 10, 0);
 	memoff(ch);
 
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 } /* End digi_send_break */
 
@@ -3347,8 +3326,7 @@
 	volatile struct board_chan *bc = ch->brdchan;
 	unsigned long int flags;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave (&epca_lock, flags);
 	globalwinon(ch);
 	ch->statusflags |= EMPTYWAIT;
 	
@@ -3359,7 +3337,7 @@
 
 	bc->iempty = 1;
 	memoff(ch);
-	restore_flags(flags);
+	spin_unlock_irqrestore (&epca_lock, flags);
 
 } /* End setup_empty_event */
 
diff -urN --exclude='*~' linux-2.6.10-rc3-original/drivers/char/Kconfig linux-2.6.10-rc3/drivers/char/Kconfig
--- linux-2.6.10-rc3-original/drivers/char/Kconfig	2004-12-03 16:52:14.000000000 -0500
+++ linux-2.6.10-rc3/drivers/char/Kconfig	2004-12-16 18:55:04.499551964 -0500
@@ -138,7 +138,7 @@
 
 config DIGIEPCA
 	tristate "Digiboard Intelligent Async Support"
-	depends on SERIAL_NONSTANDARD && BROKEN_ON_SMP
+	depends on SERIAL_NONSTANDARD
 	---help---
 	  This is a driver for Digi International's Xx, Xeve, and Xem series
 	  of cards which provide multiple serial ports. You would need

--===============51854560396496718==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51854560396496718==--
