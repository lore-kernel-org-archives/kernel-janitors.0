From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:13:13 +0000
Subject: [KJ] [PATCH 27/53] igafb: Clean up printk()'s in
Message-Id: <20050125231302.10418.94612.13569@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5231492037581168=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5231492037581168==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/igafb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/igafb.c linux-2.6.11-rc2-mm1/drivers/video/igafb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/igafb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/igafb.c	2005-01-24 19:07:03.286259792 -0500
@@ -364,7 +364,7 @@
 	if (register_framebuffer(info) < 0)
 		return 0;
 
-	printk("fb%d: %s frame buffer device at 0x%08lx [%dMB VRAM]\n",
+	pr_info("fb%d: %s frame buffer device at 0x%08lx [%dMB VRAM]\n",
 	       info->node, info->fix.id, 
 	       par->frame_buffer_phys, info->fix.smem_len >> 20);
 
@@ -406,7 +406,7 @@
 
         info = kmalloc(size, GFP_ATOMIC);
         if (!info) {
-                printk("igafb_init: can't alloc fb_info\n");
+                printk(KERN_ERR "igafb_init: can't alloc fb_info\n");
                 return -ENOMEM;
         }
         memset(info, 0, size);
@@ -415,13 +415,13 @@
 	
 
 	if ((addr = pdev->resource[0].start) == 0) {
-                printk("igafb_init: no memory start\n");
+                printk(KERN_ERR "igafb_init: no memory start\n");
 		kfree(info);
 		return -ENXIO;
 	}
 
 	if ((info->screen_base = ioremap(addr, 1024*1024*2)) == 0) {
-                printk("igafb_init: can't remap %lx[2M]\n", addr);
+                printk(KERN_ERR "igafb_init: can't remap %lx[2M]\n", addr);
 		kfree(info);
 		return -ENXIO;
 	}
@@ -454,7 +454,7 @@
 		igafb_fix.mmio_start = 0x30000000;	/* XXX */
 	}
 	if ((par->io_base = (int) ioremap(igafb_fix.mmio_start, igafb_fix.smem_len)) == 0) {
-                printk("igafb_init: can't remap %lx[4K]\n", igafb_fix.mmio_start);
+                printk(KERN_ERR "igafb_init: can't remap %lx[4K]\n", igafb_fix.mmio_start);
 		iounmap((void *)info->screen_base);
 		kfree(info);
 		return -ENXIO;
@@ -470,7 +470,7 @@
 
 	par->mmap_map = kmalloc(4 * sizeof(*par->mmap_map), GFP_ATOMIC);
 	if (!par->mmap_map) {
-		printk("igafb_init: can't alloc mmap_map\n");
+		printk(KERN_ERR "igafb_init: can't alloc mmap_map\n");
 		iounmap((void *)par->io_base);
 		iounmap(info->screen_base);
 		kfree(info);

--===============5231492037581168==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5231492037581168==--
