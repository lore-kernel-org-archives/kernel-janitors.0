From: Henne <henne@nachtwindheim.de>
Date: Mon, 24 Jul 2006 12:31:15 +0000
Subject: [KJ] [NET] initialisation cleanup for ULI526x-net-driver
Message-Id: <44C4BD93.40804@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com
Cc: kernel-janitors@lists.osdl.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

[NET] initialisation cleanup for ULI526x-net-driver

removes the unneeded local variable rc
replace pci_module_init() with pci_register_driver()
two coding style issues on switch

Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>

---

diff -ruN linux-2.6.18-rc2-git2/drivers/net/tulip/uli526x.c linux/drivers/net/tulip/uli526x.c
--- linux-2.6.18-rc2-git2/drivers/net/tulip/uli526x.c	2006-07-24 13:58:05.000000000 +0200
+++ linux/drivers/net/tulip/uli526x.c	2006-07-24 14:21:43.000000000 +0200
@@ -1702,7 +1702,6 @@
 
 static int __init uli526x_init_module(void)
 {
-	int rc;
 
 	printk(version);
 	printed_version = 1;
@@ -1714,22 +1713,19 @@
 	if (cr6set)
 		uli526x_cr6_user_set = cr6set;
 
- 	switch(mode) {
+ 	switch (mode) {
    	case ULI526X_10MHF:
 	case ULI526X_100MHF:
 	case ULI526X_10MFD:
 	case ULI526X_100MFD:
 		uli526x_media_mode = mode;
 		break;
-	default:uli526x_media_mode = ULI526X_AUTO;
+	default:
+		uli526x_media_mode = ULI526X_AUTO;
 		break;
 	}
 
-	rc = pci_module_init(&uli526x_driver);
-	if (rc < 0)
-		return rc;
-
-	return 0;
+	return pci_register_driver(&uli526x_driver);
 }
 
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
