From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:15:43 +0000
Subject: [KJ] [PATCH 49/53] tcx: Clean up printk()'s in drivers/video/tcx.c
Message-Id: <20050125231542.10418.33826.29469@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72464990895159009=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72464990895159009==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/tcx.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/tcx.c linux-2.6.11-rc2-mm1/drivers/video/tcx.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/tcx.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/tcx.c	2005-01-24 19:07:04.235256713 -0500
@@ -450,7 +450,7 @@
 
 	list_add(&all->list, &tcx_list);
 
-	printk("tcx: %s at %lx:%lx, %s\n",
+	pr_info("tcx: %s at %lx:%lx, %s\n",
 	       sdev->prom_name,
 	       (long) sdev->reg_addrs[0].which_io,
 	       (long) sdev->reg_addrs[0].phys_addr,

--===============72464990895159009==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72464990895159009==--
