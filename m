From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:15:36 +0000
Subject: [KJ] [PATCH 48/53] sun3fb: Clean up printk()'s in
Message-Id: <20050125231536.10418.59410.17139@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67014007087950567=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67014007087950567==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/sun3fb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/sun3fb.c linux-2.6.11-rc2-mm1/drivers/video/sun3fb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/sun3fb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/sun3fb.c	2005-01-24 19:07:04.234256716 -0500
@@ -645,7 +645,7 @@
 		kfree(fb);
 		return -EINVAL;
 	}
-	printk("fb%d: %s\n", fb->info.node, p);
+	pr_info("fb%d: %s\n", fb->info.node, p);
 
 	return 0;
 }
@@ -667,14 +667,14 @@
 	case FBTYPE_SUN3COLOR:
 	case FBTYPE_SUN4COLOR:
 		if(idprom->id_machtype != (SM_SUN3|SM_3_60)) {
-			printk("sun3fb: cgthree/four only supported on 3/60\n");
+			printk(KERN_ERR "sun3fb: cgthree/four only supported on 3/60\n");
 			return -ENODEV;
 		}
 		
 		addr = CGFOUR_OBMEM_ADDR;
 		return sun3fb_init_fb(*(romvec->pv_fbtype), addr);
 	default:
-		printk("sun3fb: unsupported framebuffer\n");
+		printk(KERN_ERR "sun3fb: unsupported framebuffer\n");
 		return -ENODEV;
 	}
 #else

--===============67014007087950567==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67014007087950567==--
