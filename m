From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:14:58 +0000
Subject: [KJ] [PATCH 42/53] bw2: Clean up printk()'s in drivers/video/bw2.c
Message-Id: <20050125231458.10418.88150.38516@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35048255513986182=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35048255513986182==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/bw2.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/bw2.c linux-2.6.11-rc2-mm1/drivers/video/bw2.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/bw2.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/bw2.c	2005-01-24 19:07:02.453262495 -0500
@@ -374,7 +374,7 @@
 
 	list_add(&all->list, &bw2_list);
 
-	printk("bw2: bwtwo at %lx:%lx\n",
+	pr_info("bw2: bwtwo at %lx:%lx\n",
 	       (long) (sdev ? sdev->reg_addrs[0].which_io : 0),
 	       (long) all->par.physbase);
 }

--===============35048255513986182==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35048255513986182==--
