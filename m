From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:46:05 +0000
Subject: [KJ] [PATCH] 06/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214605.15055.80724.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/core_mcpcia.c b/arch/alpha/kernel/core_mcpcia.c
index 28849c8..e6c6be9 100644
--- a/arch/alpha/kernel/core_mcpcia.c
+++ b/arch/alpha/kernel/core_mcpcia.c
@@ -32,12 +32,13 @@ #include "pci_impl.h"
  * BIOS32-style PCI interface:
  */
 
-#define DEBUG_CFG 0
+#define DEBUG_CONFIG 0
+#define PFX "pci: mcpcia: "
 
-#if DEBUG_CFG
-# define DBG_CFG(args)	printk args
+#if DEBUG_CONFIG
+# define DBG_CFG(fmt, args...)	printk (KERN_DEBUG PFX "%s: " fmt, __FUNCTION__, ## args)
 #else
-# define DBG_CFG(args)
+# define DBG_CFG(fmt, args...)
 #endif
 
 #define MCPCIA_MAX_HOSES 4
@@ -96,15 +97,15 @@ conf_read(unsigned long addr, unsigned c
 
 	local_irq_save(flags);
 
-	DBG_CFG(("conf_read(addr=0x%lx, type1=%d, hose=%d)\n",
-		 addr, type1, mid));
+	DBG_CFG("(addr=0x%lx, type1=%d, hose=%d)\n",
+		 addr, type1, mid);
 
 	/* Reset status register to avoid losing errors.  */
 	stat0 = *(vuip)MCPCIA_CAP_ERR(mid);
 	*(vuip)MCPCIA_CAP_ERR(mid) = stat0;
 	mb();
 	temp = *(vuip)MCPCIA_CAP_ERR(mid);
-	DBG_CFG(("conf_read: MCPCIA_CAP_ERR(%d) was 0x%x\n", mid, stat0));
+	DBG_CFG("MCPCIA_CAP_ERR(%d) was 0x%x\n", mid, stat0);
 
 	mb();
 	draina();
@@ -126,7 +127,7 @@ conf_read(unsigned long addr, unsigned c
 	mcheck_expected(cpu) = 0;
 	mb();
 
-	DBG_CFG(("conf_read(): finished\n"));
+	DBG_CFG("finished\n");
 
 	local_irq_restore(flags);
 	return value;
@@ -148,7 +149,7 @@ conf_write(unsigned long addr, unsigned 
 	stat0 = *(vuip)MCPCIA_CAP_ERR(mid);
 	*(vuip)MCPCIA_CAP_ERR(mid) = stat0; mb();
 	temp = *(vuip)MCPCIA_CAP_ERR(mid);
-	DBG_CFG(("conf_write: MCPCIA CAP_ERR(%d) was 0x%x\n", mid, stat0));
+	DBG_CFG("MCPCIA_CAP_ERR(%d) was 0x%x\n", mid, stat0);
 
 	draina();
 	mcheck_expected(cpu) = 1;
@@ -163,7 +164,7 @@ conf_write(unsigned long addr, unsigned 
 	mcheck_expected(cpu) = 0;
 	mb();
 
-	DBG_CFG(("conf_write(): finished\n"));
+	DBG_CFG("finished\n");
 	local_irq_restore(flags);
 }
 
@@ -175,9 +176,8 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	u8 bus = pbus->number;
 	unsigned long addr;
 
-	DBG_CFG(("mk_conf_addr(bus=%d,devfn=0x%x,hose=%d,where=0x%x,"
-		 " pci_addr=0x%p, type1=0x%p)\n",
-		 bus, devfn, hose->index, where, pci_addr, type1));
+	DBG_CFG("(bus=%d,devfn=0x%x,hose=%d,where=0x%x, pci_addr=0x%p, type1=0x%p)\n",
+		 bus, devfn, hose->index, where, pci_addr, type1);
 
 	/* Type 1 configuration cycle for *ALL* busses.  */
 	*type1 = 1;
@@ -189,7 +189,7 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	addr |= hose->config_space_base;
 
 	*pci_addr = addr;
-	DBG_CFG(("mk_conf_addr: returning pci_addr 0x%lx\n", addr));
+	DBG_CFG("returning pci_addr 0x%lx\n", addr);
 	return 0;
 }
 
@@ -325,11 +325,11 @@ mcpcia_new_hose(int h)
 	hae_mem->flags = IORESOURCE_MEM;
 
 	if (request_resource(&ioport_resource, io) < 0)
-		printk(KERN_ERR "Failed to request IO on hose %d\n", h);
+		printk(KERN_ERR PFX "failed to request IO on hose %d\n", h);
 	if (request_resource(&iomem_resource, mem) < 0)
-		printk(KERN_ERR "Failed to request MEM on hose %d\n", h);
+		printk(KERN_ERR PFX "failed to request MEM on hose %d\n", h);
 	if (request_resource(mem, hae_mem) < 0)
-		printk(KERN_ERR "Failed to request HAE_MEM on hose %d\n", h);
+		printk(KERN_ERR PFX "failed to request HAE_MEM on hose %d\n", h);
 }
 
 static void
@@ -433,7 +433,7 @@ mcpcia_init_hoses(void)
 		}
 	}
 
