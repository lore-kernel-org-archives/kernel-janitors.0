From: James Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 21:57:56 +0000
Subject: [KJ] [PATCH 45/53][RESEND] triofb: Clean up printk()'s in
Message-Id: <20050126215753.14141.25702.62565@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============01228697064346651=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============01228697064346651==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/S3triofb.c - resent after putting the *proper* KERN_ constant in place.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/S3triofb.c linux-2.6.11-rc2-mm1/drivers/video/S3triofb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/S3triofb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/S3triofb.c	2005-01-26 16:54:59.170573546 -0500
@@ -353,19 +353,19 @@
 
     if((pp = (int *)get_property(dp, "vendor-id", &len)) != NULL
 	&& *pp!=PCI_VENDOR_ID_S3) {
-	printk("%s: can't find S3 Trio board\n", dp->full_name);
+	printk(KERN_ERR "%s: can't find S3 Trio board\n", dp->full_name);
 	return;
     }
 
     if((pp = (int *)get_property(dp, "device-id", &len)) != NULL
 	&& *pp!=PCI_DEVICE_ID_S3_TRIO) {
-	printk("%s: can't find S3 Trio board\n", dp->full_name);
+	printk(KERN_ERR "%s: can't find S3 Trio board\n", dp->full_name);
 	return;
     }
 
     if ((pp = (int *)get_property(dp, "depth", &len)) != NULL
 	&& len == sizeof(int) && *pp != 8) {
-	printk("%s: can't use depth = %d\n", dp->full_name, *pp);
+	printk(KERN_ERR "%s: can't use depth = %d\n", dp->full_name, *pp);
 	return;
     }
     if ((pp = (int *)get_property(dp, "width", &len)) != NULL
@@ -540,7 +540,7 @@
     if (register_framebuffer(&fb_info) < 0)
 	return;
 
-    printk("fb%d: S3 Trio frame buffer device on %s\n",
+    pr_info("fb%d: S3 Trio frame buffer device on %s\n",
 	   fb_info.node, dp->full_name);
 }
 

--===============01228697064346651==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============01228697064346651==--
