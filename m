From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:13:37 +0000
Subject: [KJ] [PATCH 30/53] kyrofb: Clean up printk()'s in
Message-Id: <20050125231337.10418.9460.17033@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99731040072726096=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99731040072726096==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/kyro/fbdev.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/kyro/fbdev.c linux-2.6.11-rc2-mm1/drivers/video/kyro/fbdev.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/kyro/fbdev.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/kyro/fbdev.c	2005-01-24 19:07:03.376259500 -0500
@@ -739,7 +739,7 @@
 	if (register_framebuffer(info) < 0)
 		goto out_unmap;
 
-	printk("fb%d: %s frame buffer device, at %dx%d@%d using %ldk/%ldk of VRAM\n",
+	pr_info("fb%d: %s frame buffer device, at %dx%d@%d using %ldk/%ldk of VRAM\n",
 	       info->node, info->fix.id, info->var.xres,
 	       info->var.yres, info->var.bits_per_pixel, size >> 10,
 	       (unsigned long)info->fix.smem_len >> 10);

--===============99731040072726096==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99731040072726096==--
