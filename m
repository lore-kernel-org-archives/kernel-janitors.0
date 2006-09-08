From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:56:29 +0000
Subject: [KJ] [PATCH 01/72] arm: add KERN_ constants to
Message-Id: <20060908015629.10114.4294.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-footbridge/cats-pci.c b/arch/arm/mach-footbridge/cats-pci.c
index 4f984fd..8e16b58 100644
--- a/arch/arm/mach-footbridge/cats-pci.c
+++ b/arch/arm/mach-footbridge/cats-pci.c
@@ -25,7 +25,7 @@ static int __init cats_map_irq(struct pc
 		return irqmap_cats[dev->irq - 1];
 
 	if (dev->irq != 0)
-		printk("PCI: device %02x:%02x has unknown irq line %x\n",
+		printk(KERN_ERR "PCI: device %02x:%02x has unknown irq line %x\n",
 		       dev->bus->number, dev->devfn, dev->irq);
 
 	return -1;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
