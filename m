From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:14:15 +0000
Subject: [KJ] [PATCH 36/53] p9100: Clean up printk()'s in
Message-Id: <20050125231415.10418.60437.17523@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41875389430024157=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============41875389430024157==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/p9100.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/p9100.c linux-2.6.11-rc2-mm1/drivers/video/p9100.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/p9100.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/p9100.c	2005-01-24 19:07:03.639258647 -0500
@@ -326,7 +326,7 @@
 
 	list_add(&all->list, &p9100_list);
 
-	printk("p9100: %s at %lx:%lx\n",
+	pr_info("p9100: %s at %lx:%lx\n",
 	       sdev->prom_name,
 	       (long) sdev->reg_addrs[0].which_io,
 	       (long) sdev->reg_addrs[0].phys_addr);

--===============41875389430024157==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41875389430024157==--
