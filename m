From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 22 Sep 2005 09:15:23 +0000
Subject: [KJ] printk : arch/alpha/kernel/core_t2.c
Message-Id: <20050922091523.GG3818@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70317840104496432=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70317840104496432==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.14-rc2/arch/alpha/kernel/core_t2.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/core_t2.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/core_t2.c
@@ -335,7 +335,7 @@ t2_direct_map_window1(unsigned long base
 	*(vulp)T2_TBASE1 = 0;
 
 #if DEBUG_PRINT_FINAL_SETTINGS
-	printk("%s: setting WBASE1=0x%lx WMASK1=0x%lx TBASE1=0x%lx\n",
+	printk(KERN_DEBUG "%s: setting WBASE1=0x%lx WMASK1=0x%lx TBASE1=0x%lx\n",
 	       __FUNCTION__,
 	       *(vulp)T2_WBASE1,
 	       *(vulp)T2_WMASK1,
@@ -365,7 +365,7 @@ t2_sg_map_window2(struct pci_controller 
 	t2_pci_tbi(hose, 0, -1); /* flush TLB all */
 
 #if DEBUG_PRINT_FINAL_SETTINGS
-	printk("%s: setting WBASE2=0x%lx WMASK2=0x%lx TBASE2=0x%lx\n",
+	printk(KERN_DEBUG "%s: setting WBASE2=0x%lx WMASK2=0x%lx TBASE2=0x%lx\n",
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
+	printk(KERN_DEBUG "%s: HAE_1 was 0x%lx\n", __FUNCTION__, srm_hae); /* HW is 0 */
+	printk(KERN_DEBUG "%s: HAE_2 was 0x%lx\n", __FUNCTION__, *(vulp)T2_HAE_2);
+	printk(KERN_DEBUG "%s: HAE_3 was 0x%lx\n", __FUNCTION__, *(vulp)T2_HAE_3);
+	printk(KERN_DEBUG "%s: HAE_4 was 0x%lx\n", __FUNCTION__, *(vulp)T2_HAE_4);
+	printk(KERN_DEBUG "%s: HBASE was 0x%lx\n", __FUNCTION__, *(vulp)T2_HBASE);
 
-	printk("%s: WBASE1=0x%lx WMASK1=0x%lx TBASE1=0x%lx\n", __FUNCTION__, 
+	printk(KERN_DEBUG "%s: WBASE1=0x%lx WMASK1=0x%lx TBASE1=0x%lx\n", __FUNCTION__, 
 	       *(vulp)T2_WBASE1, *(vulp)T2_WMASK1, *(vulp)T2_TBASE1);
-	printk("%s: WBASE2=0x%lx WMASK2=0x%lx TBASE2=0x%lx\n", __FUNCTION__, 
+	printk(KERN_DEBUG "%s: WBASE2=0x%lx WMASK2=0x%lx TBASE2=0x%lx\n", __FUNCTION__, 
 	       *(vulp)T2_WBASE2, *(vulp)T2_WMASK2, *(vulp)T2_TBASE2);
 #endif
 
@@ -423,7 +423,7 @@ t2_init_arch(void)
 	/* Enable scatter/gather TLB use.  */
 	temp = *(vulp)T2_IOCSR;
 	if (!(temp & (0x1UL << 26))) {
-		printk("t2_init_arch: enabling SG TLB, IOCSR was 0x%lx\n",
+		printk(KERN_INFO "t2_init_arch: enabling SG TLB, IOCSR was 0x%lx\n",
 		       temp);
 		*(vulp)T2_IOCSR = temp | (0x1UL << 26);
 		mb();	
@@ -580,7 +580,7 @@ t2_machine_check(unsigned long vector, u
 		 */
 #ifdef CONFIG_VERBOSE_MCHECK
 		if (alpha_verbose_mcheck > 1) {
-			printk("t2_machine_check(cpu%d): any_expected 0x%x -"
+			printk(KERN_INFO "t2_machine_check(cpu%d): any_expected 0x%x -"
 			       " (assumed) spurious -"
 			       " code 0x%x\n", cpu, t2_mcheck_any_expected,
 			       (unsigned int)mchk_header->code);
@@ -593,7 +593,7 @@ t2_machine_check(unsigned long vector, u
 		if (t2_mcheck_last_taken & (1 << cpu)) {
 #ifdef CONFIG_VERBOSE_MCHECK
 		    if (alpha_verbose_mcheck > 1) {
-			printk("t2_machine_check(cpu%d): last_taken 0x%x - "
+			printk(KERN_INFO "t2_machine_check(cpu%d): last_taken 0x%x - "
 			       "unexpected mcheck - code 0x%x\n",
 			       cpu, t2_mcheck_last_taken,
 			       (unsigned int)mchk_header->code);
@@ -610,7 +610,7 @@ t2_machine_check(unsigned long vector, u
 
 #ifdef CONFIG_VERBOSE_MCHECK
 	if (alpha_verbose_mcheck > 1) {
-		printk("%s t2_mcheck(cpu%d): last_taken 0x%x - "
+		printk(KERN_INFO "%s t2_mcheck(cpu%d): last_taken 0x%x - "
 		       "any_expected 0x%x - code 0x%x\n",
 		       (mcheck_expected(cpu) ? "EX" : "UN"), cpu,
 		       t2_mcheck_last_taken, t2_mcheck_any_expected,


--===============70317840104496432==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70317840104496432==--
