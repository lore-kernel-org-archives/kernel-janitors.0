From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 22 Sep 2005 09:11:48 +0000
Subject: [KJ] printk : arch/alpha/kernel/core_apecs.c
Message-Id: <20050922091148.GD3818@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75699133036316679=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75699133036316679==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.14-rc2/arch/alpha/kernel/core_apecs.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/core_apecs.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/core_apecs.c
@@ -182,7 +182,7 @@ conf_read(unsigned long addr, unsigned c
 	if (stat0 & 0xffe0U) {
 		/* If not NDEV, print status.  */
 		if (!(stat0 & 0x0800)) {
-			printk("apecs.c:conf_read: got stat0=%x\n", stat0);
+			printk(KERN_INFO "apecs.c:conf_read: got stat0=%x\n", stat0);
 		}
 
 		/* Reset error status.  */
@@ -251,7 +251,7 @@ conf_write(unsigned long addr, unsigned 
 	if (stat0 & 0xffe0U) {
 		/* If not NDEV, print status.  */
 		if (!(stat0 & 0x0800)) {
-			printk("apecs.c:conf_write: got stat0=%x\n", stat0);
+			printk(KERN_INFO "apecs.c:conf_write: got stat0=%x\n", stat0);
 		}
 
 		/* Reset error status.  */


--===============75699133036316679==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75699133036316679==--
