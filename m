From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:14:29 +0000
Subject: [KJ] [PATCH 38/53] pm3fb: Clean up printk()'s in
Message-Id: <20050125231428.10418.81066.20524@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78349512318431369=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78349512318431369==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/pm3fb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/pm3fb.c linux-2.6.11-rc2-mm1/drivers/video/pm3fb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/pm3fb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/pm3fb.c	2005-01-24 19:07:03.728258358 -0500
@@ -1643,7 +1643,7 @@
 	
 	pm3fb_write_mode(l_fb_info);
 	
-	printk("fb%d: %s, using %uK of video memory (%s)\n",
+	pr_info("fb%d: %s, using %uK of video memory (%s)\n",
 	       l_fb_info->gen.info.node,
 	       permedia3_name, (u32) (l_fb_info->fb_size >> 10),
 	       cardbase[l_fb_info->board_type].cardname);

--===============78349512318431369==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78349512318431369==--
