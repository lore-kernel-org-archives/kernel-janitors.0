From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:10:12 +0000
Subject: [KJ] [PATCH 12/53] cg6: Clean up printk()'s in drivers/video/cg6.c
Message-Id: <20050125231007.10418.46382.22138@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75222499851917668=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75222499851917668==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/cg6.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/cg6.c linux-2.6.11-rc2-mm1/drivers/video/cg6.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/cg6.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/cg6.c	2005-01-24 19:07:02.538262219 -0500
@@ -747,7 +747,7 @@
 
 	list_add(&all->list, &cg6_list);
 
-	printk("cg6: CGsix [%s] at %lx:%lx\n",
+	pr_info("cg6: CGsix [%s] at %lx:%lx\n",
 	       all->info.fix.id,
 	       (long) sdev->reg_addrs[0].which_io,
 	       (long) sdev->reg_addrs[0].phys_addr);

--===============75222499851917668==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75222499851917668==--
