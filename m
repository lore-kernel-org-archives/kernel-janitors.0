From: Mark Broadbent <markb@wetlettuce.com>
Date: Sat, 10 Jul 2004 00:56:53 +0000
Subject: Re: [Kernel-janitors] [PATCH] IO-APIC debug message reducti
Message-Id: <1089421013.3154.2.camel@pooh.wireless.wetlettuce.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3177716745085355=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1089145628.2957.9.camel@tigger>
In-Reply-To: <1089145628.2957.9.camel@tigger>
To: kernel-janitors@vger.kernel.org

--===============3177716745085355==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

> IOAPIC_DEBUG should also activate the Dprintk() statements normally
> activated via editing include/asm-i386/apic.h:
> 
> #define APIC_DEBUG 0

Expanded the output reduction to covert the Dprintk's in apic.c to
apic_printk.  Rediffed and attached.

Thanks
Mark

Index: linux-2.6.7/include/asm-i386/apic.h
===================================================================
--- linux-2.6.7/include/asm-i386/apic.h	(revision 1)
+++ linux-2.6.7/include/asm-i386/apic.h	(working copy)
@@ -7,14 +7,27 @@
 #include <asm/apicdef.h>
 #include <asm/system.h>
 
-#define APIC_DEBUG 0
-
-#if APIC_DEBUG
-#define Dprintk(x...) printk(x)
-#else
 #define Dprintk(x...)
-#endif
 
+/* 
+ * Debugging macros
+ */
+#define APIC_QUIET   0
+#define APIC_VERBOSE 1
+#define APIC_DEBUG   2
+
+/*
+ * Define the default level of output to be very little
+ * This can be turned up by using apic=verbose for more
+ * information and apic=debug for _lots_ of information.
+ * apic_verbosity is defined in apic.c
+ */
+#define apic_printk(v, s, a...) do {       \
+		if ((v) >= apic_verbosity) \
+			printk(s, ##a);    \
+	} while (0)
+
+
 #ifdef CONFIG_X86_LOCAL_APIC
 
 /*
Index: linux-2.6.7/arch/i386/kernel/io_apic.c
===================================================================
--- linux-2.6.7/arch/i386/kernel/io_apic.c	(revision 1)
+++ linux-2.6.7/arch/i386/kernel/io_apic.c	(working copy)
@@ -58,6 +58,9 @@
  */
 int nr_ioapic_registers[MAX_IO_APICS];
 
+/* APIC verbosity support */
+int apic_verbosity;
+
 /*
  * Rough estimation of how many shared IRQs there are, can
  * be changed anytime.
@@ -745,13 +748,15 @@
 		pirq_entries[i] = -1;
 
 	pirqs_enabled = 1;
-	printk(KERN_INFO "PIRQ redirection, working around broken
MP-BIOS.\n");
+	apic_printk(APIC_VERBOSE, KERN_INFO 
+			"PIRQ redirection, working around broken MP-BIOS.\n");
 	max = MAX_PIRQS;
 	if (ints[0] < MAX_PIRQS)
 		max = ints[0];
 
 	for (i = 0; i < max; i++) {
-		printk(KERN_DEBUG "... PIRQ%d -> IRQ %d\n", i, ints[i+1]);
+		apic_printk(APIC_VERBOSE, KERN_DEBUG 
+				"... PIRQ%d -> IRQ %d\n", i, ints[i+1]);
 		/*
 		 * PIRQs are mapped upside down, usually.
 		 */
@@ -812,8 +817,8 @@
 {
 	int apic, i, best_guess = -1;
 
-	Dprintk("querying PCI -> IRQ mapping bus:%d, slot:%d, pin:%d.\n",
-		bus, slot, pin);
+	apic_printk(APIC_DEBUG, "querying PCI -> IRQ mapping bus:%d, "
+		"slot:%d, pin:%d.\n", bus, slot, pin);
 	if (mp_bus_id_to_pci_bus[bus] == -1) {
 		printk(KERN_WARNING "PCI BIOS passed nonexistent PCI bus %d!\n",
bus);
 		return -1;
@@ -881,7 +886,8 @@
 		unsigned int port = 0x4d0 + (irq >> 3);
 		return (inb(port) >> (irq & 7)) & 1;
 	}
-	printk(KERN_INFO "Broken MPtable reports ISA irq %d\n", irq);
+	apic_printk(APIC_VERBOSE, KERN_INFO 
+			"Broken MPtable reports ISA irq %d\n", irq);
 	return 0;
 }
 
