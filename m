From: Reiner Herrmann <reiner@reiner-h.de>
Date: Tue, 15 Aug 2006 20:12:04 +0000
Subject: [KJ] [PATCH] drivers/video: kzalloc conversion
Message-Id: <200608152212.04409.reiner@reiner-h.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use kzalloc instead of kmalloc and zero-memset in drivers/video/

Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
---
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/amba-clcd.c linux-work/drivers/video/amba-clcd.c
--- linux-2.6.18-rc4/drivers/video/amba-clcd.c	2006-06-18 03:49:35.000000000 +0200
+++ linux-work/drivers/video/amba-clcd.c	2006-08-15 21:28:54.000000000 +0200
@@ -447,13 +447,12 @@ static int clcdfb_probe(struct amba_devi
 		goto out;
 	}
 
-	fb = (struct clcd_fb *) kmalloc(sizeof(struct clcd_fb), GFP_KERNEL);
+	fb = kzalloc(sizeof(struct clcd_fb), GFP_KERNEL);
 	if (!fb) {
 		printk(KERN_INFO "CLCD: could not allocate new clcd_fb struct\n");
 		ret = -ENOMEM;
 		goto free_region;
 	}
-	memset(fb, 0, sizeof(struct clcd_fb));
 
 	fb->dev = dev;
 	fb->board = board;
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/aty/atyfb_base.c linux-work/drivers/video/aty/atyfb_base.c
--- linux-2.6.18-rc4/drivers/video/aty/atyfb_base.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/aty/atyfb_base.c	2006-08-15 21:26:36.000000000 +0200
@@ -2995,12 +2995,11 @@ static int __devinit atyfb_setup_sparc(s
 		/* nothing */ ;
 	j = i + 4;
 
-	par->mmap_map = kmalloc(j * sizeof(*par->mmap_map), GFP_ATOMIC);
+	par->mmap_map = kzalloc(j * sizeof(*par->mmap_map), GFP_ATOMIC);
 	if (!par->mmap_map) {
 		PRINTKE("atyfb_setup_sparc() can't alloc mmap_map\n");
 		return -ENOMEM;
 	}
-	memset(par->mmap_map, 0, j * sizeof(*par->mmap_map));
 
 	for (i = 0, j = 2; i < 6 && pdev->resource[i].start; i++) {
 		struct resource *rp = &pdev->resource[i];
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/au1100fb.c linux-work/drivers/video/au1100fb.c
--- linux-2.6.18-rc4/drivers/video/au1100fb.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/au1100fb.c	2006-08-15 21:30:48.000000000 +0200
@@ -451,11 +451,11 @@ int au1100fb_drv_probe(struct device *de
 			return -EINVAL;
 
 	/* Allocate new device private */
-	if (!(fbdev = kmalloc(sizeof(struct au1100fb_device), GFP_KERNEL))) {
+	fbdev = kzalloc(sizeof(struct au1100fb_device), GFP_KERNEL);
+	if (!fbdev) {
 		print_err("fail to allocate device private record");
 		return -ENOMEM;
 	}
-	memset((void*)fbdev, 0, sizeof(struct au1100fb_device));
 
 	fbdev->panel = &known_lcd_panels[drv_info.panel_idx];
 
@@ -532,10 +532,10 @@ int au1100fb_drv_probe(struct device *de
 	fbdev->info.fbops = &au1100fb_ops;
 	fbdev->info.fix = au1100fb_fix;
 
-	if (!(fbdev->info.pseudo_palette = kmalloc(sizeof(u32) * 16, GFP_KERNEL))) {
+	fbdev->info.pseudo_palette = kzalloc(sizeof(u32) * 16, GFP_KERNEL);
+	if (!fbdev->info.pseudo_palette) {
 		return -ENOMEM;
 	}
-	memset(fbdev->info.pseudo_palette, 0, sizeof(u32) * 16);
 
 	if (fb_alloc_cmap(&fbdev->info.cmap, AU1100_LCD_NBR_PALETTE_ENTRIES, 0) < 0) {
 		print_err("Fail to allocate colormap (%d entries)",
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/au1200fb.c linux-work/drivers/video/au1200fb.c
--- linux-2.6.18-rc4/drivers/video/au1200fb.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/au1200fb.c	2006-08-15 21:31:10.000000000 +0200
@@ -1589,11 +1589,10 @@ static int au1200fb_init_fbinfo(struct a
 		return -EFAULT;
 	}
 
-	fbi->pseudo_palette = kmalloc(sizeof(u32) * 16, GFP_KERNEL);
+	fbi->pseudo_palette = kzalloc(sizeof(u32) * 16, GFP_KERNEL);
 	if (!fbi->pseudo_palette) {
 		return -ENOMEM;
 	}
-	memset(fbi->pseudo_palette, 0, sizeof(u32) * 16);
 
 	if (fb_alloc_cmap(&fbi->cmap, AU1200_LCD_NBR_PALETTE_ENTRIES, 0) < 0) {
 		print_err("Fail to allocate colormap (%d entries)",
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/clps711xfb.c linux-work/drivers/video/clps711xfb.c
--- linux-2.6.18-rc4/drivers/video/clps711xfb.c	2006-06-18 03:49:35.000000000 +0200
+++ linux-work/drivers/video/clps711xfb.c	2006-08-15 21:31:30.000000000 +0200
@@ -366,11 +366,10 @@ int __init clps711xfb_init(void)
 	if (fb_get_options("clps711xfb", NULL))
 		return -ENODEV;
 
-	cfb = kmalloc(sizeof(*cfb), GFP_KERNEL);
+	cfb = kzalloc(sizeof(*cfb), GFP_KERNEL);
 	if (!cfb)
 		goto out;
 
-	memset(cfb, 0, sizeof(*cfb));
 	strcpy(cfb->fix.id, "clps711x");
 
 	cfb->fbops		= &clps7111fb_ops;
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/controlfb.c linux-work/drivers/video/controlfb.c
--- linux-2.6.18-rc4/drivers/video/controlfb.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/controlfb.c	2006-08-15 21:32:06.000000000 +0200
@@ -692,11 +692,10 @@ static int __init control_of_init(struct
 		printk(KERN_ERR "can't get 2 addresses for control\n");
 		return -ENXIO;
 	}
-	p = kmalloc(sizeof(*p), GFP_KERNEL);
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (p = 0)
 		return -ENXIO;
 	control_fb = p;	/* save it for cleanups */
-	memset(p, 0, sizeof(*p));
 
 	/* Map in frame buffer and registers */
 	p->fb_orig_base = fb_res.start;
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/cyber2000fb.c linux-work/drivers/video/cyber2000fb.c
--- linux-2.6.18-rc4/drivers/video/cyber2000fb.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/cyber2000fb.c	2006-08-15 21:32:27.000000000 +0200
@@ -1221,12 +1221,10 @@ cyberpro_alloc_fb_info(unsigned int id, 
 {
 	struct cfb_info *cfb;
 
-	cfb = kmalloc(sizeof(struct cfb_info), GFP_KERNEL);
+	cfb = kzalloc(sizeof(struct cfb_info), GFP_KERNEL);
 	if (!cfb)
 		return NULL;
 
-	memset(cfb, 0, sizeof(struct cfb_info));
-
 	cfb->id			= id;
 
 	if (id = ID_CYBERPRO_5000)
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/i810/i810_main.c linux-work/drivers/video/i810/i810_main.c
--- linux-2.6.18-rc4/drivers/video/i810/i810_main.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/i810/i810_main.c	2006-08-15 21:22:14.000000000 +0200
@@ -2010,11 +2010,11 @@ static int __devinit i810fb_init_pci (st
 	par = info->par;
 	par->dev = dev;
 
-	if (!(info->pixmap.addr = kmalloc(8*1024, GFP_KERNEL))) {
+	info->pixmap.addr = kzalloc(8*1024, GFP_KERNEL);
+	if (!info->pixmap.addr) {
 		i810fb_release_resource(info, par);
 		return -ENOMEM;
 	}
-	memset(info->pixmap.addr, 0, 8*1024);
 	info->pixmap.size = 8*1024;
 	info->pixmap.buf_align = 8;
 	info->pixmap.access_align = 32;
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/igafb.c linux-work/drivers/video/igafb.c
--- linux-2.6.18-rc4/drivers/video/igafb.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/igafb.c	2006-08-15 21:32:43.000000000 +0200
@@ -400,12 +400,11 @@ int __init igafb_init(void)
 	
 	size = sizeof(struct fb_info) + sizeof(struct iga_par) + sizeof(u32)*16;
 
-        info = kmalloc(size, GFP_ATOMIC);
+        info = kzalloc(size, GFP_ATOMIC);
         if (!info) {
                 printk("igafb_init: can't alloc fb_info\n");
                 return -ENOMEM;
         }
-        memset(info, 0, size);
 
 	par = (struct iga_par *) (info + 1);
 	
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/intelfb/intelfbdrv.c linux-work/drivers/video/intelfb/intelfbdrv.c
--- linux-2.6.18-rc4/drivers/video/intelfb/intelfbdrv.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/intelfb/intelfbdrv.c	2006-08-15 21:19:30.000000000 +0200
@@ -529,12 +529,11 @@ intelfb_pci_register(struct pci_dev *pde
 	dinfo->pdev  = pdev;
 
 	/* Reserve pixmap space. */
-	info->pixmap.addr = kmalloc(64 * 1024, GFP_KERNEL);
+	info->pixmap.addr = kzalloc(64 * 1024, GFP_KERNEL);
 	if (info->pixmap.addr = NULL) {
 		ERR_MSG("Cannot reserve pixmap memory.\n");
 		goto err_out_pixmap;
 	}
-	memset(info->pixmap.addr, 0, 64 * 1024);
 
 	/* set early this option because it could be changed by tv encoder
 	   driver */
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/matrox/matroxfb_crtc2.c linux-work/drivers/video/matrox/matroxfb_crtc2.c
--- linux-2.6.18-rc4/drivers/video/matrox/matroxfb_crtc2.c	2006-06-18 03:49:35.000000000 +0200
+++ linux-work/drivers/video/matrox/matroxfb_crtc2.c	2006-08-15 21:18:01.000000000 +0200
@@ -694,12 +694,11 @@ static void* matroxfb_crtc2_probe(struct
 	/* hardware is CRTC2 incapable... */
 	if (!ACCESS_FBINFO(devflags.crtc2))
 		return NULL;
-	m2info = (struct matroxfb_dh_fb_info*)kmalloc(sizeof(*m2info), GFP_KERNEL);
+	m2info = kzalloc(sizeof(*m2info), GFP_KERNEL);
 	if (!m2info) {
 		printk(KERN_ERR "matroxfb_crtc2: Not enough memory for CRTC2 control structs\n");
 		return NULL;
 	}
-	memset(m2info, 0, sizeof(*m2info));
 	m2info->primary_dev = MINFO;
 	if (matroxfb_dh_registerfb(m2info)) {
 		kfree(m2info);
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/nvidia/nvidia.c linux-work/drivers/video/nvidia/nvidia.c
--- linux-2.6.18-rc4/drivers/video/nvidia/nvidia.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/nvidia/nvidia.c	2006-08-15 21:11:24.000000000 +0200
@@ -1190,13 +1190,11 @@ static int __devinit nvidiafb_probe(stru
 	par = info->par;
 	par->pci_dev = pd;
 
-	info->pixmap.addr = kmalloc(8 * 1024, GFP_KERNEL);
+	info->pixmap.addr = kzalloc(8 * 1024, GFP_KERNEL);
 
 	if (info->pixmap.addr = NULL)
 		goto err_out_kfree;
 
-	memset(info->pixmap.addr, 0, 8 * 1024);
-
 	if (pci_enable_device(pd)) {
 		printk(KERN_ERR PFX "cannot enable PCI device\n");
 		goto err_out_enable;
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/offb.c linux-work/drivers/video/offb.c
--- linux-2.6.18-rc4/drivers/video/offb.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/offb.c	2006-08-15 21:36:43.000000000 +0200
@@ -263,13 +263,11 @@ static void __init offb_init_fb(const ch
 
 	size = sizeof(struct fb_info) + sizeof(u32) * 17;
 
-	info = kmalloc(size, GFP_ATOMIC);
-	
+	info = kzalloc(size, GFP_ATOMIC);
 	if (info = 0) {
 		release_mem_region(res_start, res_size);
 		return;
 	}
-	memset(info, 0, size);
 
 	fix = &info->fix;
 	var = &info->var;
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/pvr2fb.c linux-work/drivers/video/pvr2fb.c
--- linux-2.6.18-rc4/drivers/video/pvr2fb.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/pvr2fb.c	2006-08-15 21:37:05.000000000 +0200
@@ -1065,14 +1065,12 @@ int __init pvr2fb_init(void)
 #endif
 	size = sizeof(struct fb_info) + sizeof(struct pvr2fb_par) + 16 * sizeof(u32);
 
-	fb_info = kmalloc(size, GFP_KERNEL);
+	fb_info = kzalloc(size, GFP_KERNEL);
 	if (!fb_info) {
 		printk(KERN_ERR "Failed to allocate memory for fb_info\n");
 		return -ENOMEM;
 	}
 
-	memset(fb_info, 0, size);
-
 	currentpar = (struct pvr2fb_par *)(fb_info + 1);
 
 	for (i = 0; i < ARRAY_SIZE(board_list); i++) {
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/retz3fb.c linux-work/drivers/video/retz3fb.c
--- linux-2.6.18-rc4/drivers/video/retz3fb.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/retz3fb.c	2006-08-15 21:39:46.000000000 +0200
@@ -1369,10 +1369,9 @@ int __init retz3fb_init(void)
 			release_mem_region(board_addr, 0x00c00000);
 			continue;
 		}
-		if (!(zinfo = kmalloc(sizeof(struct retz3_fb_info),
-				      GFP_KERNEL)))
+		zinfo = kzalloc(sizeof(struct retz3_fb_info), GFP_KERNEL);
+		if (!zinfo)
 			return -ENOMEM;
-		memset(zinfo, 0, sizeof(struct retz3_fb_info));
 
 		zinfo->base = ioremap(board_addr, board_size);
 		zinfo->regs = zinfo->base;
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/riva/fbdev.c linux-work/drivers/video/riva/fbdev.c
--- linux-2.6.18-rc4/drivers/video/riva/fbdev.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/riva/fbdev.c	2006-08-15 21:10:00.000000000 +0200
@@ -1999,12 +1999,11 @@ static int __devinit rivafb_probe(struct
 	default_par = info->par;
 	default_par->pdev = pd;
 
-	info->pixmap.addr = kmalloc(8 * 1024, GFP_KERNEL);
+	info->pixmap.addr = kzalloc(8 * 1024, GFP_KERNEL);
 	if (info->pixmap.addr = NULL) {
 	    	ret = -ENOMEM;
 		goto err_framebuffer_release;
 	}
-	memset(info->pixmap.addr, 0, 8 * 1024);
 
 	ret = pci_enable_device(pd);
 	if (ret < 0) {
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/sun3fb.c linux-work/drivers/video/sun3fb.c
--- linux-2.6.18-rc4/drivers/video/sun3fb.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/sun3fb.c	2006-08-15 21:40:48.000000000 +0200
@@ -524,11 +524,10 @@ static int __init sun3fb_init_fb(int fbt
 	int linebytes, w, h, depth;
 	char *p = NULL;
 	
-	fb = kmalloc(sizeof(struct fb_info_sbusfb), GFP_ATOMIC);
+	fb = kzalloc(sizeof(struct fb_info_sbusfb), GFP_ATOMIC);
 	if (!fb)
 		return -ENOMEM;
 	
-	memset(fb, 0, sizeof(struct fb_info_sbusfb));
 	fix = &fb->fix;
 	var = &fb->var;
 	disp = &fb->disp;
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/tgafb.c linux-work/drivers/video/tgafb.c
--- linux-2.6.18-rc4/drivers/video/tgafb.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/tgafb.c	2006-08-15 21:41:21.000000000 +0200
@@ -1394,12 +1394,11 @@ tgafb_pci_register(struct pci_dev *pdev,
 	}
 
 	/* Allocate the fb and par structures.  */
-	all = kmalloc(sizeof(*all), GFP_KERNEL);
+	all = kzalloc(sizeof(*all), GFP_KERNEL);
 	if (!all) {
 		printk(KERN_ERR "tgafb: Cannot allocate memory\n");
 		return -ENOMEM;
 	}
-	memset(all, 0, sizeof(*all));
 	pci_set_drvdata(pdev, all);
 
 	/* Request the mem regions.  */
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/video/valkyriefb.c linux-work/drivers/video/valkyriefb.c
--- linux-2.6.18-rc4/drivers/video/valkyriefb.c	2006-08-13 16:30:20.000000000 +0200
+++ linux-work/drivers/video/valkyriefb.c	2006-08-15 21:41:39.000000000 +0200
@@ -357,10 +357,9 @@ int __init valkyriefb_init(void)
 	}
 #endif /* ppc (!CONFIG_MAC) */
 
-	p = kmalloc(sizeof(*p), GFP_ATOMIC);
+	p = kzalloc(sizeof(*p), GFP_ATOMIC);
 	if (p = 0)
 		return -ENOMEM;
-	memset(p, 0, sizeof(*p));
 
 	/* Map in frame buffer and registers */
 	if (!request_mem_region(frame_buffer_phys, 0x100000, "valkyriefb")) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
