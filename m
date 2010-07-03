From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:04:03 +0000
Subject: [PATCH 08/19] arch/x86/pci: use for_each_pci_dev()
Message-Id: <1278173044-11677-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>, Seth Heasley <seth.heasley@intel.com>, Jacob Pan <jacob.jun.pan@intel.com>, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/x86/pci/irq.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/pci/irq.c b/arch/x86/pci/irq.c
index 9810a0f..f547ee0 100644
--- a/arch/x86/pci/irq.c
+++ b/arch/x86/pci/irq.c
@@ -989,7 +989,7 @@ static int pcibios_lookup_irq(struct pci_dev *dev, int assign)
 	dev_info(&dev->dev, "%s PCI INT %c -> IRQ %d\n", msg, 'A' + pin - 1, irq);
 
 	/* Update IRQ for all devices with the same pirq value */
-	while ((dev2 = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev2)) != NULL) {
+	for_each_pci_dev(dev2) {
 		pci_read_config_byte(dev2, PCI_INTERRUPT_PIN, &pin);
 		if (!pin)
 			continue;
@@ -1028,7 +1028,7 @@ void __init pcibios_fixup_irqs(void)
 	u8 pin;
 
 	DBG(KERN_DEBUG "PCI: IRQ fixup\n");
-	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		/*
 		 * If the BIOS has set an out of range IRQ number, just
 		 * ignore it.  Also keep track of which IRQ's are
@@ -1052,7 +1052,7 @@ void __init pcibios_fixup_irqs(void)
 		return;
 
 	dev = NULL;
-	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
 		if (!pin)
 			continue;
-- 
1.7.0.4

