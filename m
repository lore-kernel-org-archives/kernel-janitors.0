From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:14:52 +0000
Subject: [KJ] [PATCH 41/53] pvr2fb: Clean up printk()'s in
Message-Id: <20050125231451.10418.27669.52398@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43431338877789072=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43431338877789072==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/pvr2fb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/pvr2fb.c linux-2.6.11-rc2-mm1/drivers/video/pvr2fb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/pvr2fb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/pvr2fb.c	2005-01-24 19:07:03.816258072 -0500
@@ -818,10 +818,10 @@
 
 	rev = fb_readl(par->mmio_base + 0x04);
 
-	printk("fb%d: %s (rev %ld.%ld) frame buffer device, using %ldk/%ldk of video memory\n",
+	pr_info("fb%d: %s (rev %ld.%ld) frame buffer device, using %ldk/%ldk of video memory\n",
 	       fb_info->node, fb_info->fix.id, (rev >> 4) & 0x0f, rev & 0x0f,
 	       modememused >> 10, (unsigned long)(fb_info->fix.smem_len >> 10));
-	printk("fb%d: Mode %dx%d-%d pitch = %ld cable: %s video output: %s\n", 
+	pr_info("fb%d: Mode %dx%d-%d pitch = %ld cable: %s video output: %s\n", 
 	       fb_info->node, fb_info->var.xres, fb_info->var.yres,
 	       fb_info->var.bits_per_pixel, 
 	       get_line_length(fb_info->var.xres, fb_info->var.bits_per_pixel),

--===============43431338877789072==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43431338877789072==--
