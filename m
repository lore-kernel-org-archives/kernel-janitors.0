From: Henne <henne@nachtwindheim.de>
Date: Tue, 15 Aug 2006 09:03:30 +0000
Subject: [KJ] [PATCH] Change pci_module_init from macro to inline function
Message-Id: <44E18DE2.8020700@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de
Cc: linux-pci@atrey.karlin.mff.cuni.cz, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Replaces the pci_module_init()-macro with a inline function,
which is marked as deprecated.
This gives a warning at compile time, which may be useful for driver developers who still use
pci_module_init() on 2.6 drivers.

Signed-of-by: Henrik Kretzschmar <henne@nachtwindheim.de>

---

--- linux-2.6.18-rc4/include/linux/pci.h	2006-08-11 10:10:08.000000000 +0200
+++ linux/include/linux/pci.h	2006-08-11 15:04:21.000000000 +0200
@@ -384,12 +384,6 @@
 	.vendor = PCI_ANY_ID, .device = PCI_ANY_ID, \
 	.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID
 
-/*
- * pci_module_init is obsolete, this stays here till we fix up all usages of it
- * in the tree.
- */
-#define pci_module_init	pci_register_driver
-
 /* these external functions are only available when PCI support is enabled */
 #ifdef CONFIG_PCI
 
@@ -547,6 +541,16 @@
 	return __pci_register_driver(driver, THIS_MODULE);
 }
 
+/*
+ * pci_module_init is obsolete, this stays here till we fix up all usages of it
+ * in the tree.
+ */
+
+static inline int __deprecated pci_module_init(struct pci_driver* drv)
+{
+	return pci_register_driver(drv);
+}
+
 void pci_unregister_driver(struct pci_driver *);
 void pci_remove_behind_bridge(struct pci_dev *);
 struct pci_driver *pci_dev_driver(const struct pci_dev *);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
