From: Leann Ogasawara <ogasawara@osdl.org>
Date: Fri, 16 Jan 2004 22:53:09 +0000
Subject: [Kernel-janitors] [PATCH] vga16fb.c ioremap/iounmap audit
Message-Id: <1074293588.12959.68.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

Patch inserts missing iounmap() on error.  Feedback appreciated. 
Thanks,

Leann

diffed against 2.6.1

=== drivers/video/vga16fb.c 1.33 vs edited ==--- 1.33/drivers/video/vga16fb.c	Thu Apr 24 03:30:41 2003
+++ edited/drivers/video/vga16fb.c	Fri Jan 16 08:31:40 2004
@@ -1373,8 +1373,10 @@
 	i = (vga16fb_defined.bits_per_pixel = 8) ? 256 : 16;
 	fb_alloc_cmap(&vga16fb.cmap, i, 0);
 
-	if (vga16fb_check_var(&vga16fb.var, &vga16fb))
+	if (vga16fb_check_var(&vga16fb.var, &vga16fb)) {
+		iounmap(vga16fb.screen_base);
 		return -EINVAL;
+	}
 
 	vga16fb_update_fix(&vga16fb);
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
