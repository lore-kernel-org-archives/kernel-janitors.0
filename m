From: James Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 01:59:20 +0000
Subject: [KJ] [PATCH 50/53][RESEND] tdfxfb: Clean up printk()'s in
Message-Id: <20050126015919.10793.66268.77527@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============044725034399032637=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============044725034399032637==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/tdfxfb.c - resent since KDevelop munged the source file.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/tdfxfb.c linux-2.6.11-rc2-mm1/drivers/video/tdfxfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/tdfxfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/tdfxfb.c	2005-01-24 19:07:04.236256709 -0500
@@ -1178,7 +1178,7 @@
 	tdfx_fix.mmio_len = pci_resource_len(pdev, 0);
 	default_par->regbase_virt = ioremap_nocache(tdfx_fix.mmio_start, tdfx_fix.mmio_len);
 	if (!default_par->regbase_virt) {
-		printk("fb: Can't remap %s register area.\n", tdfx_fix.id);
+		printk(KERN_WARNING "fb: Can't remap %s register area.\n", tdfx_fix.id);
 		goto out_err;
 	}
     
@@ -1190,7 +1190,7 @@
 
 	tdfx_fix.smem_start = pci_resource_start(pdev, 1);
 	if (!(tdfx_fix.smem_len = do_lfb_size(default_par, pdev->device))) {
-		printk("fb: Can't count %s memory.\n", tdfx_fix.id);
+		printk(KERN_WARNING "fb: Can't count %s memory.\n", tdfx_fix.id);
 		release_mem_region(pci_resource_start(pdev, 0),
 				   pci_resource_len(pdev, 0));
 		goto out_err;	
@@ -1207,7 +1207,7 @@
 	info->screen_base = ioremap_nocache(tdfx_fix.smem_start, 
 					    tdfx_fix.smem_len);
 	if (!info->screen_base) {
-		printk("fb: Can't remap %s framebuffer.\n", tdfx_fix.id);
+		printk(KERN_WARNING "fb: Can't remap %s framebuffer.\n", tdfx_fix.id);
 		release_mem_region(pci_resource_start(pdev, 1),
 				   pci_resource_len(pdev, 1));
 		release_mem_region(pci_resource_start(pdev, 0),
@@ -1227,7 +1227,7 @@
 		goto out_err;
 	}
 
-	printk("fb: %s memory = %dK\n", tdfx_fix.id, tdfx_fix.smem_len >> 10);
+	pr_info("fb: %s memory = %dK\n", tdfx_fix.id, tdfx_fix.smem_len >> 10);
 
 	tdfx_fix.ypanstep	= nopan ? 0 : 1;
 	tdfx_fix.ywrapstep	= nowrap ? 0 : 1;
@@ -1270,7 +1270,7 @@
 	}
 
 	if (register_framebuffer(info) < 0) {
-		printk("tdfxfb: can't register framebuffer\n");
+		printk(KERN_WARNING "tdfxfb: can't register framebuffer\n");
 		fb_dealloc_cmap(&info->cmap);
 		goto out_err;
 	}

--===============044725034399032637==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============044725034399032637==--
