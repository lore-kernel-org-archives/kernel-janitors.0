From: James Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 21:52:41 +0000
Subject: [KJ] [PATCH 26/53][RESEND] i810fb: Clean up printk()'s in
Message-Id: <20050126215241.14111.27135.97949@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============023204376798996229=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============023204376798996229==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/i810/i810_main.c - resent after removing unneeded references to
functions in non-debugging statements.

Diffstat:
 i810_main.c |   54 +++++++++++++++++++++++++-----------------------------
 i810_main.h |    2 ++
 2 files changed, 27 insertions(+), 29 deletions(-)

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/i810/i810_main.c linux-2.6.11-rc2-mm1/drivers/video/i810/i810_main.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/i810/i810_main.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/i810/i810_main.c	2005-01-26 16:47:07.416948084 -0500
@@ -972,10 +972,10 @@
 						      var->bits_per_pixel);
 			vidmem = line_length * yres;
 			if (vxres < xres) {
-				printk("i810fb: required video memory, "
-				       "%d bytes, for %dx%d-%d (virtual) "
-				       "is out of range\n", 
-				       vidmem, vxres, vyres, 
+				printk(KERN_ERR PFX
+				       "required video memory, %d bytes, for "
+				       "%dx%d-%d (virtual) is out of range\n", 
+				       vidmem, vxres, vyres,
 				       var->bits_per_pixel);
 				return -ENOMEM;
 			}
@@ -1597,19 +1597,18 @@
 	size = par->fb.size + par->iring.size;
 
 	if (!(bridge = agp_backend_acquire(par->dev))) {
-		printk("i810fb_alloc_fbmem: cannot acquire agpgart\n");
+		printk(KERN_ERR PFX "can't acquire agpgart\n");
 		return -ENODEV;
 	}
 	if (!(par->i810_gtt.i810_fb_memory = 
 	      agp_allocate_memory(bridge, size >> 12, AGP_NORMAL_MEMORY))) {
-		printk("i810fb_alloc_fbmem: can't allocate framebuffer "
-		       "memory\n");
+		printk(KERN_ERR PFX "can't allocate framebuffer memory\n");
 		agp_backend_release(bridge);
 		return -ENOMEM;
 	}
 	if (agp_bind_memory(par->i810_gtt.i810_fb_memory,
 			    par->fb.offset)) {
-		printk("i810fb_alloc_fbmem: can't bind framebuffer memory\n");
+		printk(KERN_ERR PFX "can't bind framebuffer memory\n");
 		agp_backend_release(bridge);
 		return -EBUSY;
 	}	
@@ -1617,14 +1616,13 @@
 	if (!(par->i810_gtt.i810_cursor_memory = 
 	      agp_allocate_memory(bridge, par->cursor_heap.size >> 12,
 				  AGP_PHYSICAL_MEMORY))) {
-		printk("i810fb_alloc_cursormem:  can't allocate" 
-		       "cursor memory\n");
+		printk(KERN_ERR PFX "can't allocate cursor memory\n");
 		agp_backend_release(bridge);
 		return -ENOMEM;
 	}
 	if (agp_bind_memory(par->i810_gtt.i810_cursor_memory,
 			    par->cursor_heap.offset)) {
-		printk("i810fb_alloc_cursormem: cannot bind cursor memory\n");
+		printk(KERN_ERR PFX "can't bind cursor memory\n");
 		agp_backend_release(bridge);
 		return -EBUSY;
 	}	
@@ -1754,7 +1752,7 @@
 	int err;
 
 	if ((err = pci_enable_device(par->dev))) { 
-		printk("i810fb_init: cannot enable device\n");
+		printk(KERN_ERR PFX "cannot enable device\n");
 		return err;		
 	}
 	par->res_flags |= PCI_DEVICE_ENABLED;
@@ -1769,14 +1767,14 @@
 		par->mmio_start_phys = pci_resource_start(par->dev, 0);
 	}
 	if (!par->aperture.size) {
-		printk("i810fb_init: device is disabled\n");
+		printk(KERN_ERR PFX "device is disabled\n");
 		return -ENOMEM;
 	}
 
 	if (!request_mem_region(par->aperture.physical, 
 				par->aperture.size, 
 				i810_pci_list[entry->driver_data])) {
-		printk("i810fb_init: cannot request framebuffer region\n");
+		printk(KERN_ERR PFX "cannot request framebuffer region\n");
 		return -ENODEV;
 	}
 	par->res_flags |= FRAMEBUFFER_REQ;
