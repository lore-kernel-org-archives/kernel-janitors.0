From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:08:10 +0000
Subject: [KJ] [PATCH 1/53] acornfb: Clean up printk()'s in
Message-Id: <20050125230808.10418.32680.80704@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============064348943728215424=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============064348943728215424==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/acornfb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/acornfb.c linux-2.6.11-rc2-mm1/drivers/video/acornfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/acornfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/acornfb.c	2005-01-24 19:07:02.024263887 -0500
@@ -1277,7 +1277,7 @@
 		mb_freed += PAGE_SIZE / 1024;
 	}
 
-	printk("acornfb: freed %dK memory\n", mb_freed);
+	pr_info("acornfb: freed %dK memory\n", mb_freed);
 }
 
 static int __init acornfb_probe(struct device *dev)
@@ -1423,7 +1423,7 @@
 	 * generic database.
 	 */
 	if (rc == 0) {
-		printk("Acornfb: no valid mode found\n");
+		printk(KERN_ERR "Acornfb: no valid mode found\n");
 		return -EINVAL;
 	}
 

--===============064348943728215424==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============064348943728215424==--
