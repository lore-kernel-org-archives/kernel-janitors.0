From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 02 Jan 2007 23:23:26 +0000
Subject: Re: [KJ] [PATCH] set_current_state usage in oss/
Message-Id: <1167780206.22745.5.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1167089629.11578.2.camel@alice>
In-Reply-To: <1167089629.11578.2.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi, 

thanks for your comments, i am sorry i
didnt have time to look at this again until now

> >  			}
> >  			mutex_unlock(&bta->lock);
> > -			current->state = TASK_INTERRUPTIBLE;
> > +			__set_current_state(TASK_INTERRUPTIBLE);
> >  			schedule();
> >  			mutex_lock(&bta->lock);
> >  			if(signal_pending(current)) {
> > @@ -608,7 +608,7 @@ static ssize_t btaudio_dsp_read(struct f
> >  	}
> >  	mutex_unlock(&bta->lock);
> >  	remove_wait_queue(&bta->readq, &wait);
> > -	current->state = TASK_RUNNING;
> > +	__set_current_state(TASK_RUNNING);
> 
> Both lines might be replaced with something like finish_wait().

care to explain the first one?


> > --- linux-2.6.20-rc2/sound/oss/cs46xx.c.orig	2006-12-26 00:04:05.000000000 +0100
> > +++ linux-2.6.20-rc2/sound/oss/cs46xx.c	2006-12-26 00:04:06.000000000 +0100
> > @@ -1435,7 +1435,7 @@ static int drain_dac(struct cs_state *st
> >  	for (;;) {
> >  		/* It seems that we have to set the current state to TASK_INTERRUPTIBLE
> >  		   every time to make the process really go to sleep */
> > -		current->state = TASK_INTERRUPTIBLE;
> > +		__set_current_state(TASK_INTERRUPTIBLE);
> >  
> >  		spin_lock_irqsave(&state->card->lock, flags);
> >  		count = dmabuf->count;
> > @@ -1449,7 +1449,7 @@ static int drain_dac(struct cs_state *st
> >  
> >  		if (nonblock) {
> >  			remove_wait_queue(&dmabuf->wait, &wait);
> > -			current->state = TASK_RUNNING;
> > +			__set_current_state(TASK_RUNNING);
> 
> finish_wait()

same here, the second one is clear

> And so on. Consider using these APIs
> (schedule_timeout_{,un}interruptible(), prepare_to_wait(),
> finish_wait()) rather than just the small change of using the
> __set_current_state() macro. Admittedly, this is all in OSS, which is
> slowly being removed (by Adrian Bunk) in favor of ALSA. I sent in many
> patches before for fixing up similar callers, but left OSS alone.

A grep found me ~178 usages of this type in the kernel, and so i decided i
should start where not much can go wrong :-)
I tried to redo the patch, taking the wait api into consideration, but left 
the two cases above unchanged. Patch is a bit bigger now, since we could 
replace the sleep() functions with a direct call to schedule_timeout_interruptible().

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.20-rc3/sound/oss/btaudio.c.orig	2007-01-02 23:55:05.000000000 +0100
+++ linux-2.6.20-rc3/sound/oss/btaudio.c	2007-01-02 23:57:13.000000000 +0100
@@ -607,8 +607,7 @@ static ssize_t btaudio_dsp_read(struct f
 			bta->read_offset = 0;
 	}
 	mutex_unlock(&bta->lock);
-	remove_wait_queue(&bta->readq, &wait);
-	current->state = TASK_RUNNING;
+	finish_wait(&bta->readq, &wait);
 	return ret;
 }
 
--- linux-2.6.20-rc3/sound/oss/cs4232.c.orig	2007-01-02 23:58:50.000000000 +0100
+++ linux-2.6.20-rc3/sound/oss/cs4232.c	2007-01-03 00:01:58.000000000 +0100
@@ -96,12 +96,6 @@ static unsigned char crystal_key[] =	/* 
 	0x09, 0x84, 0x42, 0xa1, 0xd0, 0x68, 0x34, 0x1a
 };
 
-static void sleep(unsigned howlong)
-{
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(howlong);
-}
-
 static void enable_xctrl(int baseio)
 {
         unsigned char regd;
@@ -179,7 +173,7 @@ static int __init probe_cs4232(struct ad
 		for (i = 0; i < 32; i++)
 			CS_OUT(crystal_key[i]);
 
-		sleep(HZ / 10);
+		schedule_timeout_interruptible(HZ / 10);
 
 		/*
 		 *	Now set the CSN (Card Select Number).
@@ -212,7 +206,7 @@ static int __init probe_cs4232(struct ad
 
 		CS_OUT2(0x33, 0x01);	/* Activate logical dev 0 */
 
-		sleep(HZ / 10);
+		schedule_timeout_interruptible(HZ / 10);
 
 		/*
 		 * Initialize logical device 3 (MPU)
@@ -241,7 +235,7 @@ static int __init probe_cs4232(struct ad
 		
 		CS_OUT(0x79);
 
-		sleep(HZ / 5);
+		schedule_timeout_interruptible(HZ / 5);
 
 		/*
 		 * Then try to detect the codec part of the chip
@@ -250,7 +244,7 @@ static int __init probe_cs4232(struct ad
 		if (ad1848_detect(ports, NULL, hw_config->osp))
 			goto got_it;
 		
-		sleep(HZ);
+		schedule_timeout_interruptible(HZ);
 	}
 fail:
 	release_region(base, 4);
--- linux-2.6.20-rc3/sound/oss/cs46xx.c.orig	2007-01-03 00:03:09.000000000 +0100
+++ linux-2.6.20-rc3/sound/oss/cs46xx.c	2007-01-03 00:07:42.000000000 +0100
@@ -1448,8 +1448,7 @@ static int drain_dac(struct cs_state *st
 			break;
 
 		if (nonblock) {
-			remove_wait_queue(&dmabuf->wait, &wait);
-			current->state = TASK_RUNNING;
+			finish_wait(&dmabuf->wait, &wait);
 			return -EBUSY;
 		}
 
@@ -1462,8 +1461,7 @@ static int drain_dac(struct cs_state *st
 			break;
 		}
 	}
-	remove_wait_queue(&dmabuf->wait, &wait);
-	current->state = TASK_RUNNING;
+	finish_wait(&dmabuf->wait, &wait);
 	if (signal_pending(current)) {
 		CS_DBGOUT(CS_FUNCTION, 4, printk("cs46xx: drain_dac()- -ERESTARTSYS\n"));
 		/*
@@ -1834,8 +1832,7 @@ static int cs_midi_release(struct inode 
         unsigned count, tmo;
 
         if (file->f_mode & FMODE_WRITE) {
-                current->state = TASK_INTERRUPTIBLE;
-                add_wait_queue(&card->midi.owait, &wait);
+		prepare_to_wait(&card->midi.owait, &wait, TASK_INTERRUPTIBLE);
                 for (;;) {
                         spin_lock_irqsave(&card->midi.lock, flags);
                         count = card->midi.ocnt;
@@ -1850,8 +1847,7 @@ static int cs_midi_release(struct inode 
                         if (!schedule_timeout(tmo ? : 1) && tmo)
                                 printk(KERN_DEBUG "cs46xx: midi timed out??\n");
                 }
-                remove_wait_queue(&card->midi.owait, &wait);
-                current->state = TASK_RUNNING;
+		finish_wait(&card->midi.owait, &wait);
         }
         mutex_lock(&card->midi.open_mutex);
         card->midi.open_mode &= (~(file->f_mode & (FMODE_READ | FMODE_WRITE)));
@@ -4770,8 +4766,7 @@ static int cs_hardware_init(struct cs_ca
 		 */
 			if (cs461x_peekBA0(card, BA0_ACSTS) & ACSTS_CRDY)
 				break;
-			current->state = TASK_UNINTERRUPTIBLE;
-			schedule_timeout(1);
+			schedule_timeout_interruptible(1);
 		} while (time_before(jiffies, end_time));
 	} else {
 		for (count = 0; count < 100; count++) {
@@ -4815,8 +4810,7 @@ static int cs_hardware_init(struct cs_ca
 			 */
 			if ((cs461x_peekBA0(card, BA0_ACISV) & (ACISV_ISV3 | ACISV_ISV4)) = (ACISV_ISV3 | ACISV_ISV4))
 				break;
-			current->state = TASK_UNINTERRUPTIBLE;
-			schedule_timeout(1);
+			schedule_timeout_interruptible(1);
 		} while (time_before(jiffies, end_time));
 	} else {
 		for (count = 0; count < 100; count++) {
--- linux-2.6.20-rc3/sound/oss/emu10k1/ecard.c.orig	2007-01-03 00:09:17.000000000 +0100
+++ linux-2.6.20-rc3/sound/oss/emu10k1/ecard.c	2007-01-03 00:09:34.000000000 +0100
@@ -138,9 +138,7 @@ void __devinit emu10k1_ecard_init(struct
 	ecard_write(card, EC_DACCAL | EC_LEDN | EC_TRIM_CSN);
 
 	/* Step 3: Wait for awhile; FIXME: Is this correct? */
-
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(HZ);
+	schedule_timeout_interruptible(HZ);
 
 	/* Step 4: Switch off the DAC and ADC calibration.  Note
 	 * That ADC_CAL is actually an inverted signal, so we assert
--- linux-2.6.20-rc3/sound/oss/msnd_pinnacle.c.orig	2007-01-03 00:10:16.000000000 +0100
+++ linux-2.6.20-rc3/sound/oss/msnd_pinnacle.c	2007-01-03 00:10:41.000000000 +0100
@@ -671,8 +671,7 @@ static void dsp_write_flush(void)
 		get_play_delay_jiffies(dev.DAPF.len));
 	clear_bit(F_WRITEFLUSH, &dev.flags);
 	if (!signal_pending(current)) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(get_play_delay_jiffies(DAP_BUFF_SIZE));
+		schedule_timeout_interruptible(get_play_delay_jiffies(DAP_BUFF_SIZE));
 	}
 	clear_bit(F_WRITING, &dev.flags);
 }
@@ -1277,8 +1276,7 @@ static int __init calibrate_adc(WORD sra
 		       & ~0x0001, dev.SMA + SMA_wCurrHostStatusFlags);
 	if (msnd_send_word(&dev, 0, 0, HDEXAR_CAL_A_TO_D) = 0 &&
 	    chk_send_dsp_cmd(&dev, HDEX_AUX_REQ) = 0) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(HZ / 3);
+		schedule_timeout_interruptible(HZ / 3);
 		return 0;
 	}
 	printk(KERN_WARNING LOGNAME ": ADC calibration failed\n");
--- linux-2.6.20-rc3/sound/oss/sscape.c.orig	2007-01-03 00:11:14.000000000 +0100
+++ linux-2.6.20-rc3/sound/oss/sscape.c	2007-01-03 00:12:39.000000000 +0100
@@ -154,11 +154,6 @@ static char old_hardware = 1;
 static char old_hardware;
 #endif
 
-static void sleep(unsigned howlong)
-{
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(howlong);
-}
 
 static unsigned char sscape_read(struct sscape_info *devc, int reg)
 {
@@ -464,7 +459,7 @@ static int sscape_download_boot(struct s
 		int resid;
 
 		if (HZ / 50)
-			sleep(HZ / 50);
+			schedule_timeout_interruptible(HZ / 50);
 		clear_dma_ff(devc->dma);
 		if ((resid = get_dma_residue(devc->dma)) = 0)
 			done = 1;
@@ -496,7 +491,7 @@ static int sscape_download_boot(struct s
 		{
 			unsigned char x;
 			
-			sleep(1);
+			schedule_timeout_interruptible(1);
 			x = inb(PORT(HOST_DATA));
 			if (x = 0xff || x = 0xfe)		/* OBP startup acknowledge */
 			{
@@ -517,7 +512,7 @@ static int sscape_download_boot(struct s
 		timeout_val = 5 * HZ;
 		while (!done && timeout_val-- > 0)
 		{
-			sleep(1);
+			schedule_timeout_interruptible(1);
 			if (inb(PORT(HOST_DATA)) = 0xfe)	/* Host startup acknowledge */
 				done = 1;
 		}
@@ -882,7 +877,7 @@ static int sscape_pnp_wait_dma (sscape_i
 	if (arg = 0) reg = 2;
 	else reg = 3;
 
-	sleep ( 1 );
+	schedule_timeout_interruptible(1);
 	i = 0;
 	do {
 		d = sscape_read(devc, reg) & 1;
@@ -957,7 +952,7 @@ static	int	sscape_pnp_upload_file(sscape
 	while (!done && timeout_val-- > 0)
 	{
 		unsigned char x;
-		sleep(1);
+		schedule_timeout_interruptible(1);
 		x = inb( devc -> base + 3);
 		if (x = 0xff || x = 0xfe)		/* OBP startup acknowledge */
 		{
@@ -970,7 +965,7 @@ static	int	sscape_pnp_upload_file(sscape
 	while (!done && timeout_val-- > 0)
 	{
 		unsigned char x;
-		sleep(1);
+		schedule_timeout_interruptible(1);
 		x = inb( devc -> base + 3);
 		if (x = 0xfe)		/* OBP startup acknowledge */
 		{
--- linux-2.6.20-rc3/sound/oss/swarm_cs4297a.c.orig	2007-01-03 00:13:29.000000000 +0100
+++ linux-2.6.20-rc3/sound/oss/swarm_cs4297a.c	2007-01-03 00:13:42.000000000 +0100
@@ -1632,8 +1632,7 @@ static int drain_dac(struct cs4297a_stat
                        s->dma_dac.descrtab_phys) / sizeof(serdma_descr_t));
         s->dma_dac.hwptr = s->dma_dac.swptr = hwptr;
         spin_unlock_irqrestore(&s->lock, flags);
-	remove_wait_queue(&s->dma_dac.wait, &wait);
-	current->state = TASK_RUNNING;
+	finish_wait(&s->dma_dac.wait, &wait);
 	return 0;
 }
 
--- linux-2.6.20-rc3/sound/oss/vwsnd.c.orig	2007-01-03 00:13:56.000000000 +0100
+++ linux-2.6.20-rc3/sound/oss/vwsnd.c	2007-01-03 00:15:02.000000000 +0100
@@ -1834,8 +1834,7 @@ static void pcm_shutdown_port(vwsnd_dev_
 			break;
 		schedule();
 	}
-	current->state = TASK_RUNNING;
-	remove_wait_queue(&aport->queue, &wait);
+	finish_wait(&aport->queue, &wait);
 	li_disable_interrupts(&devc->lith, mask);
 	if (aport = &devc->rport)
 		ad1843_shutdown_adc(&devc->lith);
@@ -2204,8 +2203,7 @@ static void pcm_write_sync(vwsnd_dev_t *
 			break;
 		schedule();
 	}
-	current->state = TASK_RUNNING;
-	remove_wait_queue(&wport->queue, &wait);
+	finish_wait(&wport->queue, &wait);
 	DBGPV("swstate = %d, hwstate = %d\n", wport->swstate, wport->hwstate);
 	DBGRV();
 }
@@ -2281,19 +2279,16 @@ static ssize_t vwsnd_audio_do_read(struc
 			set_current_state(TASK_INTERRUPTIBLE);
 			if (rport->flags & DISABLED ||
 			    file->f_flags & O_NONBLOCK) {
-				current->state = TASK_RUNNING;
-				remove_wait_queue(&rport->queue, &wait);
+				finish_wait(&rport->queue, &wait);
 				return ret ? ret : -EAGAIN;
 			}
 			schedule();
 			if (signal_pending(current)) {
-				current->state = TASK_RUNNING;
-				remove_wait_queue(&rport->queue, &wait);
+				finish_wait(&rport->queue, &wait);
 				return ret ? ret : -ERESTARTSYS;
 			}
 		}
-		current->state = TASK_RUNNING;
-		remove_wait_queue(&rport->queue, &wait);
+		finish_wait(&rport->queue, &wait);
 		pcm_input(devc, 0, 0);
 		/* nb bytes are available in userbuf. */
 		if (nb > count)
@@ -2357,19 +2352,16 @@ static ssize_t vwsnd_audio_do_write(stru
 			set_current_state(TASK_INTERRUPTIBLE);
 			if (wport->flags & DISABLED ||
 			    file->f_flags & O_NONBLOCK) {
-				current->state = TASK_RUNNING;
-				remove_wait_queue(&wport->queue, &wait);
+				finish_wait(&wport->queue, &wait);
 				return ret ? ret : -EAGAIN;
 			}
 			schedule();
 			if (signal_pending(current)) {
-				current->state = TASK_RUNNING;
-				remove_wait_queue(&wport->queue, &wait);
+				finish_wait(&wport->queue, &wait);
 				return ret ? ret : -ERESTARTSYS;
 			}
 		}
-		current->state = TASK_RUNNING;
-		remove_wait_queue(&wport->queue, &wait);
+		finish_wait(&wport->queue, &wait);
 		/* nb bytes are available in userbuf. */
 		if (nb > count)
 			nb = count;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
