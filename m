From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:14:22 +0000
Subject: [KJ] [PATCH 37/53] platinumfb: Clean up printk()'s in
Message-Id: <20050125231421.10418.8940.68112@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24851162001144944=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24851162001144944==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/platinumfb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/platinumfb.c linux-2.6.11-rc2-mm1/drivers/video/platinumfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/platinumfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/platinumfb.c	2005-01-24 19:07:03.639258647 -0500
@@ -146,7 +146,7 @@
 	info->fix.visual = (pinfo->cmode == CMODE_8) ?
 		FB_VISUAL_PSEUDOCOLOR : FB_VISUAL_DIRECTCOLOR;
 	info->fix.line_length = vmode_attrs[pinfo->vmode-1].hres * (1<<pinfo->cmode) + offset;
-	printk("line_length: %x\n", info->fix.line_length);
+	printk(KERN_DEBUG "line_length: %x\n", info->fix.line_length);
 	return 0;
 }
 
@@ -362,12 +362,12 @@
 	      platinum_vram_reqd(default_vmode, default_cmode) > pinfo->total_vram)
 		default_cmode--;
 
-	printk("platinumfb:  Using video mode %d and color mode %d.\n", default_vmode, default_cmode);
+	pr_info("platinumfb:  Using video mode %d and color mode %d.\n", default_vmode, default_cmode);
 
 	/* Setup default var */
 	if (mac_vmode_to_var(default_vmode, default_cmode, &var) < 0) {
 		/* This shouldn't happen! */
-		printk("mac_vmode_to_var(%d, %d,) failed\n", default_vmode, default_cmode);
+		printk(KERN_ERR "mac_vmode_to_var(%d, %d,) failed\n", default_vmode, default_cmode);
 try_again:
 		default_vmode = VMODE_640_480_60;
 		default_cmode = CMODE_8;

--===============24851162001144944==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24851162001144944==--
