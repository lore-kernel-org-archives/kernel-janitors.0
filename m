From: Leann Ogasawara <ogasawara@osdl.org>
Date: Fri, 06 Feb 2004 22:31:00 +0000
Subject: [Kernel-janitors] [PATCH] drivers/video/radeonfb.c fb_alloc_cmap()
Message-Id: <1076106660.11881.1071.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all,

Patch audits fb_alloc_cmap() and also incorporates an error path. 
Feedback appreciated.  Thanks,

Leann

=== drivers/video/radeonfb.c 1.35 vs edited ==--- 1.35/drivers/video/radeonfb.c	Wed Jan 21 09:48:54 2004
+++ edited/drivers/video/radeonfb.c	Thu Feb  5 11:57:31 2004
@@ -1287,6 +1287,7 @@
 {
         struct fb_info *info = &rinfo->info;
 	struct fb_var_screeninfo var;
+	int ret;
 
         var = radeonfb_default_var;
         if ((radeon_init_disp_var(rinfo, &var)) < 0)
@@ -1296,7 +1297,9 @@
 	rinfo->bpp = var.bits_per_pixel;
         
 	info->var = var;
-	fb_alloc_cmap(&info->cmap, 256, 0);
+	ret = fb_alloc_cmap(&info->cmap, 256, 0);
+	if (ret)
+		return ret;
 
 	var.activate = FB_ACTIVATE_NOW;
         return 0;
@@ -2806,7 +2809,9 @@
 {
 	struct radeonfb_info *rinfo;
 	struct radeon_chip_info *rci = &radeon_chip_info[ent->driver_data];
+        struct fb_info *info;
 	u32 tmp;
+	int ret;
 
 	RTRACE("radeonfb_pci_register BEGIN\n");
 
@@ -2823,7 +2828,7 @@
 	}
 
 	memset (rinfo, 0, sizeof (struct radeonfb_info));
-	//info = &rinfo->info;
+	info = &rinfo->info;
 	rinfo->pdev = pdev;
 	strcpy(rinfo->name, rci->name);
 	rinfo->arch = rci->arch;
@@ -2836,29 +2841,23 @@
 	if (!request_mem_region (rinfo->fb_base_phys,
 				 pci_resource_len(pdev, 0), "radeonfb")) {
 		printk ("radeonfb: cannot reserve FB region\n");
-		kfree (rinfo);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_mem_region_fb;
 	}
 
 	if (!request_mem_region (rinfo->mmio_base_phys,
 				 pci_resource_len(pdev, 2), "radeonfb")) {
 		printk ("radeonfb: cannot reserve MMIO region\n");
-		release_mem_region (rinfo->fb_base_phys,
-				    pci_resource_len(pdev, 0));
-		kfree (rinfo);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_mem_region_mmio;
 	}
 
 	/* map the regions */
 	rinfo->mmio_base = (unsigned long) ioremap (rinfo->mmio_base_phys,
RADEON_REGSIZE);
 	if (!rinfo->mmio_base) {
 		printk ("radeonfb: cannot map MMIO\n");
-		release_mem_region (rinfo->mmio_base_phys,
-				    pci_resource_len(pdev, 2));
-		release_mem_region (rinfo->fb_base_phys,
-				    pci_resource_len(pdev, 0));
-		kfree (rinfo);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_ioremap_mmio;
 	}
 
 	rinfo->chipset = pdev->device;
@@ -2977,26 +2976,16 @@
 	if ((rinfo->dviDisp_type = MT_DFP) || (rinfo->dviDisp_type = MT_LCD)
||
 	    (rinfo->crtDisp_type = MT_DFP)) {
 		if (!radeon_get_dfpinfo(rinfo)) {
-			iounmap ((void*)rinfo->mmio_base);
-			release_mem_region (rinfo->mmio_base_phys,
-					    pci_resource_len(pdev, 2));
-			release_mem_region (rinfo->fb_base_phys,
-					    pci_resource_len(pdev, 0));
-			kfree (rinfo);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto err_ioremap_fb;
 		}
 	}
 
 	rinfo->fb_base = (unsigned long) ioremap (rinfo->fb_base_phys,
rinfo->video_ram);
 	if (!rinfo->fb_base) {
 		printk ("radeonfb: cannot map FB\n");
-		iounmap ((void*)rinfo->mmio_base);
-		release_mem_region (rinfo->mmio_base_phys,
-				    pci_resource_len(pdev, 2));
-		release_mem_region (rinfo->fb_base_phys,
-				    pci_resource_len(pdev, 0));
-		kfree (rinfo);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_ioremap_fb;
 	}
 
 	/* I SHOULD FIX THAT CRAP ! I should probably mimmic XFree DRI
@@ -3034,7 +3023,12 @@
 	radeon_save_state (rinfo, &rinfo->init_state);
 
 	/* set all the vital stuff */
-	radeon_set_fbinfo (rinfo);
+	ret = radeon_set_fbinfo (rinfo);
+	if (ret) {
+		printk(KERN_ERR "fadeonfb: unable to set fb info\n");
+		ret = -ENOMEM;
+		goto err_set_fbinfo;
+	}
 
 	pci_set_drvdata(pdev, rinfo);
 	rinfo->next = board_list;
@@ -3042,14 +3036,8 @@
 
 	if (register_framebuffer ((struct fb_info *) rinfo) < 0) {
 		printk ("radeonfb: could not register framebuffer\n");
-		iounmap ((void*)rinfo->fb_base);
-		iounmap ((void*)rinfo->mmio_base);
-		release_mem_region (rinfo->mmio_base_phys,
-				    pci_resource_len(pdev, 2));
-		release_mem_region (rinfo->fb_base_phys,
-				    pci_resource_len(pdev, 0));
-		kfree (rinfo);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_reg_fb;
 	}
 
 #ifdef CONFIG_MTRR
@@ -3087,14 +3075,29 @@
 	RTRACE("radeonfb_pci_register END\n");
 
 	return 0;
-}
-
 
+ err_reg_fb:
+	fb_dealloc_cmap(&info->cmap);
+ err_set_fbinfo:
+	iounmap ((void*)rinfo->fb_base);
+ err_ioremap_fb:
+	iounmap ((void*)rinfo->mmio_base);
+ err_ioremap_mmio:
+	release_mem_region (rinfo->mmio_base_phys,
+			    pci_resource_len(pdev, 2));
+ err_mem_region_mmio:
+	release_mem_region (rinfo->fb_base_phys,
+			    pci_resource_len(pdev, 0));
+ err_mem_region_fb:
+	kfree (rinfo);
+	return ret;
+}
 
 static void __devexit radeonfb_pci_unregister (struct pci_dev *pdev)
 {
         struct radeonfb_info *rinfo = pci_get_drvdata(pdev);
- 
+        struct fb_info *info = &rinfo->info;
+
         if (!rinfo)
                 return;
  
@@ -3111,7 +3114,7 @@
 #endif
 
         unregister_framebuffer ((struct fb_info *) rinfo);
-                
+	fb_dealloc_cmap(&info->cmap);
         iounmap ((void*)rinfo->mmio_base);
         iounmap ((void*)rinfo->fb_base);
  


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
