From: Mark Broadbent <markb@wetlettuce.com>
Date: Tue, 06 Jul 2004 20:27:08 +0000
Subject: [Kernel-janitors] [PATCH] IO-APIC debug message reduction at
Message-Id: <1089145628.2957.9.camel@tigger>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-6+i1QaV1uM1pq4MmNoAS"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--=-6+i1QaV1uM1pq4MmNoAS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi All,

Below is a patch that reduces the amount of debug information given out
by the IO-APIC initialisation.

Comments welcome, please be gentle as this is my first patch.

Thanks
Mark



--=-6+i1QaV1uM1pq4MmNoAS
Content-Disposition: attachment; filename=ioapic-output-reduction.patch
Content-Type: text/x-patch; name=ioapic-output-reduction.patch;
	charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

--- linux-2.6.7/arch/i386/kernel/io_apic.c	2004-07-06 21:07:29.000000000 +0100
+++ linux/arch/i386/kernel/io_apic.c	2004-07-06 21:15:26.000000000 +0100
@@ -84,6 +84,17 @@
 #define vector_to_irq(vector)	(vector)
 #endif
 
+#define IOAPIC_QUIET   (0)
+#define IOAPIC_VERBOSE (1)
+#define IOAPIC_DEBUG   (2)
+
+/*
+ * Define the default level of output to be very little
+ * This can be turned up by using apic=verbose for more
+ * information and apic=debug for _lots_ of information.
+ */
+static int ioapic_verbosity = 0;
+
 /*
  * The common case is 1:1 IRQ<->pin mappings. Sometimes there are
  * shared ISA-space IRQs, so we have to support them. We are super
@@ -734,6 +745,26 @@
 
 __setup("noapic", ioapic_setup);
 
+static int __init ioapic_set_verbosity(char *str)
+{
+	if (strcmp("debug", str) == 0)
+	{
+		ioapic_verbosity = IOAPIC_DEBUG;
+	}
+	else if (strcmp("verbose", str) == 0)
+	{
+		ioapic_verbosity = IOAPIC_VERBOSE;
+	}
+	else
+	{
+		printk(KERN_WARNING "IO-APIC Verbosity level %s not recognised, use ioapic=verbose or ioapic=debug", str);
+	}
+
+	return 0;
+}
+
+__setup("ioapic=", ioapic_set_verbosity);
+
 static int __init ioapic_pirq_setup(char *str)
 {
 	int i, max;
@@ -745,13 +776,16 @@
 		pirq_entries[i] = -1;
 
 	pirqs_enabled = 1;
-	printk(KERN_INFO "PIRQ redirection, working around broken MP-BIOS.\n");
+
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(KERN_INFO "PIRQ redirection, working around broken MP-BIOS.\n");
 	max = MAX_PIRQS;
 	if (ints[0] < MAX_PIRQS)
 		max = ints[0];
 
 	for (i = 0; i < max; i++) {
-		printk(KERN_DEBUG "... PIRQ%d -> IRQ %d\n", i, ints[i+1]);
+		if (ioapic_verbosity > IOAPIC_QUIET)
+			printk(KERN_DEBUG "... PIRQ%d -> IRQ %d\n", i, ints[i+1]);
 		/*
 		 * PIRQs are mapped upside down, usually.
 		 */
