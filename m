From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:11:12 +0000
Subject: [KJ] [PATCH 18/53] cyber2000fb: Clean up printk()'s in
Message-Id: <20050125231104.10418.4280.90309@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============050828466796546845=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============050828466796546845==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/cyber2000fb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/cyber2000fb.c linux-2.6.11-rc2-mm1/drivers/video/cyber2000fb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/cyber2000fb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/cyber2000fb.c	2005-01-24 19:07:02.938260921 -0500
@@ -1370,7 +1370,7 @@
 	err = -EINVAL;
 	if (!fb_find_mode(&cfb->fb.var, &cfb->fb, NULL, NULL, 0,
 	    		  &cyber2000fb_default_mode, 8)) {
-		printk("%s: no valid mode found\n", cfb->fb.fix.id);
+		printk(KERN_ERR "%s: no valid mode found\n", cfb->fb.fix.id);
 		goto failed;
 	}
 

--===============050828466796546845==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============050828466796546845==--
