From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sun, 26 Feb 2006 08:08:20 +0000
Subject: [KJ][Patch] check return for request_region in msnd_pinnacle.c
Message-Id: <1140941300.8088.21.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34574211256721088=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34574211256721088==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

I know OSS is depricated, but I thought this would be a good educational
patch for me to do.

The return value from request_region is not checked in msnd_pinnacle.c @
line 1400.

The patch below adds a check for it and serialises the error path.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc4/sound/oss/msnd_pinnacle.c.orig	2006-02-26 16:50:08.000000000 +1100
+++ linux-2.6.16-rc4/sound/oss/msnd_pinnacle.c	2006-02-26 19:02:21.000000000 +1100
@@ -1397,36 +1397,34 @@ static int __init attach_multisound(void
 		printk(KERN_ERR LOGNAME ": Couldn't grab IRQ %d\n", dev.irq);
 		return err;
 	}
-	request_region(dev.io, dev.numio, dev.name);
+	
+	if (!request_region(dev.io, dev.numio, dev.name)) {
+		printk(KERN_ERR LOGNAME ": Couldn't request_region\n");
+		err = -EBUSY;
+		goto rr_fail;
+	}
 
         if ((err = dsp_full_reset()) < 0) {
-		release_region(dev.io, dev.numio);
-		free_irq(dev.irq, &dev);
-		return err;
+		goto dsp_fail;
 	}
 
 	if ((err = msnd_register(&dev)) < 0) {
 		printk(KERN_ERR LOGNAME ": Unable to register MultiSound\n");
-		release_region(dev.io, dev.numio);
-		free_irq(dev.irq, &dev);
-		return err;
+		goto dsp_fail;
 	}
 
 	if ((dev.dsp_minor = register_sound_dsp(&dev_fileops, -1)) < 0) {
-		printk(KERN_ERR LOGNAME ": Unable to register DSP operations\n");
-		msnd_unregister(&dev);
-		release_region(dev.io, dev.numio);
-		free_irq(dev.irq, &dev);
-		return dev.dsp_minor;
+		printk(KERN_ERR LOGNAME ": Unable to register DSP"
+							" operations\n");
+		err = dev.dsp_minor;
+		goto rs_fail;
 	}
 
 	if ((dev.mixer_minor = register_sound_mixer(&dev_fileops, -1)) < 0) {
-		printk(KERN_ERR LOGNAME ": Unable to register mixer operations\n");
-		unregister_sound_mixer(dev.mixer_minor);
-		msnd_unregister(&dev);
-		release_region(dev.io, dev.numio);
-		free_irq(dev.irq, &dev);
-		return dev.mixer_minor;
+		printk(KERN_ERR LOGNAME ": Unable to register mixer"
+							" operations\n");
+		err = dev.mixer_minor;
+		goto rsm_fail;
 	}
 
 	dev.ext_midi_dev = dev.hdr_midi_dev = -1;
@@ -1438,6 +1436,16 @@ static int __init attach_multisound(void
 #endif
 
 	return 0;
+
+rsm_fail:
+	unregister_sound_mixer(dev.mixer_minor);
+rs_fail:
+	msnd_unregister(&dev);
+dsp_fail:
+	release_region(dev.io, dev.numio);
+rr_fail:
+	free_irq(dev.irq, &dev);
+	return err;
 }
 
 static void __exit unload_multisound(void)



--===============34574211256721088==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34574211256721088==--