@@ -1123,10 +1129,12 @@
 	if ((pin >= 16) && (pin <= 23)) {
 		if (pirq_entries[pin-16] != -1) {
 			if (!pirq_entries[pin-16]) {
-				printk(KERN_DEBUG "disabling PIRQ%d\n", pin-16);
+				apic_printk(APIC_VERBOSE, KERN_DEBUG 
+						"disabling PIRQ%d\n", pin-16);
 			} else {
 				irq = pirq_entries[pin-16];
-				printk(KERN_DEBUG "using PIRQ%d -> IRQ %d\n",
+				apic_printk(APIC_VERBOSE, KERN_DEBUG 
+						"using PIRQ%d -> IRQ %d\n",
 						pin-16, irq);
 			}
 		}
@@ -1216,7 +1224,7 @@
 	int apic, pin, idx, irq, first_notcon = 1, vector;
 	unsigned long flags;
 
-	printk(KERN_DEBUG "init IO_APIC IRQs\n");
+	apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
 
 	for (apic = 0; apic < nr_ioapics; apic++) {
 	for (pin = 0; pin < nr_ioapic_registers[apic]; pin++) {
@@ -1235,10 +1243,14 @@
 		idx = find_irq_entry(apic,pin,mp_INT);
 		if (idx == -1) {
 			if (first_notcon) {
-				printk(KERN_DEBUG " IO-APIC (apicid-pin) %d-%d",
mp_ioapics[apic].mpc_apicid, pin);
+				apic_printk(APIC_VERBOSE, KERN_DEBUG 
+						" IO-APIC (apicid-pin) %d-%d", 
+						mp_ioapics[apic].mpc_apicid, 
+						pin);
 				first_notcon = 0;
 			} else
-				printk(", %d-%d", mp_ioapics[apic].mpc_apicid, pin);
+				apic_printk(APIC_VERBOSE, ", %d-%d", 
+					mp_ioapics[apic].mpc_apicid, pin);
 			continue;
 		}
 
@@ -1279,7 +1291,7 @@
 	}
 
 	if (!first_notcon)
-		printk(" not connected.\n");
+		apic_printk(APIC_VERBOSE, " not connected.\n");
 }
 
 /*
@@ -1339,6 +1351,9 @@
 	union IO_APIC_reg_03 reg_03;
 	unsigned long flags;
 
+	if (apic_verbosity == APIC_QUIET)
+		return;
+		
  	printk(KERN_DEBUG "number of MP IRQ sources: %d.\n", mp_irq_entries);
 	for (i = 0; i < nr_ioapics; i++)
 		printk(KERN_DEBUG "number of IO-APIC #%d registers: %d.\n",
@@ -1476,6 +1491,9 @@
 	unsigned int v;
 	int i, j;
 
+	if (apic_verbosity == APIC_QUIET)
+		return;
+		
 	printk(KERN_DEBUG "0123456789abcdef0123456789abcdef\n" KERN_DEBUG);
 	for (i = 0; i < 8; i++) {
 		v = apic_read(base + i*0x10);
@@ -1493,6 +1511,9 @@
 {
 	unsigned int v, ver, maxlvt;
 
+	if (apic_verbosity == APIC_QUIET)
+		return;
+		
 	printk("\n" KERN_DEBUG "printing local APIC contents on CPU#%d/%d:\n",
 		smp_processor_id(), hard_smp_processor_id());
 	v = apic_read(APIC_ID);
@@ -1580,6 +1601,9 @@
 	unsigned int v;
 	unsigned long flags;
 
+	if (apic_verbosity == APIC_QUIET)
+		return;
+		
 	printk(KERN_DEBUG "\nprinting PIC contents\n");
 
 	spin_lock_irqsave(&i8259A_lock, flags);
@@ -1715,7 +1739,9 @@
 		} else {
 			physid_mask_t tmp;
 			tmp = apicid_to_cpu_present(mp_ioapics[apic].mpc_apicid);
-			printk("Setting %d in the phys_id_present_map\n",
mp_ioapics[apic].mpc_apicid);
+			apic_printk(APIC_VERBOSE, "Setting %d in the "
+					"phys_id_present_map\n", 
+					mp_ioapics[apic].mpc_apicid);
 			physids_or(phys_id_present_map, phys_id_present_map, tmp);
 		}
 
@@ -1734,8 +1760,9 @@
 		 * Read the right value from the MPC table and
 		 * write it into the ID register.
 	 	 */
-		printk(KERN_INFO "...changing IO-APIC physical APIC ID to %d ...",
-					mp_ioapics[apic].mpc_apicid);
+		apic_printk(APIC_VERBOSE, KERN_INFO 
+			"...changing IO-APIC physical APIC ID to %d ...",
+			mp_ioapics[apic].mpc_apicid);
 
 		reg_00.bits.ID = mp_ioapics[apic].mpc_apicid;
 		spin_lock_irqsave(&ioapic_lock, flags);
@@ -1751,7 +1778,7 @@
 		if (reg_00.bits.ID != mp_ioapics[apic].mpc_apicid)
 			panic("could not set ID!\n");
 		else
-			printk(" ok.\n");
+			apic_printk(APIC_VERBOSE, " ok.\n");
 	}
 }
 #else
