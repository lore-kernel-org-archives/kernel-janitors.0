From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:57:38 +0000
Subject: [KJ] [PATCH 11/72] arm: add KERN_ constants to
Message-Id: <20060908015738.10114.98961.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-ixp4xx/common-pci.c b/arch/arm/mach-ixp4xx/common-pci.c
index 9562177..4bed0e7 100644
--- a/arch/arm/mach-ixp4xx/common-pci.c
+++ b/arch/arm/mach-ixp4xx/common-pci.c
@@ -375,7 +375,7 @@ void __init ixp4xx_pci_preinit(void)
 	 * Rev 0 IXP425 requires workaround.
 	 */
 	if (!(processor_id & 0xf) && !cpu_is_ixp46x()) {
-		printk("PCI: IXP42x A0 silicon detected - "
+		pr_info("PCI: IXP42x A0 silicon detected - "
 			"PCI Non-Prefetch Workaround Enabled\n");
 		ixp4xx_pci_read = ixp4xx_pci_read_errata;
 	} else
@@ -404,7 +404,7 @@ void __init ixp4xx_pci_preinit(void)
 		0x00010203;
 
 	if (*PCI_CSR & PCI_CSR_HOST) {
-		printk("PCI: IXP4xx is host\n");
+		pr_info("PCI: IXP4xx is host\n");
 
 		pr_debug("setup BARs in controller\n");
 
@@ -427,10 +427,10 @@ void __init ixp4xx_pci_preinit(void)
 		 */
 		local_write_config(PCI_BASE_ADDRESS_5, 4, 0xfffffc01);
 	} else {
-		printk("PCI: IXP4xx is target - No bus scan performed\n");
+		pr_info("PCI: IXP4xx is target - No bus scan performed\n");
 	}
 
-	printk("PCI: IXP4xx Using %s access for memory space\n",
+	pr_info("PCI: IXP4xx Using %s access for memory space\n",
 #ifndef CONFIG_IXP4XX_INDIRECT_PCI
 			"direct"
 #else
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
