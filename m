From: Leann Ogasawara <ogasawara@osdl.org>
Date: Fri, 06 Feb 2004 22:41:51 +0000
Subject: [Kernel-janitors] [PATCH] drivers/video/neofb.c fb_alloc_cmap()
Message-Id: <1076107311.11881.1115.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

Patch audits fb_alloc_cmap() and fixes up error handling.  Feedback
appreciated.  Thanks,

Leann

diffed against 2.6.2

=== drivers/video/neofb.c 1.31 vs edited ==--- 1.31/drivers/video/neofb.c	Tue Feb  3 21:39:34 2004
+++ edited/drivers/video/neofb.c	Fri Feb  6 08:27:13 2004
@@ -1637,13 +1637,12 @@
 
 	DBG("neo_unmap_mmio");
 
-	if (par->mmio_vbase) {
-		iounmap(par->mmio_vbase);
-		par->mmio_vbase = NULL;
+	iounmap(par->mmio_vbase);
+	par->mmio_vbase = NULL;
+
+	release_mem_region(info->fix.mmio_start,
+			   info->fix.mmio_len);
 
-		release_mem_region(info->fix.mmio_start,
-				   info->fix.mmio_len);
-	}
 }
 
 static int __devinit neo_map_video(struct fb_info *info,
@@ -1687,19 +1686,17 @@
 
 	DBG("neo_unmap_video");
 
-	if (info->screen_base) {
 #ifdef CONFIG_MTRR
-		struct neofb_par *par = (struct neofb_par *) info->par;
-		mtrr_del(par->mtrr, info->fix.smem_start,
-			 info->fix.smem_len);
+	struct neofb_par *par = (struct neofb_par *) info->par;
+	mtrr_del(par->mtrr, info->fix.smem_start,
+		 info->fix.smem_len);
 #endif
 
-		iounmap(info->screen_base);
-		info->screen_base = NULL;
+	iounmap(info->screen_base);
+	info->screen_base = NULL;
 
-		release_mem_region(info->fix.smem_start,
-				   info->fix.smem_len);
-	}
+	release_mem_region(info->fix.smem_start,
+			   info->fix.smem_len);
 }
 
 static int __devinit neo_init_hw(struct fb_info *info)
@@ -1880,6 +1877,7 @@
 {
 	struct fb_info *info;
 	struct neofb_par *par;
+	int ret;
 
 	info = kmalloc(sizeof(struct fb_info) + sizeof(struct neofb_par) + 
 		       sizeof(u32) * 17, GFP_KERNEL);
@@ -1942,7 +1940,11 @@
 	info->par = par;
 	info->pseudo_palette = (void *) (par + 1);
 
-	fb_alloc_cmap(&info->cmap, NR_PALETTE, 0);
+	ret = fb_alloc_cmap(&info->cmap, NR_PALETTE, 0);
+	if (ret) {
+		kfree(info);
+		info = NULL;
+	}
 
 	return info;
 }
@@ -1953,7 +1955,7 @@
 		/*
 		 * Free the colourmap
 		 */
-		fb_alloc_cmap(&info->cmap, 0, 0);
+		fb_dealloc_cmap(&info->cmap);
 
 		kfree(info);
 	}
@@ -1978,21 +1980,21 @@
 	err = -ENOMEM;
 	info = neo_alloc_fb_info(dev, id);
 	if (!info)
-		goto failed;
+		return err;
 
 	err = neo_map_mmio(info, dev);
 	if (err)
-		goto failed;
+		goto err_map_mmio;
 
 	video_len = neo_init_hw(info);
 	if (video_len < 0) {
 		err = video_len;
-		goto failed;
+		goto err_init_hw;
 	}
 
 	err = neo_map_video(info, dev, video_len);
 	if (err)
-		goto failed;
+		goto err_init_hw;
 
 	/*
 	 * Calculate the hsync and vsync frequencies.  Note that
@@ -2016,7 +2018,7 @@
 
 	err = register_framebuffer(info);
 	if (err < 0)
-		goto failed;
+		goto err_reg_fb;
 
 	printk(KERN_INFO "fb%d: %s frame buffer device\n",
 	       info->node, info->fix.id);
@@ -2027,9 +2029,11 @@
 	pci_set_drvdata(dev, info);
 	return 0;
 
-      failed:
+ err_reg_fb:
 	neo_unmap_video(info);
+ err_init_hw:
 	neo_unmap_mmio(info);
+ err_map_mmio:
 	neo_free_fb_info(info);
 
 	return err;



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
