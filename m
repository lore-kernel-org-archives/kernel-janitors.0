From: Leann Ogasawara <ogasawara@osdl.org>
Date: Tue, 27 Jan 2004 21:44:53 +0000
Subject: [Kernel-janitors] [PATCH] drivers/video/vga16fb.c ioremap() and
Message-Id: <1075239893.3744.27.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

This is an updated patch of the previous ioremap/iounmap patch I
submitted for vga16fb.c  This not only includes the ioremap audit and
error handling but also include fb_alloc_cmap() audit and error
handling.  Thanks,

Leann

diffed against 2.6.2-rc2

note:  there are more cases of fb_alloc_cmap() needing to be audited
that I'll get around to later.  

=== drivers/video/vga16fb.c 1.33 vs edited ==--- 1.33/drivers/video/vga16fb.c	Thu Apr 24 03:30:41 2003
+++ edited/drivers/video/vga16fb.c	Mon Jan 26 17:33:26 2004
@@ -1341,6 +1341,7 @@
 int __init vga16fb_init(void)
 {
 	int i;
+	int ret;
 
 	printk(KERN_DEBUG "vga16fb: initializing\n");
 
@@ -1349,7 +1350,8 @@
         vga16fb.screen_base = ioremap(VGA_FB_PHYS, VGA_FB_PHYS_LEN);
 	if (!vga16fb.screen_base) {
 		printk(KERN_ERR "vga16fb: unable to map device\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_ioremap;
 	}
 	printk(KERN_INFO "vga16fb: mapped to 0x%p\n", vga16fb.screen_base);
 
@@ -1371,28 +1373,44 @@
 	vga16fb.flags = FBINFO_FLAG_DEFAULT;
 
 	i = (vga16fb_defined.bits_per_pixel = 8) ? 256 : 16;
-	fb_alloc_cmap(&vga16fb.cmap, i, 0);
-
-	if (vga16fb_check_var(&vga16fb.var, &vga16fb))
-		return -EINVAL;
+	ret = fb_alloc_cmap(&vga16fb.cmap, i, 0);
+	if (ret) {
+		printk(KERN_ERR "vga16fb: unable to allocate colormap\n");
+		ret = -ENOMEM;
+		goto err_alloc_cmap;
+	}
+	if (vga16fb_check_var(&vga16fb.var, &vga16fb)) {
+		printk(KERN_ERR "vga16fb: unable to validate variable\n");
+		ret = -EINVAL;
+		goto err_check_var;
+	}
 
 	vga16fb_update_fix(&vga16fb);
 
 	if (register_framebuffer(&vga16fb) < 0) {
-		iounmap(vga16fb.screen_base);
-		return -EINVAL;
+		printk(KERN_ERR "vga16fb: unable to register framebuffer\n");
+		ret = -EINVAL;
+		goto err_check_var;
 	}
 
 	printk(KERN_INFO "fb%d: %s frame buffer device\n",
 	       vga16fb.node, vga16fb.fix.id);
 
 	return 0;
+
+ err_check_var:
+	fb_dealloc_cmap(&vga16fb.cmap);
+ err_alloc_cmap:
+	iounmap(vga16fb.screen_base);
+ err_ioremap:
+	return ret;
 }
 
 static void __exit vga16fb_exit(void)
 {
     unregister_framebuffer(&vga16fb);
     iounmap(vga16fb.screen_base);
+    fb_dealloc_cmap(&vga16fb.cmap);
     /* XXX unshare VGA regions */
 }
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
