From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:11:39 +0000
Subject: [KJ] [PATCH 21/53] fb: Clean up printk()'s in drivers/video/fbmem.c
Message-Id: <20050125231139.10418.10777.48883@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84881350004615341=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84881350004615341==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/fbmem.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/fbmem.c linux-2.6.11-rc2-mm1/drivers/video/fbmem.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/fbmem.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/fbmem.c	2005-01-24 19:07:03.024260642 -0500
@@ -1195,7 +1195,7 @@
 
 	devfs_mk_dir("fb");
 	if (register_chrdev(FB_MAJOR,"fb",&fb_fops))
-		printk("unable to get major %d for fb devs\n", FB_MAJOR);
+		printk(KERN_WARNING "unable to get major %d for fb devs\n", FB_MAJOR);
 
 	fb_class = class_simple_create(THIS_MODULE, "graphics");
 	if (IS_ERR(fb_class)) {

--===============84881350004615341==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84881350004615341==--
