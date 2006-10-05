From: Amol Lad <amol@verismonetworks.com>
Date: Thu, 05 Oct 2006 12:35:54 +0000
Subject: [KJ] [PATCH] ioremap balanced with iounmap for sound
Message-Id: <1160051034.19143.66.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158842563.28299.145.camel@amol.verismonetworks.com>
In-Reply-To: <1158842563.28299.145.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ioremap must be balanced by an iounmap and failing to do so can result
in a memory leak.

Tested (compilation only):
- using allmodconfig
- making sure the files are compiling without any warning/error due to
new changes

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
 oss/btaudio.c                 |    2 ++
 oss/dmasound/dmasound_awacs.c |   39 +++++++++++++++++++++++++++++++++++----
 oss/msnd_pinnacle.c           |   10 ++++++++++
 pci/au88x0/au88x0.c           |    1 +
 pci/rme32.c                   |    4 ++++
 pci/rme96.c                   |    4 ++++
 pci/rme9652/hdsp.c            |   21 ++++++++++++++++-----
 pci/rme9652/hdspm.c           |    6 +++++-
 pci/rme9652/rme9652.c         |    4 ++++
 9 files changed, 81 insertions(+), 10 deletions(-)
---
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/sound/oss/btaudio.c linux-2.6.19-rc1/sound/oss/btaudio.c
--- linux-2.6.19-rc1-orig/sound/oss/btaudio.c	2006-09-21 10:15:52.000000000 +0530
+++ linux-2.6.19-rc1/sound/oss/btaudio.c	2006-10-05 15:21:32.000000000 +0530
@@ -1013,6 +1013,7 @@ static int __devinit btaudio_probe(struc
         return 0;
 
  fail4:
+	iounmap(bta->mmio);
 	unregister_sound_dsp(bta->dsp_analog);
  fail3:
 	if (digital)
@@ -1051,6 +1052,7 @@ static void __devexit btaudio_remove(str
         free_irq(bta->irq,bta);
 	release_mem_region(pci_resource_start(pci_dev,0),
 			   pci_resource_len(pci_dev,0));
+	iounmap(bta->mmio);
 
 	/* remove from linked list */
 	if (bta = btaudios) {
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/sound/oss/dmasound/dmasound_awacs.c linux-2.6.19-rc1/sound/oss/dmasound/dmasound_awacs.c
--- linux-2.6.19-rc1-orig/sound/oss/dmasound/dmasound_awacs.c	2006-10-05 14:01:04.000000000 +0530
+++ linux-2.6.19-rc1/sound/oss/dmasound/dmasound_awacs.c	2006-10-05 17:34:42.000000000 +0530
@@ -3067,8 +3067,9 @@ printk("dmasound_pmac: Awacs/Screamer Co
 		udelay(1);
 
 	/* Initialize beep stuff */
-	if ((res=setup_beep()))
-		return res ;
+	res=setup_beep();
+	if (res)
+		goto out_unmap;
 
 #ifdef CONFIG_PM
 	pmu_register_sleep_notifier(&awacs_sleep_notifier);
@@ -3160,7 +3161,26 @@ printk("dmasound_pmac: Awacs/Screamer Co
 	 */
 	input_register_device(awacs_beep_dev);
 
-	return dmasound_init();
+	res = dmasound_init();
+	if (res)
+		goto out_unmap1;
+
+	return 0;
+	
+out_unmap1:
+	if (is_pbook_3X00)
+		iounmap(latch_base);
+	else if (is_pbook_g3)
+		iounmap(macio_base);
+out_unmap:
+	if (i2s_node)
+		iounmap(i2s);
+	else
+		iounmap(awacs);
+	iounmap(awacs_txdma);
+	iounmap(awacs_rxdma);
+
+	return res;
 }
 
 static void __exit dmasound_awacs_cleanup(void)
@@ -3177,8 +3197,19 @@ static void __exit dmasound_awacs_cleanu
 			daca_cleanup();
 			break;
 	}
-	dmasound_deinit();
 
+	if (is_pbook_3X00)
+		iounmap(latch_base);
+	else if (is_pbook_g3)
+		iounmap(macio_base);
+	if (i2s_node)
+		iounmap(i2s);
+	else
+		iounmap(awacs);
+	iounmap(awacs_txdma);
+	iounmap(awacs_rxdma);
+
+	dmasound_deinit();
 }
 
 MODULE_DESCRIPTION("PowerMac built-in audio driver.");
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/sound/oss/msnd_pinnacle.c linux-2.6.19-rc1/sound/oss/msnd_pinnacle.c
--- linux-2.6.19-rc1-orig/sound/oss/msnd_pinnacle.c	2006-09-21 10:15:52.000000000 +0530
+++ linux-2.6.19-rc1/sound/oss/msnd_pinnacle.c	2006-10-05 17:23:26.000000000 +0530
@@ -1441,6 +1441,8 @@ static int __init attach_multisound(void
 
 static void __exit unload_multisound(void)
 {
+	iounmap(dev.base);
+	dev.base = NULL;
 	release_region(dev.io, dev.numio);
 	free_irq(dev.irq, &dev);
 	unregister_sound_mixer(dev.mixer_minor);
@@ -1884,12 +1886,16 @@ static int __init msnd_init(void)
 	printk(KERN_INFO LOGNAME ": %u byte audio FIFOs (x2)\n", dev.fifosize);
 	if ((err = msnd_fifo_alloc(&dev.DAPF, dev.fifosize)) < 0) {
 		printk(KERN_ERR LOGNAME ": Couldn't allocate write FIFO\n");
+		iounmap(dev.base);
+		dev.base = NULL;
 		return err;
 	}
 
 	if ((err = msnd_fifo_alloc(&dev.DARF, dev.fifosize)) < 0) {
 		printk(KERN_ERR LOGNAME ": Couldn't allocate read FIFO\n");
 		msnd_fifo_free(&dev.DAPF);
+		iounmap(dev.base);
+		dev.base = NULL;
 		return err;
 	}
 
@@ -1897,6 +1903,8 @@ static int __init msnd_init(void)
 		printk(KERN_ERR LOGNAME ": Probe failed\n");
 		msnd_fifo_free(&dev.DAPF);
 		msnd_fifo_free(&dev.DARF);
+		iounmap(dev.base);
+		dev.base = NULL;
 		return err;
 	}
 
@@ -1904,6 +1912,8 @@ static int __init msnd_init(void)
 		printk(KERN_ERR LOGNAME ": Attach failed\n");
 		msnd_fifo_free(&dev.DAPF);
 		msnd_fifo_free(&dev.DARF);
+		iounmap(dev.base);
+		dev.base = NULL;
 		return err;
 	}
 
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/sound/pci/au88x0/au88x0.c linux-2.6.19-rc1/sound/pci/au88x0/au88x0.c
--- linux-2.6.19-rc1-orig/sound/pci/au88x0/au88x0.c	2006-09-21 10:15:52.000000000 +0530
+++ linux-2.6.19-rc1/sound/pci/au88x0/au88x0.c	2006-10-05 16:22:35.000000000 +0530
@@ -128,6 +128,7 @@ static int snd_vortex_dev_free(struct sn
 	// Take down PCI interface.
 	synchronize_irq(vortex->irq);
 	free_irq(vortex->irq, vortex);
+	iounmap(vortex->mmio);
 	pci_release_regions(vortex->pci_dev);
 	pci_disable_device(vortex->pci_dev);
 	kfree(vortex);
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/sound/pci/rme32.c linux-2.6.19-rc1/sound/pci/rme32.c
--- linux-2.6.19-rc1-orig/sound/pci/rme32.c	2006-09-21 10:15:53.000000000 +0530
+++ linux-2.6.19-rc1/sound/pci/rme32.c	2006-10-05 16:52:01.000000000 +0530
@@ -1376,6 +1376,7 @@ static int __devinit snd_rme32_create(st
 
 	if (request_irq(pci->irq, snd_rme32_interrupt, IRQF_DISABLED | IRQF_SHARED, "RME32", (void *) rme32)) {
 		snd_printk(KERN_ERR "unable to grab IRQ %d\n", pci->irq);
+		iounmap(rme32->iobase);
 		return -EBUSY;
 	}
 	rme32->irq = pci->irq;
@@ -1385,6 +1386,7 @@ static int __devinit snd_rme32_create(st
 
 	/* set up ALSA pcm device for S/PDIF */
 	if ((err = snd_pcm_new(rme32->card, "Digi32 IEC958", 0, 1, 1, &rme32->spdif_pcm)) < 0) {
+		iounmap(rme32->iobase);
 		return err;
 	}
 	rme32->spdif_pcm->private_data = rme32;
@@ -1417,6 +1419,7 @@ static int __devinit snd_rme32_create(st
 		if ((err = snd_pcm_new(rme32->card, "Digi32 ADAT", 1,
 				       1, 1, &rme32->adat_pcm)) < 0)
 		{
+			iounmap(rme32->iobase);
 			return err;
 		}		
 		rme32->adat_pcm->private_data = rme32;
@@ -1462,6 +1465,7 @@ static int __devinit snd_rme32_create(st
 
 	/* init switch interface */
 	if ((err = snd_rme32_create_switches(rme32->card, rme32)) < 0) {
+		iounmap(rme32->iobase);
 		return err;
 	}
 
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/sound/pci/rme9652/hdsp.c linux-2.6.19-rc1/sound/pci/rme9652/hdsp.c
--- linux-2.6.19-rc1-orig/sound/pci/rme9652/hdsp.c	2006-10-05 14:01:05.000000000 +0530
+++ linux-2.6.19-rc1/sound/pci/rme9652/hdsp.c	2006-10-05 16:54:38.000000000 +0530
@@ -4936,6 +4936,7 @@ static int __devinit snd_hdsp_create(str
 
 	if (request_irq(pci->irq, snd_hdsp_interrupt, IRQF_DISABLED|IRQF_SHARED, "hdsp", (void *)hdsp)) {
 		snd_printk(KERN_ERR "Hammerfall-DSP: unable to use IRQ %d\n", pci->irq);
+		iounmap(hdsp->iobase);
 		return -EBUSY;
 	}
 
@@ -4943,8 +4944,10 @@ static int __devinit snd_hdsp_create(str
 	hdsp->precise_ptr = 1;
 	hdsp->use_midi_tasklet = 1;
 
-	if ((err = snd_hdsp_initialize_memory(hdsp)) < 0)
+	if ((err = snd_hdsp_initialize_memory(hdsp)) < 0) {
+		iounmap(hdsp->iobase);
 		return err;
+	}
 	
 	if (!is_9652 && !is_9632) {
 		/* we wait 2 seconds to let freshly inserted cardbus cards do their hardware init */
@@ -4964,8 +4967,10 @@ static int __devinit snd_hdsp_create(str
 #endif
 			/* no iobox connected, we defer initialization */
 			snd_printk(KERN_INFO "Hammerfall-DSP: card initialization pending : waiting for firmware\n");
-			if ((err = snd_hdsp_create_hwdep(card, hdsp)) < 0)
+			if ((err = snd_hdsp_create_hwdep(card, hdsp)) < 0) {
+				iounmap(hdsp->iobase);
 				return err;
+			}
 			return 0;
 		} else {
 			snd_printk(KERN_INFO "Hammerfall-DSP: Firmware already present, initializing card.\n");	    
@@ -4976,8 +4981,10 @@ static int __devinit snd_hdsp_create(str
 		}
 	}
 	
-	if ((err = snd_hdsp_enable_io(hdsp)) != 0)
+	if ((err = snd_hdsp_enable_io(hdsp)) != 0) {
+		iounmap(hdsp->iobase);
 		return err;
+	}
 	
 	if (is_9652)
 	        hdsp->io_type = H9652;
@@ -4985,16 +4992,20 @@ static int __devinit snd_hdsp_create(str
 	if (is_9632)
 		hdsp->io_type = H9632;
 
-	if ((err = snd_hdsp_create_hwdep(card, hdsp)) < 0)
+	if ((err = snd_hdsp_create_hwdep(card, hdsp)) < 0) {
+		iounmap(hdsp->iobase);
 		return err;
+	}
 	
 	snd_hdsp_initialize_channels(hdsp);
 	snd_hdsp_initialize_midi_flush(hdsp);
 
 	hdsp->state |= HDSP_FirmwareLoaded;	
 
-	if ((err = snd_hdsp_create_alsa_devices(card, hdsp)) < 0)
+	if ((err = snd_hdsp_create_alsa_devices(card, hdsp)) < 0) {
+		iounmap(hdsp->iobase);
 		return err;
+	}
 
 	return 0;	
 }
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/sound/pci/rme9652/hdspm.c linux-2.6.19-rc1/sound/pci/rme9652/hdspm.c
--- linux-2.6.19-rc1-orig/sound/pci/rme9652/hdspm.c	2006-09-21 10:15:53.000000000 +0530
+++ linux-2.6.19-rc1/sound/pci/rme9652/hdspm.c	2006-10-05 16:55:32.000000000 +0530
@@ -3500,6 +3500,7 @@ static int __devinit snd_hdspm_create(st
 			IRQF_DISABLED | IRQF_SHARED, "hdspm",
 			(void *) hdspm)) {
 		snd_printk(KERN_ERR "HDSPM: unable to use IRQ %d\n", pci->irq);
+		iounmap(hdspm->iobase);
 		return -EBUSY;
 	}
 
@@ -3516,6 +3517,7 @@ static int __devinit snd_hdspm_create(st
 	    = NULL) {
 		snd_printk(KERN_ERR "HDSPM: unable to kmalloc Mixer memory of %d Bytes\n",
 			   (int)sizeof(struct hdspm_mixer));
+		iounmap(hdspm->iobase);
 		return err;
 	}
 
@@ -3524,8 +3526,10 @@ static int __devinit snd_hdspm_create(st
 	hdspm->qs_channels = MADI_QS_CHANNELS;
 
 	snd_printdd("create alsa devices.\n");
-	if ((err = snd_hdspm_create_alsa_devices(card, hdspm)) < 0)
+	if ((err = snd_hdspm_create_alsa_devices(card, hdspm)) < 0) {
+		iounmap(hdspm->iobase);
 		return err;
+	}
 
 	snd_hdspm_initialize_midi_flush(hdspm);
 
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/sound/pci/rme9652/rme9652.c linux-2.6.19-rc1/sound/pci/rme9652/rme9652.c
--- linux-2.6.19-rc1-orig/sound/pci/rme9652/rme9652.c	2006-09-21 10:15:53.000000000 +0530
+++ linux-2.6.19-rc1/sound/pci/rme9652/rme9652.c	2006-10-05 16:56:18.000000000 +0530
@@ -2502,6 +2502,7 @@ static int __devinit snd_rme9652_create(
 	
 	if (request_irq(pci->irq, snd_rme9652_interrupt, IRQF_DISABLED|IRQF_SHARED, "rme9652", (void *)rme9652)) {
 		snd_printk(KERN_ERR "unable to request IRQ %d\n", pci->irq);
+		iounmap(rme9652->iobase);
 		return -EBUSY;
 	}
 	rme9652->irq = pci->irq;
@@ -2562,14 +2563,17 @@ static int __devinit snd_rme9652_create(
 	pci_set_master(rme9652->pci);
 
 	if ((err = snd_rme9652_initialize_memory(rme9652)) < 0) {
+		iounmap(rme9652->iobase);
 		return err;
 	}
 
 	if ((err = snd_rme9652_create_pcm(card, rme9652)) < 0) {
+		iounmap(rme9652->iobase);
 		return err;
 	}
 
 	if ((err = snd_rme9652_create_controls(card, rme9652)) < 0) {
+		iounmap(rme9652->iobase);
 		return err;
 	}
 
diff -uprN -X linux-2.6.19-rc1-orig/Documentation/dontdiff linux-2.6.19-rc1-orig/sound/pci/rme96.c linux-2.6.19-rc1/sound/pci/rme96.c
--- linux-2.6.19-rc1-orig/sound/pci/rme96.c	2006-09-21 10:15:53.000000000 +0530
+++ linux-2.6.19-rc1/sound/pci/rme96.c	2006-10-05 16:53:17.000000000 +0530
@@ -1590,6 +1590,7 @@ snd_rme96_create(struct rme96 *rme96)
 
 	if (request_irq(pci->irq, snd_rme96_interrupt, IRQF_DISABLED|IRQF_SHARED, "RME96", (void *)rme96)) {
 		snd_printk(KERN_ERR "unable to grab IRQ %d\n", pci->irq);
+		iounmap(rme96->iobase);
 		return -EBUSY;
 	}
 	rme96->irq = pci->irq;
@@ -1601,6 +1602,7 @@ snd_rme96_create(struct rme96 *rme96)
 	if ((err = snd_pcm_new(rme96->card, "Digi96 IEC958", 0,
 			       1, 1, &rme96->spdif_pcm)) < 0)
 	{
+		iounmap(rme96->iobase);
 		return err;
 	}
 	rme96->spdif_pcm->private_data = rme96;
@@ -1619,6 +1621,7 @@ snd_rme96_create(struct rme96 *rme96)
 		if ((err = snd_pcm_new(rme96->card, "Digi96 ADAT", 1,
 				       1, 1, &rme96->adat_pcm)) < 0)
 		{
+			iounmap(rme96->iobase);
 			return err;
 		}		
 		rme96->adat_pcm->private_data = rme96;
@@ -1671,6 +1674,7 @@ snd_rme96_create(struct rme96 *rme96)
 	
 	/* init switch interface */
 	if ((err = snd_rme96_create_switches(rme96->card, rme96)) < 0) {
+		iounmap(rme96->iobase);
 		return err;
 	}
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
