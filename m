From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Sat, 06 Jun 2009 12:58:56 +0000
Subject: [PATCH] pci hotplug: adding __init/__exit macros to sgi_hotplug
Message-Id: <200906061458.56611.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init and __exit macros to the module_init /
module_exit functions from drivers/pci/hotplug/sgi_hotplug.c
linux version 2.6.30-rc8

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
diff -up linux-2.6.30-rc8/drivers/pci/hotplug/sgi_hotplug.c{.orig,}
--- linux-2.6.30-rc8/drivers/pci/hotplug/sgi_hotplug.c.orig
+++ linux-2.6.30-rc8/drivers/pci/hotplug/sgi_hotplug.c
@@ -679,7 +679,7 @@ alloc_err:
 	return rc;
 }
 
-static int sn_pci_hotplug_init(void)
+static int __init sn_pci_hotplug_init(void)
 {
 	struct pci_bus *pci_bus = NULL;
 	int rc;
@@ -716,7 +716,7 @@ static int sn_pci_hotplug_init(void)
 	return registered = 1 ? 0 : -ENODEV;
 }
 
-static void sn_pci_hotplug_exit(void)
+static void __exit sn_pci_hotplug_exit(void)
 {
 	struct hotplug_slot *bss_hotplug_slot;
 
