From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:46:26 +0000
Subject: [KJ] [PATCH] 09/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214626.15055.38674.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/core_titan.c b/arch/alpha/kernel/core_titan.c
index 3662fef..7722e4f 100644
--- a/arch/alpha/kernel/core_titan.c
+++ b/arch/alpha/kernel/core_titan.c
@@ -39,14 +39,14 @@ struct
  */
 
 #define DEBUG_CONFIG 0
+#define PFX "pci: titan: "
 
 #if DEBUG_CONFIG
-# define DBG_CFG(args)	printk args
+# define DBG_CFG(fmt, args...)	printk (KERN_DEBUG PFX "%s: " fmt, __FUNCTION__, ## args)
 #else
-# define DBG_CFG(args)
+# define DBG_CFG(fmt, args...)
 #endif
 
-
 /*
  * Routines to access TIG registers.
  */
@@ -113,9 +113,9 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	unsigned long addr;
 	u8 bus = pbus->number;
 
-	DBG_CFG(("mk_conf_addr(bus=%d ,device_fn=0x%x, where=0x%x, "
+	DBG_CFG("(bus=%d ,device_fn=0x%x, where=0x%x, "
 		 "pci_addr=0x%p, type1=0x%p)\n",
-		 bus, device_fn, where, pci_addr, type1));
+		 bus, device_fn, where, pci_addr, type1);
 
 	if (!pbus->parent) /* No parent means peer PCI bus. */
 		bus = 0;
@@ -125,7 +125,7 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	addr |= hose->config_space_base;
 		
 	*pci_addr = addr;
-	DBG_CFG(("mk_conf_addr: returning pci_addr 0x%lx\n", addr));
+	DBG_CFG("returning pci_addr 0x%lx\n", addr);
 	return 0;
 }
 
