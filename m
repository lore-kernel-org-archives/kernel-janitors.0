From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 25 Dec 2006 23:33:49 +0000
Subject: [KJ] [PATCH] set_current_state usage in oss/
Message-Id: <1167089629.11578.2.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

since we have a macro to set the current state,
we should use it, instead of open coding it.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.20-rc2/sound/oss/btaudio.c.orig	2006-12-26 00:04:05.000000000 +0100
+++ linux-2.6.20-rc2/sound/oss/btaudio.c	2006-12-26 00:04:05.000000000 +0100
@@ -531,7 +531,7 @@ static ssize_t btaudio_dsp_read(struct f
 				break;
 			}
 			mutex_unlock(&bta->lock);
-			current->state = TASK_INTERRUPTIBLE;
+			__set_current_state(TASK_INTERRUPTIBLE);
 			schedule();
 			mutex_lock(&bta->lock);
 			if(signal_pending(current)) {
@@ -608,7 +608,7 @@ static ssize_t btaudio_dsp_read(struct f
 	}
 	mutex_unlock(&bta->lock);
 	remove_wait_queue(&bta->readq, &wait);
-	current->state = TASK_RUNNING;
+	__set_current_state(TASK_RUNNING);
 	return ret;
 }
 
--- linux-2.6.20-rc2/sound/oss/cs4232.c.orig	2006-12-26 00:04:05.000000000 +0100
+++ linux-2.6.20-rc2/sound/oss/cs4232.c	2006-12-26 00:04:05.000000000 +0100
@@ -98,7 +98,7 @@ static unsigned char crystal_key[] =	/* 
 
 static void sleep(unsigned howlong)
 {
-	current->state = TASK_INTERRUPTIBLE;
+	__set_current_state(TASK_INTERRUPTIBLE);
 	schedule_timeout(howlong);
 }
 
--- linux-2.6.20-rc2/sound/oss/cs46xx.c.orig	2006-12-26 00:04:05.000000000 +0100
+++ linux-2.6.20-rc2/sound/oss/cs46xx.c	2006-12-26 00:04:06.000000000 +0100
@@ -1435,7 +1435,7 @@ static int drain_dac(struct cs_state *st
 	for (;;) {
 		/* It seems that we have to set the current state to TASK_INTERRUPTIBLE
 		   every time to make the process really go to sleep */
-		current->state = TASK_INTERRUPTIBLE;
+		__set_current_state(TASK_INTERRUPTIBLE);
 
 		spin_lock_irqsave(&state->card->lock, flags);
 		count = dmabuf->count;
@@ -1449,7 +1449,7 @@ static int drain_dac(struct cs_state *st
 
 		if (nonblock) {
 			remove_wait_queue(&dmabuf->wait, &wait);
-			current->state = TASK_RUNNING;
+			__set_current_state(TASK_RUNNING);
 			return -EBUSY;
 		}
 
@@ -1463,7 +1463,7 @@ static int drain_dac(struct cs_state *st
 		}
 	}
 	remove_wait_queue(&dmabuf->wait, &wait);
