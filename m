From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:13:43 +0000
Subject: [KJ] [PATCH 31/53] leo: Clean up printk()'s in drivers/video/leo.c
Message-Id: <20050125231343.10418.71005.99060@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62288819221905678=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62288819221905678==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/leo.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/leo.c linux-2.6.11-rc2-mm1/drivers/video/leo.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/leo.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/leo.c	2005-01-24 19:07:03.376259500 -0500
@@ -614,7 +614,7 @@
 
 	list_add(&all->list, &leo_list);
 
-	printk("leo: %s at %lx:%lx\n",
+	pr_info("leo: %s at %lx:%lx\n",
 	       sdev->prom_name,
 	       (long) sdev->reg_addrs[0].which_io,
 	       (long) sdev->reg_addrs[0].phys_addr);

--===============62288819221905678==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62288819221905678==--
