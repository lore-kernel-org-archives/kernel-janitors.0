From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:12:16 +0000
Subject: [KJ] [PATCH 24/53] fm2fb: Clean up printk()'s in
Message-Id: <20050125231209.10418.92940.57732@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18599051253472476=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============18599051253472476==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/fm2fb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/fm2fb.c linux-2.6.11-rc2-mm1/drivers/video/fm2fb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/fm2fb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/fm2fb.c	2005-01-24 19:07:03.111260360 -0500
@@ -288,7 +288,7 @@
 		zorro_release_device(z);
 		return -EINVAL;
 	}
-	printk("fb%d: %s frame buffer device\n", info->node, fb_fix.id);
+	pr_info("fb%d: %s frame buffer device\n", info->node, fb_fix.id);
 	return 0;
 }
 

--===============18599051253472476==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18599051253472476==--
