From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 23:26:05 +0000
Subject: [KJ] [PATCH 1/6] arm: add KERN_ constants to
Message-Id: <20060907232600.9720.69576.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index 240c448..c5afff3 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -282,7 +282,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_C
 void __devinit pcibios_update_irq(struct pci_dev *dev, int irq)
 {
 	if (debug_pci)
-		printk("PCI: Assigning IRQ %02d to %s\n", irq, pci_name(dev));
+		pr_info("PCI: Assigning IRQ %02d to %s\n", irq, pci_name(dev));
 	pci_write_config_byte(dev, PCI_INTERRUPT_LINE, irq);
 }
 
@@ -497,7 +497,7 @@ static u8 __devinit pcibios_swizzle(stru
 		slot = sys->swizzle(dev, pin);
 
 	if (debug_pci)
-		printk("PCI: %s swizzling pin %d => pin %d slot %d\n",
+		pr_info("PCI: %s swizzling pin %d => pin %d slot %d\n",
 			pci_name(dev), oldpin, *pin, slot);
 
 	return slot;
@@ -515,7 +515,7 @@ static int pcibios_map_irq(struct pci_de
 		irq = sys->map_irq(dev, slot, pin);
 
 	if (debug_pci)
-		printk("PCI: %s mapping slot %d pin %d => irq %d\n",
+		pr_info("PCI: %s mapping slot %d pin %d => irq %d\n",
 			pci_name(dev), slot, pin, irq);
 
 	return irq;
@@ -668,7 +668,7 @@ int pcibios_enable_device(struct pci_dev
 		cmd |= PCI_COMMAND_IO | PCI_COMMAND_MEMORY;
 
 	if (cmd != old_cmd) {
-		printk("PCI: enabling device %s (%04x -> %04x)\n",
+		pr_info("PCI: enabling device %s (%04x -> %04x)\n",
 		       pci_name(dev), old_cmd, cmd);
 		pci_write_config_word(dev, PCI_COMMAND, cmd);
 	}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
