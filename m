From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:10:58 +0000
Subject: [KJ] [PATCH 17/53] ng1: Clean up printk()'s in
Message-Id: <20050125231053.10418.55042.67333@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26209872768363773=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26209872768363773==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/console/newport_con.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/console/newport_con.c linux-2.6.11-rc2-mm1/drivers/video/console/newport_con.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/console/newport_con.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/console/newport_con.c	2005-01-24 19:07:02.854261194 -0500
@@ -230,7 +230,7 @@
 			newport_ysize += linetable[i + 1];
 		}
 	}
-	printk("NG1: Screensize %dx%d\n", newport_xsize, newport_ysize);
+	pr_info("NG1: Screensize %dx%d\n", newport_xsize, newport_ysize);
 }
 
 static void newport_get_revisions(void)
@@ -273,7 +273,7 @@
 	bt445_rev = (npregs->set.dcbdata0.bybytes.b3 >> 4) - 0x0a;
 
 #define L(a)     (char)('A'+(a))
-	printk
+	pr_info
 	    ("NG1: Revision %d, %d bitplanes, REX3 revision %c, VC2 revision %c, xmap9 revision %c, cmap revision %c, bt445 revision %c\n",
 	     board_rev, bitplanes, L(rex3_rev), L(vc2_rev), L(xmap9_rev),
 	     L(cmap_rev ? (cmap_rev + 1) : 0), L(bt445_rev));

--===============26209872768363773==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26209872768363773==--