@@ -1122,12 +1156,13 @@
 	 */
 	if ((pin >= 16) && (pin <= 23)) {
 		if (pirq_entries[pin-16] != -1) {
-			if (!pirq_entries[pin-16]) {
+			if (!pirq_entries[pin-16] && ioapic_verbosity > IOAPIC_QUIET) {
 				printk(KERN_DEBUG "disabling PIRQ%d\n", pin-16);
 			} else {
 				irq = pirq_entries[pin-16];
-				printk(KERN_DEBUG "using PIRQ%d -> IRQ %d\n",
-						pin-16, irq);
+				if (ioapic_verbosity > IOAPIC_QUIET)
+					printk(KERN_DEBUG "using PIRQ%d -> IRQ %d\n",
+						   pin-16, irq);
 			}
 		}
 	}
@@ -1216,7 +1251,8 @@
 	int apic, pin, idx, irq, first_notcon = 1, vector;
 	unsigned long flags;
 
-	printk(KERN_DEBUG "init IO_APIC IRQs\n");
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(KERN_DEBUG "init IO_APIC IRQs\n");
 
 	for (apic = 0; apic < nr_ioapics; apic++) {
 	for (pin = 0; pin < nr_ioapic_registers[apic]; pin++) {
@@ -1235,9 +1271,10 @@
 		idx = find_irq_entry(apic,pin,mp_INT);
 		if (idx == -1) {
 			if (first_notcon) {
-				printk(KERN_DEBUG " IO-APIC (apicid-pin) %d-%d", mp_ioapics[apic].mpc_apicid, pin);
+				if (ioapic_verbosity > IOAPIC_QUIET)
+					printk(KERN_DEBUG " IO-APIC (apicid-pin) %d-%d", mp_ioapics[apic].mpc_apicid, pin);
 				first_notcon = 0;
-			} else
+			} else if (ioapic_verbosity > IOAPIC_QUIET)
 				printk(", %d-%d", mp_ioapics[apic].mpc_apicid, pin);
 			continue;
 		}
@@ -1278,7 +1315,7 @@
 	}
 	}
 
-	if (!first_notcon)
+	if (!first_notcon && ioapic_verbosity > IOAPIC_QUIET)
 		printk(" not connected.\n");
 }
 
@@ -1339,6 +1376,9 @@
 	union IO_APIC_reg_03 reg_03;
 	unsigned long flags;
 
