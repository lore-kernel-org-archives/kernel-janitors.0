From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:10:39 +0000
Subject: [KJ] [PATCH 15/53] fbcon: Clean up printk()'s in
Message-Id: <20050125231038.10418.12751.25516@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============059710618091921575=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============059710618091921575==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/console/fbcon.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/console/fbcon.c linux-2.6.11-rc2-mm1/drivers/video/console/fbcon.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/console/fbcon.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/console/fbcon.c	2005-01-24 19:07:02.770261466 -0500
@@ -842,7 +842,7 @@
 			udelay(20);
 
 		if (ct == 1000)
-			printk
+			pr_info
 			    ("fbcon_startup: No VBL detected, using timer based cursor.\n");
 
 		free_irq(IRQ_MAC_VBL, fb_vbl_detect);

--===============059710618091921575==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============059710618091921575==--
