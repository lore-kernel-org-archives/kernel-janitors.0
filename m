From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:45:38 +0000
Subject: [KJ] [PATCH] 02/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214538.15055.40888.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/core_cia.c b/arch/alpha/kernel/core_cia.c
index fd56306..b87245a 100644
--- a/arch/alpha/kernel/core_cia.c
+++ b/arch/alpha/kernel/core_cia.c
@@ -35,10 +35,12 @@ #include "pci_impl.h"
  */
 
 #define DEBUG_CONFIG 0
+#define PFX "pci: cia: "
+
 #if DEBUG_CONFIG
-# define DBGC(args)	printk args
+# define DBG_CFG(fmt, args...)	printk (KERN_DEBUG PFX "%s: " fmt, __FUNCTION__, ## args)
 #else
-# define DBGC(args)
+# define DBG_CFG(fmt, args...)
 #endif
 
 #define vip	volatile int  *
@@ -93,9 +95,8 @@ mk_conf_addr(struct pci_bus *bus_dev, un
 	*type1 = (bus != 0);
 	*pci_addr = (bus << 16) | (device_fn << 8) | where;
 
-	DBGC(("mk_conf_addr(bus=%d ,device_fn=0x%x, where=0x%x,"
-	      " returning address 0x%p\n"
-	      bus, device_fn, where, *pci_addr));
+	DBG_CFG("(bus=%d ,device_fn=0x%x, where=0x%x, returning address 0x%p\n"
+	      bus, device_fn, where, *pci_addr);
 
 	return 0;
 }
@@ -107,7 +108,7 @@ conf_read(unsigned long addr, unsigned c
 	int stat0, value;
 	int cia_cfg = 0;
 
-	DBGC(("conf_read(addr=0x%lx, type1=%d) ", addr, type1));
+	DBG_CFG("(addr=0x%lx, type1=%d) started\n", addr, type1);
 	local_irq_save(flags);
 
 	/* Reset status register to avoid losing errors.  */
@@ -150,7 +151,7 @@ conf_read(unsigned long addr, unsigned c
 	}
 
 	local_irq_restore(flags);
-	DBGC(("done\n"));
+	DBG_CFG("(addr=0x%lx, type1=%d) completed\n", addr, type1);
 
 	return value;
 }
@@ -161,7 +162,7 @@ conf_write(unsigned long addr, unsigned 
 	unsigned long flags;
 	int stat0, cia_cfg = 0;
 
-	DBGC(("conf_write(addr=0x%lx, type1=%d) ", addr, type1));
+	DBG_CFG("(addr=0x%lx, type1=%d) started", addr, type1);
 	local_irq_save(flags);
 
 	/* Reset status register to avoid losing errors.  */
@@ -200,7 +201,7 @@ conf_write(unsigned long addr, unsigned 
 	}
 
 	local_irq_restore(flags);
-	DBGC(("done\n"));
+	DBG_CFG("(addr=0x%lx, type1=%d) completed", addr, type1);
 }
 
 static int 
