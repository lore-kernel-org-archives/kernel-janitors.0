From: Leann Ogasawara <ogasawara@osdl.org>
Date: Fri, 06 Feb 2004 22:39:33 +0000
Subject: [Kernel-janitors] [PATCH] drivers/video/vesafb.c fb_alloc_cmap()
Message-Id: <1076107173.11884.1111.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

Patch audits fb_aloc_cmap() and incorporates an error path.  Feedback
appreciated.  Thanks,

Leann

diffed against 2.6.2


=== drivers/video/vesafb.c 1.33 vs edited ==--- 1.33/drivers/video/vesafb.c	Thu Jul 17 22:30:53 2003
+++ edited/drivers/video/vesafb.c	Thu Feb  5 08:20:05 2004
@@ -218,6 +218,8 @@
 {
 	int video_cmap_len;
 	int i;
+	int ret;
+	int failed = 0;
 
 	if (screen_info.orig_video_isVGA != VIDEO_TYPE_VLFB)
 		return -ENXIO;
@@ -249,15 +251,16 @@
 			vesafb_fix.smem_start);
 		/* We cannot make this fatal. Sometimes this comes from magic
 		   spaces our resource handlers simply don't know about */
+		failed = 1;
 	}
 
         fb_info.screen_base = ioremap(vesafb_fix.smem_start,
vesafb_fix.smem_len);
 	if (!fb_info.screen_base) {
-		release_mem_region(vesafb_fix.smem_start, vesafb_fix.smem_len);
 		printk(KERN_ERR
 		       "vesafb: abort, cannot ioremap video memory 0x%x @ 0x%lx\n",
 			vesafb_fix.smem_len, vesafb_fix.smem_start);
-		return -EIO;
+		ret = -EIO;
+		goto err_ioremap;
 	}
 
 	printk(KERN_INFO "vesafb: framebuffer at 0x%lx, mapped to 0x%p, size
%dk\n",
@@ -364,14 +367,33 @@
 	fb_info.pseudo_palette = pseudo_palette;
 	fb_info.flags = FBINFO_FLAG_DEFAULT;
 
-	fb_alloc_cmap(&fb_info.cmap, video_cmap_len, 0);
-
-	if (register_framebuffer(&fb_info)<0)
-		return -EINVAL;
-
+	ret = fb_alloc_cmap(&fb_info.cmap, video_cmap_len, 0);
+	if (ret) {
+		printk(KERN_ERR "vesafb: unable to allocate colormap\n");
+		ret = -ENOMEM;
+		goto err_alloc_cmap;
+	}
+	if (register_framebuffer(&fb_info)<0) {
+		printk (KERN_ERR "vesafb: unable to register framebuffer\n");
+		ret = -EINVAL;
+		goto err_reg_fb;
+	}
 	printk(KERN_INFO "fb%d: %s frame buffer device\n",
 	       fb_info.node, fb_info.fix.id);
 	return 0;
+
+
+ err_reg_fb:
+	fb_dealloc_cmap(&fb_info.cmap);
+
+ err_alloc_cmap:
+	iounmap(fb_info.screen_base);
+
+ err_ioremap:
+	if (!failed)
+		release_mem_region(vesafb_fix.smem_start, vesafb_fix.smem_len);
+
+ 	return ret;
 }
 
 /*


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
