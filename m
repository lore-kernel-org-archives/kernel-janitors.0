From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:14:38 +0000
Subject: [KJ] [PATCH 39/53] pmag-ba: Clean up printk()'s in
Message-Id: <20050125231437.10418.60123.77549@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78896936700995113=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78896936700995113==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/pmag-ba-fb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/pmag-ba-fb.c linux-2.6.11-rc2-mm1/drivers/video/pmag-ba-fb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/pmag-ba-fb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/pmag-ba-fb.c	2005-01-24 19:07:03.729258355 -0500
@@ -123,7 +123,7 @@
 	unsigned long base_addr = get_tc_base_addr(slot);
 	struct fb_info *info = &pmagba_fb_info[slot]; 
 
-	printk("PMAG-BA framebuffer in slot %d\n", slot);
+	pr_info("PMAG-BA framebuffer in slot %d\n", slot);
 	/*
 	 * Framebuffer display memory base address and friends
 	 */

--===============78896936700995113==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78896936700995113==--