@@ -2085,11 +2112,11 @@
 	 * is from Maciej W. Rozycki - so we do not have to EOI from
 	 * the NMI handler or the timer interrupt.
 	 */ 
-	printk(KERN_INFO "activating NMI Watchdog ...");
+	apic_printk(APIC_VERBOSE, KERN_INFO "activating NMI Watchdog ...");
 
 	on_each_cpu(enable_NMI_through_LVT0, NULL, 1, 1);
 
-	printk(" done.\n");
+	apic_printk(APIC_VERBOSE, " done.\n");
 }
 
 /*
@@ -2266,7 +2293,8 @@
 		return;
 	}
 	printk(" failed :(.\n");
-	panic("IO-APIC + timer doesn't work! pester mingo@redhat.com");
+	panic("IO-APIC + timer doesn't work! ensure you boot with "
+		"ioapic=debug and pester mingo@redhat.com");
 }
 
 /*
@@ -2390,7 +2418,8 @@
 			panic("IOAPIC[%d]: Unable change apic_id!\n", ioapic);
 	}
 
-	printk(KERN_INFO "IOAPIC[%d]: Assigned apic_id %d\n", ioapic,
apic_id);
+	apic_printk(APIC_VERBOSE, KERN_INFO 
+			"IOAPIC[%d]: Assigned apic_id %d\n", ioapic, apic_id);
 
 	return apic_id;
 }
@@ -2456,9 +2485,10 @@
 
 	entry.vector = assign_irq_vector(irq);
 
-	Dprintk(KERN_DEBUG "IOAPIC[%d]: Set PCI routing entry (%d-%d -> 0x%x
-> "
-		"IRQ %d Mode:%i Active:%i)\n", ioapic, 
-		mp_ioapics[ioapic].mpc_apicid, pin, entry.vector, irq, edge_level,
active_high_low);
+	apic_printk(APIC_DEBUG, KERN_DEBUG "IOAPIC[%d]: Set PCI routing entry
"
+		"(%d-%d -> 0x%x -> IRQ %d Mode:%i Active:%i)\n", ioapic, 
+		mp_ioapics[ioapic].mpc_apicid, pin, entry.vector, irq, 
+		edge_level, active_high_low);
 
  	if (use_pci_vector() && !platform_legacy_irq(irq))
 		irq = IO_APIC_VECTOR(irq);
Index: linux-2.6.7/arch/i386/kernel/apic.c
===================================================================
--- linux-2.6.7/arch/i386/kernel/apic.c	(revision 1)
+++ linux-2.6.7/arch/i386/kernel/apic.c	(working copy)
@@ -40,6 +40,15 @@
 
 #include "io_ports.h"
 
+/* 
+ * Debug level
+ */
+extern int apic_verbosity;
+
+/* Ensure io_apic can see this level as well */
+EXPORT_SYMBOL(apic_verbosity);
+
+
 static void apic_pm_activate(void);
 
 void __init apic_intr_init(void)
@@ -163,7 +172,8 @@
 		 * PIC mode, enable APIC mode in the IMCR, i.e.
 		 * connect BSP's local APIC to INT and NMI lines.
 		 */
