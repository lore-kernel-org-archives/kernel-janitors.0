From: Fry <fryboy@optushome.com.au>
Date: Wed, 18 Feb 2004 06:09:49 +0000
Subject: [Kernel-janitors] [PATCH] Moving MODULE_LICENSE();
Message-Id: <1077084589.6225.1.camel@mugen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-ExEHnaBsMK1poAC15imF"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--=-ExEHnaBsMK1poAC15imF
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hey guys,

My first kernel patch. Hope I didn't miss one.
Please CC me on any replies, I'm subscribed at work, not home.

Thanks,

Fry.
-- 
PGP Public Key: http://members.optushome.com.au/fryboy/fryboy.pub

--=-ExEHnaBsMK1poAC15imF
Content-Disposition: attachment; filename=video-license.patch
Content-Type: text/x-patch; name=video-license.patch; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 7bit

diff -r -u linux-2.6.3/drivers/video-old/amifb.c linux-2.6.3/drivers/video/amifb.c
--- linux-2.6.3/drivers/video-old/amifb.c	2004-02-18 16:59:33.001422464 +1100
+++ linux-2.6.3/drivers/video/amifb.c	2004-02-18 16:43:33.267324224 +1100
@@ -3812,7 +3812,6 @@
 
 
 #ifdef MODULE
-MODULE_LICENSE("GPL");
 
 int init_module(void)
 {
@@ -3826,3 +3825,5 @@
 	amifb_video_off();
 }
 #endif /* MODULE */
+
+MODULE_LICENSE("GPL");
diff -r -u linux-2.6.3/drivers/video-old/atafb.c linux-2.6.3/drivers/video/atafb.c
--- linux-2.6.3/drivers/video-old/atafb.c	2004-02-18 16:59:33.001422464 +1100
+++ linux-2.6.3/drivers/video/atafb.c	2004-02-18 16:46:03.111544440 +1100
@@ -3091,7 +3091,6 @@
 }
 
 #ifdef MODULE
-MODULE_LICENSE("GPL");
 
 int init_module(void)
 {
@@ -3107,3 +3106,5 @@
 	/* TODO: further clean up ... */
 }
 #endif /* MODULE */
+
+MODULE_LICENSE("GPL");
diff -r -u linux-2.6.3/drivers/video-old/controlfb.c linux-2.6.3/drivers/video/controlfb.c
--- linux-2.6.3/drivers/video-old/controlfb.c	2004-02-18 16:59:33.002422312 +1100
+++ linux-2.6.3/drivers/video/controlfb.c	2004-02-18 16:52:40.739095864 +1100
@@ -183,7 +183,6 @@
 /********************  The functions for controlfb_ops ********************/
 
 #ifdef MODULE
-MODULE_LICENSE("GPL");
 
 int init_module(void)
 {
@@ -202,6 +201,8 @@
 }
 #endif
 
+MODULE_LICENSE("GPL");
+
 /*
  * Checks a var structure
  */
diff -r -u linux-2.6.3/drivers/video-old/cyberfb.c linux-2.6.3/drivers/video/cyberfb.c
--- linux-2.6.3/drivers/video-old/cyberfb.c	2004-02-18 16:59:33.002422312 +1100
+++ linux-2.6.3/drivers/video/cyberfb.c	2004-02-18 16:53:24.574431880 +1100
@@ -1200,7 +1200,6 @@
 
 
 #ifdef MODULE
-MODULE_LICENSE("GPL");
 
 int init_module(void)
 {
@@ -1216,6 +1215,8 @@
 }
 #endif /* MODULE */
 
