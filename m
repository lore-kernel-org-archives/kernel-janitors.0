From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:02:41 +0000
Subject: [KJ] [PATCH 56/72] arm: add KERN_ constants to
Message-Id: <20060908020241.10114.51498.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-versatile/pci.c b/arch/arm/mach-versatile/pci.c
index 41b3700..67be698 100644
--- a/arch/arm/mach-versatile/pci.c
+++ b/arch/arm/mach-versatile/pci.c
@@ -65,7 +65,7 @@ static int __init versatile_pci_slot_ign
 
 	while ((retval = get_option(&str,&slot))) {
 		if ((slot < 0) || (slot > 31)) {
-			printk("Illegal slot value: %d\n",slot);
+			printk(KERN_ERR "Illegal slot value: %d\n",slot);
 		} else {
 			pci_slot_ignore |= (1 << slot);
 		}
@@ -243,7 +243,7 @@ int __init pci_versatile_setup(int nr, s
 
 	val = __raw_readl(SYS_PCICTL);
 	if (!(val & 1)) {
-		printk("Not plugged into PCI backplane!\n");
+		printk(KERN_ERR "Not plugged into PCI backplane!\n");
 		ret = -EIO;
 		goto out;
 	}
@@ -252,11 +252,11 @@ int __init pci_versatile_setup(int nr, s
 		sys->mem_offset = 0;
 		ret = pci_versatile_setup_resources(sys->resource);
 		if (ret < 0) {
-			printk("pci_versatile_setup: resources... oops?\n");
+			printk(KERN_ERR "pci_versatile_setup: resources... oops?\n");
 			goto out;
 		}
 	} else {
-		printk("pci_versatile_setup: resources... nr = 0??\n");
+		printk(KERN_ERR "pci_versatile_setup: resources... nr = 0??\n");
 		goto out;
 	}
 
@@ -272,12 +272,12 @@ int __init pci_versatile_setup(int nr, s
 		}
 
 	if (myslot = -1) {
-		printk("Cannot find PCI core!\n");
+		printk(KERN_ERR "Cannot find PCI core!\n");
 		ret = -EIO;
 		goto out;
 	}
 
-	printk("PCI core found (slot %d)\n",myslot);
+	pr_info("PCI core found (slot %d)\n",myslot);
 
 	__raw_writel(myslot, PCI_SELFID);
 	local_pci_cfg_base = (void *) VERSATILE_PCI_CFG_VIRT_BASE + (myslot << 11);
@@ -338,7 +338,7 @@ static int __init versatile_map_irq(stru
 	 */
 	irq = 27 + ((slot + pin - 1) & 3);
 
-	printk("PCI map irq: slot %d, pin %d, devslot %d, irq: %d\n",slot,pin,devslot,irq);
+	pr_info("PCI map irq: slot %d, pin %d, devslot %d, irq: %d\n",slot,pin,devslot,irq);
 
 	return irq;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
