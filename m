From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 22 Sep 2005 09:14:26 +0000
Subject: [KJ] printk : arch/alpha/kernel/core_polaris.c
Message-Id: <20050922091426.GF3818@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6071868101363076=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6071868101363076==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.14-rc2/arch/alpha/kernel/core_polaris.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/core_polaris.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/core_polaris.c
@@ -152,7 +152,7 @@ polaris_init_arch(void)
 	 * already.
 	 */
 #if 0
-	printk("polaris_init_arch(): trusting firmware for setup\n");
+	printk(KERN_INFO "polaris_init_arch(): trusting firmware for setup\n");
 #endif
 
 	/*


--===============6071868101363076==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6071868101363076==--
