From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:17 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 4/16] ifdefs:
Message-Id: <20040508233817.GA4100@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62102230792762214=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62102230792762214==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- c/drivers/net/eepro100.c	2004-04-04 05:37:36.000000000 +0200
+++ a/drivers/net/eepro100.c	2004-05-08 22:51:22.000000000 +0200
@@ -2454,22 +2454,6 @@
 #endif /* CONFIG_PM */
 };
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,48)
-static int pci_module_init(struct pci_driver *pdev)
-{
-	int rc;
-
-	rc = pci_register_driver(pdev);
-	if (rc <= 0) {
-		printk(KERN_INFO "%s: No cards found, driver not installed.\n",
-			   pdev->name);
-		pci_unregister_driver(pdev);
-		return -ENODEV;
-	}
-	return 0;
-}
-#endif
-
 static int __init eepro100_init_module(void)
 {
 #ifdef MODULE

--===============62102230792762214==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62102230792762214==--