+MODULE_LICENSE("GPL");
+
 /*
  *
  * Low level initialization routines for the CyberVision64 graphics card
diff -r -u linux-2.6.3/drivers/video-old/imsttfb.c linux-2.6.3/drivers/video/imsttfb.c
--- linux-2.6.3/drivers/video-old/imsttfb.c	2004-02-18 16:59:33.002422312 +1100
+++ linux-2.6.3/drivers/video/imsttfb.c	2004-02-18 16:54:16.911475440 +1100
@@ -1607,8 +1607,11 @@
 }
 
 #ifdef MODULE
-MODULE_LICENSE("GPL");
 module_init(imsttfb_init);
 #endif
+
+module_init(imsttfb_init);
 module_exit(imsttfb_exit);
 
+MODULE_LICENSE("GPL");
+
diff -r -u linux-2.6.3/drivers/video-old/maxinefb.c linux-2.6.3/drivers/video/maxinefb.c
--- linux-2.6.3/drivers/video-old/maxinefb.c	2004-02-18 16:59:33.002422312 +1100
+++ linux-2.6.3/drivers/video/maxinefb.c	2004-02-18 16:55:12.390041416 +1100
@@ -174,8 +174,8 @@
 }
 
 #ifdef MODULE
-MODULE_LICENSE("GPL");
 module_init(maxinefb_init);
 #endif
 module_exit(maxinefb_exit);
 
+MODULE_LICENSE("GPL");
diff -r -u linux-2.6.3/drivers/video-old/pm2fb.c linux-2.6.3/drivers/video/pm2fb.c
--- linux-2.6.3/drivers/video-old/pm2fb.c	2004-02-18 16:59:32.987424592 +1100
+++ linux-2.6.3/drivers/video/pm2fb.c	2004-02-18 17:04:12.709900312 +1100
@@ -2402,8 +2402,6 @@
 
 #ifdef MODULE
 
-MODULE_LICENSE("GPL");
-
 static char *mode = NULL;
 
 MODULE_PARM(mode, "s");
@@ -2421,6 +2419,8 @@
 }
 #endif /* MODULE */
 
+MODULE_LICENSE("GPL");
+
 /***************************************************************************
  * That's all folks!
  ***************************************************************************/
diff -r -u linux-2.6.3/drivers/video-old/retz3fb.c linux-2.6.3/drivers/video/retz3fb.c
--- linux-2.6.3/drivers/video-old/retz3fb.c	2004-02-18 16:59:33.002422312 +1100
+++ linux-2.6.3/drivers/video/retz3fb.c	2004-02-18 16:55:41.011690264 +1100
@@ -1485,7 +1485,6 @@
 
 
 #ifdef MODULE
-MODULE_LICENSE("GPL");
 
 int init_module(void)
 {
@@ -1503,6 +1502,7 @@
 }
 #endif
 
+MODULE_LICENSE("GPL");
 
 /*
  *  Text console acceleration
diff -r -u linux-2.6.3/drivers/video-old/sgivwfb.c linux-2.6.3/drivers/video/sgivwfb.c
--- linux-2.6.3/drivers/video-old/sgivwfb.c	2004-02-18 16:59:33.003422160 +1100
+++ linux-2.6.3/drivers/video/sgivwfb.c	2004-02-18 16:56:06.339839800 +1100
@@ -819,7 +819,6 @@
 }
 
 #ifdef MODULE
-MODULE_LICENSE("GPL");
 
 int init_module(void)
 {
@@ -836,3 +835,5 @@
 }
 
 #endif				/* MODULE */
+
+MODULE_LICENSE("GPL");
diff -r -u linux-2.6.3/drivers/video-old/vga16fb.c linux-2.6.3/drivers/video/vga16fb.c
--- linux-2.6.3/drivers/video-old/vga16fb.c	2004-02-18 16:59:33.003422160 +1100
+++ linux-2.6.3/drivers/video/vga16fb.c	2004-02-18 16:56:43.947122624 +1100
@@ -1416,12 +1416,13 @@
 }
 
 #ifdef MODULE
-MODULE_LICENSE("GPL");
 module_init(vga16fb_init);
 #endif
 module_exit(vga16fb_exit);
 
 
+MODULE_LICENSE("GPL");
+
 /*
  * Overrides for Emacs so that we follow Linus's tabbing style.
  * ---------------------------------------------------------------------------
diff -r -u linux-2.6.3/drivers/video-old/virgefb.c linux-2.6.3/drivers/video/virgefb.c
--- linux-2.6.3/drivers/video-old/virgefb.c	2004-02-18 16:59:33.003422160 +1100
+++ linux-2.6.3/drivers/video/virgefb.c	2004-02-18 16:57:15.608309392 +1100
@@ -2058,7 +2058,6 @@
 #endif
 
 #ifdef MODULE
-MODULE_LICENSE("GPL");
 
 int init_module(void)
 {
@@ -2074,6 +2073,8 @@
 }
 #endif /* MODULE */
 
+MODULE_LICENSE("GPL");
+
 static int cv3d_has_4mb(void)
 {
 	/* cyberfb version didn't work, neither does this (not reliably)

--=-ExEHnaBsMK1poAC15imF
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--=-ExEHnaBsMK1poAC15imF--