-	printk("mcpcia_init_hoses: found %d hoses\n", hose_count);
+	pr_info(PFX "found %d hoses\n", hose_count);
 
 	/* Now do init for each hose.  */
 	for (hose = hose_head; hose; hose = hose->next)
@@ -450,65 +450,65 @@ mcpcia_print_uncorrectable(struct el_MCP
 
 	/* Print PAL fields */
 	for (i = 0; i < 24; i += 2) {
-		printk("  paltmp[%d-%d] = %16lx %16lx\n",
+		printk(KERN_ERR PFX "paltmp[%d-%d] = %16lx %16lx\n",
 		       i, i+1, frame->paltemp[i], frame->paltemp[i+1]);
 	}
 	for (i = 0; i < 8; i += 2) {
-		printk("  shadow[%d-%d] = %16lx %16lx\n",
+		printk(KERN_ERR PFX "shadow[%d-%d] = %16lx %16lx\n",
 		       i, i+1, frame->shadow[i], 
 		       frame->shadow[i+1]);
 	}
-	printk("  Addr of excepting instruction  = %16lx\n",
+	printk(KERN_ERR PFX "addr of excepting instruction  = %16lx\n",
 	       frame->exc_addr);
-	printk("  Summary of arithmetic traps    = %16lx\n",
+	printk(KERN_ERR PFX "summary of arithmetic traps    = %16lx\n",
 	       frame->exc_sum);
-	printk("  Exception mask                 = %16lx\n",
+	printk(KERN_ERR PFX "exception mask                 = %16lx\n",
 	       frame->exc_mask);
-	printk("  Base address for PALcode       = %16lx\n",
+	printk(KERN_ERR PFX "base address for PALcode       = %16lx\n",
 	       frame->pal_base);
-	printk("  Interrupt Status Reg           = %16lx\n",
+	printk(KERN_ERR PFX "Interrupt Status Reg           = %16lx\n",
 	       frame->isr);
-	printk("  CURRENT SETUP OF EV5 IBOX      = %16lx\n",
+	printk(KERN_ERR PFX "current setup of EV5 IBOX      = %16lx\n",
 	       frame->icsr);
-	printk("  I-CACHE Reg %s parity error   = %16lx\n",
+	printk(KERN_ERR PFX "I-CACHE reg %s parity error   = %16lx\n",
 	       (frame->ic_perr_stat & 0x800L) ? 
-	       "Data" : "Tag", 
-	       frame->ic_perr_stat); 
-	printk("  D-CACHE error Reg              = %16lx\n",
+	       "data" : "tag",
+	       frame->ic_perr_stat);
+	printk(KERN_ERR PFX "D-CACHE error reg              = %16lx\n",
 	       frame->dc_perr_stat);
 	if (frame->dc_perr_stat & 0x2) {
 		switch (frame->dc_perr_stat & 0x03c) {
 		case 8:
-			printk("    Data error in bank 1\n");
+			printk(KERN_ERR PFX "data error in bank 1\n");
 			break;
 		case 4:
-			printk("    Data error in bank 0\n");
+			printk(KERN_ERR PFX "data error in bank 0\n");
 			break;
 		case 20:
-			printk("    Tag error in bank 1\n");
+			printk(KERN_ERR PFX "tag error in bank 1\n");
 			break;
 		case 10:
-			printk("    Tag error in bank 0\n");
+			printk(KERN_ERR PFX "tag error in bank 0\n");
 			break;
 		}
 	}
-	printk("  Effective VA                   = %16lx\n",
+	printk(KERN_ERR PFX "effective VA                   = %16lx\n",
 	       frame->va);
-	printk("  Reason for D-stream            = %16lx\n",
+	printk(KERN_ERR PFX "reason for D-stream            = %16lx\n",
 	       frame->mm_stat);
-	printk("  EV5 SCache address             = %16lx\n",
+	printk(KERN_ERR PFX "EV5 SCache address             = %16lx\n",
 	       frame->sc_addr);
-	printk("  EV5 SCache TAG/Data parity     = %16lx\n",
+	printk(KERN_ERR PFX "EV5 SCache TAG/Data parity     = %16lx\n",
 	       frame->sc_stat);
-	printk("  EV5 BC_TAG_ADDR                = %16lx\n",
+	printk(KERN_ERR PFX "EV5 BC_TAG_ADDR                = %16lx\n",
 	       frame->bc_tag_addr);
-	printk("  EV5 EI_ADDR: Phys addr of Xfer = %16lx\n",
+	printk(KERN_ERR PFX "EV5 EI_ADDR: Phys addr of Xfer = %16lx\n",
 	       frame->ei_addr);
-	printk("  Fill Syndrome                  = %16lx\n",
+	printk(KERN_ERR PFX "fill syndrome                  = %16lx\n",
 	       frame->fill_syndrome);
-	printk("  EI_STAT reg                    = %16lx\n",
+	printk(KERN_ERR PFX "EI_STAT reg                    = %16lx\n",
 	       frame->ei_stat);
-	printk("  LD_LOCK                        = %16lx\n",
+	printk(KERN_ERR PFX "LD_LOCK                        = %16lx\n",
 	       frame->ld_lock);
 }
 
@@ -549,25 +549,25 @@ mcpcia_print_system_area(unsigned long l
 
 	for (hose = hose_head; hose; hose = hose->next, iodpp++) {
 
-	  printk("IOD %d Register Subpacket - Bridge Base Address %16lx\n",
+	  pr_info(PFX "IOD %d register subpacket - bridge base address %16lx\n",
 		 hose->index, iodpp->base);
-	  printk("  WHOAMI      = %8x\n", iodpp->whoami);
-	  printk("  PCI_REV     = %8x\n", iodpp->pci_rev);
-	  printk("  CAP_CTRL    = %8x\n", iodpp->cap_ctrl);
-	  printk("  HAE_MEM     = %8x\n", iodpp->hae_mem);
-	  printk("  HAE_IO      = %8x\n", iodpp->hae_io);
-	  printk("  INT_CTL     = %8x\n", iodpp->int_ctl);
-	  printk("  INT_REG     = %8x\n", iodpp->int_reg);
-	  printk("  INT_MASK0   = %8x\n", iodpp->int_mask0);
-	  printk("  INT_MASK1   = %8x\n", iodpp->int_mask1);
-	  printk("  MC_ERR0     = %8x\n", iodpp->mc_err0);
-	  printk("  MC_ERR1     = %8x\n", iodpp->mc_err1);
-	  printk("  CAP_ERR     = %8x\n", iodpp->cap_err);
-	  printk("  PCI_ERR1    = %8x\n", iodpp->pci_err1);
-	  printk("  MDPA_STAT   = %8x\n", iodpp->mdpa_stat);
-	  printk("  MDPA_SYN    = %8x\n", iodpp->mdpa_syn);
-	  printk("  MDPB_STAT   = %8x\n", iodpp->mdpb_stat);
-	  printk("  MDPB_SYN    = %8x\n", iodpp->mdpb_syn);
+	  pr_info(PFX "  WHOAMI      = %8x\n", iodpp->whoami);
+	  pr_info(PFX "  PCI_REV     = %8x\n", iodpp->pci_rev);
+	  pr_info(PFX "  CAP_CTRL    = %8x\n", iodpp->cap_ctrl);
+	  pr_info(PFX "  HAE_MEM     = %8x\n", iodpp->hae_mem);
+	  pr_info(PFX "  HAE_IO      = %8x\n", iodpp->hae_io);
+	  pr_info(PFX "  INT_CTL     = %8x\n", iodpp->int_ctl);
+	  pr_info(PFX "  INT_REG     = %8x\n", iodpp->int_reg);
+	  pr_info(PFX "  INT_MASK0   = %8x\n", iodpp->int_mask0);
+	  pr_info(PFX "  INT_MASK1   = %8x\n", iodpp->int_mask1);
+	  pr_info(PFX "  MC_ERR0     = %8x\n", iodpp->mc_err0);
+	  pr_info(PFX "  MC_ERR1     = %8x\n", iodpp->mc_err1);
+	  pr_info(PFX "  CAP_ERR     = %8x\n", iodpp->cap_err);
+	  pr_info(PFX "  PCI_ERR1    = %8x\n", iodpp->pci_err1);
+	  pr_info(PFX "  MDPA_STAT   = %8x\n", iodpp->mdpa_stat);
+	  pr_info(PFX "  MDPA_SYN    = %8x\n", iodpp->mdpa_syn);
+	  pr_info(PFX "  MDPB_STAT   = %8x\n", iodpp->mdpb_stat);
+	  pr_info(PFX "  MDPB_SYN    = %8x\n", iodpp->mdpb_syn);
 	}
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
