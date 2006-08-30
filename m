From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:46:19 +0000
Subject: [KJ] [PATCH] 08/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214619.15055.33176.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/core_t2.c b/arch/alpha/kernel/core_t2.c
index ecce09e..c994c91 100644
--- a/arch/alpha/kernel/core_t2.c
+++ b/arch/alpha/kernel/core_t2.c
@@ -67,11 +67,12 @@ #define T2_ISA_SG_LENGTH	0x00800000UL
  */
 
 #define DEBUG_CONFIG 0
+#define PFX "pci: t2: "
 
 #if DEBUG_CONFIG
-# define DBG(args)	printk args
+# define DBG_CFG(fmt, args...)	printk (KERN_DEBUG PFX "%s: " fmt, __FUNCTION__, ## args)
 #else
-# define DBG(args)
+# define DBG_CFG(fmt, args...)
 #endif
 
 static volatile unsigned int t2_mcheck_any_expected;
@@ -142,9 +143,9 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 	unsigned long addr;
 	u8 bus = pbus->number;
 
-	DBG(("mk_conf_addr(bus=%d, dfn=0x%x, where=0x%x,"
+	DBG_CFG("(bus=%d, dfn=0x%x, where=0x%x,"
 	     " addr=0x%lx, type1=0x%x)\n",
-	     bus, device_fn, where, pci_addr, type1));
+	     bus, device_fn, where, pci_addr, type1);
 
 	if (bus = 0) {
 		int device = device_fn >> 3;
@@ -152,8 +153,7 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 		/* Type 0 configuration cycle.  */
 
 		if (device > 8) {
-			DBG(("mk_conf_addr: device (%d)>20, returning -1\n",
-			     device));
+			DBG_CFG("device (%d)>20, returning -1\n", device);
 			return -1;
 		}
 
@@ -165,7 +165,7 @@ mk_conf_addr(struct pci_bus *pbus, unsig
 		addr = (bus << 16) | (device_fn << 8) | (where);
 	}
 	*pci_addr = addr;
-	DBG(("mk_conf_addr: returning pci_addr 0x%lx\n", addr));
+	DBG_CFG("returning pci_addr 0x%lx\n", addr);
 	return 0;
 }
 