-		printk("leaving PIC mode, enabling APIC mode.\n");
+		apic_printk(APIC_VERBOSE, "leaving PIC mode, "
+				"enabling APIC mode.\n");
 		outb(0x70, 0x22);
 		outb(0x01, 0x23);
 	}
@@ -179,7 +189,8 @@
 		 * interrupts, including IPIs, won't work beyond
 		 * this point!  The only exception are INIT IPIs.
 		 */
-		printk("disabling APIC mode, entering PIC mode.\n");
+		apic_printk(APIC_VERBOSE, "disabling APIC mode, "
+				"entering PIC mode.\n");
 		outb(0x70, 0x22);
 		outb(0x00, 0x23);
 	}
@@ -220,10 +231,10 @@
 	 * The version register is read-only in a real APIC.
 	 */
 	reg0 = apic_read(APIC_LVR);
-	Dprintk("Getting VERSION: %x\n", reg0);
+	apic_printk(APIC_DEBUG, "Getting VERSION: %x\n", reg0);
 	apic_write(APIC_LVR, reg0 ^ APIC_LVR_MASK);
 	reg1 = apic_read(APIC_LVR);
-	Dprintk("Getting VERSION: %x\n", reg1);
+	apic_printk(APIC_DEBUG, "Getting VERSION: %x\n", reg1);
 
 	/*
 	 * The two version reads above should print the same
@@ -247,7 +258,7 @@
 	 * The ID register is read/write in a real APIC.
 	 */
 	reg0 = apic_read(APIC_ID);
-	Dprintk("Getting ID: %x\n", reg0);
+	apic_printk(APIC_DEBUG, "Getting ID: %x\n", reg0);
 
 	/*
 	 * The next two are just to see if we have sane values.
@@ -255,9 +266,9 @@
 	 * compatibility mode, but most boxes are anymore.
 	 */
 	reg0 = apic_read(APIC_LVT0);
-	Dprintk("Getting LVT0: %x\n", reg0);
+	apic_printk(APIC_DEBUG, "Getting LVT0: %x\n", reg0);
 	reg1 = apic_read(APIC_LVT1);
-	Dprintk("Getting LVT1: %x\n", reg1);
+	apic_printk(APIC_DEBUG, "Getting LVT1: %x\n", reg1);
 
 	return 1;
 }
@@ -269,7 +280,7 @@
 	 */
 	apic_wait_icr_idle();
 
-	Dprintk("Synchronizing Arb IDs.\n");
+	apic_printk(APIC_DEBUG, "Synchronizing Arb IDs.\n");
 	apic_write_around(APIC_ICR, APIC_DEST_ALLINC | APIC_INT_LEVELTRIG
 				| APIC_DM_INIT);
 }
@@ -417,10 +428,12 @@
 	value = apic_read(APIC_LVT0) & APIC_LVT_MASKED;
 	if (!smp_processor_id() && (pic_mode || !value)) {
 		value = APIC_DM_EXTINT;
-		printk("enabled ExtINT on CPU#%d\n", smp_processor_id());
+		apic_printk(APIC_VERBOSE, "enabled ExtINT on CPU#%d\n", 
+				smp_processor_id());
 	} else {
 		value = APIC_DM_EXTINT | APIC_LVT_MASKED;
-		printk("masked ExtINT on CPU#%d\n", smp_processor_id());
+		apic_printk(APIC_VERBOSE, "masked ExtINT on CPU#%d\n", 
+				smp_processor_id());
 	}
 	apic_write_around(APIC_LVT0, value);
 
@@ -440,7 +453,8 @@
 		if (maxlvt > 3)		/* Due to the Pentium erratum 3AP. */
 			apic_write(APIC_ESR, 0);
 		value = apic_read(APIC_ESR);
-		printk("ESR value before enabling vector: %08lx\n", value);
+		apic_printk(APIC_VERBOSE, "ESR value before enabling vector:"
+				" %08lx\n", value);
 
 		value = ERROR_APIC_VECTOR;      // enables sending errors
 		apic_write_around(APIC_LVTERR, value);
@@ -450,7 +464,8 @@
 		if (maxlvt > 3)
 			apic_write(APIC_ESR, 0);
 		value = apic_read(APIC_ESR);
