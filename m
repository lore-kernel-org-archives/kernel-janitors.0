From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:10:00 +0000
Subject: [KJ] [PATCH 11/53] cg3: Clean up printk()'s in drivers/video/cg3.c
Message-Id: <20050125230958.10418.36382.23193@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45663261432541802=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45663261432541802==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/cg3.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/cg3.c linux-2.6.11-rc2-mm1/drivers/video/cg3.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/cg3.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/cg3.c	2005-01-24 19:07:02.538262219 -0500
@@ -431,7 +431,7 @@
 
 	list_add(&all->list, &cg3_list);
 
-	printk("cg3: %s at %lx:%lx\n",
+	pr_info("cg3: %s at %lx:%lx\n",
 	       sdev->prom_name,
 	       (long) sdev->reg_addrs[0].which_io,
 	       (long) sdev->reg_addrs[0].phys_addr);

--===============45663261432541802==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45663261432541802==--