@@ -183,7 +183,7 @@ conf_read(unsigned long addr, unsigned c
 
 	cpu = smp_processor_id();
 
-	DBG(("conf_read(addr=0x%lx, type1=%d)\n", addr, type1));
+	DBG_CFG("(addr=0x%lx, type1=%d)\n", addr, type1);
 
 	/* If Type1 access, must set T2 CFG.  */
 	if (type1) {
@@ -335,7 +335,7 @@ t2_direct_map_window1(unsigned long base
 	*(vulp)T2_TBASE1 = 0;
 
 #if DEBUG_PRINT_FINAL_SETTINGS
-	printk("%s: setting WBASE1=0x%lx WMASK1=0x%lx TBASE1=0x%lx\n",
+	printk(KERN_DEBUG PFX "%s: setting WBASE1=0x%lx WMASK1=0x%lx TBASE1=0x%lx\n",
 	       __FUNCTION__,
 	       *(vulp)T2_WBASE1,
 	       *(vulp)T2_WMASK1,
@@ -365,7 +365,7 @@ t2_sg_map_window2(struct pci_controller 
 	t2_pci_tbi(hose, 0, -1); /* flush TLB all */
 
 #if DEBUG_PRINT_FINAL_SETTINGS
-	printk("%s: setting WBASE2=0x%lx WMASK2=0x%lx TBASE2=0x%lx\n",
+	printk(KERN_DEBUG PFX "%s: setting WBASE2=0x%lx WMASK2=0x%lx TBASE2=0x%lx\n",
 	       __FUNCTION__,
 	       *(vulp)T2_WBASE2,
 	       *(vulp)T2_WMASK2,
@@ -377,15 +377,15 @@ static void __init
 t2_save_configuration(void)
 {
 #if DEBUG_PRINT_INITIAL_SETTINGS
-	printk("%s: HAE_1 was 0x%lx\n", __FUNCTION__, srm_hae); /* HW is 0 */
-	printk("%s: HAE_2 was 0x%lx\n", __FUNCTION__, *(vulp)T2_HAE_2);
-	printk("%s: HAE_3 was 0x%lx\n", __FUNCTION__, *(vulp)T2_HAE_3);
-	printk("%s: HAE_4 was 0x%lx\n", __FUNCTION__, *(vulp)T2_HAE_4);
-	printk("%s: HBASE was 0x%lx\n", __FUNCTION__, *(vulp)T2_HBASE);
+	printk(KERN_DEBUG PFX "%s: HAE_1 was 0x%lx\n", __FUNCTION__, srm_hae); /* HW is 0 */
+	printk(KERN_DEBUG PFX "%s: HAE_2 was 0x%lx\n", __FUNCTION__, *(vulp)T2_HAE_2);
+	printk(KERN_DEBUG PFX "%s: HAE_3 was 0x%lx\n", __FUNCTION__, *(vulp)T2_HAE_3);
+	printk(KERN_DEBUG PFX "%s: HAE_4 was 0x%lx\n", __FUNCTION__, *(vulp)T2_HAE_4);
+	printk(KERN_DEBUG PFX "%s: HBASE was 0x%lx\n", __FUNCTION__, *(vulp)T2_HBASE);
 
-	printk("%s: WBASE1=0x%lx WMASK1=0x%lx TBASE1=0x%lx\n", __FUNCTION__, 
+	printk(KERN_DEBUG PFX "%s: WBASE1=0x%lx WMASK1=0x%lx TBASE1=0x%lx\n", __FUNCTION__, 
 	       *(vulp)T2_WBASE1, *(vulp)T2_WMASK1, *(vulp)T2_TBASE1);
-	printk("%s: WBASE2=0x%lx WMASK2=0x%lx TBASE2=0x%lx\n", __FUNCTION__, 
+	printk(KERN_DEBUG PFX "%s: WBASE2=0x%lx WMASK2=0x%lx TBASE2=0x%lx\n", __FUNCTION__, 
 	       *(vulp)T2_WBASE2, *(vulp)T2_WMASK2, *(vulp)T2_TBASE2);
 #endif
 
@@ -423,7 +423,7 @@ t2_init_arch(void)
 	/* Enable scatter/gather TLB use.  */
 	temp = *(vulp)T2_IOCSR;
 	if (!(temp & (0x1UL << 26))) {
-		printk("t2_init_arch: enabling SG TLB, IOCSR was 0x%lx\n",
+		pr_info(PFX "enabling SG TLB, IOCSR was 0x%lx\n",
 		       temp);
 		*(vulp)T2_IOCSR = temp | (0x1UL << 26);
 		mb();	
@@ -580,10 +580,9 @@ #endif
 		 */
 #ifdef CONFIG_VERBOSE_MCHECK
 		if (alpha_verbose_mcheck > 1) {
-			printk("t2_machine_check(cpu%d): any_expected 0x%x -"
-			       " (assumed) spurious -"
-			       " code 0x%x\n", cpu, t2_mcheck_any_expected,
-			       (unsigned int)mchk_header->code);
+			pr_info(PFX "%s(cpu%d): any_expected 0x%x -"
+				" (assumed) spurious - code 0x%x\n", __FUNCTION__, cpu,
+				t2_mcheck_any_expected, (unsigned int)mchk_header->code);
 		}
 #endif
 		return;
@@ -593,9 +592,9 @@ #endif
 		if (t2_mcheck_last_taken & (1 << cpu)) {
 #ifdef CONFIG_VERBOSE_MCHECK
 		    if (alpha_verbose_mcheck > 1) {
-			printk("t2_machine_check(cpu%d): last_taken 0x%x - "
+			pr_info(PFX "%s(cpu%d): last_taken 0x%x - "
 			       "unexpected mcheck - code 0x%x\n",
-			       cpu, t2_mcheck_last_taken,
+			       __FUNCTION__, cpu, t2_mcheck_last_taken,
 			       (unsigned int)mchk_header->code);
 		    }
 #endif
@@ -610,11 +609,12 @@ #endif
 
 #ifdef CONFIG_VERBOSE_MCHECK
 	if (alpha_verbose_mcheck > 1) {
-		printk("%s t2_mcheck(cpu%d): last_taken 0x%x - "
-		       "any_expected 0x%x - code 0x%x\n",
-		       (mcheck_expected(cpu) ? "EX" : "UN"), cpu,
-		       t2_mcheck_last_taken, t2_mcheck_any_expected,
-		       (unsigned int)mchk_header->code);
+		printk(KERN_DEBUG PFX 
+			"%s t2_mcheck(cpu%d): last_taken 0x%x - "
+			"any_expected 0x%x - code 0x%x\n",
+			(mcheck_expected(cpu) ? "EX" : "UN"), cpu,
+			t2_mcheck_last_taken, t2_mcheck_any_expected,
+			(unsigned int)mchk_header->code);
 	}
 #endif
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
