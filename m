From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Fri, 24 Feb 2006 21:17:28 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/video
Message-Id: <1140815848.26064.4.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75050642950202207=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75050642950202207==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/video to kzalloc usage.
Compile tested with allyes config. It also contains a formating change
in video/matrox/matroxfb_maven.c, i am not sure if it is ok to
remove the cast, to keep it on a single line to make it more readable.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/drivers/video/au1100fb.c.orig	2006-02-24 21:50:38.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/au1100fb.c	2006-02-24 21:52:45.000000000 +0100
@@ -444,11 +444,10 @@ int au1100fb_drv_probe(struct device *de
 			return -EINVAL;
 
 	/* Allocate new device private */
-	if (!(fbdev = kmalloc(sizeof(struct au1100fb_device), GFP_KERNEL))) {
+	if (!(fbdev = kzalloc(sizeof(struct au1100fb_device), GFP_KERNEL))) {
 		print_err("fail to allocate device private record");
 		return -ENOMEM;
 	}
-	memset((void*)fbdev, 0, sizeof(struct au1100fb_device));
 
 	fbdev->panel = &known_lcd_panels[drv_info.panel_idx];
 
@@ -525,10 +524,8 @@ int au1100fb_drv_probe(struct device *de
 	fbdev->info.fbops = &au1100fb_ops;
 	fbdev->info.fix = au1100fb_fix;
 
-	if (!(fbdev->info.pseudo_palette = kmalloc(sizeof(u32) * 16, GFP_KERNEL))) {
+	if (!(fbdev->info.pseudo_palette = kcalloc(16, sizeof(u32), GFP_KERNEL)))
 		return -ENOMEM;
-	}
-	memset(fbdev->info.pseudo_palette, 0, sizeof(u32) * 16);
 
 	if (fb_alloc_cmap(&fbdev->info.cmap, AU1100_LCD_NBR_PALETTE_ENTRIES, 0) < 0) {
 		print_err("Fail to allocate colormap (%d entries)",
--- linux-2.6.16-rc4/drivers/video/matrox/matroxfb_crtc2.c.orig	2006-02-24 21:53:00.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/matrox/matroxfb_crtc2.c	2006-02-24 21:53:26.000000000 +0100
@@ -694,12 +694,11 @@ static void* matroxfb_crtc2_probe(struct
 	/* hardware is CRTC2 incapable... */
 	if (!ACCESS_FBINFO(devflags.crtc2))
 		return NULL;
-	m2info = (struct matroxfb_dh_fb_info*)kmalloc(sizeof(*m2info), GFP_KERNEL);
+	m2info = (struct matroxfb_dh_fb_info*)kzalloc(sizeof(*m2info), GFP_KERNEL);
 	if (!m2info) {
 		printk(KERN_ERR "matroxfb_crtc2: Not enough memory for CRTC2 control structs\n");
 		return NULL;
 	}
-	memset(m2info, 0, sizeof(*m2info));
 	m2info->primary_dev = MINFO;
 	if (matroxfb_dh_registerfb(m2info)) {
 		kfree(m2info);
--- linux-2.6.16-rc4/drivers/video/matrox/matroxfb_maven.c.orig	2006-02-24 21:53:35.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/matrox/matroxfb_maven.c	2006-02-24 21:56:22.000000000 +0100
@@ -1243,12 +1243,13 @@ static int maven_detect_client(struct i2
 					      I2C_FUNC_SMBUS_BYTE_DATA |
 					      I2C_FUNC_PROTOCOL_MANGLING))
 		goto ERROR0;
-	if (!(new_client = (struct i2c_client*)kmalloc(sizeof(*new_client) + sizeof(*data),
-			GFP_KERNEL))) {
+
+	new_client = (struct i2c_client*)kzalloc(sizeof(*new_client) + sizeof(*data),
+			GFP_KERNEL);
+	if (!new_client) {
 		err = -ENOMEM;
 		goto ERROR0;
 	}
-	memset(new_client, 0, sizeof(*new_client) + sizeof(*data));
 	data = (struct maven_data*)(new_client + 1);
 	i2c_set_clientdata(new_client, data);
 	new_client->addr = address;
--- linux-2.6.16-rc4/drivers/video/cg14.c.orig	2006-02-24 21:56:33.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/cg14.c	2006-02-24 21:56:52.000000000 +0100
@@ -480,12 +480,11 @@ static void cg14_init_one(struct sbus_de
 		}
 	}
 
-	all = kmalloc(sizeof(*all), GFP_KERNEL);
+	all = kzalloc(sizeof(*all), GFP_KERNEL);
 	if (!all) {
 		printk(KERN_ERR "cg14: Cannot allocate memory.\n");
 		return;
 	}
-	memset(all, 0, sizeof(*all));
 
 	INIT_LIST_HEAD(&all->list);
 
--- linux-2.6.16-rc4/drivers/video/valkyriefb.c.orig	2006-02-24 21:57:03.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/valkyriefb.c	2006-02-24 21:57:14.000000000 +0100
@@ -359,10 +359,9 @@ int __init valkyriefb_init(void)
 	}
 #endif /* ppc (!CONFIG_MAC) */
 
-	p = kmalloc(sizeof(*p), GFP_ATOMIC);
+	p = kzalloc(sizeof(*p), GFP_ATOMIC);
 	if (p == 0)
 		return -ENOMEM;
-	memset(p, 0, sizeof(*p));
 
 	/* Map in frame buffer and registers */
 	if (!request_mem_region(frame_buffer_phys, 0x100000, "valkyriefb")) {
--- linux-2.6.16-rc4/drivers/video/cg3.c.orig	2006-02-24 21:58:47.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/cg3.c	2006-02-24 21:58:58.000000000 +0100
@@ -369,12 +369,11 @@ static void cg3_init_one(struct sbus_dev
 	struct all_info *all;
 	int linebytes;
 
-	all = kmalloc(sizeof(*all), GFP_KERNEL);
+	all = kzalloc(sizeof(*all), GFP_KERNEL);
 	if (!all) {
 		printk(KERN_ERR "cg3: Cannot allocate memory.\n");
 		return;
 	}
-	memset(all, 0, sizeof(*all));
 
 	INIT_LIST_HEAD(&all->list);
 
--- linux-2.6.16-rc4/drivers/video/aty/atyfb_base.c.orig	2006-02-24 21:59:19.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/aty/atyfb_base.c	2006-02-24 21:59:47.000000000 +0100
@@ -2853,12 +2853,11 @@ static int __devinit atyfb_setup_sparc(s
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
--- linux-2.6.16-rc4/drivers/video/leo.c.orig	2006-02-24 21:59:55.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/leo.c	2006-02-24 22:00:05.000000000 +0100
@@ -541,12 +541,11 @@ static void leo_init_one(struct sbus_dev
 	struct all_info *all;
 	int linebytes;
 
-	all = kmalloc(sizeof(*all), GFP_KERNEL);
+	all = kzalloc(sizeof(*all), GFP_KERNEL);
 	if (!all) {
 		printk(KERN_ERR "leo: Cannot allocate memory.\n");
 		return;
 	}
-	memset(all, 0, sizeof(*all));
 
 	INIT_LIST_HEAD(&all->list);
 
--- linux-2.6.16-rc4/drivers/video/igafb.c.orig	2006-02-24 22:00:16.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/igafb.c	2006-02-24 22:00:48.000000000 +0100
@@ -404,12 +404,11 @@ int __init igafb_init(void)
 	
 	size = sizeof(struct fb_info) + sizeof(struct iga_par) + sizeof(u32)*16;
 
-        info = kmalloc(size, GFP_ATOMIC);
+        info = kzalloc(size, GFP_ATOMIC);
         if (!info) {
                 printk("igafb_init: can't alloc fb_info\n");
                 return -ENOMEM;
         }
-        memset(info, 0, size);
 
 	par = (struct iga_par *) (info + 1);
 	
@@ -468,7 +467,7 @@ int __init igafb_init(void)
 	 * one additional region with size == 0. 
 	 */
 
-	par->mmap_map = kmalloc(4 * sizeof(*par->mmap_map), GFP_ATOMIC);
+	par->mmap_map = kzalloc(4 * sizeof(*par->mmap_map), GFP_ATOMIC);
 	if (!par->mmap_map) {
 		printk("igafb_init: can't alloc mmap_map\n");
 		iounmap((void *)par->io_base);
@@ -477,8 +476,6 @@ int __init igafb_init(void)
 		return -ENOMEM;
 	}
 
-	memset(par->mmap_map, 0, 4 * sizeof(*par->mmap_map));
-
 	/*
 	 * Set default vmode and cmode from PROM properties.
 	 */
--- linux-2.6.16-rc4/drivers/video/bw2.c.orig	2006-02-24 22:00:58.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/bw2.c	2006-02-24 22:01:05.000000000 +0100
@@ -301,12 +301,11 @@ static void bw2_init_one(struct sbus_dev
 #endif
 	int linebytes;
 
-	all = kmalloc(sizeof(*all), GFP_KERNEL);
+	all = kzalloc(sizeof(*all), GFP_KERNEL);
 	if (!all) {
 		printk(KERN_ERR "bw2: Cannot allocate memory.\n");
 		return;
 	}
-	memset(all, 0, sizeof(*all));
 
 	INIT_LIST_HEAD(&all->list);
 
--- linux-2.6.16-rc4/drivers/video/nvidia/nvidia.c.orig	2006-02-24 22:01:15.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/nvidia/nvidia.c	2006-02-24 22:02:05.000000000 +0100
@@ -1566,13 +1566,11 @@ static int __devinit nvidiafb_probe(stru
 	par = info->par;
 	par->pci_dev = pd;
 
-	info->pixmap.addr = kmalloc(8 * 1024, GFP_KERNEL);
+	info->pixmap.addr = kzalloc(8 * 1024, GFP_KERNEL);
 
 	if (info->pixmap.addr == NULL)
 		goto err_out_kfree;
 
-	memset(info->pixmap.addr, 0, 8 * 1024);
-
 	if (pci_enable_device(pd)) {
 		printk(KERN_ERR PFX "cannot enable PCI device\n");
 		goto err_out_enable;
--- linux-2.6.16-rc4/drivers/video/retz3fb.c.orig	2006-02-24 22:02:16.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/retz3fb.c	2006-02-24 22:02:34.000000000 +0100
@@ -1370,10 +1370,9 @@ int __init retz3fb_init(void)
 			release_mem_region(board_addr, 0x00c00000);
 			continue;
 		}
-		if (!(zinfo = kmalloc(sizeof(struct retz3_fb_info),
+		if (!(zinfo = kzalloc(sizeof(struct retz3_fb_info),
 				      GFP_KERNEL)))
 			return -ENOMEM;
-		memset(zinfo, 0, sizeof(struct retz3_fb_info));
 
 		zinfo->base = ioremap(board_addr, board_size);
 		zinfo->regs = zinfo->base;
--- linux-2.6.16-rc4/drivers/video/tgafb.c.orig	2006-02-24 22:02:42.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/tgafb.c	2006-02-24 22:02:51.000000000 +0100
@@ -1396,12 +1396,11 @@ tgafb_pci_register(struct pci_dev *pdev,
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
--- linux-2.6.16-rc4/drivers/video/i810/i810_main.c.orig	2006-02-24 22:03:12.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/i810/i810_main.c	2006-02-24 22:03:31.000000000 +0100
@@ -2012,11 +2012,10 @@ static int __devinit i810fb_init_pci (st
 	par = info->par;
 	par->dev = dev;
 
-	if (!(info->pixmap.addr = kmalloc(8*1024, GFP_KERNEL))) {
+	if (!(info->pixmap.addr = kzalloc(8*1024, GFP_KERNEL))) {
 		i810fb_release_resource(info, par);
 		return -ENOMEM;
 	}
-	memset(info->pixmap.addr, 0, 8*1024);
 	info->pixmap.size = 8*1024;
 	info->pixmap.buf_align = 8;
 	info->pixmap.access_align = 32;
--- linux-2.6.16-rc4/drivers/video/clps711xfb.c.orig	2006-02-24 22:03:44.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/clps711xfb.c	2006-02-24 22:03:55.000000000 +0100
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
--- linux-2.6.16-rc4/drivers/video/controlfb.c.orig	2006-02-24 22:04:05.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/controlfb.c	2006-02-24 22:04:19.000000000 +0100
@@ -694,11 +694,10 @@ static int __init control_of_init(struct
 		printk(KERN_ERR "can't get 2 addresses for control\n");
 		return -ENXIO;
 	}
-	p = kmalloc(sizeof(*p), GFP_KERNEL);
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (p == 0)
 		return -ENXIO;
 	control_fb = p;	/* save it for cleanups */
-	memset(p, 0, sizeof(*p));
 
 	/* Map in frame buffer and registers */
 	p->fb_orig_base = fb_res.start;
--- linux-2.6.16-rc4/drivers/video/cyber2000fb.c.orig	2006-02-24 22:04:33.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/cyber2000fb.c	2006-02-24 22:04:44.000000000 +0100
@@ -1223,12 +1223,10 @@ cyberpro_alloc_fb_info(unsigned int id, 
 {
 	struct cfb_info *cfb;
 
-	cfb = kmalloc(sizeof(struct cfb_info), GFP_KERNEL);
+	cfb = kzalloc(sizeof(struct cfb_info), GFP_KERNEL);
 	if (!cfb)
 		return NULL;
 
-	memset(cfb, 0, sizeof(struct cfb_info));
-
 	cfb->id			= id;
 
 	if (id == ID_CYBERPRO_5000)
--- linux-2.6.16-rc4/drivers/video/tcx.c.orig	2006-02-24 22:04:54.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/tcx.c	2006-02-24 22:05:03.000000000 +0100
@@ -359,12 +359,11 @@ static void tcx_init_one(struct sbus_dev
 	struct all_info *all;
 	int linebytes, i;
 
-	all = kmalloc(sizeof(*all), GFP_KERNEL);
+	all = kzalloc(sizeof(*all), GFP_KERNEL);
 	if (!all) {
 		printk(KERN_ERR "tcx: Cannot allocate memory.\n");
 		return;
 	}
-	memset(all, 0, sizeof(*all));
 
 	INIT_LIST_HEAD(&all->list);
 
--- linux-2.6.16-rc4/drivers/video/ffb.c.orig	2006-02-24 22:05:11.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/ffb.c	2006-02-24 22:05:17.000000000 +0100
@@ -940,12 +940,11 @@ static void ffb_init_one(int node, int p
 		return;
 	}
 
-	all = kmalloc(sizeof(*all), GFP_KERNEL);
+	all = kzalloc(sizeof(*all), GFP_KERNEL);
 	if (!all) {
 		printk(KERN_ERR "ffb: Cannot allocate memory.\n");
 		return;
 	}
-	memset(all, 0, sizeof(*all));
 
 	INIT_LIST_HEAD(&all->list);	
 
--- linux-2.6.16-rc4/drivers/video/sun3fb.c.orig	2006-02-24 22:05:24.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/sun3fb.c	2006-02-24 22:06:14.000000000 +0100
@@ -526,11 +526,10 @@ static int __init sun3fb_init_fb(int fbt
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
--- linux-2.6.16-rc4/drivers/video/savage/savagefb_driver.c.orig	2006-02-24 22:06:27.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/savage/savagefb_driver.c	2006-02-24 22:06:44.000000000 +0100
@@ -1950,11 +1950,10 @@ static int __devinit savage_init_fb_info
 
 #if defined(CONFIG_FB_SAVAGE_ACCEL)
 	/* FIFO size + padding for commands */
-	info->pixmap.addr = kmalloc(8*1024, GFP_KERNEL);
+	info->pixmap.addr = kzalloc(8*1024, GFP_KERNEL);
 
 	err = -ENOMEM;
 	if (info->pixmap.addr) {
-		memset(info->pixmap.addr, 0, 8*1024);
 		info->pixmap.size = 8*1024;
 		info->pixmap.scan_align = 4;
 		info->pixmap.buf_align = 4;
--- linux-2.6.16-rc4/drivers/video/riva/fbdev.c.orig	2006-02-24 22:08:25.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/riva/fbdev.c	2006-02-24 22:08:44.000000000 +0100
@@ -1888,12 +1888,11 @@ static int __devinit rivafb_probe(struct
 	default_par = info->par;
 	default_par->pdev = pd;
 
-	info->pixmap.addr = kmalloc(8 * 1024, GFP_KERNEL);
+	info->pixmap.addr = kzalloc(8 * 1024, GFP_KERNEL);
 	if (info->pixmap.addr == NULL) {
 	    	ret = -ENOMEM;
 		goto err_framebuffer_release;
 	}
-	memset(info->pixmap.addr, 0, 8 * 1024);
 
 	ret = pci_enable_device(pd);
 	if (ret < 0) {
--- linux-2.6.16-rc4/drivers/video/cg6.c.orig	2006-02-24 22:08:54.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/cg6.c	2006-02-24 22:09:03.000000000 +0100
@@ -667,12 +667,11 @@ static void cg6_init_one(struct sbus_dev
 	struct all_info *all;
 	int linebytes;
 
-	all = kmalloc(sizeof(*all), GFP_KERNEL);
+	all = kzalloc(sizeof(*all), GFP_KERNEL);
 	if (!all) {
 		printk(KERN_ERR "cg6: Cannot allocate memory.\n");
 		return;
 	}
-	memset(all, 0, sizeof(*all));
 
 	INIT_LIST_HEAD(&all->list);
 
--- linux-2.6.16-rc4/drivers/video/p9100.c.orig	2006-02-24 22:09:11.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/p9100.c	2006-02-24 22:09:18.000000000 +0100
@@ -272,12 +272,11 @@ static void p9100_init_one(struct sbus_d
 	struct all_info *all;
 	int linebytes;
 
-	all = kmalloc(sizeof(*all), GFP_KERNEL);
+	all = kzalloc(sizeof(*all), GFP_KERNEL);
 	if (!all) {
 		printk(KERN_ERR "p9100: Cannot allocate memory.\n");
 		return;
 	}
-	memset(all, 0, sizeof(*all));
 
 	INIT_LIST_HEAD(&all->list);
 
--- linux-2.6.16-rc4/drivers/video/intelfb/intelfbdrv.c.orig	2006-02-24 22:09:32.000000000 +0100
+++ linux-2.6.16-rc4/drivers/video/intelfb/intelfbdrv.c	2006-02-24 22:09:43.000000000 +0100
@@ -526,12 +526,11 @@ intelfb_pci_register(struct pci_dev *pde
 	dinfo->pdev  = pdev;
 
 	/* Reserve pixmap space. */
-	info->pixmap.addr = kmalloc(64 * 1024, GFP_KERNEL);
+	info->pixmap.addr = kzalloc(64 * 1024, GFP_KERNEL);
 	if (info->pixmap.addr == NULL) {
 		ERR_MSG("Cannot reserve pixmap memory.\n");
 		goto err_out_pixmap;
 	}
-	memset(info->pixmap.addr, 0, 64 * 1024);
 
 	/* set early this option because it could be changed by tv encoder
 	   driver */



--===============75050642950202207==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75050642950202207==--