-		printk("ESR value after enabling vector: %08lx\n", value);
+		apic_printk(APIC_VERBOSE, "ESR value after enabling vector:"
+				" %08lx\n", value);
 	} else {
 		if (esr_disable)	
 			/* 
@@ -625,6 +640,21 @@
 }
 __setup("lapic", lapic_enable);
 
+static int __init apic_set_verbosity(char *str)
+{
+	if (strcmp("debug", str) == 0)
+		apic_verbosity = APIC_DEBUG;
+	else if (strcmp("verbose", str) == 0)
+		apic_verbosity = APIC_VERBOSE;
+	else
+		printk(KERN_WARNING "APIC Verbosity level %s not recognised"
+				" use apic=verbose or apic=debug", str);
+
+	return 0;
+}
+
+__setup("apic=", apic_set_verbosity);
+
 static int __init detect_init_APIC (void)
 {
 	u32 h, l, features;
@@ -661,7 +691,8 @@
 		 */
 		rdmsr(MSR_IA32_APICBASE, l, h);
 		if (!(l & MSR_IA32_APICBASE_ENABLE)) {
-			printk("Local APIC disabled by BIOS -- reenabling.\n");
+			apic_printk(APIC_VERBOSE, "Local APIC disabled "
+					"by BIOS -- reenabling.\n");
 			l &= ~MSR_IA32_APICBASE_BASE;
 			l |= MSR_IA32_APICBASE_ENABLE | APIC_DEFAULT_PHYS_BASE;
 			wrmsr(MSR_IA32_APICBASE, l, h);
@@ -688,7 +719,7 @@
 	if (nmi_watchdog != NMI_NONE)
 		nmi_watchdog = NMI_LOCAL_APIC;
 
-	printk("Found and enabled local APIC!\n");
+	apic_printk(APIC_VERBOSE, "Found and enabled local APIC!\n");
 
 	apic_pm_activate();
 
@@ -715,7 +746,8 @@
 		apic_phys = mp_lapic_addr;
 
 	set_fixmap_nocache(FIX_APIC_BASE, apic_phys);
-	Dprintk("mapped APIC to %08lx (%08lx)\n", APIC_BASE, apic_phys);
+	apic_printk(APIC_DEBUG, "mapped APIC to %08lx (%08lx)\n", APIC_BASE, 
+			apic_phys);
 
 	/*
 	 * Fetch the APIC ID of the BSP in case we have a
@@ -745,7 +777,8 @@
 				ioapic_phys = __pa(ioapic_phys);
 			}
 			set_fixmap_nocache(idx, ioapic_phys);
-			Dprintk("mapped IOAPIC to %08lx (%08lx)\n",
+			apic_printk(APIC_DEBUG, "mapped IOAPIC to "
+					"%08lx (%08lx)\n",
 					__fix_to_virt(idx), ioapic_phys);
 			idx++;
 		}
@@ -884,7 +917,7 @@
 	int i;
 	const int LOOPS = HZ/10;
 
-	printk("calibrating APIC timer ...\n");
+	apic_printk(APIC_VERBOSE, "calibrating APIC timer ...\n");
 
 	/*
 	 * Put whatever arbitrary (but long enough) timeout
@@ -929,11 +962,13 @@
 	result = (tt1-tt2)*APIC_DIVISOR/LOOPS;
 
 	if (cpu_has_tsc)
-		printk("..... CPU clock speed is %ld.%04ld MHz.\n",
+		apic_printk(APIC_VERBOSE, "..... CPU clock speed is "
+			"%ld.%04ld MHz.\n",
 			((long)(t2-t1)/LOOPS)/(1000000/HZ),
 			((long)(t2-t1)/LOOPS)%(1000000/HZ));
 
-	printk("..... host bus clock speed is %ld.%04ld MHz.\n",
+	apic_printk(APIC_VERBOSE, "..... host bus clock speed is "
+		"%ld.%04ld MHz.\n",
 		result/(1000000/HZ),
 		result%(1000000/HZ));
 
@@ -944,7 +979,7 @@
 
 void __init setup_boot_APIC_clock(void)
 {
-	printk("Using local APIC timer interrupts.\n");
+	apic_printk(APIC_VERBOSE, "Using local APIC timer interrupts.\n");
 	using_apic_timer = 1;
 
 	local_irq_disable();



--===============3177716745085355==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3177716745085355==--
