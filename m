From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:45:51 +0000
Subject: [KJ] [PATCH] 04/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214551.15055.76667.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/core_lca.c b/arch/alpha/kernel/core_lca.c
index 6a5a914..2910a4f 100644
--- a/arch/alpha/kernel/core_lca.c
+++ b/arch/alpha/kernel/core_lca.c
@@ -29,6 +29,8 @@ #include "pci_impl.h"
  * BIOS32-style PCI interface:
  */
 
+#define PFX "pci: lca: "
+
 /*
  * Machine check reasons.  Defined according to PALcode sources
  * (osf.h and platform.h).
@@ -146,7 +148,8 @@ conf_read(unsigned long addr)
 		code = ((stat0 >> LCA_IOC_STAT0_CODE_SHIFT)
 			& LCA_IOC_STAT0_CODE_MASK);
 		if (code != 1) {
-			printk("lca.c:conf_read: got stat0=%lx\n", stat0);
+			printk(KERN_ERR PFX "%s: got stat0=%lx\n",
+				__FUNCTION__, stat0);
 		}
 
 		/* Reset error status.  */
@@ -183,7 +186,8 @@ conf_write(unsigned long addr, unsigned 
 		code = ((stat0 >> LCA_IOC_STAT0_CODE_SHIFT)
 			& LCA_IOC_STAT0_CODE_MASK);
 		if (code != 1) {
-			printk("lca.c:conf_write: got stat0=%lx\n", stat0);
+			printk(KERN_ERR PFX "%s: got stat0=%lx\n",
+				__FUNCTION__, stat0);
 		}
 
 		/* Reset error status.  */
@@ -334,23 +338,23 @@ #define IOC_P_NBR	((__u32) ~((1<<13) - 1
 static void
 mem_error(unsigned long esr, unsigned long ear)
 {
-	printk("    %s %s error to %s occurred at address %x\n",
-	       ((esr & ESR_CEE) ? "Correctable" :
-		(esr & ESR_UEE) ? "Uncorrectable" : "A"),
+	printk(KERN_CRIT PFX "%s %s error to %s occurred at address %x\n",
+	       ((esr & ESR_CEE) ? "correctable" :
+		(esr & ESR_UEE) ? "uncorrectable" : "a"),
 	       (esr & ESR_WRE) ? "write" : "read",
 	       (esr & ESR_SOR) ? "memory" : "b-cache",
 	       (unsigned) (ear & 0x1ffffff8));
 	if (esr & ESR_CTE) {
-		printk("    A b-cache tag parity error was detected.\n");
+		printk(KERN_CRIT PFX "a b-cache tag parity error was detected\n");
 	}
 	if (esr & ESR_MSE) {
-		printk("    Several other correctable errors occurred.\n");
+		printk(KERN_CRIT PFX "several other correctable errors occurred\n");
 	}
 	if (esr & ESR_MHE) {
-		printk("    Several other uncorrectable errors occurred.\n");
+		printk(KERN_CRIT PFX "several other uncorrectable errors occurred\n");
 	}
 	if (esr & ESR_NXM) {
-		printk("    Attempted to access non-existent memory.\n");
+		printk(KERN_CRIT PFX "attempted to access non-existent memory\n");
 	}
 }
 
@@ -372,16 +376,16 @@ ioc_error(__u32 stat0, __u32 stat1)
 	unsigned code = (stat0 & IOC_CODE) >> IOC_CODE_SHIFT;
 	unsigned cmd  = (stat0 & IOC_CMD)  >> IOC_CMD_SHIFT;
 
-	printk("    %s initiated PCI %s cycle to address %x"
-	       " failed due to %s.\n",
+	printk(KERN_ERR PFX "%s initiated PCI %s cycle to address %x"
+	       " failed due to %s\n",
 	       code > 3 ? "PCI" : "CPU", pci_cmd[cmd], stat1, err_name[code]);
 
 	if (code = 5 || code = 6) {
-		printk("    (Error occurred at PCI memory address %x.)\n",
+		printk(KERN_ERR PFX "error occurred at PCI memory address %x\n",
 		       (stat0 & ~IOC_P_NBR));
 	}
 	if (stat0 & IOC_LOST) {
-		printk("    Other PCI errors occurred simultaneously.\n");
+		printk(KERN_ERR PFX "other PCI errors occurred simultaneously\n");
 	}
 }
 
@@ -396,7 +400,7 @@ lca_machine_check(unsigned long vector, 
 
 	wrmces(rdmces());	/* reset machine check pending flag */
 
-	printk(KERN_CRIT "LCA machine check: vector=%#lx pc=%#lx code=%#x\n",
+	printk(KERN_CRIT PFX "machine check: vector=%#lx pc=%#lx code=%#x\n",
 	       vector, regs->pc, (unsigned int) el.c->code);
 
 	/*
@@ -426,8 +430,8 @@ lca_machine_check(unsigned long vector, 
 
 	switch (el.c->size) {
 	case sizeof(struct el_lca_mcheck_short):
-		printk(KERN_CRIT
-		       "  Reason: %s (short frame%s, dc_stat=%#lx):\n",
+		printk(KERN_CRIT PFX
+		       "reason: %s (short frame%s, dc_stat=%#lx):\n",
 		       reason, el.c->retry ? ", retryable" : "",
 		       el.s->dc_stat);
 		if (el.s->esr & ESR_EAV) {
@@ -439,12 +443,11 @@ lca_machine_check(unsigned long vector, 
 		break;
 
 	case sizeof(struct el_lca_mcheck_long):
-		printk(KERN_CRIT "  Reason: %s (long frame%s):\n",
+		printk(KERN_CRIT PFX "reason: %s (long frame%s):\n",
 		       reason, el.c->retry ? ", retryable" : "");
-		printk(KERN_CRIT
-		       "    reason: %#lx  exc_addr: %#lx  dc_stat: %#lx\n", 
+		printk(KERN_CRIT PFX "reason: %#lx  exc_addr: %#lx  dc_stat: %#lx\n",
 		       el.l->pt[0], el.l->exc_addr, el.l->dc_stat);
-		printk(KERN_CRIT "    car: %#lx\n", el.l->car);
+		printk(KERN_CRIT PFX "car: %#lx\n", el.l->car);
 		if (el.l->esr & ESR_EAV) {
 			mem_error(el.l->esr, el.l->ear);
 		}
@@ -454,7 +457,7 @@ lca_machine_check(unsigned long vector, 
 		break;
 
 	default:
-		printk(KERN_CRIT "  Unknown errorlog size %d\n", el.c->size);
+		printk(KERN_CRIT PFX "Unknown errorlog size %d\n", el.c->size);
 	}
 
 	/* Dump the logout area to give all info.  */
@@ -463,7 +466,7 @@ #ifdef CONFIG_VERBOSE_MCHECK
 		unsigned long * ptr = (unsigned long *) la_ptr;
 		long i;
 		for (i = 0; i < el.c->size / sizeof(long); i += 2) {
-			printk(KERN_CRIT " +%8lx %016lx %016lx\n",
+			printk(KERN_CRIT PFX "+%8lx %016lx %016lx\n",
 			       i*sizeof(long), ptr[i], ptr[i+1]);
 		}
 	}
@@ -482,12 +485,12 @@ lca_clock_print(void)
 
         pmr_reg = LCA_READ_PMR;
 
-        printk("Status of clock control:\n");
-        printk("\tPrimary clock divisor\t0x%lx\n", LCA_GET_PRIMARY(pmr_reg));
-        printk("\tOverride clock divisor\t0x%lx\n", LCA_GET_OVERRIDE(pmr_reg));
-        printk("\tInterrupt override is %s\n",
+        pr_info(PFX "Status of clock control:\n");
+        pr_info(PFX "\tPrimary clock divisor\t0x%lx\n", LCA_GET_PRIMARY(pmr_reg));
+        pr_info(PFX "\tOverride clock divisor\t0x%lx\n", LCA_GET_OVERRIDE(pmr_reg));
+        pr_info(PFX "\tInterrupt override is %s\n",
 	       (pmr_reg & LCA_PMR_INTO) ? "on" : "off"); 
-        printk("\tDMA override is %s\n",
+        pr_info(PFX "\tDMA override is %s\n",
 	       (pmr_reg & LCA_PMR_DMAO) ? "on" : "off"); 
 
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
