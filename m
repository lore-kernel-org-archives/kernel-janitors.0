From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:10:32 +0000
Subject: [KJ] [PATCH 14/53] clps711xfb: Clean up printk()'s in
Message-Id: <20050125231029.10418.59752.49511@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94059656304626205=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94059656304626205==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/clps711xfb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/clps711xfb.c linux-2.6.11-rc2-mm1/drivers/video/clps711xfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/clps711xfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/clps711xfb.c	2005-01-24 19:07:02.768261473 -0500
@@ -385,7 +385,7 @@
 	clps7111fb_backlight_proc_entry = create_proc_entry("backlight", 0444,
 		&proc_root);
 	if (clps7111fb_backlight_proc_entry == NULL) {
-		printk("Couldn't create the /proc entry for the backlight.\n");
+		printk(KERN_ERR "Couldn't create the /proc entry for the backlight.\n");
 		return -EINVAL;
 	}
 

--===============94059656304626205==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94059656304626205==--
