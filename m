From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:12:54 +0000
Subject: [KJ] [PATCH 26/53] i810fb: Clean up printk()'s in
Message-Id: <20050125231237.10418.29636.65629@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55531132340940936=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============55531132340940936==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/i810/i810_main.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/i810/i810_main.c linux-2.6.11-rc2-mm1/drivers/video/i810/i810_main.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/i810/i810_main.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/i810/i810_main.c	2005-01-24 19:07:03.200260071 -0500
@@ -972,7 +972,8 @@
 						      var->bits_per_pixel);
 			vidmem = line_length * yres;
 			if (vxres < xres) {
-				printk("i810fb: required video memory, "
+				printk(KERN_ERR
+				       "i810fb: required video memory, "
 				       "%d bytes, for %dx%d-%d (virtual) "
 				       "is out of range\n", 
 				       vidmem, vxres, vyres, 
@@ -1597,19 +1598,19 @@
 	size = par->fb.size + par->iring.size;
 
 	if (!(bridge = agp_backend_acquire(par->dev))) {
-		printk("i810fb_alloc_fbmem: cannot acquire agpgart\n");
+		printk(KERN_ERR "i810fb_alloc_fbmem: cannot acquire agpgart\n");
 		return -ENODEV;
 	}
 	if (!(par->i810_gtt.i810_fb_memory = 
 	      agp_allocate_memory(bridge, size >> 12, AGP_NORMAL_MEMORY))) {
-		printk("i810fb_alloc_fbmem: can't allocate framebuffer "
+		printk(KERN_ERR "i810fb_alloc_fbmem: can't allocate framebuffer "
 		       "memory\n");
 		agp_backend_release(bridge);
 		return -ENOMEM;
 	}
 	if (agp_bind_memory(par->i810_gtt.i810_fb_memory,
 			    par->fb.offset)) {
-		printk("i810fb_alloc_fbmem: can't bind framebuffer memory\n");
+		printk(KERN_ERR "i810fb_alloc_fbmem: can't bind framebuffer memory\n");
 		agp_backend_release(bridge);
 		return -EBUSY;
 	}	
@@ -1617,14 +1618,14 @@
 	if (!(par->i810_gtt.i810_cursor_memory = 
 	      agp_allocate_memory(bridge, par->cursor_heap.size >> 12,
 				  AGP_PHYSICAL_MEMORY))) {
-		printk("i810fb_alloc_cursormem:  can't allocate" 
+		printk(KERN_ERR "i810fb_alloc_cursormem: can't allocate" 
 		       "cursor memory\n");
 		agp_backend_release(bridge);
 		return -ENOMEM;
 	}
 	if (agp_bind_memory(par->i810_gtt.i810_cursor_memory,
 			    par->cursor_heap.offset)) {
-		printk("i810fb_alloc_cursormem: cannot bind cursor memory\n");
+		printk(KERN_ERR "i810fb_alloc_cursormem: cannot bind cursor memory\n");
 		agp_backend_release(bridge);
 		return -EBUSY;
 	}	
@@ -1754,7 +1755,7 @@
 	int err;
 
 	if ((err = pci_enable_device(par->dev))) { 
-		printk("i810fb_init: cannot enable device\n");
+		printk(KERN_ERR "i810fb_init: cannot enable device\n");
 		return err;		
 	}
 	par->res_flags |= PCI_DEVICE_ENABLED;
@@ -1769,14 +1770,14 @@
 		par->mmio_start_phys = pci_resource_start(par->dev, 0);
 	}
 	if (!par->aperture.size) {
-		printk("i810fb_init: device is disabled\n");
+		printk(KERN_ERR "i810fb_init: device is disabled\n");
 		return -ENOMEM;
 	}
 
 	if (!request_mem_region(par->aperture.physical, 
 				par->aperture.size, 
 				i810_pci_list[entry->driver_data])) {
-		printk("i810fb_init: cannot request framebuffer region\n");
+		printk(KERN_ERR "i810fb_init: cannot request framebuffer region\n");
 		return -ENODEV;
 	}
 	par->res_flags |= FRAMEBUFFER_REQ;
@@ -1784,14 +1785,14 @@
 	par->aperture.virtual = ioremap_nocache(par->aperture.physical, 
 					par->aperture.size);
 	if (!par->aperture.virtual) {
-		printk("i810fb_init: cannot remap framebuffer region\n");
+		printk(KERN_ERR "i810fb_init: cannot remap framebuffer region\n");
 		return -ENODEV;
 	}
   
 	if (!request_mem_region(par->mmio_start_phys, 
 				MMIO_SIZE, 
 				i810_pci_list[entry->driver_data])) {
-		printk("i810fb_init: cannot request mmio region\n");
+		printk(KERN_ERR "i810fb_init: cannot request mmio region\n");
 		return -ENODEV;
 	}
 	par->res_flags |= MMIO_REQ;
@@ -1799,7 +1800,7 @@
 	par->mmio_start_virtual = ioremap_nocache(par->mmio_start_phys, 
 						  MMIO_SIZE);
 	if (!par->mmio_start_virtual) {
-		printk("i810fb_init: cannot remap mmio region\n");
+		printk(KERN_ERR "i810fb_init: cannot remap mmio region\n");
 		return -ENODEV;
 	}
 
@@ -1906,7 +1907,7 @@
 	err = register_framebuffer(info);
 	if (err < 0) {
     		i810fb_release_resource(info, par); 
-		printk("i810fb_init: cannot register framebuffer device\n");
+		printk(KERN_ERR "i810fb_init: cannot register framebuffer device\n");
     		return err;  
     	}   
 
@@ -1918,16 +1919,14 @@
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
+	pr_info("I810FB: fb%d         : %s v%d.%d.%d%s\n",
+		info->node, i810_pci_list[entry->driver_data],
+		VERSION_MAJOR, VERSION_MINOR, VERSION_TEENIE, BRANCH_VERSION );
+	pr_info("I810FB: Video RAM   : %dK\n",(int) par->fb.size>>10);
+	pr_info("I810FB: Monitor     : H: %d-%d KHz V: %d-%d Hz\n",
+		info->monspecs.hfmin/1000, info->monspecs.hfmax/1000,
+		info->monspecs.vfmin, info->monspecs.vfmax);
+	pr_info("I810FB: Mode        : %dx%d-%dbpp@%dHz\n", info->var.xres, 
 	       info->var.yres, info->var.bits_per_pixel, vfreq);
 	return 0;
 }
@@ -1973,7 +1972,7 @@
 	unregister_framebuffer(info);  
 	i810fb_release_resource(info, par);
 	pci_set_drvdata(dev, NULL);
-	printk("cleanup_module:  unloaded i810 framebuffer device\n");
+	printk(KERN_DEBUG "cleanup_module:  unloaded i810 framebuffer device\n");
 }                                                	
 
 #ifndef MODULE

--===============55531132340940936==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55531132340940936==--
