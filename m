From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:57:45 +0000
Subject: [KJ] [PATCH 12/72] arm: add KERN_ constants to
Message-Id: <20060908015745.10114.80563.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-ixp4xx/gtwx5715-pci.c b/arch/arm/mach-ixp4xx/gtwx5715-pci.c
index a66484b..150b2f5 100644
--- a/arch/arm/mach-ixp4xx/gtwx5715-pci.c
+++ b/arch/arm/mach-ixp4xx/gtwx5715-pci.c
@@ -69,7 +69,7 @@ static int __init gtwx5715_map_irq(struc
 	else
 		rc = gtwx5715_irqmap[slot][pin-1];
 
-	printk("%s: Mapped slot %d pin %d to IRQ %d\n", __FUNCTION__,slot, pin, rc);
+	pr_info("%s: Mapped slot %d pin %d to IRQ %d\n", __FUNCTION__,slot, pin, rc);
 	return(rc);
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
