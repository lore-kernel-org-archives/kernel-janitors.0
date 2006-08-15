From: Henne <henne@nachtwindheim.de>
Date: Tue, 15 Aug 2006 08:57:16 +0000
Subject: [KJ] [PATCH] kerneldoc correction in pci-driver
Message-Id: <44E18C6C.2080902@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de
Cc: linux-kernel@vger.kernel.org, linux-pci@atrey.karlin.mff.cuni.cz, kernel-janitors@lists.osdl.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Removes an unused kerneldoc entry from pci_match_device and
put the others into correct order.

Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>

---

--- linux-2.6.18-rc4/drivers/pci/pci-driver.c	2006-06-18 03:49:35.000000000 +0200
+++ linux/drivers/pci/pci-driver.c	2006-08-11 13:59:39.000000000 +0200
@@ -139,9 +139,8 @@
 /**
  * pci_match_device - Tell if a PCI device structure has a matching
  *                    PCI device id structure
- * @ids: array of PCI device id structures to search in
- * @dev: the PCI device structure to match against
  * @drv: the PCI driver to match against
+ * @dev: the PCI device structure to match against
  *
  * Used by a driver to check whether a PCI device present in the
  * system is in its list of supported devices.  Returns the matching


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
