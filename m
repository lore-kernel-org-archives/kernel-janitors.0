From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:09:51 +0000
Subject: [KJ] [PATCH 10/53] cg14: Clean up printk()'s in drivers/video/cg14.c
Message-Id: <20050125230950.10418.50985.80845@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82074616794663813=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82074616794663813==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/cg14.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/cg14.c linux-2.6.11-rc2-mm1/drivers/video/cg14.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/cg14.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/cg14.c	2005-01-24 19:07:02.454262492 -0500
@@ -582,7 +582,7 @@
 
 	list_add(&all->list, &cg14_list);
 
-	printk("cg14: cgfourteen at %lx:%lx, %dMB\n",
+	pr_info("cg14: cgfourteen at %lx:%lx, %dMB\n",
 	       all->par.iospace, all->par.physbase, all->par.ramsize >> 20);
 
 }

--===============82074616794663813==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82074616794663813==--
