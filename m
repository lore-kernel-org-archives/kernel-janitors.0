From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:46:39 +0000
Subject: [KJ] [PATCH] 11/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214639.15055.57834.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/core_wildfire.c b/arch/alpha/kernel/core_wildfire.c
index 2b767a1..0730b36 100644
--- a/arch/alpha/kernel/core_wildfire.c
+++ b/arch/alpha/kernel/core_wildfire.c
@@ -25,11 +25,12 @@ #include "pci_impl.h"
 #define DEBUG_CONFIG 0
 #define DEBUG_DUMP_REGS 0
 #define DEBUG_DUMP_CONFIG 1
+#define PFX "pci: wildfire: "
 
 #if DEBUG_CONFIG
-# define DBG_CFG(args)	printk args
+# define DBG_CFG(fmt, args...)	printk (KERN_DEBUG PFX "%s: " fmt, __FUNCTION__, ## args)
 #else
-# define DBG_CFG(args)
+# define DBG_CFG(fmt, args...)
 #endif
 
 #if DEBUG_DUMP_REGS
@@ -88,10 +89,10 @@ wildfire_init_hose(int qbbno, int hoseno
 	hose->mem_space->flags = IORESOURCE_MEM;
 
 	if (request_resource(&ioport_resource, hose->io_space) < 0)
-		printk(KERN_ERR "Failed to request IO on qbb %d hose %d\n",
+		printk(KERN_ERR PFX "failed to request IO on qbb %d hose %d\n",
 		       qbbno, hoseno);
 	if (request_resource(&iomem_resource, hose->mem_space) < 0)
-		printk(KERN_ERR "Failed to request MEM on qbb %d hose %d\n",
+		printk(KERN_ERR PFX "failed to request MEM on qbb %d hose %d\n",
 		       qbbno, hoseno);
 
 #if DEBUG_DUMP_REGS
@@ -360,9 +361,9 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	unsigned long addr;
 	u8 bus = pbus->number;
 
-	DBG_CFG(("mk_conf_addr(bus=%d ,device_fn=0x%x, where=0x%x, "
+	DBG_CFG("(bus=%d ,device_fn=0x%x, where=0x%x, "
 		 "pci_addr=0x%p, type1=0x%p)\n",
-		 bus, device_fn, where, pci_addr, type1));
+		 bus, device_fn, where, pci_addr, type1);
 
 	if (!pbus->parent) /* No parent means peer PCI bus. */
 		bus = 0;
@@ -372,7 +373,7 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	addr |= hose->config_space_base;
 		
 	*pci_addr = addr;
-	DBG_CFG(("mk_conf_addr: returning pci_addr 0x%lx\n", addr));
+	DBG_CFG("returning pci_addr 0x%lx\n", addr);
 	return 0;
 }
 
@@ -473,27 +474,24 @@ wildfire_dump_pci_regs(int qbbno, int ho
 	wildfire_pci *pci = WILDFIRE_pci(qbbno, hoseno);
 	int i;
 
-	printk(KERN_ERR "PCI registers for QBB %d hose %d (%p)\n",
-	       qbbno, hoseno, pci);
+	pr_info(PFX "PCI registers for QBB %d hose %d (%p)\n", qbbno, hoseno, pci);
 
-	printk(KERN_ERR " PCI_IO_ADDR_EXT: 0x%16lx\n",
-	       pci->pci_io_addr_ext.csr);
-	printk(KERN_ERR " PCI_CTRL:        0x%16lx\n", pci->pci_ctrl.csr);
-	printk(KERN_ERR " PCI_ERR_SUM:     0x%16lx\n", pci->pci_err_sum.csr);
-	printk(KERN_ERR " PCI_ERR_ADDR:    0x%16lx\n", pci->pci_err_addr.csr);
-	printk(KERN_ERR " PCI_STALL_CNT:   0x%16lx\n", pci->pci_stall_cnt.csr);
-	printk(KERN_ERR " PCI_PEND_INT:    0x%16lx\n", pci->pci_pend_int.csr);
-	printk(KERN_ERR " PCI_SENT_INT:    0x%16lx\n", pci->pci_sent_int.csr);
+	pr_info(PFX "PCI_IO_ADDR_EXT: 0x%16lx\n", pci->pci_io_addr_ext.csr);
+	pr_info(PFX "PCI_CTRL:        0x%16lx\n", pci->pci_ctrl.csr);
+	pr_info(PFX "PCI_ERR_SUM:     0x%16lx\n", pci->pci_err_sum.csr);
+	pr_info(PFX "PCI_ERR_ADDR:    0x%16lx\n", pci->pci_err_addr.csr);
+	pr_info(PFX "PCI_STALL_CNT:   0x%16lx\n", pci->pci_stall_cnt.csr);
+	pr_info(PFX "PCI_PEND_INT:    0x%16lx\n", pci->pci_pend_int.csr);
+	pr_info(PFX "PCI_SENT_INT:    0x%16lx\n", pci->pci_sent_int.csr);
 
-	printk(KERN_ERR " DMA window registers for QBB %d hose %d (%p)\n",
+	pr_info(PFX " DMA window registers for QBB %d hose %d (%p)\n",
 	       qbbno, hoseno, pci);
 	for (i = 0; i < 4; i++) {
-		printk(KERN_ERR "  window %d: 0x%16lx 0x%16lx 0x%16lx\n", i,
+		pr_info(PFX "window %d: 0x%16lx 0x%16lx 0x%16lx\n", i,
 		       pci->pci_window[i].wbase.csr,
 		       pci->pci_window[i].wmask.csr,
 		       pci->pci_window[i].tbase.csr);
 	}
-	printk(KERN_ERR "\n");
 }
 
 static void __init
@@ -502,25 +500,24 @@ wildfire_dump_pca_regs(int qbbno, int pc
 	wildfire_pca *pca = WILDFIRE_pca(qbbno, pcano);
 	int i;
 
-	printk(KERN_ERR "PCA registers for QBB %d PCA %d (%p)\n",
+	pr_info(PFX "PCA registers for QBB %d PCA %d (%p)\n",
 	       qbbno, pcano, pca);
 
-	printk(KERN_ERR " PCA_WHAT_AM_I: 0x%16lx\n", pca->pca_what_am_i.csr);
-	printk(KERN_ERR " PCA_ERR_SUM:   0x%16lx\n", pca->pca_err_sum.csr);
-	printk(KERN_ERR " PCA_PEND_INT:  0x%16lx\n", pca->pca_pend_int.csr);
-	printk(KERN_ERR " PCA_SENT_INT:  0x%16lx\n", pca->pca_sent_int.csr);
-	printk(KERN_ERR " PCA_STDIO_EL:  0x%16lx\n",
+	pr_info(PFX "PCA_WHAT_AM_I: 0x%16lx\n", pca->pca_what_am_i.csr);
+	pr_info(PFX "PCA_ERR_SUM:   0x%16lx\n", pca->pca_err_sum.csr);
+	pr_info(PFX "PCA_PEND_INT:  0x%16lx\n", pca->pca_pend_int.csr);
+	pr_info(PFX "PCA_SENT_INT:  0x%16lx\n", pca->pca_sent_int.csr);
+	pr_info(PFX "PCA_STDIO_EL:  0x%16lx\n",
 	       pca->pca_stdio_edge_level.csr);
 
-	printk(KERN_ERR " PCA target registers for QBB %d PCA %d (%p)\n",
+	pr_info(PFX "PCA target registers for QBB %d PCA %d (%p)\n",
 	       qbbno, pcano, pca);
 	for (i = 0; i < 4; i++) {
-	  printk(KERN_ERR "  target %d: 0x%16lx 0x%16lx\n", i,
+	  pr_info(PFX "target %d: 0x%16lx 0x%16lx\n", i,
 		       pca->pca_int[i].target.csr,
 		       pca->pca_int[i].enable.csr);
 	}
 
-	printk(KERN_ERR "\n");
 }
 
 static void __init
@@ -529,21 +526,20 @@ wildfire_dump_qsa_regs(int qbbno)
 	wildfire_qsa *qsa = WILDFIRE_qsa(qbbno);
 	int i;
 
-	printk(KERN_ERR "QSA registers for QBB %d (%p)\n", qbbno, qsa);
+	pr_info(PFX "QSA registers for QBB %d (%p)\n", qbbno, qsa);
 
-	printk(KERN_ERR " QSA_QBB_ID:      0x%16lx\n", qsa->qsa_qbb_id.csr);
-	printk(KERN_ERR " QSA_PORT_ENA:    0x%16lx\n", qsa->qsa_port_ena.csr);
-	printk(KERN_ERR " QSA_REF_INT:     0x%16lx\n", qsa->qsa_ref_int.csr);
+	pr_info(PFX "QSA_QBB_ID:      0x%16lx\n", qsa->qsa_qbb_id.csr);
+	pr_info(PFX "QSA_PORT_ENA:    0x%16lx\n", qsa->qsa_port_ena.csr);
+	pr_info(PFX "QSA_REF_INT:     0x%16lx\n", qsa->qsa_ref_int.csr);
 
 	for (i = 0; i < 5; i++)
-		printk(KERN_ERR " QSA_CONFIG_%d:    0x%16lx\n",
+		pr_info(PFX "QSA_CONFIG_%d:    0x%16lx\n",
 		       i, qsa->qsa_config[i].csr);
 
 	for (i = 0; i < 2; i++)
-		printk(KERN_ERR " QSA_QBB_POP_%d:   0x%16lx\n",
+		pr_info(PFX "QSA_QBB_POP_%d:   0x%16lx\n",
 		       i, qsa->qsa_qbb_pop[0].csr);
 
-	printk(KERN_ERR "\n");
 }
 
 static void __init
@@ -551,24 +547,16 @@ wildfire_dump_qsd_regs(int qbbno)
 {
 	wildfire_qsd *qsd = WILDFIRE_qsd(qbbno);
 
-	printk(KERN_ERR "QSD registers for QBB %d (%p)\n", qbbno, qsd);
-
-	printk(KERN_ERR " QSD_WHAMI:         0x%16lx\n", qsd->qsd_whami.csr);
-	printk(KERN_ERR " QSD_REV:           0x%16lx\n", qsd->qsd_rev.csr);
-	printk(KERN_ERR " QSD_PORT_PRESENT:  0x%16lx\n",
-	       qsd->qsd_port_present.csr);
-	printk(KERN_ERR " QSD_PORT_ACTUVE:   0x%16lx\n",
-	       qsd->qsd_port_active.csr);
-	printk(KERN_ERR " QSD_FAULT_ENA:     0x%16lx\n",
-	       qsd->qsd_fault_ena.csr);
-	printk(KERN_ERR " QSD_CPU_INT_ENA:   0x%16lx\n",
-	       qsd->qsd_cpu_int_ena.csr);
-	printk(KERN_ERR " QSD_MEM_CONFIG:    0x%16lx\n",
-	       qsd->qsd_mem_config.csr);
-	printk(KERN_ERR " QSD_ERR_SUM:       0x%16lx\n",
-	       qsd->qsd_err_sum.csr);
-
-	printk(KERN_ERR "\n");
+	pr_info(PFX "QSD registers for QBB %d (%p)\n", qbbno, qsd);
+
+	pr_info(PFX "QSD_WHAMI:         0x%16lx\n", qsd->qsd_whami.csr);
+	pr_info(PFX "QSD_REV:           0x%16lx\n", qsd->qsd_rev.csr);
+	pr_info(PFX "QSD_PORT_PRESENT:  0x%16lx\n", qsd->qsd_port_present.csr);
+	pr_info(PFX "QSD_PORT_ACTUVE:   0x%16lx\n", qsd->qsd_port_active.csr);
+	pr_info(PFX "QSD_FAULT_ENA:     0x%16lx\n", qsd->qsd_fault_ena.csr);
+	pr_info(PFX "QSD_CPU_INT_ENA:   0x%16lx\n", qsd->qsd_cpu_int_ena.csr);
+	pr_info(PFX "QSD_MEM_CONFIG:    0x%16lx\n", qsd->qsd_mem_config.csr);
+	pr_info(PFX "QSD_ERR_SUM:       0x%16lx\n", qsd->qsd_err_sum.csr);
 }
 
 static void __init
@@ -577,23 +565,19 @@ wildfire_dump_iop_regs(int qbbno)
 	wildfire_iop *iop = WILDFIRE_iop(qbbno);
 	int i;
 
-	printk(KERN_ERR "IOP registers for QBB %d (%p)\n", qbbno, iop);
+	pr_info(PFX "IOP registers for QBB %d (%p)\n", qbbno, iop);
 
-	printk(KERN_ERR " IOA_CONFIG:          0x%16lx\n", iop->ioa_config.csr);
-	printk(KERN_ERR " IOD_CONFIG:          0x%16lx\n", iop->iod_config.csr);
-	printk(KERN_ERR " IOP_SWITCH_CREDITS:  0x%16lx\n",
-	       iop->iop_switch_credits.csr);
-	printk(KERN_ERR " IOP_HOSE_CREDITS:    0x%16lx\n",
-	       iop->iop_hose_credits.csr);
+	pr_info(PFX "IOA_CONFIG:          0x%16lx\n", iop->ioa_config.csr);
+	pr_info(PFX "IOD_CONFIG:          0x%16lx\n", iop->iod_config.csr);
+	pr_info(PFX "IOP_SWITCH_CREDITS:  0x%16lx\n", iop->iop_switch_credits.csr);
+	pr_info(PFX "IOP_HOSE_CREDITS:    0x%16lx\n", iop->iop_hose_credits.csr);
 
 	for (i = 0; i < 4; i++) 
-		printk(KERN_ERR " IOP_HOSE_%d_INIT:     0x%16lx\n",
+		pr_info(PFX "IOP_HOSE_%d_INIT:     0x%16lx\n",
 		       i, iop->iop_hose[i].init.csr);
 	for (i = 0; i < 4; i++) 
-		printk(KERN_ERR " IOP_DEV_INT_TARGET_%d: 0x%16lx\n",
+		pr_info(PFX "IOP_DEV_INT_TARGET_%d: 0x%16lx\n",
 		       i, iop->iop_dev_int[i].target.csr);
-
-	printk(KERN_ERR "\n");
 }
 
 static void __init
@@ -602,20 +586,17 @@ wildfire_dump_gp_regs(int qbbno)
 	wildfire_gp *gp = WILDFIRE_gp(qbbno);
 	int i;
 
-	printk(KERN_ERR "GP registers for QBB %d (%p)\n", qbbno, gp);
+	pr_info(PFX "GP registers for QBB %d (%p)\n", qbbno, gp);
 	for (i = 0; i < 4; i++) 
-		printk(KERN_ERR " GPA_QBB_MAP_%d:     0x%16lx\n",
+		printk(KERN_ERR "GPA_QBB_MAP_%d:     0x%16lx\n",
 		       i, gp->gpa_qbb_map[i].csr);
 
-	printk(KERN_ERR " GPA_MEM_POP_MAP:   0x%16lx\n",
-	       gp->gpa_mem_pop_map.csr);
-	printk(KERN_ERR " GPA_SCRATCH:       0x%16lx\n", gp->gpa_scratch.csr);
-	printk(KERN_ERR " GPA_DIAG:          0x%16lx\n", gp->gpa_diag.csr);
-	printk(KERN_ERR " GPA_CONFIG_0:      0x%16lx\n", gp->gpa_config_0.csr);
-	printk(KERN_ERR " GPA_INIT_ID:       0x%16lx\n", gp->gpa_init_id.csr);
-	printk(KERN_ERR " GPA_CONFIG_2:      0x%16lx\n", gp->gpa_config_2.csr);
-
-	printk(KERN_ERR "\n");
+	pr_info(PFX "GPA_MEM_POP_MAP:   0x%16lx\n", gp->gpa_mem_pop_map.csr);
+	pr_info(PFX "GPA_SCRATCH:       0x%16lx\n", gp->gpa_scratch.csr);
+	pr_info(PFX "GPA_DIAG:          0x%16lx\n", gp->gpa_diag.csr);
+	pr_info(PFX "GPA_CONFIG_0:      0x%16lx\n", gp->gpa_config_0.csr);
+	pr_info(PFX "GPA_INIT_ID:       0x%16lx\n", gp->gpa_init_id.csr);
+	pr_info(PFX "GPA_CONFIG_2:      0x%16lx\n", gp->gpa_config_2.csr);
 }
 #endif /* DUMP_REGS */
 
@@ -625,21 +606,21 @@ wildfire_dump_hardware_config(void)
 {
 	int i;
 
-	printk(KERN_ERR "Probed Hardware Configuration\n");
+	pr_info(PFX "Probed Hardware Configuration\n");
 
-	printk(KERN_ERR " hard_qbb_mask:  0x%16lx\n", wildfire_hard_qbb_mask);
-	printk(KERN_ERR " soft_qbb_mask:  0x%16lx\n", wildfire_soft_qbb_mask);
+	pr_info(PFX "hard_qbb_mask:  0x%16lx\n", wildfire_hard_qbb_mask);
+	pr_info(PFX "soft_qbb_mask:  0x%16lx\n", wildfire_soft_qbb_mask);
 
-	printk(KERN_ERR " gp_mask:        0x%16lx\n", wildfire_gp_mask);
-	printk(KERN_ERR " hs_mask:        0x%16lx\n", wildfire_hs_mask);
-	printk(KERN_ERR " iop_mask:       0x%16lx\n", wildfire_iop_mask);
-	printk(KERN_ERR " ior_mask:       0x%16lx\n", wildfire_ior_mask);
-	printk(KERN_ERR " pca_mask:       0x%16lx\n", wildfire_pca_mask);
+	pr_info(PFX "gp_mask:        0x%16lx\n", wildfire_gp_mask);
+	pr_info(PFX "hs_mask:        0x%16lx\n", wildfire_hs_mask);
+	pr_info(PFX "iop_mask:       0x%16lx\n", wildfire_iop_mask);
+	pr_info(PFX "ior_mask:       0x%16lx\n", wildfire_ior_mask);
+	pr_info(PFX "pca_mask:       0x%16lx\n", wildfire_pca_mask);
 
-	printk(KERN_ERR " cpu_mask:       0x%16lx\n", wildfire_cpu_mask);
-	printk(KERN_ERR " mem_mask:       0x%16lx\n", wildfire_mem_mask);
+	pr_info(PFX "cpu_mask:       0x%16lx\n", wildfire_cpu_mask);
+	pr_info(PFX "mem_mask:       0x%16lx\n", wildfire_mem_mask);
 
-	printk(" hard_qbb_map: ");
+	pr_info(PFX "hard_qbb_map: ");
 	for (i = 0; i < WILDFIRE_MAX_QBB; i++)
 	    if (wildfire_hard_qbb_map[i] = QBB_MAP_EMPTY)
 		printk("--- ");
@@ -647,7 +628,7 @@ wildfire_dump_hardware_config(void)
 		printk("%3d ", wildfire_hard_qbb_map[i]);
 	printk("\n");
 
-	printk(" soft_qbb_map: ");
+	pr_info(PFX "soft_qbb_map: ");
 	for (i = 0; i < WILDFIRE_MAX_QBB; i++)
 	    if (wildfire_soft_qbb_map[i] = QBB_MAP_EMPTY)
 		printk("--- ");
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
