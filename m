From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:47:29 +0000
Subject: [KJ] [PATCH] 18/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214729.15055.96510.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index ffb7d54..adb0b3e 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -214,13 +214,13 @@ pdev_save_srm_config(struct pci_dev *dev
 		return;
 
 	if (!printed) {
-		printk(KERN_INFO "pci: enabling save/restore of SRM state\n");
+		pr_info("pci: enabling save/restore of SRM state\n");
 		printed = 1;
 	}
 
 	tmp = kmalloc(sizeof(*tmp), GFP_KERNEL);
 	if (!tmp) {
-		printk(KERN_ERR "%s: kmalloc() failed!\n", __FUNCTION__);
+		printk(KERN_ERR "pci: %s: kmalloc() failed!\n", __FUNCTION__);
 		return;
 	}
 	tmp->next = srm_saved_configs;
@@ -388,7 +388,7 @@ pcibios_enable_device(struct pci_dev *de
 	}
 
 	if (cmd != oldcmd) {
-		printk(KERN_DEBUG "PCI: Enabling device: (%s), cmd %x\n",
+		printk(KERN_DEBUG "pci: Enabling device: (%s), cmd %x\n",
 		       pci_name(dev), cmd);
 		/* Enable the appropriate bits in the PCI command register.  */
 		pci_write_config_word(dev, PCI_COMMAND, cmd);
@@ -407,7 +407,7 @@ pcibios_set_master(struct pci_dev *dev)
 	u8 lat;
 	pci_read_config_byte(dev, PCI_LATENCY_TIMER, &lat);
 	if (lat >= 16) return;
-	printk("PCI: Setting latency timer of device %s to 64\n",
+	pr_info("pci: Setting latency timer of device %s to 64\n",
 							pci_name(dev));
 	pci_write_config_byte(dev, PCI_LATENCY_TIMER, 64);
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
