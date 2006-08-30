From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:45:58 +0000
Subject: [KJ] [PATCH] 05/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214558.15055.51478.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index 7f6a984..b4257b1 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -34,14 +34,14 @@ #include "pci_impl.h"
  * Debug helpers
  */
 #define DEBUG_CONFIG 0
+#define PFX "pci: marvel: "
 
 #if DEBUG_CONFIG
-# define DBG_CFG(args) printk args
+# define DBG_CFG(fmt, args...)	printk (KERN_DEBUG PFX "%s: " fmt, __FUNCTION__, ## args)
 #else
-# define DBG_CFG(args)
+# define DBG_CFG(fmt, args...)
 #endif
 
-
 /*
  * Private data
  */
@@ -112,7 +112,7 @@ alloc_io7(unsigned int pe)
 	int h;
 
 	if (marvel_find_io7(pe)) {
-		printk(KERN_WARNING "IO7 at PE %d already allocated!\n", pe);
+		printk(KERN_WARNING PFX "IO7 at PE %d already allocated!\n", pe);
 		return NULL;
 	}
 
@@ -151,7 +151,7 @@ alloc_io7(unsigned int pe)
 		}
 
 		if (NULL = insp) { /* couldn't insert ?!? */
-			printk(KERN_WARNING "Failed to insert IO7 at PE %d "
+			printk(KERN_WARNING PFX "failed to insert IO7 at PE %d "
 			       " - adding at head of list\n", io7->pe);
 			io7->next = io7_head;
 			io7_head = io7;
@@ -249,10 +249,10 @@ io7_init_hose(struct io7 *io7, int port)
 	hose->mem_space->flags = IORESOURCE_MEM;
 
 	if (request_resource(&ioport_resource, hose->io_space) < 0)
-		printk(KERN_ERR "Failed to request IO on hose %d\n", 
+		printk(KERN_ERR PFX "failed to request IO on hose %d\n", 
 		       hose->index);
 	if (request_resource(&iomem_resource, hose->mem_space) < 0)
-		printk(KERN_ERR "Failed to request MEM on hose %d\n", 
+		printk(KERN_ERR PFX "failed to request MEM on hose %d\n", 
 		       hose->index);
 
 	/*
@@ -318,7 +318,7 @@ io7_init_hose(struct io7 *io7, int port)
 	csrs->POx_CTRL.csr &= ~(1UL << 61);
 
 #if 1
-	printk("FIXME: disabling master aborts\n");
+	printk(KERN_ERR PFX "FIXME: disabling master aborts\n");
 	csrs->POx_MSK_HEI.csr &= ~(3UL << 14);
 #endif
 	/*
@@ -332,7 +332,7 @@ marvel_init_io7(struct io7 *io7)
 {
 	int i;
 
-	printk("Initializing IO7 at PID %d\n", io7->pe);
+	pr_info(PFX "initializing IO7 at PID %d\n", io7->pe);
 
 	/*
 	 * Get the Port 7 CSR pointer.
@@ -361,7 +361,7 @@ marvel_io7_present(gct6_node *node)
 		return;
 
 	pe = (node->id >> 8) & 0xff;
-	printk("Found an IO7 at PID %d\n", pe);
+	pr_info(PFX "found an IO7 at PID %d\n", pe);
 
 	alloc_io7(pe);
 }
@@ -383,7 +383,7 @@ #ifdef CONFIG_VGA_HOSE
 		 *         need to fix this decode when the console 
 		 *         changes its encoding
 		 */
-		printk("console graphics is on hose %d (console)\n", h);
+		pr_info(PFX "console graphics is on hose %d (console)\n", h);
 
 		/*
 		 * The console's hose numbering is:
@@ -399,7 +399,7 @@ #ifdef CONFIG_VGA_HOSE
 			hose = io7->ports[port].hose;
 
 		if (hose) {
-			printk("Console graphics on hose %d\n", hose->index);
+			pr_info(PFX "console graphics on hose %d\n", hose->index);
 			pci_vga_hose = hose;
 		}
 	}
@@ -426,7 +426,7 @@ marvel_specify_io7(char *str)
 	do {
 		pid = simple_strtoul(str, &pchar, 0);
 		if (pchar != str) {
-			printk("User-specified IO7 at PID %lu\n", pid);
+			pr_info(PFX "user-specified IO7 at PID %lu\n", pid);
 			io7 = alloc_io7(pid);
 			if (io7) marvel_init_io7(io7);
 		}
@@ -527,7 +527,7 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 
 	addr = build_conf_addr(hose, bus, devfn, where);
 
-	DBG_CFG(("mk_conf_addr: returning pci_addr 0x%lx\n", addr));
+	DBG_CFG("returning pci_addr 0x%lx\n", addr);
 	return addr;
 }
 
@@ -673,7 +673,7 @@ #endif
 		break;
 
 	default:
-		printk(KERN_WARNING "Illegal RTC port %lx\n", addr);
+		printk(KERN_WARNING PFX "illegal RTC port %lx\n", addr);
 		break;
 	}
 
@@ -759,7 +759,8 @@ #endif
 		    baddr += PAGE_SIZE, vaddr += PAGE_SIZE) {
 			pfn = ptes[baddr >> PAGE_SHIFT];
 			if (!(pfn & 1)) {
-				printk("ioremap failed... pte not valid...\n");
+				printk(KERN_ERR PFX "%s: ioremap failed... pte not valid...\n",
+					__FUNCTION__);
 				vfree(area->addr);
 				return NULL;
 			}
@@ -768,7 +769,7 @@ #endif
 			if (__alpha_remap_area_pages(vaddr,
 						     pfn << PAGE_SHIFT, 
 						     PAGE_SIZE, 0)) {
-				printk("FAILED to map...\n");
+				printk(KERN_ERR PFX "%s: FAILED to map\n", __FUNCTION__);
 				vfree(area->addr);
 				return NULL;
 			}
@@ -930,7 +931,7 @@ marvel_agp_setup(alpha_agp_info *agp)
 				       aper->pg_count - 1);
 
 	if (aper->pg_start < 0) {
-		printk(KERN_ERR "Failed to reserve AGP memory\n");
+		printk(KERN_ERR PFX "failed to reserve AGP memory\n");
 		kfree(aper);
 		return -ENOMEM;
 	}
@@ -951,14 +952,14 @@ marvel_agp_cleanup(alpha_agp_info *agp)
 
 	status = iommu_release(aper->arena, aper->pg_start, aper->pg_count);
 	if (status = -EBUSY) {
-		printk(KERN_WARNING
-		       "Attempted to release bound AGP memory - unbinding\n");
+		printk(KERN_WARNING PFX
+		       "attempted to release bound AGP memory - unbinding\n");
 		iommu_unbind(aper->arena, aper->pg_start, aper->pg_count);
 		status = iommu_release(aper->arena, aper->pg_start, 
 				       aper->pg_count);
 	}
 	if (status < 0)
-		printk(KERN_ERR "Failed to release AGP memory\n");
+		printk(KERN_ERR PFX "failed to release AGP memory\n");
 
 	kfree(aper);
 	kfree(agp);
@@ -1002,8 +1003,8 @@ marvel_agp_configure(alpha_agp_info *agp
 		 * Don't know what this PLL setting is, take the requested
 		 * rate, but warn the user.
 		 */
-		printk("%s: unknown PLL setting RNGB=%lx (PLL6_CTL=%016lx)\n",
-		       __FUNCTION__, IO7_PLL_RNGB(agp_pll), agp_pll);
+		printk(KERN_WARNING PFX "%s: unknown PLL setting RNGB=%lx "
+			"(PLL6_CTL=%016lx)\n", __FUNCTION__, IO7_PLL_RNGB(agp_pll), agp_pll);
 		break;
 	}
 
@@ -1011,7 +1012,7 @@ marvel_agp_configure(alpha_agp_info *agp
 	 * Set the new rate, if necessary.
 	 */
 	if (new_rate) {
-		printk("Requested AGP Rate %dX not compatible "
+		printk(KERN_WARNING PFX "requested AGP rate %dX not compatible "
 		       "with PLL setting - using %dX\n",
 		       agp->mode.bits.rate,
 		       new_rate);
@@ -1019,7 +1020,7 @@ marvel_agp_configure(alpha_agp_info *agp
 		agp->mode.bits.rate = new_rate;
 	}
 		
-	printk("Enabling AGP on hose %d: %dX%s RQ %d\n", 
+	pr_info(PFX "enabling AGP on hose %d: %dX%s RQ %d\n", 
 	       agp->hose->index, agp->mode.bits.rate, 
 	       agp->mode.bits.sba ? " - SBA" : "", agp->mode.bits.rq);
 
@@ -1053,13 +1054,13 @@ marvel_agp_translate(alpha_agp_info *agp
 
 	if (addr < agp->aperture.bus_base ||
 	    addr >= agp->aperture.bus_base + agp->aperture.size) {
-		printk("%s: addr out of range\n", __FUNCTION__);
+		printk(KERN_ERR PFX "%s: addr out of range\n", __FUNCTION__);
 		return -EINVAL;
 	}
 
 	pte = aper->arena->ptes[baddr >> PAGE_SHIFT];
 	if (!(pte & 1)) {
-		printk("%s: pte not valid\n", __FUNCTION__);
+		printk(KERN_ERR PFX "%s: pte not valid\n", __FUNCTION__);
 		return -EINVAL;
 	} 
 	return (pte >> 1) << PAGE_SHIFT;
@@ -1109,7 +1110,7 @@ marvel_agp_info(void)
 	if (!hose || !hose->sg_pci)
 		return NULL;
 
-	printk("MARVEL - using hose %d as AGP\n", hose->index);
+	pr_info(PFX "using hose %d as AGP\n", hose->index);
 
 	/* 
 	 * Get the csrs from the hose.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
