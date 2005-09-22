From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 22 Sep 2005 09:13:23 +0000
Subject: [KJ] printk : arch/alpha/kernel/core_mcpcia.c
Message-Id: <20050922091323.GE3818@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33914238585022904=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33914238585022904==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.14-rc2/arch/alpha/kernel/core_mcpcia.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/core_mcpcia.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/core_mcpcia.c
@@ -433,7 +433,7 @@ mcpcia_init_hoses(void)
 		}
 	}
 
-	printk("mcpcia_init_hoses: found %d hoses\n", hose_count);
+	printk(KERN_INFO "mcpcia_init_hoses: found %d hoses\n", hose_count);
 
 	/* Now do init for each hose.  */
 	for (hose = hose_head; hose; hose = hose->next)
@@ -450,65 +450,65 @@ mcpcia_print_uncorrectable(struct el_MCP
 
 	/* Print PAL fields */
 	for (i = 0; i < 24; i += 2) {
-		printk("  paltmp[%d-%d] = %16lx %16lx\n",
+		printk(KERN_INFO "  paltmp[%d-%d] = %16lx %16lx\n",
 		       i, i+1, frame->paltemp[i], frame->paltemp[i+1]);
 	}
 	for (i = 0; i < 8; i += 2) {
-		printk("  shadow[%d-%d] = %16lx %16lx\n",
+		printk(KERN_INFO "  shadow[%d-%d] = %16lx %16lx\n",
 		       i, i+1, frame->shadow[i], 
 		       frame->shadow[i+1]);
 	}
-	printk("  Addr of excepting instruction  = %16lx\n",
+	printk(KERN_INFO "  Addr of excepting instruction  = %16lx\n",
 	       frame->exc_addr);
-	printk("  Summary of arithmetic traps    = %16lx\n",
+	printk(KERN_INFO "  Summary of arithmetic traps    = %16lx\n",
 	       frame->exc_sum);
-	printk("  Exception mask                 = %16lx\n",
+	printk(KERN_INFO "  Exception mask                 = %16lx\n",
 	       frame->exc_mask);
-	printk("  Base address for PALcode       = %16lx\n",
+	printk(KERN_INFO "  Base address for PALcode       = %16lx\n",
 	       frame->pal_base);
-	printk("  Interrupt Status Reg           = %16lx\n",
+	printk(KERN_INFO "  Interrupt Status Reg           = %16lx\n",
 	       frame->isr);
-	printk("  CURRENT SETUP OF EV5 IBOX      = %16lx\n",
+	printk(KERN_INFO "  CURRENT SETUP OF EV5 IBOX      = %16lx\n",
 	       frame->icsr);
-	printk("  I-CACHE Reg %s parity error   = %16lx\n",
+	printk(KERN_INFO "  I-CACHE Reg %s parity error   = %16lx\n",
 	       (frame->ic_perr_stat & 0x800L) ? 
 	       "Data" : "Tag", 
 	       frame->ic_perr_stat); 
-	printk("  D-CACHE error Reg              = %16lx\n",
+	printk(KERN_INFO "  D-CACHE error Reg              = %16lx\n",
 	       frame->dc_perr_stat);
 	if (frame->dc_perr_stat & 0x2) {
 		switch (frame->dc_perr_stat & 0x03c) {
 		case 8:
-			printk("    Data error in bank 1\n");
+			printk(KERN_INFO "    Data error in bank 1\n");
 			break;
 		case 4:
-			printk("    Data error in bank 0\n");
+			printk(KERN_INFO "    Data error in bank 0\n");
 			break;
 		case 20:
-			printk("    Tag error in bank 1\n");
+			printk(KERN_INFO "    Tag error in bank 1\n");
 			break;
 		case 10:
-			printk("    Tag error in bank 0\n");
+			printk(KERN_INFO "    Tag error in bank 0\n");
 			break;
 		}
 	}
-	printk("  Effective VA                   = %16lx\n",
+	printk(KERN_INFO "  Effective VA                   = %16lx\n",
 	       frame->va);
-	printk("  Reason for D-stream            = %16lx\n",
+	printk(KERN_INFO "  Reason for D-stream            = %16lx\n",
 	       frame->mm_stat);
-	printk("  EV5 SCache address             = %16lx\n",
+	printk(KERN_INFO "  EV5 SCache address             = %16lx\n",
 	       frame->sc_addr);
-	printk("  EV5 SCache TAG/Data parity     = %16lx\n",
+	printk(KERN_INFO "  EV5 SCache TAG/Data parity     = %16lx\n",
 	       frame->sc_stat);
-	printk("  EV5 BC_TAG_ADDR                = %16lx\n",
+	printk(KERN_INFO "  EV5 BC_TAG_ADDR                = %16lx\n",
 	       frame->bc_tag_addr);
-	printk("  EV5 EI_ADDR: Phys addr of Xfer = %16lx\n",
+	printk(KERN_INFO "  EV5 EI_ADDR: Phys addr of Xfer = %16lx\n",
 	       frame->ei_addr);
-	printk("  Fill Syndrome                  = %16lx\n",
+	printk(KERN_INFO "  Fill Syndrome                  = %16lx\n",
 	       frame->fill_syndrome);
-	printk("  EI_STAT reg                    = %16lx\n",
+	printk(KERN_INFO "  EI_STAT reg                    = %16lx\n",
 	       frame->ei_stat);
-	printk("  LD_LOCK                        = %16lx\n",
+	printk(KERN_INFO "  LD_LOCK                        = %16lx\n",
 	       frame->ld_lock);
 }
 
@@ -549,25 +549,25 @@ mcpcia_print_system_area(unsigned long l
 
 	for (hose = hose_head; hose; hose = hose->next, iodpp++) {
 
-	  printk("IOD %d Register Subpacket - Bridge Base Address %16lx\n",
+	  printk(KERN_INFO "IOD %d Register Subpacket - Bridge Base Address %16lx\n",
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
+	  printk(KERN_INFO "  WHOAMI      = %8x\n", iodpp->whoami);
+	  printk(KERN_INFO "  PCI_REV     = %8x\n", iodpp->pci_rev);
+	  printk(KERN_INFO "  CAP_CTRL    = %8x\n", iodpp->cap_ctrl);
+	  printk(KERN_INFO "  HAE_MEM     = %8x\n", iodpp->hae_mem);
+	  printk(KERN_INFO "  HAE_IO      = %8x\n", iodpp->hae_io);
+	  printk(KERN_INFO "  INT_CTL     = %8x\n", iodpp->int_ctl);
+	  printk(KERN_INFO "  INT_REG     = %8x\n", iodpp->int_reg);
+	  printk(KERN_INFO "  INT_MASK0   = %8x\n", iodpp->int_mask0);
+	  printk(KERN_INFO "  INT_MASK1   = %8x\n", iodpp->int_mask1);
+	  printk(KERN_INFO "  MC_ERR0     = %8x\n", iodpp->mc_err0);
+	  printk(KERN_INFO "  MC_ERR1     = %8x\n", iodpp->mc_err1);
+	  printk(KERN_INFO "  CAP_ERR     = %8x\n", iodpp->cap_err);
+	  printk(KERN_INFO "  PCI_ERR1    = %8x\n", iodpp->pci_err1);
+	  printk(KERN_INFO "  MDPA_STAT   = %8x\n", iodpp->mdpa_stat);
+	  printk(KERN_INFO "  MDPA_SYN    = %8x\n", iodpp->mdpa_syn);
+	  printk(KERN_INFO "  MDPB_STAT   = %8x\n", iodpp->mdpb_stat);
+	  printk(KERN_INFO "  MDPB_SYN    = %8x\n", iodpp->mdpb_syn);
 	}
 }
 


--===============33914238585022904==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33914238585022904==--
