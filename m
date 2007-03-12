From: Surya <surya.prabhakar@wipro.com>
Date: Mon, 12 Mar 2007 10:17:16 +0000
Subject: [KJ] Patch11:replace pci_find_device in isdn/hisax/niccy.c
Message-Id: <1173693916.14236.4.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
    Replacing pci_find_device in niccy.c (isdn/hisax)
Applies and compiles clean on latest tree.

thanks.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 

diff --git a/drivers/isdn/hisax/niccy.c b/drivers/isdn/hisax/niccy.c
index e5918c6..dddbaae 100644
--- a/drivers/isdn/hisax/niccy.c
+++ b/drivers/isdn/hisax/niccy.c
@@ -302,29 +302,29 @@ int __devinit setup_niccy(struct IsdnCar
 #ifdef CONFIG_PCI
 		u_int pci_ioaddr;
 		cs->subtyp = 0;
-		if ((niccy_dev = pci_find_device(PCI_VENDOR_ID_SATSAGEM,
+		if ((niccy_dev = pci_get_device(PCI_VENDOR_ID_SATSAGEM,
 						 PCI_DEVICE_ID_SATSAGEM_NICCY,
 						 niccy_dev))) {
 			if (pci_enable_device(niccy_dev))
-				return 0;
+				goto niccy_dev_cleanup;
 			/* get IRQ */
 			if (!niccy_dev->irq) {
 				printk(KERN_WARNING
 				       "Niccy: No IRQ for PCI card found\n");
-				return 0;
+				goto niccy_dev_cleanup;
 			}
 			cs->irq = niccy_dev->irq;
 			cs->hw.niccy.cfg_reg = pci_resource_start(niccy_dev, 0);
 			if (!cs->hw.niccy.cfg_reg) {
 				printk(KERN_WARNING
 				       "Niccy: No IO-Adr for PCI cfg found\n");
-				return 0;
+				goto niccy_dev_cleanup;
 			}
 			pci_ioaddr = pci_resource_start(niccy_dev, 1);
 			if (!pci_ioaddr) {
 				printk(KERN_WARNING
 				       "Niccy: No IO-Adr for PCI card found\n");
-				return 0;
+				goto niccy_dev_cleanup;
 			}
 			cs->subtyp = NICCY_PCI;
 		} else {
@@ -341,7 +341,7 @@ int __devinit setup_niccy(struct IsdnCar
 			       "HiSax: %s data port %x-%x already in use\n",
 			       CardType[card->typ],
 			       cs->hw.niccy.isac, cs->hw.niccy.isac + 4);
-			return 0;
+			goto niccy_dev_cleanup;
 		}
 		if (!request_region(cs->hw.niccy.cfg_reg, 0x40, "niccy pci")) {
 			printk(KERN_WARNING
@@ -350,7 +350,7 @@ int __devinit setup_niccy(struct IsdnCar
 			       cs->hw.niccy.cfg_reg,
 			       cs->hw.niccy.cfg_reg + 0x40);
 			release_region(cs->hw.niccy.isac, 4);
-			return 0;
+			goto niccy_dev_cleanup;
 		}
 #else
 		printk(KERN_WARNING "Niccy: io0 0 and NO_PCI_BIOS\n");
@@ -376,7 +376,13 @@ int __devinit setup_niccy(struct IsdnCar
 		printk(KERN_WARNING "Niccy: wrong HSCX versions check IO "
 			"address\n");
 		release_io_niccy(cs);
-		return 0;
+		goto niccy_dev_cleanup;
 	}
+
+	pci_dev_put(niccy_dev);
 	return 1;
+
+niccy_dev_cleanup:
+		pci_dev_put(niccy_dev);
+		return (0);
 }

-- 
surya.
12/03/2007
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
