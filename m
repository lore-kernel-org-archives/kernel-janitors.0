From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:13:57 +0000
Subject: [KJ] [PATCH 33/53] matroxfb: Clean up printk()'s in
Message-Id: <20050125231356.10418.40764.12045@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20637454229951757=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20637454229951757==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/matrox/matroxfb_base.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/matrox/matroxfb_base.c linux-2.6.11-rc2-mm1/drivers/video/matrox/matroxfb_base.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/matrox/matroxfb_base.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/matrox/matroxfb_base.c	2005-01-24 19:07:03.464259214 -0500
@@ -1880,7 +1880,7 @@
 	if (register_framebuffer(&ACCESS_FBINFO(fbcon)) < 0) {
 		goto failVideoIO;
 	}
-	printk("fb%d: %s frame buffer device\n",
+	pr_info("fb%d: %s frame buffer device\n",
 	       ACCESS_FBINFO(fbcon.node), ACCESS_FBINFO(fbcon.fix.id));
 
 	/* there is no console on this fb... but we have to initialize hardware

--===============20637454229951757==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20637454229951757==--
