From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2013 07:44:54 +0000
Subject: [patch] PCI: set ->mask_pos correctly
Message-Id: <20130430074454.GF7237@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

The "+" operation has higher precedence than "?:" and ->msi_cap is
always non-zero here so the original statement is equivalent to:

	entry->mask_pos = PCI_MSI_MASK_64;

Which wasn't the intent.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
index d40bed7..2c10752 100644
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -563,8 +563,10 @@ static int msi_capability_init(struct pci_dev *dev, int nvec)
 	entry->msi_attrib.default_irq	= dev->irq;	/* Save IOAPIC IRQ */
 	entry->msi_attrib.pos		= dev->msi_cap;
 
-	entry->mask_pos = dev->msi_cap + (control & PCI_MSI_FLAGS_64BIT) ?
-		PCI_MSI_MASK_64 : PCI_MSI_MASK_32;
+	if (control & PCI_MSI_FLAGS_64BIT)
+		entry->mask_pos = dev->msi_cap + PCI_MSI_MASK_64;
+	else
+		entry->mask_pos = dev->msi_cap + PCI_MSI_MASK_32;
 	/* All MSIs are unmasked by default, Mask them all */
 	if (entry->msi_attrib.maskbit)
 		pci_read_config_dword(dev, entry->mask_pos, &entry->masked);
