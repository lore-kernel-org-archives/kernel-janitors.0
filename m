From: James Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 01:06:04 +0000
Subject: [KJ] [PATCH 1/53][RESEND] acornfb: Clean up printk()'s in
Message-Id: <20050126010604.10605.79152.22572@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37125155385217257=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37125155385217257==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/acornfb.c, and fixed a trivial capitalization problem in the driver name.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/acornfb.c linux-2.6.11-rc2-mm1/drivers/video/acornfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/acornfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/acornfb.c	2005-01-25 20:01:47.000000000 -0500
@@ -1121,7 +1121,7 @@
 	return;
 
 bad:
-	printk(KERN_ERR "Acornfb: bad monitor settings: %s\n", opt);
+	printk(KERN_ERR "acornfb: bad monitor settings: %s\n", opt);
 	current_par.montype = -1;
 }
 
@@ -1277,7 +1277,7 @@
 		mb_freed += PAGE_SIZE / 1024;
 	}
 
-	printk("acornfb: freed %dK memory\n", mb_freed);
+	pr_info("acornfb: freed %dK memory\n", mb_freed);
 }
 
 static int __init acornfb_probe(struct device *dev)
@@ -1423,7 +1423,7 @@
 	 * generic database.
 	 */
 	if (rc == 0) {
-		printk("Acornfb: no valid mode found\n");
+		printk(KERN_ERR "acornfb: no valid mode found\n");
 		return -EINVAL;
 	}
 
@@ -1433,21 +1433,21 @@
 	v_sync = h_sync / (fb_info.var.yres + fb_info.var.upper_margin +
 		 fb_info.var.lower_margin + fb_info.var.vsync_len);
 
-	printk(KERN_INFO "Acornfb: %dkB %cRAM, %s, using %dx%d, "
+	printk(KERN_INFO "acornfb: %dkB %cRAM, %s, using %dx%d, "
 		"%d.%03dkHz, %dHz\n",
 		fb_info.fix.smem_len / 1024,
 		current_par.using_vram ? 'V' : 'D',
 		VIDC_NAME, fb_info.var.xres, fb_info.var.yres,
 		h_sync / 1000, h_sync % 1000, v_sync);
 
-	printk(KERN_INFO "Acornfb: Monitor: %d.%03d-%d.%03dkHz, %d-%dHz%s\n",
+	printk(KERN_INFO "acornfb: Monitor: %d.%03d-%d.%03dkHz, %d-%dHz%s\n",
 		fb_info.monspecs.hfmin / 1000, fb_info.monspecs.hfmin % 1000,
 		fb_info.monspecs.hfmax / 1000, fb_info.monspecs.hfmax % 1000,
 		fb_info.monspecs.vfmin, fb_info.monspecs.vfmax,
 		fb_info.monspecs.dpms ? ", DPMS" : "");
 
 	if (fb_set_var(&fb_info, &fb_info.var))
-		printk(KERN_ERR "Acornfb: unable to set display parameters\n");
+		printk(KERN_ERR "acornfb: unable to set display parameters\n");
 
 	if (register_framebuffer(&fb_info) < 0)
 		return -EINVAL;

--===============37125155385217257==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37125155385217257==--
