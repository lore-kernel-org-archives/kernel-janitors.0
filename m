From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:10:46 +0000
Subject: [KJ] [PATCH 16/53] mdacon: Clean up printk()'s in
Message-Id: <20050125231045.10418.34071.68616@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51269119667033514=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51269119667033514==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/console/mdacon.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/console/mdacon.c linux-2.6.11-rc2-mm1/drivers/video/console/mdacon.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/console/mdacon.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/console/mdacon.c	2005-01-24 19:07:02.854261194 -0500
@@ -326,7 +326,7 @@
 	mda_type_name = "MDA";
 
 	if (! mda_detect()) {
-		printk("mdacon: MDA card not detected.\n");
+		pr_info("mdacon: MDA card not detected.\n");
 		return NULL;
 	}
 
@@ -337,7 +337,7 @@
 	/* cursor looks ugly during boot-up, so turn it off */
 	mda_set_cursor(mda_vram_len - 1);
 
-	printk("mdacon: %s with %ldK of memory detected.\n",
+	pr_info("mdacon: %s with %ldK of memory detected.\n",
 		mda_type_name, mda_vram_len/1024);
 
 	return "MDA-2";

--===============51269119667033514==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51269119667033514==--