-	current->state = TASK_RUNNING;
+	__set_current_state(TASK_RUNNING);
 	if (signal_pending(current)) {
 		CS_DBGOUT(CS_FUNCTION, 4, printk("cs46xx: drain_dac()- -ERESTARTSYS\n"));
 		/*
@@ -1834,7 +1834,7 @@ static int cs_midi_release(struct inode 
         unsigned count, tmo;
 
         if (file->f_mode & FMODE_WRITE) {
-                current->state = TASK_INTERRUPTIBLE;
+                __set_current_state(TASK_INTERRUPTIBLE);
                 add_wait_queue(&card->midi.owait, &wait);
                 for (;;) {
                         spin_lock_irqsave(&card->midi.lock, flags);
@@ -1851,7 +1851,7 @@ static int cs_midi_release(struct inode 
                                 printk(KERN_DEBUG "cs46xx: midi timed out??\n");
                 }
                 remove_wait_queue(&card->midi.owait, &wait);
-                current->state = TASK_RUNNING;
+                __set_current_state(TASK_RUNNING);
         }
         mutex_lock(&card->midi.open_mutex);
         card->midi.open_mode &= (~(file->f_mode & (FMODE_READ | FMODE_WRITE)));
@@ -4770,7 +4770,7 @@ static int cs_hardware_init(struct cs_ca
 		 */
 			if (cs461x_peekBA0(card, BA0_ACSTS) & ACSTS_CRDY)
 				break;
-			current->state = TASK_UNINTERRUPTIBLE;
+			__set_current_state(TASK_UNINTERRUPTIBLE);
 			schedule_timeout(1);
 		} while (time_before(jiffies, end_time));
 	} else {
@@ -4815,7 +4815,7 @@ static int cs_hardware_init(struct cs_ca
 			 */
 			if ((cs461x_peekBA0(card, BA0_ACISV) & (ACISV_ISV3 | ACISV_ISV4)) = (ACISV_ISV3 | ACISV_ISV4))
 				break;
-			current->state = TASK_UNINTERRUPTIBLE;
+			__set_current_state(TASK_UNINTERRUPTIBLE);
 			schedule_timeout(1);
 		} while (time_before(jiffies, end_time));
 	} else {
--- linux-2.6.20-rc2/sound/oss/emu10k1/ecard.c.orig	2006-12-26 00:04:06.000000000 +0100
+++ linux-2.6.20-rc2/sound/oss/emu10k1/ecard.c	2006-12-26 00:04:06.000000000 +0100
@@ -139,7 +139,7 @@ void __devinit emu10k1_ecard_init(struct
 
 	/* Step 3: Wait for awhile; FIXME: Is this correct? */
 
-	current->state = TASK_INTERRUPTIBLE;
+	__set_current_state(TASK_INTERRUPTIBLE);
 	schedule_timeout(HZ);
 
 	/* Step 4: Switch off the DAC and ADC calibration.  Note
--- linux-2.6.20-rc2/sound/oss/msnd_pinnacle.c.orig	2006-12-26 00:04:06.000000000 +0100
+++ linux-2.6.20-rc2/sound/oss/msnd_pinnacle.c	2006-12-26 00:04:06.000000000 +0100
@@ -671,7 +671,7 @@ static void dsp_write_flush(void)
 		get_play_delay_jiffies(dev.DAPF.len));
 	clear_bit(F_WRITEFLUSH, &dev.flags);
 	if (!signal_pending(current)) {
-		current->state = TASK_INTERRUPTIBLE;
+		__set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(get_play_delay_jiffies(DAP_BUFF_SIZE));
 	}
 	clear_bit(F_WRITING, &dev.flags);
@@ -1277,7 +1277,7 @@ static int __init calibrate_adc(WORD sra
 		       & ~0x0001, dev.SMA + SMA_wCurrHostStatusFlags);
 	if (msnd_send_word(&dev, 0, 0, HDEXAR_CAL_A_TO_D) = 0 &&
 	    chk_send_dsp_cmd(&dev, HDEX_AUX_REQ) = 0) {
-		current->state = TASK_INTERRUPTIBLE;
+		__set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(HZ / 3);
 		return 0;
 	}
--- linux-2.6.20-rc2/sound/oss/sscape.c.orig	2006-12-26 00:04:06.000000000 +0100
+++ linux-2.6.20-rc2/sound/oss/sscape.c	2006-12-26 00:04:06.000000000 +0100
@@ -156,7 +156,7 @@ static char old_hardware;
 
 static void sleep(unsigned howlong)
 {
-	current->state = TASK_INTERRUPTIBLE;
+	__set_current_state(TASK_INTERRUPTIBLE);
 	schedule_timeout(howlong);
 }
 
--- linux-2.6.20-rc2/sound/oss/swarm_cs4297a.c.orig	2006-12-26 00:04:06.000000000 +0100
+++ linux-2.6.20-rc2/sound/oss/swarm_cs4297a.c	2006-12-26 00:04:06.000000000 +0100
@@ -1633,7 +1633,7 @@ static int drain_dac(struct cs4297a_stat
         s->dma_dac.hwptr = s->dma_dac.swptr = hwptr;
         spin_unlock_irqrestore(&s->lock, flags);
 	remove_wait_queue(&s->dma_dac.wait, &wait);
-	current->state = TASK_RUNNING;
+	__set_current_state(TASK_RUNNING);
 	return 0;
 }
 
--- linux-2.6.20-rc2/sound/oss/vwsnd.c.orig	2006-12-26 00:04:06.000000000 +0100
+++ linux-2.6.20-rc2/sound/oss/vwsnd.c	2006-12-26 00:04:06.000000000 +0100
@@ -1834,7 +1834,7 @@ static void pcm_shutdown_port(vwsnd_dev_
 			break;
 		schedule();
 	}
-	current->state = TASK_RUNNING;
+	__set_current_state(TASK_RUNNING);
 	remove_wait_queue(&aport->queue, &wait);
 	li_disable_interrupts(&devc->lith, mask);
 	if (aport = &devc->rport)
@@ -2204,7 +2204,7 @@ static void pcm_write_sync(vwsnd_dev_t *
 			break;
 		schedule();
 	}
-	current->state = TASK_RUNNING;
+	__set_current_state(TASK_RUNNING);
 	remove_wait_queue(&wport->queue, &wait);
 	DBGPV("swstate = %d, hwstate = %d\n", wport->swstate, wport->hwstate);
 	DBGRV();
@@ -2281,18 +2281,18 @@ static ssize_t vwsnd_audio_do_read(struc
 			set_current_state(TASK_INTERRUPTIBLE);
 			if (rport->flags & DISABLED ||
 			    file->f_flags & O_NONBLOCK) {
-				current->state = TASK_RUNNING;
+				__set_current_state(TASK_RUNNING);
 				remove_wait_queue(&rport->queue, &wait);
 				return ret ? ret : -EAGAIN;
 			}
 			schedule();
 			if (signal_pending(current)) {
-				current->state = TASK_RUNNING;
+				__set_current_state(TASK_RUNNING);
 				remove_wait_queue(&rport->queue, &wait);
 				return ret ? ret : -ERESTARTSYS;
 			}
 		}
-		current->state = TASK_RUNNING;
+		__set_current_state(TASK_RUNNING);
 		remove_wait_queue(&rport->queue, &wait);
 		pcm_input(devc, 0, 0);
 		/* nb bytes are available in userbuf. */
@@ -2357,18 +2357,18 @@ static ssize_t vwsnd_audio_do_write(stru
 			set_current_state(TASK_INTERRUPTIBLE);
 			if (wport->flags & DISABLED ||
 			    file->f_flags & O_NONBLOCK) {
-				current->state = TASK_RUNNING;
+				__set_current_state(TASK_RUNNING);
 				remove_wait_queue(&wport->queue, &wait);
 				return ret ? ret : -EAGAIN;
 			}
 			schedule();
 			if (signal_pending(current)) {
-				current->state = TASK_RUNNING;
+				__set_current_state(TASK_RUNNING);
 				remove_wait_queue(&wport->queue, &wait);
 				return ret ? ret : -ERESTARTSYS;
 			}
 		}
-		current->state = TASK_RUNNING;
+		__set_current_state(TASK_RUNNING);
 		remove_wait_queue(&wport->queue, &wait);
 		/* nb bytes are available in userbuf. */
 		if (nb > count)


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
