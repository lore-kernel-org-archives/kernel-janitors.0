From: James Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 22:06:44 +0000
Subject: [KJ] [PATCH 53/53][RESEND] tridentfb: Clean up printk()'s in
Message-Id: <20050126220644.14158.61018.29589@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89430163626511727=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89430163626511727==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/tridentfb.c - resent after correcting one improper KERN_ constant.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/tridentfb.c linux-2.6.11-rc2-mm1/drivers/video/tridentfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/tridentfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/tridentfb.c	2005-01-26 17:02:49.907863015 -0500
@@ -1163,7 +1163,7 @@
 	fb_info.var = default_var;
 	fb_info.device = &dev->dev;
 	if (register_framebuffer(&fb_info) < 0) {
-		output("Could not register Trident framebuffer\n");
+		printk(KERN_ERR "tridentfb: could not register Trident framebuffer\n");
 		return -EINVAL;
 	}
 	output("fb%d: %s frame buffer device %dx%d-%dbpp\n",
diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/include/video/trident.h linux-2.6.11-rc2-mm1/include/video/trident.h
--- linux-2.6.11-rc2-mm1-original/include/video/trident.h	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/include/video/trident.h	2005-01-26 17:02:08.952592688 -0500
@@ -9,7 +9,7 @@
 #define debug(f,a...)
 #endif
 
-#define output(f, a...) printk("tridentfb: " f, ## a)
+#define output(f, a...) pr_info("tridentfb: " f, ## a)
 
 #define Kb	(1024)
 #define Mb	(Kb*Kb)

--===============89430163626511727==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89430163626511727==--