@@ -398,23 +399,23 @@ verify_tb_operation(void)
 
 	temp = *(vip)CIA_IOC_TB_TAGn(0);
 	if (temp != tag0) {
-		printk("pci: failed tb register update test "
+		printk(KERN_ERR PFX "failed tb register update test "
 		       "(tag0 %#x != %#x)\n", temp, tag0);
 		goto failed;
 	}
 	temp = *(vip)CIA_IOC_TB_TAGn(1);
 	if (temp != 0) {
-		printk("pci: failed tb register update test "
+		printk(KERN_ERR PFX "failed tb register update test "
 		       "(tag1 %#x != 0)\n", temp);
 		goto failed;
 	}
 	temp = *(vip)CIA_IOC_TBn_PAGEm(0,0);
 	if (temp != pte0) {
-		printk("pci: failed tb register update test "
+		printk(KERN_ERR PFX "failed tb register update test "
 		       "(pte0 %#x != %#x)\n", temp, pte0);
 		goto failed;
 	}
-	printk("pci: passed tb register update test\n");
+	pr_info(PFX "passed tb register update test\n");
 
 	/* Second, verify we can actually do I/O through this entry.  */
 
@@ -428,15 +429,15 @@ verify_tb_operation(void)
 	mcheck_expected(0) = 0;
 	mb();
 	if (mcheck_taken(0)) {
-		printk("pci: failed sg loopback i/o read test (mcheck)\n");
+		printk(KERN_ERR PFX "failed sg loopback i/o read test (mcheck)\n");
 		goto failed;
 	}
 	if (temp != data0) {
-		printk("pci: failed sg loopback i/o read test "
+		printk(KERN_ERR PFX "failed sg loopback i/o read test "
 		       "(%#x != %#x)\n", temp, data0);
 		goto failed;
 	}
-	printk("pci: passed sg loopback i/o read test\n");
+	pr_info(PFX "passed sg loopback i/o read test\n");
 
 	/* Third, try to invalidate the TLB.  */
 
@@ -445,9 +446,9 @@ verify_tb_operation(void)
 		temp = *(vip)CIA_IOC_TB_TAGn(0);
 		if (temp & 1) {
 			use_tbia_try2 = 1;
-			printk("pci: failed tbia test; workaround available\n");
+			printk(KERN_ERR PFX "failed tbia test; workaround available\n");
 		} else {
-			printk("pci: passed tbia test\n");
+			pr_info(PFX "passed tbia test\n");
 		}
 	}
 
@@ -465,15 +466,15 @@ verify_tb_operation(void)
 	mcheck_expected(0) = 0;
 	mb();
 	if (mcheck_taken(0)) {
-		printk("pci: failed pte write cache snoop test (mcheck)\n");
+		printk(KERN_ERR PFX "failed pte write cache snoop test (mcheck)\n");
 		goto failed;
 	}
 	if (temp != data0) {
-		printk("pci: failed pte write cache snoop test "
+		printk(KERN_ERR PFX "failed pte write cache snoop test "
 		       "(%#x != %#x)\n", temp, data0);
 		goto failed;
 	}
-	printk("pci: passed pte write cache snoop test\n");
+	pr_info(PFX "passed pte write cache snoop test\n");
 
 	/* Fifth, verify that a previously invalid PTE entry gets
 	   filled from the page table.  */
@@ -489,17 +490,17 @@ verify_tb_operation(void)
 	mcheck_expected(0) = 0;
 	mb();
 	if (mcheck_taken(0)) {
-		printk("pci: failed valid tag invalid pte reload test "
+		printk(KERN_ERR PFX "failed valid tag invalid pte reload test "
 		       "(mcheck; workaround available)\n");
 		/* Work around this bug by aligning new allocations
 		   on 4 page boundaries.  */
 		arena->align_entry = 4;
 	} else if (temp != data0) {
-		printk("pci: failed valid tag invalid pte reload test "
+		printk(KERN_ERR PFX "failed valid tag invalid pte reload test "
 		       "(%#x != %#x)\n", temp, data0);
 		goto failed;
 	} else {
-		printk("pci: passed valid tag invalid pte reload test\n");
+		printk(KERN_ERR PFX "passed valid tag invalid pte reload test\n");
 	}
 
 	/* Sixth, verify machine checks are working.  Test invalid
@@ -512,8 +513,11 @@ verify_tb_operation(void)
 	mb();
 	mcheck_expected(0) = 0;
 	mb();
-	printk("pci: %s pci machine check test\n",
-	       mcheck_taken(0) ? "passed" : "failed");
+	if (mcheck_taken(0)) {
+		pr_info (PFX "passed pci machine check test\n");
+	} else {
+		printk (KERN_ERR PFX "failed pci machine check test\n");
+	}
 
 	/* Clean up after the tests.  */
 	arena->ptes[4] = 0;
@@ -529,7 +533,7 @@ verify_tb_operation(void)
 		*(vip)CIA_IOC_TB_TAGn(2) = 2;
 		*(vip)CIA_IOC_TB_TAGn(3) = 2;
 
-		printk("pci: tbia workaround enabled\n");
+		pr_info(PFX "tbia workaround enabled\n");
 	}
 	alpha_mv.mv_pci_tbi(arena->hose, 0, -1);
 
@@ -546,7 +550,7 @@ exit:
 	return;
 
 failed:
-	printk("pci: disabling sg translation window\n");
+	printk(KERN_WARNING PFX "disabling sg translation window\n");
 	*(vip)CIA_IOC_PCI_W0_BASE = 0;
 	*(vip)CIA_IOC_PCI_W1_BASE = 0;
 	pci_isa_hose->sg_isa = NULL;
@@ -632,7 +636,7 @@ do_init_arch(int is_pyxis)
 	int temp, cia_rev, tbia_window;
 
 	cia_rev = *(vip)CIA_IOC_CIA_REV & CIA_REV_MASK;
-	printk("pci: cia revision %d%s\n",
+	pr_info(PFX "revision %d%s\n",
 	       cia_rev, is_pyxis ? " (pyxis)" : "");
 
 	if (alpha_using_srm)
@@ -868,10 +872,10 @@ cia_decode_pci_error(struct el_CIA_sysda
 			addr |= tmp << 32;
 		}
 
-		printk(KERN_CRIT "CIA machine check: %s\n", msg);
-		printk(KERN_CRIT "  DMA command: %s\n", cmd);
-		printk(KERN_CRIT "  PCI address: %#010lx\n", addr);
-		printk(KERN_CRIT "  %s, Lock: %d, DAC: %d\n",
+		printk(KERN_CRIT PFX "machine check: %s\n", msg);
+		printk(KERN_CRIT PFX "  DMA command: %s\n", cmd);
+		printk(KERN_CRIT PFX "  PCI address: %#010lx\n", addr);
+		printk(KERN_CRIT PFX "  %s, Lock: %d, DAC: %d\n",
 		       window, lock, dac);
 	} else if (cia->cia_err & (CIA_ERR_PERR
 				   | CIA_ERR_PCI_ADDR_PE
@@ -912,18 +916,18 @@ cia_decode_pci_error(struct el_CIA_sysda
 			addr |= tmp << 32;
 		}
 
-		printk(KERN_CRIT "CIA machine check: %s\n", msg);
-		printk(KERN_CRIT "  PCI command: %s\n", cmd);
-		printk(KERN_CRIT "  Master state: %s, Target state: %s\n",
+		printk(KERN_CRIT PFX "machine check: %s\n", msg);
+		printk(KERN_CRIT PFX "  PCI command: %s\n", cmd);
+		printk(KERN_CRIT PFX "  Master state: %s, Target state: %s\n",
 		       master, target);
-		printk(KERN_CRIT "  PCI address: %#010lx, DAC: %d\n",
+		printk(KERN_CRIT PFX "  PCI address: %#010lx, DAC: %d\n",
 		       addr, dac);
 	} else {
-		printk(KERN_CRIT "CIA machine check: %s\n", msg);
-		printk(KERN_CRIT "  Unknown PCI error\n");
-		printk(KERN_CRIT "  PCI_ERR0 = %#08lx", cia->pci_err0);
-		printk(KERN_CRIT "  PCI_ERR1 = %#08lx", cia->pci_err1);
-		printk(KERN_CRIT "  PCI_ERR2 = %#08lx", cia->pci_err2);
+		printk(KERN_CRIT PFX "machine check: %s\n", msg);
+		printk(KERN_CRIT PFX "  Unknown PCI error\n");
+		printk(KERN_CRIT PFX "  PCI_ERR0 = %#08lx", cia->pci_err0);
+		printk(KERN_CRIT PFX "  PCI_ERR1 = %#08lx", cia->pci_err1);
+		printk(KERN_CRIT PFX "  PCI_ERR2 = %#08lx", cia->pci_err2);
 	}
 }
 
@@ -941,7 +945,7 @@ cia_decode_mem_error(struct el_CIA_sysda
 	if ((cia->mem_err1 >> 20) & 1)
 		cia_decode_pci_error(cia, msg);
 	else
-		printk(KERN_CRIT "CIA machine check: %s\n", msg);
+		printk(KERN_CRIT PFX "machine check: %s\n", msg);
 
 	mem_port_addr = cia->mem_err0 & 0xfffffff0;
 	mem_port_addr |= (cia->mem_err1 & 0x83UL) << 32;
@@ -1016,11 +1020,11 @@ cia_decode_mem_error(struct el_CIA_sysda
 	default:   set_select = "Unknown"; break;
 	}
 
-	printk(KERN_CRIT "  Memory port command: %s\n", mem_port_cmd);
-	printk(KERN_CRIT "  Memory port address: %#010lx, mask: %#lx\n",
+	printk(KERN_CRIT PFX "  Memory port command: %s\n", mem_port_cmd);
+	printk(KERN_CRIT PFX "  Memory port address: %#010lx, mask: %#lx\n",
 	       mem_port_addr, mem_port_mask);
-	printk(KERN_CRIT "  Memory sequencer state: %s\n", seq_state);
-	printk(KERN_CRIT "  Memory set: %s\n", set_select);
+	printk(KERN_CRIT PFX "  Memory sequencer state: %s\n", seq_state);
+	printk(KERN_CRIT PFX "  Memory set: %s\n", set_select);
 }
 
 static void
@@ -1034,7 +1038,7 @@ cia_decode_ecc_error(struct el_CIA_sysda
 
 	syn = cia->cia_syn & 0xff;
 	if (syn = (syn & -syn)) {
-		fmt = KERN_CRIT "  ECC syndrome %#x -- check bit %d\n";
+		fmt = KERN_CRIT PFX "  ECC syndrome %#x -- check bit %d\n";
 		i = ffs(syn) - 1;
 	} else {
 		static unsigned char const data_bit[64] = {
@@ -1061,9 +1065,9 @@ cia_decode_ecc_error(struct el_CIA_sysda
 				break;
 
 		if (i < 64)
-			fmt = KERN_CRIT "  ECC syndrome %#x -- data bit %d\n";
+			fmt = KERN_CRIT PFX "  ECC syndrome %#x -- data bit %d\n";
 		else
-			fmt = KERN_CRIT "  ECC syndrome %#x -- unknown bit\n";
+			fmt = KERN_CRIT PFX "  ECC syndrome %#x -- unknown bit\n";
 	}
 
 	printk (fmt, syn, i);
@@ -1091,9 +1095,9 @@ cia_decode_parity_error(struct el_CIA_sy
 	mask = (cia->cpu_err1 >> 12) & 0xF;
 	par = (cia->cpu_err1 >> 21) & 1;
 
-	printk(KERN_CRIT "CIA machine check: System bus parity error\n");
-	printk(KERN_CRIT "  Command: %s, Parity bit: %d\n", cmd, par);
-	printk(KERN_CRIT "  Address: %#010lx, Mask: %#lx\n", addr, mask);
+	printk(KERN_CRIT PFX "machine check: System bus parity error\n");
+	printk(KERN_CRIT PFX "  Command: %s, Parity bit: %d\n", cmd, par);
+	printk(KERN_CRIT PFX "  Address: %#010lx, Mask: %#lx\n", addr, mask);
 }
 #endif /* CONFIG_VERBOSE_MCHECK */
 
@@ -1154,37 +1158,37 @@ #ifdef CONFIG_VERBOSE_MCHECK
 	}
 
 	if (cia->cia_err & CIA_ERR_LOST_CORR_ERR)
-		printk(KERN_CRIT "CIA lost machine check: "
+		printk(KERN_CRIT PFX "lost machine check: "
 		       "Correctable ECC error\n");
 	if (cia->cia_err & CIA_ERR_LOST_UN_CORR_ERR)
-		printk(KERN_CRIT "CIA lost machine check: "
+		printk(KERN_CRIT PFX "lost machine check: "
 		       "Uncorrectable ECC error\n");
 	if (cia->cia_err & CIA_ERR_LOST_CPU_PE)
-		printk(KERN_CRIT "CIA lost machine check: "
+		printk(KERN_CRIT PFX "lost machine check: "
 		       "System bus parity error\n");
 	if (cia->cia_err & CIA_ERR_LOST_MEM_NEM)
-		printk(KERN_CRIT "CIA lost machine check: "
+		printk(KERN_CRIT PFX "lost machine check: "
 		       "Access to nonexistent memory\n");
 	if (cia->cia_err & CIA_ERR_LOST_PERR)
-		printk(KERN_CRIT "CIA lost machine check: "
+		printk(KERN_CRIT PFX "lost machine check: "
 		       "PCI data parity error\n");
 	if (cia->cia_err & CIA_ERR_LOST_PCI_ADDR_PE)
-		printk(KERN_CRIT "CIA lost machine check: "
+		printk(KERN_CRIT PFX "lost machine check: "
 		       "PCI address parity error\n");
 	if (cia->cia_err & CIA_ERR_LOST_RCVD_MAS_ABT)
-		printk(KERN_CRIT "CIA lost machine check: "
+		printk(KERN_CRIT PFX "lost machine check: "
 		       "PCI master abort\n");
 	if (cia->cia_err & CIA_ERR_LOST_RCVD_TAR_ABT)
-		printk(KERN_CRIT "CIA lost machine check: "
+		printk(KERN_CRIT PFX "lost machine check: "
 		       "PCI target abort\n");
 	if (cia->cia_err & CIA_ERR_LOST_PA_PTE_INV)
-		printk(KERN_CRIT "CIA lost machine check: "
+		printk(KERN_CRIT PFX "lost machine check: "
 		       "PCI invalid PTE\n");
 	if (cia->cia_err & CIA_ERR_LOST_FROM_WRT_ERR)
-		printk(KERN_CRIT "CIA lost machine check: "
+		printk(KERN_CRIT PFX "lost machine check: "
 		       "Write to flash ROM attempted\n");
 	if (cia->cia_err & CIA_ERR_LOST_IOA_TIMEOUT)
-		printk(KERN_CRIT "CIA lost machine check: "
+		printk(KERN_CRIT PFX "lost machine check: "
 		       "I/O timeout\n");
 #endif /* CONFIG_VERBOSE_MCHECK */
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
