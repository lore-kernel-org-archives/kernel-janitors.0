From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 30 Sep 2005 13:51:08 +0000
Subject: [KJ] [PATCH] printk : arch/i386/apic.c
Message-Id: <20050930135108.GD21296@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============055271396792414329=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============055271396792414329==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.14-rc2/arch/i386/kernel/apic.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/i386/kernel/apic.c
+++ linux-2.6.14-rc2/arch/i386/kernel/apic.c
@@ -60,7 +60,7 @@ static void apic_pm_activate(void);
  */
 void ack_bad_irq(unsigned int irq)
 {
-	printk("unexpected IRQ trap at vector %02x\n", irq);
+	printk(KERN_ERR "unexpected IRQ trap at vector %02x\n", irq);
 	/*
 	 * Currently unexpected vectors happen only on SMP and APIC.
 	 * We _must_ ack these because every local APIC has only N
@@ -546,9 +546,9 @@ void __devinit setup_local_APIC(void)
 			 * ESR disabled - we can't do anything useful with the
 			 * errors anyway - mbligh
 			 */
-			printk("Leaving ESR disabled.\n");
+			printk(KERN_INFO "Leaving ESR disabled.\n");
 		else 
-			printk("No ESR for 82489DX.\n");
+			printk(KERN_INFO "No ESR for 82489DX.\n");
 	}
 
 	if (nmi_watchdog == NMI_LOCAL_APIC)
@@ -752,7 +752,7 @@ static int __init detect_init_APIC (void
 		 * APIC only if "lapic" specified.
 		 */
 		if (enable_local_apic <= 0) {
-			printk("Local APIC disabled by BIOS -- "
+			printk(KERN_INFO "Local APIC disabled by BIOS -- "
 			       "you can enable it with \"lapic\"\n");
 			return -1;
 		}
@@ -764,7 +764,7 @@ static int __init detect_init_APIC (void
 		 */
 		rdmsr(MSR_IA32_APICBASE, l, h);
 		if (!(l & MSR_IA32_APICBASE_ENABLE)) {
-			printk("Local APIC disabled by BIOS -- reenabling.\n");
+			printk(KERN_INFO "Local APIC disabled by BIOS -- reenabling.\n");
 			l &= ~MSR_IA32_APICBASE_BASE;
 			l |= MSR_IA32_APICBASE_ENABLE | APIC_DEFAULT_PHYS_BASE;
 			wrmsr(MSR_IA32_APICBASE, l, h);
@@ -777,7 +777,7 @@ static int __init detect_init_APIC (void
 	 */
 	features = cpuid_edx(1);
 	if (!(features & (1 << X86_FEATURE_APIC))) {
-		printk("Could not enable APIC!\n");
+		printk(KERN_WARNING "Could not enable APIC!\n");
 		return -1;
 	}
 	set_bit(X86_FEATURE_APIC, boot_cpu_data.x86_capability);
@@ -791,14 +791,14 @@ static int __init detect_init_APIC (void
 	if (nmi_watchdog != NMI_NONE)
 		nmi_watchdog = NMI_LOCAL_APIC;
 
-	printk("Found and enabled local APIC!\n");
+	printk(KERN_INFO "Found and enabled local APIC!\n");
 
 	apic_pm_activate();
 
 	return 0;
 
 no_apic:
-	printk("No local APIC present or hardware disabled\n");
+	printk(KERN_INFO "No local APIC present or hardware disabled\n");
 	return -1;
 }
 
@@ -1249,7 +1249,7 @@ fastcall void smp_error_interrupt(struct
 	   6: Received illegal vector
 	   7: Illegal register address
 	*/
-	printk (KERN_DEBUG "APIC error on CPU%d: %02lx(%02lx)\n",
+	printk(KERN_DEBUG "APIC error on CPU%d: %02lx(%02lx)\n",
 	        smp_processor_id(), v , v1);
 	irq_exit();
 }


--===============055271396792414329==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============055271396792414329==--
