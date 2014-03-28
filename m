From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Mar 2014 08:24:59 +0000
Subject: [patch] xen-pciback: silence an unwanted debug printk
Message-Id: <20140328082459.GI25192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a missing curly brace here so we might print some extra debug
information.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/xen-pciback/pciback_ops.c b/drivers/xen/xen-pciback/pciback_ops.c
index 929dd46..607e414 100644
--- a/drivers/xen/xen-pciback/pciback_ops.c
+++ b/drivers/xen/xen-pciback/pciback_ops.c
@@ -217,7 +217,7 @@ int xen_pcibk_enable_msix(struct xen_pcibk_device *pdev,
 	if (result = 0) {
 		for (i = 0; i < op->value; i++) {
 			op->msix_entries[i].entry = entries[i].entry;
-			if (entries[i].vector)
+			if (entries[i].vector) {
 				op->msix_entries[i].vector  					xen_pirq_from_irq(entries[i].vector);
 				if (unlikely(verbose_request))
@@ -225,6 +225,7 @@ int xen_pcibk_enable_msix(struct xen_pcibk_device *pdev,
 						"MSI-X[%d]: %d\n",
 						pci_name(dev), i,
 						op->msix_entries[i].vector);
+			}
 		}
 	} else
 		pr_warn_ratelimited("%s: error enabling MSI-X for guest %u: err %d!\n",
