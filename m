From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:08:28 +0000
Subject: [KJ] [PATCH 2/53] amifb: Clean up printk()'s in
Message-Id: <20050125230817.10418.45825.41897@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56936074256619351=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56936074256619351==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/amifb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/amifb.c linux-2.6.11-rc2-mm1/drivers/video/amifb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/amifb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/amifb.c	2005-01-24 19:07:02.109263611 -0500
@@ -2333,7 +2333,7 @@
 
 		default:
 #ifdef CONFIG_FB_AMIGA_OCS
-			printk("Unknown graphics chipset, defaulting to OCS\n");
+			pr_info("Unknown graphics chipset, defaulting to OCS\n");
 			strcat(fb_info.fix.id, "Unknown");
 			goto default_chipset;
 #else /* CONFIG_FB_AMIGA_OCS */
@@ -2410,7 +2410,7 @@
 	videomemory = (u_long)ioremap_writethrough(fb_info.fix.smem_start,
 						   fb_info.fix.smem_len);
 	if (!videomemory) {
-		printk("amifb: WARNING! unable to map videomem cached writethrough\n");
+		printk(KERN_WARNING "amifb: WARNING! unable to map videomem cached writethrough\n");
 		videomemory = ZTWO_VADDR(fb_info.fix.smem_start);
 	}
 
@@ -2443,7 +2443,7 @@
 		goto amifb_error;
 	}
 
-	printk("fb%d: %s frame buffer device, using %dK of video memory\n",
+	pr_info("fb%d: %s frame buffer device, using %dK of video memory\n",
 	       fb_info.node, fb_info.fix.id, fb_info.fix.smem_len>>10);
 
 	return 0;

--===============56936074256619351==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56936074256619351==--
