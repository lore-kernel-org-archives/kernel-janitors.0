From: Masoud Sharbiani <masouds@masoud.ir>
Date: Mon, 03 Oct 2005 17:51:48 +0000
Subject: [KJ] [PATCH] Stallion serial board sti()/cli() removal
Message-Id: <20051003175147.GA15354@masoud.ir>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89017773386493215=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89017773386493215==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, 
I've removed all references to old cli/sti method on stallion serial driver.
Please review and commit if necessary.
cheers, 
Masoud
PS: This is my first janitorial task. The patch below should apply cleanly to 2.6.14-rc2 or later.


----------------------------
diff --git a/drivers/char/stallion.c b/drivers/char/stallion.c
--- a/drivers/char/stallion.c
+++ b/drivers/char/stallion.c
@@ -43,7 +43,7 @@
 #include <linux/devfs_fs_kernel.h>
 #include <linux/device.h>
 #include <linux/delay.h>
-
+#include <linux/spinlock.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
 
@@ -721,6 +721,7 @@ static struct file_operations	stl_fsiome
 
 static struct class *stallion_class;
 
+static spinlock_t stallion_lock = SPIN_LOCK_UNLOCKED;
 /*
  *	Loadable module initialization stuff.
  */
@@ -733,10 +734,9 @@ static int __init stallion_module_init(v
 	printk("init_module()\n");
 #endif
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	stl_init();
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 
 	return(0);
 }
