From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:46:33 +0000
Subject: [KJ] [PATCH] 10/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214633.15055.14801.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/core_tsunami.c b/arch/alpha/kernel/core_tsunami.c
index 8aa305b..0632181 100644
--- a/arch/alpha/kernel/core_tsunami.c
+++ b/arch/alpha/kernel/core_tsunami.c
@@ -43,14 +43,14 @@ struct 
  */
 
 #define DEBUG_CONFIG 0
+#define PFX "pci: tsunami: "
 
 #if DEBUG_CONFIG
-# define DBG_CFG(args)	printk args
+# define DBG_CFG(fmt, args...)	printk (KERN_DEBUG PFX "%s: " fmt, __FUNCTION__, ## args)
 #else
-# define DBG_CFG(args)
+# define DBG_CFG(fmt, args...)
 #endif
 
-
 /*
  * Given a bus, device, and function number, compute resulting
  * configuration space address
@@ -93,9 +93,8 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	unsigned long addr;
 	u8 bus = pbus->number;
 
-	DBG_CFG(("mk_conf_addr(bus=%d ,device_fn=0x%x, where=0x%x, "
-		 "pci_addr=0x%p, type1=0x%p)\n",
-		 bus, device_fn, where, pci_addr, type1));
+	DBG_CFG("(bus=%d ,device_fn=0x%x, where=0x%x, pci_addr=0x%p, type1=0x%p)\n",
+		 bus, device_fn, where, pci_addr, type1);
 	
 	if (!pbus->parent) /* No parent means peer PCI bus. */
 		bus = 0;
@@ -105,7 +104,7 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	addr |= hose->config_space_base;
 		
 	*pci_addr = addr;
-	DBG_CFG(("mk_conf_addr: returning pci_addr 0x%lx\n", addr));
+	DBG_CFG("returning pci_addr 0x%lx\n", addr);
 	return 0;
 }
 
@@ -211,7 +210,7 @@ tsunami_probe_read(volatile unsigned lon
 	mcheck_taken(cpu) = 0;
 	setipl(s);
 
-	printk("dont_care = 0x%lx\n", dont_care);
+	printk(KERN_DEBUG PFX "dont_care = 0x%lx\n", dont_care);
 
 	return probe_result;
 }
@@ -229,7 +228,7 @@ tsunami_probe_write(volatile unsigned lo
 		int source = (TSUNAMI_cchip->misc.csr >> 29) & 7;
 		TSUNAMI_cchip->misc.csr |= (1L << 28); /* ...and unlock NXS. */
 		probe_result = 0;
-		printk("tsunami_probe_write: unit %d at 0x%016lx\n", source,
+		pr_info(PFX "unit %d at 0x%016lx\n", source,
 		       (unsigned long)vaddr);
 	}
 	if (probe_result)
@@ -281,9 +280,9 @@ tsunami_init_one_pchip(tsunami_pchip *pc
 	hose->mem_space->flags = IORESOURCE_MEM;
 
 	if (request_resource(&ioport_resource, hose->io_space) < 0)
-		printk(KERN_ERR "Failed to request IO on hose %d\n", index);
+		printk(KERN_ERR PFX "failed to request IO on hose %d\n", index);
 	if (request_resource(&iomem_resource, hose->mem_space) < 0)
-		printk(KERN_ERR "Failed to request MEM on hose %d\n", index);
+		printk(KERN_ERR PFX "failed to request MEM on hose %d\n", index);
 
 	/*
 	 * Save the existing PCI window translations.  SRM will 
@@ -362,27 +361,27 @@ #ifdef NXM_MACHINE_CHECKS_ON_TSUNAMI
 	/* NXMs just don't matter to Tsunami--unless they make it
 	   choke completely. */
 	tmp = (unsigned long)(TSUNAMI_cchip - 1);
-	printk("%s: probing bogus address:  0x%016lx\n", FN, bogus_addr);
-	printk("\tprobe %s\n",
+	pr_info(PFX "%s: probing bogus address:  0x%016lx\n", FN, bogus_addr);
+	pr_info(PFX "\tprobe %s\n",
 	       tsunami_probe_write((unsigned long *)bogus_addr)
 	       ? "succeeded" : "failed");
 #endif /* NXM_MACHINE_CHECKS_ON_TSUNAMI */
 
-#if 0
-	printk("%s: CChip registers:\n", FN);
-	printk("%s: CSR_CSC 0x%lx\n", FN, TSUNAMI_cchip->csc.csr);
-	printk("%s: CSR_MTR 0x%lx\n", FN, TSUNAMI_cchip.mtr.csr);
-	printk("%s: CSR_MISC 0x%lx\n", FN, TSUNAMI_cchip->misc.csr);
-	printk("%s: CSR_DIM0 0x%lx\n", FN, TSUNAMI_cchip->dim0.csr);
-	printk("%s: CSR_DIM1 0x%lx\n", FN, TSUNAMI_cchip->dim1.csr);
-	printk("%s: CSR_DIR0 0x%lx\n", FN, TSUNAMI_cchip->dir0.csr);
-	printk("%s: CSR_DIR1 0x%lx\n", FN, TSUNAMI_cchip->dir1.csr);
-	printk("%s: CSR_DRIR 0x%lx\n", FN, TSUNAMI_cchip->drir.csr);
-
-	printk("%s: DChip registers:\n");
-	printk("%s: CSR_DSC 0x%lx\n", FN, TSUNAMI_dchip->dsc.csr);
-	printk("%s: CSR_STR 0x%lx\n", FN, TSUNAMI_dchip->str.csr);
-	printk("%s: CSR_DREV 0x%lx\n", FN, TSUNAMI_dchip->drev.csr);
+#ifdef DEBUG_CONFIG
+	pr_info(PFX "%s: CChip registers:\n", FN);
+	pr_info(PFX "%s: CSR_CSC 0x%lx\n", FN, TSUNAMI_cchip->csc.csr);
+	pr_info(PFX "%s: CSR_MTR 0x%lx\n", FN, TSUNAMI_cchip.mtr.csr);
+	pr_info(PFX "%s: CSR_MISC 0x%lx\n", FN, TSUNAMI_cchip->misc.csr);
+	pr_info(PFX "%s: CSR_DIM0 0x%lx\n", FN, TSUNAMI_cchip->dim0.csr);
+	pr_info(PFX "%s: CSR_DIM1 0x%lx\n", FN, TSUNAMI_cchip->dim1.csr);
+	pr_info(PFX "%s: CSR_DIR0 0x%lx\n", FN, TSUNAMI_cchip->dir0.csr);
+	pr_info(PFX "%s: CSR_DIR1 0x%lx\n", FN, TSUNAMI_cchip->dir1.csr);
+	pr_info(PFX "%s: CSR_DRIR 0x%lx\n", FN, TSUNAMI_cchip->drir.csr);
+
+	pr_info(PFX "%s: DChip registers:\n");
+	pr_info(PFX "%s: CSR_DSC 0x%lx\n", FN, TSUNAMI_dchip->dsc.csr);
+	pr_info(PFX "%s: CSR_STR 0x%lx\n", FN, TSUNAMI_dchip->str.csr);
+	pr_info(PFX "%s: CSR_DREV 0x%lx\n", FN, TSUNAMI_dchip->drev.csr);
 #endif
 	/* With multiple PCI busses, we play with I/O as physical addrs.  */
 	ioport_resource.end = ~0UL;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
