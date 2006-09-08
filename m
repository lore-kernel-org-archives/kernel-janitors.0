From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:57:17 +0000
Subject: [KJ] [PATCH 08/72] arm: add KERN_ constants to
Message-Id: <20060908015717.10114.91178.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-ixp2000/ixdp2800.c b/arch/arm/mach-ixp2000/ixdp2800.c
index 91d36d9..18bf803 100644
--- a/arch/arm/mach-ixp2000/ixdp2800.c
+++ b/arch/arm/mach-ixp2000/ixdp2800.c
@@ -100,7 +100,7 @@ static void __init ixdp2800_slave_wait_f
 
 void __init ixdp2800_pci_preinit(void)
 {
-	printk("ixdp2x00_pci_preinit called\n");
+	pr_info("ixdp2x00_pci_preinit called\n");
 
 	*IXP2000_PCI_ADDR_EXT = 0x0001e000;
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