@@ -1784,14 +1782,14 @@
 	par->aperture.virtual = ioremap_nocache(par->aperture.physical, 
 					par->aperture.size);
 	if (!par->aperture.virtual) {
-		printk("i810fb_init: cannot remap framebuffer region\n");
+		printk(KERN_ERR PFX "cannot remap framebuffer region\n");
 		return -ENODEV;
 	}
   
 	if (!request_mem_region(par->mmio_start_phys, 
 				MMIO_SIZE, 
 				i810_pci_list[entry->driver_data])) {
-		printk("i810fb_init: cannot request mmio region\n");
+		printk(KERN_ERR PFX "cannot request mmio region\n");
 		return -ENODEV;
 	}
 	par->res_flags |= MMIO_REQ;
@@ -1799,7 +1797,7 @@
 	par->mmio_start_virtual = ioremap_nocache(par->mmio_start_phys, 
 						  MMIO_SIZE);
 	if (!par->mmio_start_virtual) {
-		printk("i810fb_init: cannot remap mmio region\n");
+		printk(KERN_ERR PFX "cannot remap mmio region\n");
 		return -ENODEV;
 	}
 
@@ -1906,7 +1904,7 @@
 	err = register_framebuffer(info);
 	if (err < 0) {
     		i810fb_release_resource(info, par); 
-		printk("i810fb_init: cannot register framebuffer device\n");
+		printk(KERN_ERR PFX "cannot register framebuffer device\n");
     		return err;  
     	}   
 
@@ -1918,16 +1916,14 @@
 	vfreq = hfreq/(info->var.yres + info->var.upper_margin +
 		       info->var.vsync_len + info->var.lower_margin);
 
-      	printk("I810FB: fb%d         : %s v%d.%d.%d%s\n"
-      	       "I810FB: Video RAM   : %dK\n" 
-	       "I810FB: Monitor     : H: %d-%d KHz V: %d-%d Hz\n"
-	       "I810FB: Mode        : %dx%d-%dbpp@%dHz\n",
-	       info->node,
-	       i810_pci_list[entry->driver_data],
-	       VERSION_MAJOR, VERSION_MINOR, VERSION_TEENIE, BRANCH_VERSION,
-	       (int) par->fb.size>>10, info->monspecs.hfmin/1000,
-	       info->monspecs.hfmax/1000, info->monspecs.vfmin,
-	       info->monspecs.vfmax, info->var.xres, 
+	pr_info(PFX "fb%d         : %s v%d.%d.%d%s\n",
+		info->node, i810_pci_list[entry->driver_data],
+		VERSION_MAJOR, VERSION_MINOR, VERSION_TEENIE, BRANCH_VERSION );
+	pr_info(PFX "Video RAM   : %dK\n",(int) par->fb.size>>10);
+	pr_info(PFX "Monitor     : H: %d-%d KHz V: %d-%d Hz\n",
+		info->monspecs.hfmin/1000, info->monspecs.hfmax/1000,
+		info->monspecs.vfmin, info->monspecs.vfmax);
+	pr_info(PFX "Mode        : %dx%d-%dbpp@%dHz\n", info->var.xres, 
 	       info->var.yres, info->var.bits_per_pixel, vfreq);
 	return 0;
 }
@@ -1973,7 +1969,7 @@
 	unregister_framebuffer(info);  
 	i810fb_release_resource(info, par);
 	pci_set_drvdata(dev, NULL);
-	printk("cleanup_module:  unloaded i810 framebuffer device\n");
+	printk(KERN_DEBUG PFX "unloaded i810 framebuffer device\n");
 }                                                	
 
 #ifndef MODULE
diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/i810/i810_main.h linux-2.6.11-rc2-mm1/drivers/video/i810/i810_main.h
--- linux-2.6.11-rc2-mm1-original/drivers/video/i810/i810_main.h	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/i810/i810_main.h	2005-01-26 16:44:27.476163623 -0500
@@ -14,6 +14,8 @@
 #ifndef __I810_MAIN_H__
 #define __I810_MAIN_H__
 
+#define PFX "i810fb: "
+
 static int  __devinit i810fb_init_pci (struct pci_dev *dev, 
 				       const struct pci_device_id *entry);
 static void __exit i810fb_remove_pci(struct pci_dev *dev);

--===============023204376798996229==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============023204376798996229==--
