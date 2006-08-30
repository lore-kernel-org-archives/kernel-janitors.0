From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:45:44 +0000
Subject: [KJ] [PATCH] 03/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214544.15055.63277.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/core_irongate.c b/arch/alpha/kernel/core_irongate.c
index 138d497..d02a0cd 100644
--- a/arch/alpha/kernel/core_irongate.c
+++ b/arch/alpha/kernel/core_irongate.c
@@ -34,11 +34,12 @@ #include "pci_impl.h"
  */
 
 #define DEBUG_CONFIG 0
+#define PFX "pci: irongate: "
 
 #if DEBUG_CONFIG
-# define DBG_CFG(args)	printk args
+# define DBG_CFG(fmt, args...)	printk (KERN_DEBUG PFX "%s: " fmt, __FUNCTION__, ## args)
 #else
-# define DBG_CFG(args)
+# define DBG_CFG(fmt, args...)
 #endif
 
 igcsr32 *IronECC;
@@ -85,9 +86,8 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	unsigned long addr;
 	u8 bus = pbus->number;
 
-	DBG_CFG(("mk_conf_addr(bus=%d ,device_fn=0x%x, where=0x%x, "
-		 "pci_addr=0x%p, type1=0x%p)\n",
-		 bus, device_fn, where, pci_addr, type1));
+	DBG_CFG("(bus=%d ,device_fn=0x%x, where=0x%x, pci_addr=0x%p, type1=0x%p)\n",
+		 bus, device_fn, where, pci_addr, type1);
 
 	*type1 = (bus != 0);
 
@@ -95,7 +95,7 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	addr |= IRONGATE_CONF;
 
 	*pci_addr = addr;
-	DBG_CFG(("mk_conf_addr: returning pci_addr 0x%lx\n", addr));
+	DBG_CFG("returning pci_addr 0x%lx\n", addr);
 	return 0;
 }
 
@@ -169,13 +169,13 @@ irongate_pci_clr_err(void)
 
 again:
 	IRONGATE_jd = IRONGATE0->stat_cmd;
-	printk("Iron stat_cmd %x\n", IRONGATE_jd);
+	printk(KERN_ERR PFX "stat_cmd %x\n", IRONGATE_jd);
 	IRONGATE0->stat_cmd = IRONGATE_jd; /* write again clears error bits */
 	mb();
 	IRONGATE_jd = IRONGATE0->stat_cmd;  /* re-read to force write */
 
 	IRONGATE_jd = *IronECC;
-	printk("Iron ECC %x\n", IRONGATE_jd);
+	printk(KERN_ERR PFX "ECC %x\n", IRONGATE_jd);
 	*IronECC = IRONGATE_jd; /* write again clears error bits */
 	mb();
 	IRONGATE_jd = *IronECC;  /* re-read to force write */
@@ -216,7 +216,7 @@ albacore_init_arch(void)
 	   Issue a warning for such consoles. */
 	if (alpha_using_srm &&
 	    (pal_rev < 0x13e ||	(pal_rev = 0x13e && pal_var < 2)))
-		printk(KERN_WARNING "WARNING! Upgrade to SRM A5.6-19 "
+		printk(KERN_WARNING PFX "WARNING! Upgrade to SRM A5.6-19 "
 				    "or later\n");
 
 	if (pci_mem > IRONGATE_3GB)
@@ -236,14 +236,13 @@ #ifdef CONFIG_BLK_DEV_INITRD
 			free_bootmem_node(NODE_DATA(0), __pa(initrd_start),
 					  PAGE_ALIGN(size));
 			if (!move_initrd(pci_mem))
-				printk("irongate_init_arch: initrd too big "
-				       "(%ldK)\ndisabling initrd\n",
-				       size / 1024);
+				printk(KERN_ERR PFX "initrd too big (%ldK) - "
+					"disabling initrd\n", size / 1024);
 		}
 #endif
 		reserve_bootmem_node(NODE_DATA(0), pci_mem, memtop - pci_mem);
-		printk("irongate_init_arch: temporarily reserving "
-			"region %08lx-%08lx for PCI\n", pci_mem, memtop - 1);
+		pr_info(PFX "temporarily reserving region %08lx-%08lx for PCI\n",
+			 pci_mem, memtop - 1);
 	}
 }
 
@@ -351,7 +350,7 @@ irongate_ioremap(unsigned long addr, uns
 	 * Adjust the limits (mappings must be page aligned)
 	 */
 	if (addr & ~PAGE_MASK) {
-		printk("AGP ioremap failed... addr not page aligned (0x%lx)\n",
+		printk(KERN_ERR PFX "AGP ioremap failed... addr not page aligned (0x%lx)\n",
 		       addr);
 		return (void __iomem *)(addr + IRONGATE_MEM);
 	}
@@ -389,7 +388,7 @@ #endif
 
 		if (__alpha_remap_area_pages(vaddr,
 					     pte, PAGE_SIZE, 0)) {
-			printk("AGP ioremap: FAILED to map...\n");
+			printk(KERN_ERR PFX "AGP ioremap: FAILED to map...\n");
 			vfree(area->addr);
 			return NULL;
 		}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