+ 	if (ioapic_verbosity == IOAPIC_QUIET)
+ 		return;
+ 	
  	printk(KERN_DEBUG "number of MP IRQ sources: %d.\n", mp_irq_entries);
 	for (i = 0; i < nr_ioapics; i++)
 		printk(KERN_DEBUG "number of IO-APIC #%d registers: %d.\n",
@@ -1476,6 +1516,9 @@
 	unsigned int v;
 	int i, j;
 
+	if (ioapic_verbosity == IOAPIC_QUIET)
+		return;
+	
 	printk(KERN_DEBUG "0123456789abcdef0123456789abcdef\n" KERN_DEBUG);
 	for (i = 0; i < 8; i++) {
 		v = apic_read(base + i*0x10);
@@ -1493,6 +1536,9 @@
 {
 	unsigned int v, ver, maxlvt;
 
+	if (ioapic_verbosity == IOAPIC_QUIET)
+		return;
+	
 	printk("\n" KERN_DEBUG "printing local APIC contents on CPU#%d/%d:\n",
 		smp_processor_id(), hard_smp_processor_id());
 	v = apic_read(APIC_ID);
@@ -1580,6 +1626,9 @@
 	unsigned int v;
 	unsigned long flags;
 
+	if (ioapic_verbosity == IOAPIC_QUIET)
+		return;
+	
 	printk(KERN_DEBUG "\nprinting PIC contents\n");
 
 	spin_lock_irqsave(&i8259A_lock, flags);
@@ -2085,11 +2134,13 @@
 	 * is from Maciej W. Rozycki - so we do not have to EOI from
 	 * the NMI handler or the timer interrupt.
 	 */ 
-	printk(KERN_INFO "activating NMI Watchdog ...");
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(KERN_INFO "activating NMI Watchdog ...");
 
 	on_each_cpu(enable_NMI_through_LVT0, NULL, 1, 1);
 
-	printk(" done.\n");
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(" done.\n");
 }
 
 /*
@@ -2187,7 +2238,8 @@
 	pin1 = find_isa_irq_pin(0, mp_INT);
 	pin2 = find_isa_irq_pin(0, mp_ExtINT);
 
-	printk(KERN_INFO "..TIMER: vector=0x%02X pin1=%d pin2=%d\n", vector, pin1, pin2);
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(KERN_INFO "..TIMER: vector=0x%02X pin1=%d pin2=%d\n", vector, pin1, pin2);
 
 	if (pin1 != -1) {
 		/*
@@ -2207,15 +2259,19 @@
 		printk(KERN_ERR "..MP-BIOS bug: 8254 timer not connected to IO-APIC\n");
 	}
 
-	printk(KERN_INFO "...trying to set up timer (IRQ0) through the 8259A ... ");
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(KERN_INFO "...trying to set up timer (IRQ0) through the 8259A ... ");
+	
 	if (pin2 != -1) {
-		printk("\n..... (found pin %d) ...", pin2);
+		if (ioapic_verbosity > IOAPIC_QUIET)
+			printk("\n..... (found pin %d) ...", pin2);
 		/*
 		 * legacy devices should be connected to IO APIC #0
 		 */
 		setup_ExtINT_IRQ0_pin(pin2, vector);
 		if (timer_irq_works()) {
-			printk("works.\n");
+			if (ioapic_verbosity > IOAPIC_QUIET)
+				printk("works.\n");
 			if (pin1 != -1)
 				replace_pin_at_irq(0, 0, pin1, 0, pin2);
 			else
@@ -2231,14 +2287,16 @@
 		 */
 		clear_IO_APIC_pin(0, pin2);
 	}
-	printk(" failed.\n");
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(" failed.\n");
 
 	if (nmi_watchdog == NMI_IO_APIC) {
 		printk(KERN_WARNING "timer doesn't work through the IO-APIC - disabling NMI Watchdog!\n");
 		nmi_watchdog = 0;
 	}
 
-	printk(KERN_INFO "...trying to set up timer as Virtual Wire IRQ...");
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(KERN_INFO "...trying to set up timer as Virtual Wire IRQ...");
 
 	disable_8259A_irq(0);
 	irq_desc[0].handler = &lapic_irq_type;
@@ -2246,13 +2304,16 @@
 	enable_8259A_irq(0);
 
 	if (timer_irq_works()) {
-		printk(" works.\n");
+		if (ioapic_verbosity > IOAPIC_QUIET)
+			printk(" works.\n");
 		return;
 	}
 	apic_write_around(APIC_LVT0, APIC_LVT_MASKED | APIC_DM_FIXED | vector);
-	printk(" failed.\n");
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(" failed.\n");
 
-	printk(KERN_INFO "...trying to set up timer as ExtINT IRQ...");
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(KERN_INFO "...trying to set up timer as ExtINT IRQ...");
 
 	timer_ack = 0;
 	init_8259A(0);
@@ -2262,11 +2323,13 @@
 	unlock_ExtINT_logic();
 
 	if (timer_irq_works()) {
-		printk(" works.\n");
+		if (ioapic_verbosity > IOAPIC_QUIET)
+			printk(" works.\n");
 		return;
 	}
-	printk(" failed :(.\n");
-	panic("IO-APIC + timer doesn't work! pester mingo@redhat.com");
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(" failed :(.\n");
+	panic("IO-APIC + timer doesn't work! Boot with ioapic=debug and pester mingo@redhat.com");
 }
 
 /*
@@ -2287,7 +2350,8 @@
 	else
 		io_apic_irqs = ~PIC_IRQS;
 
-	printk("ENABLING IO-APIC IRQs\n");
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk("ENABLING IO-APIC IRQs\n");
 
 	/*
 	 * Set up IO-APIC IRQ routing.
@@ -2390,7 +2454,8 @@
 			panic("IOAPIC[%d]: Unable change apic_id!\n", ioapic);
 	}
 
-	printk(KERN_INFO "IOAPIC[%d]: Assigned apic_id %d\n", ioapic, apic_id);
+	if (ioapic_verbosity > IOAPIC_QUIET)
+		printk(KERN_INFO "IOAPIC[%d]: Assigned apic_id %d\n", ioapic, apic_id);
 
 	return apic_id;
 }

--=-6+i1QaV1uM1pq4MmNoAS
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--=-6+i1QaV1uM1pq4MmNoAS--
