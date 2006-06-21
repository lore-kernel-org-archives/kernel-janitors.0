From: Julius Volz <julius.volz@s2003.tu-chemnitz.de>
Date: Wed, 21 Jun 2006 01:27:27 +0000
Subject: [KJ] [PATCH] Add missing printk() log-level constants in
Message-Id: <20060621032727.72bd5e4c.volz@hrz.tu-chemnitz.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

with my second patch I'll try adding some printk() log-level constants.
Please enlighten me about any mistakes I might have made and whether
the log-levels I chose seem appropriate...

Description:
This patch adds some missing printk() log-level constants in
drivers/acpi/pci_link.c.

Signed-Off-By: Julius Volz <juliusrv@gmail.com>

--- pci_link.c.orig	2006-06-21 02:39:27.000000000 +0200
+++ pci_link.c	2006-06-21 03:19:39.000000000 +0200
@@ -361,7 +361,7 @@
 		/* ignore resource_source, it's optional */
 		break;
 	default:
-		printk("ACPI BUG: resource_type %d\n", link->irq.resource_type);
+		printk(KERN_WARNING "ACPI BUG: resource_type %d\n", link->irq.resource_type);
 		result = -EINVAL;
 		goto end;
 
@@ -588,15 +588,15 @@
 
 	/* Attempt to enable the link device at this IRQ. */
 	if (acpi_pci_link_set(link, irq)) {
-		printk(PREFIX
+		printk(KERN_WARNING PREFIX
 		       "Unable to set IRQ for %s [%s] (likely buggy ACPI BIOS).\n"
-		       "Try pci=noacpi or acpi=off\n",
+		       KERN_WARNING PREFIX "Try pci=noacpi or acpi=off\n",
 		       acpi_device_name(link->device),
 		       acpi_device_bid(link->device));
 		return_VALUE(-ENODEV);
 	} else {
 		acpi_irq_penalty[link->irq.active] += PIRQ_PENALTY_PCI_USING;
-		printk(PREFIX "%s [%s] enabled at IRQ %d\n",
+		printk(KERN_INFO PREFIX "%s [%s] enabled at IRQ %d\n",
 		       acpi_device_name(link->device),
 		       acpi_device_bid(link->device), link->irq.active);
 	}
@@ -755,7 +755,7 @@
 	/* query and set link->irq.active */
 	acpi_pci_link_get_current(link);
 
-	printk(PREFIX "%s [%s] (IRQs", acpi_device_name(device),
+	printk(KERN_INFO PREFIX "%s [%s] (IRQs", acpi_device_name(device),
 	       acpi_device_bid(device));
 	for (i = 0; i < link->irq.possible_count; i++) {
 		if (link->irq.active = link->irq.possible[i]) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
