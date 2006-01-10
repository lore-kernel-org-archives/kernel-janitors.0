From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 10 Jan 2006 11:40:11 +0000
Subject: [KJ] [PATCH] printk : arch/arm/kernel/bios32.c
Message-Id: <20060110114011.GB8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13736996737373275=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============13736996737373275==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).


Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.15/arch/arm/kernel/bios32.c
===================================================================
--- linux-2.6.15.orig/arch/arm/kernel/bios32.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/kernel/bios32.c	2006-01-07 10:57:32.000000000 +0100
@@ -48,7 +48,8 @@
 		pci_write_config_word(dev, PCI_STATUS, status & status_mask);
 
 		if (warn)
-			printk("(%s: %04X) ", pci_name(dev), status);
+			printk(KERN_WARNING "(%s: %04X) ", 
+					pci_name(dev), status);
 	}
 
 	list_for_each_entry(dev, &bus->devices, bus_list)
@@ -283,7 +284,7 @@
 void __devinit pcibios_update_irq(struct pci_dev *dev, int irq)
 {
 	if (debug_pci)
-		printk("PCI: Assigning IRQ %02d to %s\n", irq, pci_name(dev));
+		printk(KERN_DEBUG "PCI: Assigning IRQ %02d to %s\n", irq, pci_name(dev));
 	pci_write_config_byte(dev, PCI_INTERRUPT_LINE, irq);
 }
 
@@ -509,7 +510,7 @@
 		slot = sys->swizzle(dev, pin);
 
 	if (debug_pci)
-		printk("PCI: %s swizzling pin %d => pin %d slot %d\n",
+		printk(KERN_DEBUG "PCI: %s swizzling pin %d => pin %d slot %d\n",
 			pci_name(dev), oldpin, *pin, slot);
 
 	return slot;
@@ -527,7 +528,7 @@
 		irq = sys->map_irq(dev, slot, pin);
 
 	if (debug_pci)
-		printk("PCI: %s mapping slot %d pin %d => irq %d\n",
+		printk(KERN_DEBUG "PCI: %s mapping slot %d pin %d => irq %d\n",
 			pci_name(dev), slot, pin, irq);
 
 	return irq;
@@ -682,7 +683,7 @@
 		cmd |= PCI_COMMAND_IO | PCI_COMMAND_MEMORY;
 
 	if (cmd != old_cmd) {
-		printk("PCI: enabling device %s (%04x -> %04x)\n",
+		printk(KERN_INFO "PCI: enabling device %s (%04x -> %04x)\n",
 		       pci_name(dev), old_cmd, cmd);
 		pci_write_config_word(dev, PCI_COMMAND, cmd);
 	}

--===============13736996737373275==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13736996737373275==--
