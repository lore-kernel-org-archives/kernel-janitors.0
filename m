From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:11:32 +0000
Subject: [KJ] [PATCH 20/53] dnfb: Clean up printk()'s in drivers/video/dnfb.c
Message-Id: <20050125231129.10418.58461.83451@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99316729278070603=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99316729278070603==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/dnfb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/dnfb.c linux-2.6.11-rc2-mm1/drivers/video/dnfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/dnfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/dnfb.c	2005-01-24 19:07:03.023260645 -0500
@@ -266,7 +266,7 @@
 	out_8(AP_CONTROL_2, S_DATA_PLN);
 	out_be16(AP_ROP_1, SWAP(0x3));
 
-	printk("apollo frame buffer alive and kicking !\n");
+	pr_info("apollo frame buffer initialized\n");
 	return err;
 }
 

--===============99316729278070603==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99316729278070603==--