@@ -758,8 +758,7 @@ static void __exit stallion_module_exit(
 	printk(KERN_INFO "Unloading %s: version %s\n", stl_drvtitle,
 		stl_drvversion);
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 
 /*
  *	Free up all allocated resources used by the ports. This includes
@@ -772,7 +771,7 @@ static void __exit stallion_module_exit(
 	if (i) {
 		printk("STALLION: failed to un-register tty driver, "
 			"errno=%d\n", -i);
-		restore_flags(flags);
+		spin_unlock_irqrestore(&stallion_lock, flags);
 		return;
 	}
 	for (i = 0; i < 4; i++) {
@@ -819,7 +818,7 @@ static void __exit stallion_module_exit(
 		stl_brds[i] = (stlbrd_t *) NULL;
 	}
 
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 module_init(stallion_module_init);
@@ -1086,8 +1085,7 @@ static int stl_waitcarrier(stlport_t *po
 	if (portp->tty->termios->c_cflag & CLOCAL)
 		doclocal++;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	portp->openwaitcnt++;
 	if (! tty_hung_up_p(filp))
 		portp->refcount--;
@@ -1116,7 +1114,7 @@ static int stl_waitcarrier(stlport_t *po
 	if (! tty_hung_up_p(filp))
 		portp->refcount++;
 	portp->openwaitcnt--;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 
 	return(rc);
 }
@@ -1136,16 +1134,15 @@ static void stl_close(struct tty_struct 
 	if (portp == (stlport_t *) NULL)
 		return;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	if (tty_hung_up_p(filp)) {
-		restore_flags(flags);
+		spin_unlock_irqrestore(&stallion_lock, flags);
 		return;
 	}
 	if ((tty->count == 1) && (portp->refcount != 1))
 		portp->refcount = 1;
 	if (portp->refcount-- > 1) {
-		restore_flags(flags);
+		spin_unlock_irqrestore(&stallion_lock, flags);
 		return;
 	}
 
@@ -1190,7 +1187,7 @@ static void stl_close(struct tty_struct 
 
 	portp->flags &= ~(ASYNC_NORMAL_ACTIVE|ASYNC_CLOSING);
 	wake_up_interruptible(&portp->close_wait);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -2899,8 +2896,7 @@ static int stl_getportstats(stlport_t *p
 	portp->stats.lflags = 0;
 	portp->stats.rxbuffered = 0;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	if (portp->tty != (struct tty_struct *) NULL) {
 		if (portp->tty->driver_data == portp) {
 			portp->stats.ttystate = portp->tty->flags;
@@ -2913,7 +2909,7 @@ static int stl_getportstats(stlport_t *p
 			}
 		}
 	}
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 
 	head = portp->tx.head;
 	tail = portp->tx.tail;
@@ -3445,8 +3441,7 @@ static void stl_cd1400setport(stlport_t 
 		tiosp->c_cc[VSTART], tiosp->c_cc[VSTOP]);
 #endif
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_cd1400setreg(portp, CAR, (portp->portnr & 0x3));
 	srer = stl_cd1400getreg(portp, SRER);
@@ -3483,7 +3478,7 @@ static void stl_cd1400setport(stlport_t 
 		portp->sigs &= ~TIOCM_CD;
 	stl_cd1400setreg(portp, SRER, ((srer & ~sreroff) | sreron));
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -3509,8 +3504,7 @@ static void stl_cd1400setsignals(stlport
 	if (rts > 0)
 		msvr2 = MSVR2_RTS;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_cd1400setreg(portp, CAR, (portp->portnr & 0x03));
 	if (rts >= 0)
@@ -3518,7 +3512,7 @@ static void stl_cd1400setsignals(stlport
 	if (dtr >= 0)
 		stl_cd1400setreg(portp, MSVR1, msvr1);
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -3537,14 +3531,13 @@ static int stl_cd1400getsignals(stlport_
 	printk("stl_cd1400getsignals(portp=%x)\n", (int) portp);
 #endif
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_cd1400setreg(portp, CAR, (portp->portnr & 0x03));
 	msvr1 = stl_cd1400getreg(portp, MSVR1);
 	msvr2 = stl_cd1400getreg(portp, MSVR2);
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 
 	sigs = 0;
 	sigs |= (msvr1 & MSVR1_DCD) ? TIOCM_CD : 0;
@@ -3586,15 +3579,14 @@ static void stl_cd1400enablerxtx(stlport
 	else if (rx > 0)
 		ccr |= CCR_RXENABLE;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_cd1400setreg(portp, CAR, (portp->portnr & 0x03));
 	stl_cd1400ccrwait(portp);
 	stl_cd1400setreg(portp, CCR, ccr);
 	stl_cd1400ccrwait(portp);
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -3626,8 +3618,7 @@ static void stl_cd1400startrxtx(stlport_
 	else if (rx > 0)
 		sreron |= SRER_RXDATA;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_cd1400setreg(portp, CAR, (portp->portnr & 0x03));
 	stl_cd1400setreg(portp, SRER,
@@ -3635,7 +3626,7 @@ static void stl_cd1400startrxtx(stlport_
 	BRDDISABLE(portp->brdnr);
 	if (tx > 0)
 		set_bit(ASYI_TXBUSY, &portp->istate);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -3651,13 +3642,12 @@ static void stl_cd1400disableintrs(stlpo
 #ifdef DEBUG
 	printk("stl_cd1400disableintrs(portp=%x)\n", (int) portp);
 #endif
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_cd1400setreg(portp, CAR, (portp->portnr & 0x03));
 	stl_cd1400setreg(portp, SRER, 0);
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -3670,8 +3660,7 @@ static void stl_cd1400sendbreak(stlport_
 	printk("stl_cd1400sendbreak(portp=%x,len=%d)\n", (int) portp, len);
 #endif
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_cd1400setreg(portp, CAR, (portp->portnr & 0x03));
 	stl_cd1400setreg(portp, SRER,
@@ -3681,7 +3670,7 @@ static void stl_cd1400sendbreak(stlport_
 	portp->brklen = len;
 	if (len == 1)
 		portp->stats.txbreaks++;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -3705,8 +3694,7 @@ static void stl_cd1400flowctrl(stlport_t
 	if (tty == (struct tty_struct *) NULL)
 		return;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_cd1400setreg(portp, CAR, (portp->portnr & 0x03));
 
@@ -3746,7 +3734,7 @@ static void stl_cd1400flowctrl(stlport_t
 	}
 
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -3770,8 +3758,7 @@ static void stl_cd1400sendflow(stlport_t
 	if (tty == (struct tty_struct *) NULL)
 		return;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_cd1400setreg(portp, CAR, (portp->portnr & 0x03));
 	if (state) {
@@ -3786,7 +3773,7 @@ static void stl_cd1400sendflow(stlport_t
 		stl_cd1400ccrwait(portp);
 	}
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -3802,8 +3789,7 @@ static void stl_cd1400flush(stlport_t *p
 	if (portp == (stlport_t *) NULL)
 		return;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_cd1400setreg(portp, CAR, (portp->portnr & 0x03));
 	stl_cd1400ccrwait(portp);
@@ -3811,7 +3797,7 @@ static void stl_cd1400flush(stlport_t *p
 	stl_cd1400ccrwait(portp);
 	portp->tx.tail = portp->tx.head;
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -4461,8 +4447,7 @@ static void stl_sc26198setport(stlport_t
 		tiosp->c_cc[VSTART], tiosp->c_cc[VSTOP]);
 #endif
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_sc26198setreg(portp, IMR, 0);
 	stl_sc26198updatereg(portp, MR0, mr0);
@@ -4489,7 +4474,7 @@ static void stl_sc26198setport(stlport_t
 	portp->imr = (portp->imr & ~imroff) | imron;
 	stl_sc26198setreg(portp, IMR, portp->imr);
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -4519,13 +4504,12 @@ static void stl_sc26198setsignals(stlpor
 	else if (rts > 0)
 		iopioron |= IPR_RTS;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_sc26198setreg(portp, IOPIOR,
 		((stl_sc26198getreg(portp, IOPIOR) & ~iopioroff) | iopioron));
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -4544,12 +4528,11 @@ static int stl_sc26198getsignals(stlport
 	printk("stl_sc26198getsignals(portp=%x)\n", (int) portp);
 #endif
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	ipr = stl_sc26198getreg(portp, IPR);
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 
 	sigs = 0;
 	sigs |= (ipr & IPR_DCD) ? 0 : TIOCM_CD;
@@ -4586,13 +4569,12 @@ static void stl_sc26198enablerxtx(stlpor
 	else if (rx > 0)
 		ccr |= CR_RXENABLE;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_sc26198setreg(portp, SCCR, ccr);
 	BRDDISABLE(portp->brdnr);
 	portp->crenable = ccr;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -4621,15 +4603,14 @@ static void stl_sc26198startrxtx(stlport
 	else if (rx > 0)
 		imr |= IR_RXRDY | IR_RXBREAK | IR_RXWATCHDOG;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_sc26198setreg(portp, IMR, imr);
 	BRDDISABLE(portp->brdnr);
 	portp->imr = imr;
 	if (tx > 0)
 		set_bit(ASYI_TXBUSY, &portp->istate);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -4646,13 +4627,12 @@ static void stl_sc26198disableintrs(stlp
 	printk("stl_sc26198disableintrs(portp=%x)\n", (int) portp);
 #endif
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	portp->imr = 0;
 	stl_sc26198setreg(portp, IMR, 0);
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -4665,8 +4645,7 @@ static void stl_sc26198sendbreak(stlport
 	printk("stl_sc26198sendbreak(portp=%x,len=%d)\n", (int) portp, len);
 #endif
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	if (len == 1) {
 		stl_sc26198setreg(portp, SCCR, CR_TXSTARTBREAK);
@@ -4675,7 +4654,7 @@ static void stl_sc26198sendbreak(stlport
 		stl_sc26198setreg(portp, SCCR, CR_TXSTOPBREAK);
 	}
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -4700,8 +4679,7 @@ static void stl_sc26198flowctrl(stlport_
 	if (tty == (struct tty_struct *) NULL)
 		return;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 
 	if (state) {
@@ -4747,7 +4725,7 @@ static void stl_sc26198flowctrl(stlport_
 	}
 
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -4772,8 +4750,7 @@ static void stl_sc26198sendflow(stlport_
 	if (tty == (struct tty_struct *) NULL)
 		return;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	if (state) {
 		mr0 = stl_sc26198getreg(portp, MR0);
@@ -4793,7 +4770,7 @@ static void stl_sc26198sendflow(stlport_
 		stl_sc26198setreg(portp, MR0, mr0);
 	}
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -4809,14 +4786,13 @@ static void stl_sc26198flush(stlport_t *
 	if (portp == (stlport_t *) NULL)
 		return;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	stl_sc26198setreg(portp, SCCR, CR_TXRESET);
 	stl_sc26198setreg(portp, SCCR, portp->crenable);
 	BRDDISABLE(portp->brdnr);
 	portp->tx.tail = portp->tx.head;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 }
 
 /*****************************************************************************/
@@ -4843,12 +4819,11 @@ static int stl_sc26198datastate(stlport_
 	if (test_bit(ASYI_TXBUSY, &portp->istate))
 		return(1);
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&stallion_lock, flags);
 	BRDENABLE(portp->brdnr, portp->pagenr);
 	sr = stl_sc26198getreg(portp, SR);
 	BRDDISABLE(portp->brdnr);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&stallion_lock, flags);
 
 	return((sr & SR_TXEMPTY) ? 0 : 1);
 }

--===============89017773386493215==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89017773386493215==--