@@ -276,9 +276,9 @@ titan_init_one_pachip_port(titan_pachip_
 	hose->mem_space->flags = IORESOURCE_MEM;
 
 	if (request_resource(&ioport_resource, hose->io_space) < 0)
-		printk(KERN_ERR "Failed to request IO on hose %d\n", index);
+		printk(KERN_ERR PFX "failed to request IO on hose %d\n", index);
 	if (request_resource(&iomem_resource, hose->mem_space) < 0)
-		printk(KERN_ERR "Failed to request MEM on hose %d\n", index);
+		printk(KERN_ERR PFX "failed to request MEM on hose %d\n", index);
 
 	/*
 	 * Save the existing PCI window translations.  SRM will 
@@ -374,7 +374,7 @@ #ifdef CONFIG_VGA_HOSE
 		}
 
 		if (hose) {
-			printk("Console graphics on hose %d\n", hose->index);
+			pr_info(PFX "console graphics on hose %d\n", hose->index);
 			pci_vga_hose = hose;
 		}
 	}
@@ -384,22 +384,21 @@ #endif /* CONFIG_VGA_HOSE */
 void __init
 titan_init_arch(void)
 {
-#if 0
-	printk("%s: titan_init_arch()\n", __FUNCTION__);
-	printk("%s: CChip registers:\n", __FUNCTION__);
-	printk("%s: CSR_CSC 0x%lx\n", __FUNCTION__, TITAN_cchip->csc.csr);
-	printk("%s: CSR_MTR 0x%lx\n", __FUNCTION__, TITAN_cchip->mtr.csr);
-	printk("%s: CSR_MISC 0x%lx\n", __FUNCTION__, TITAN_cchip->misc.csr);
-	printk("%s: CSR_DIM0 0x%lx\n", __FUNCTION__, TITAN_cchip->dim0.csr);
-	printk("%s: CSR_DIM1 0x%lx\n", __FUNCTION__, TITAN_cchip->dim1.csr);
-	printk("%s: CSR_DIR0 0x%lx\n", __FUNCTION__, TITAN_cchip->dir0.csr);
-	printk("%s: CSR_DIR1 0x%lx\n", __FUNCTION__, TITAN_cchip->dir1.csr);
-	printk("%s: CSR_DRIR 0x%lx\n", __FUNCTION__, TITAN_cchip->drir.csr);
-
-	printk("%s: DChip registers:\n", __FUNCTION__);
-	printk("%s: CSR_DSC 0x%lx\n", __FUNCTION__, TITAN_dchip->dsc.csr);
-	printk("%s: CSR_STR 0x%lx\n", __FUNCTION__, TITAN_dchip->str.csr);
-	printk("%s: CSR_DREV 0x%lx\n", __FUNCTION__, TITAN_dchip->drev.csr);
+#ifdef DEBUG_CONFIG
+	pr_info(PFX "%s: CChip registers:\n", __FUNCTION__);
+	pr_info(PFX "%s: CSR_CSC 0x%lx\n", __FUNCTION__, TITAN_cchip->csc.csr);
+	pr_info(PFX "%s: CSR_MTR 0x%lx\n", __FUNCTION__, TITAN_cchip->mtr.csr);
+	pr_info(PFX "%s: CSR_MISC 0x%lx\n", __FUNCTION__, TITAN_cchip->misc.csr);
+	pr_info(PFX "%s: CSR_DIM0 0x%lx\n", __FUNCTION__, TITAN_cchip->dim0.csr);
+	pr_info(PFX "%s: CSR_DIM1 0x%lx\n", __FUNCTION__, TITAN_cchip->dim1.csr);
+	pr_info(PFX "%s: CSR_DIR0 0x%lx\n", __FUNCTION__, TITAN_cchip->dir0.csr);
+	pr_info(PFX "%s: CSR_DIR1 0x%lx\n", __FUNCTION__, TITAN_cchip->dir1.csr);
+	pr_info(PFX "%s: CSR_DRIR 0x%lx\n", __FUNCTION__, TITAN_cchip->drir.csr);
+
+	pr_info(PFX "%s: DChip registers:\n", __FUNCTION__);
+	pr_info(PFX "%s: CSR_DSC 0x%lx\n", __FUNCTION__, TITAN_dchip->dsc.csr);
+	pr_info(PFX "%s: CSR_STR 0x%lx\n", __FUNCTION__, TITAN_dchip->str.csr);
+	pr_info(PFX "%s: CSR_DREV 0x%lx\n", __FUNCTION__, TITAN_dchip->drev.csr);
 #endif
 
 	boot_cpuid = __hard_smp_processor_id();
@@ -530,7 +529,8 @@ #endif
 		    baddr += PAGE_SIZE, vaddr += PAGE_SIZE) {
 			pfn = ptes[baddr >> PAGE_SHIFT];
 			if (!(pfn & 1)) {
-				printk("ioremap failed... pte not valid...\n");
+				printk(KERN_ERR PFX "%s: ioremap failed... pte not valid...\n",
+					__FUNCTION__);
 				vfree(area->addr);
 				return NULL;
 			}
@@ -539,7 +539,7 @@ #endif
 			if (__alpha_remap_area_pages(vaddr,
 						     pfn << PAGE_SHIFT, 
 						     PAGE_SIZE, 0)) {
-				printk("FAILED to map...\n");
+				printk(KERN_ERR PFX "%s: FAILED to map...\n", __FUNCTION__);
 				vfree(area->addr);
 				return NULL;
 			}
@@ -610,7 +610,7 @@ titan_agp_setup(alpha_agp_info *agp)
 	aper->pg_start = iommu_reserve(aper->arena, aper->pg_count,
 				       aper->pg_count - 1);
 	if (aper->pg_start < 0) {
-		printk(KERN_ERR "Failed to reserve AGP memory\n");
+		printk(KERN_ERR PFX "failed to reserve AGP memory\n");
 		kfree(aper);
 		return -ENOMEM;
 	}
@@ -631,14 +631,14 @@ titan_agp_cleanup(alpha_agp_info *agp)
 
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
@@ -673,7 +673,7 @@ #endif
 	pctl.pctl_r_bits.apctl_v_agp_en = agp->mode.bits.enable;
 
 	/* Tell the user.  */
-	printk("Enabling AGP: %dX%s\n", 
+	pr_info(PFX "enabling AGP: %dX%s\n",
 	       1 << pctl.pctl_r_bits.apctl_v_agp_rate,
 	       pctl.pctl_r_bits.apctl_v_agp_sba_en ? " - SBA" : "");
 	       
@@ -711,13 +711,13 @@ titan_agp_translate(alpha_agp_info *agp,
 
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
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
