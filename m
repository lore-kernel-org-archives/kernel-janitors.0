From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 19 Dec 2005 20:31:32 +0000
Subject: [KJ] [Patch] Cleanup LINUX_VERSION_CODE in sound/mipx/au1x00.c
Message-Id: <1135024293.22691.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8349936459450813=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8349936459450813==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch removes LINUX_VERSION_CODE usage in
the Au1000 driver. 

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc6/sound/mips/au1x00.c.orig	2005-12-19 21:06:37.000000000 +0100
+++ linux-2.6.15-rc6/sound/mips/au1x00.c	2005-12-19 21:07:20.000000000 +0100
@@ -50,12 +50,7 @@
 MODULE_AUTHOR("Charles Eidsness <charles@cooper-street.com>");
 MODULE_DESCRIPTION("Au1000 AC'97 ALSA Driver");
 MODULE_LICENSE("GPL");
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,8)
 MODULE_SUPPORTED_DEVICE("{{AMD,Au1000 AC'97}}");
-#else
-MODULE_CLASSES("{sound}");
-MODULE_DEVICES("{{AMD,Au1000 AC'97}}");
-#endif
 
 #define PLAYBACK 0
 #define CAPTURE 1
@@ -533,17 +528,12 @@ snd_au1000_ac97_new(void)
 {
 	int err;
 
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,8)
 	ac97_bus_t *pbus;
 	ac97_template_t ac97;
  	static ac97_bus_ops_t ops = {
 		.write = snd_au1000_ac97_write,
 		.read = snd_au1000_ac97_read,
 	};
-#else
-	ac97_bus_t bus, *pbus;
-	ac97_t ac97;
-#endif
 
 	if ((au1000->ac97_res_port = request_region(AC97C_CONFIG,
 	       		sizeof(au1000_ac97_reg_t), "Au1x00 AC97")) == NULL) {
@@ -575,16 +565,8 @@ snd_au1000_ac97_new(void)
 	spin_unlock(&au1000->ac97_lock);
 
 	/* Initialise AC97 middle-layer */
-#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,8)
 	if ((err = snd_ac97_bus(au1000->card, 0, &ops, au1000, &pbus)) < 0)
  		return err;
-#else
-	memset(&bus, 0, sizeof(bus));
-	bus.write = snd_au1000_ac97_write;
-	bus.read = snd_au1000_ac97_read;
-	if ((err = snd_ac97_bus(au1000->card, &bus, &pbus)) < 0)
-		return err;
-#endif
 	memset(&ac97, 0, sizeof(ac97));
 	ac97.private_data = au1000;
 	ac97.private_free = snd_au1000_ac97_free;



--===============8349936459450813==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8349936459450813==--
