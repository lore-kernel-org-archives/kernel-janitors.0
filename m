From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:08:40 +0000
Subject: [KJ] [PATCH 3/53] atafb: Clean up printk()'s in
Message-Id: <20050125230834.10418.89601.31431@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57634513311686453=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57634513311686453==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/atafb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/atafb.c linux-2.6.11-rc2-mm1/drivers/video/atafb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/atafb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/atafb.c	2005-01-24 19:07:02.196263329 -0500
@@ -2732,7 +2732,7 @@
 		}
 		fbhw = &st_switch;
 		atafb_ops.fb_setcolreg = &stste_setcolreg;
-		printk("Cannot determine video hardware; defaulting to ST(e)\n");
+		pr_info("Cannot determine video hardware; defaulting to ST(e)\n");
 #else /* ATAFB_STE */
 		/* no default driver included */
 		/* Nobody will ever see this message :-) */
@@ -2809,13 +2809,13 @@
 	if (register_framebuffer(&fb_info) < 0)
 		return -EINVAL;
 
-	printk("Determined %dx%d, depth %d\n",
+	pr_info("Determined %dx%d, depth %d\n",
 	       disp.var.xres, disp.var.yres, disp.var.bits_per_pixel);
 	if ((disp.var.xres != disp.var.xres_virtual) ||
 	    (disp.var.yres != disp.var.yres_virtual))
 	   printk("   virtual %dx%d\n",
 			  disp.var.xres_virtual, disp.var.yres_virtual);
-	printk("fb%d: %s frame buffer device, using %dK of video memory\n",
+	pr_info("fb%d: %s frame buffer device, using %dK of video memory\n",
 	       fb_info.node, fb_info.modename, screen_len>>10);
 
 	/* TODO: This driver cannot be unloaded yet */

--===============57634513311686453==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57634513311686453==--
