From: Mark Broadbent <markb@wetlettuce.com>
Date: Thu, 08 Jul 2004 18:45:37 +0000
Subject: Re: [Kernel-janitors] [PATCH] IO-APIC debug message reducti
Message-Id: <1089312337.3147.34.camel@pooh.wireless.wetlettuce.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68375722697481267=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1089145628.2957.9.camel@tigger>
In-Reply-To: <1089145628.2957.9.camel@tigger>
To: kernel-janitors@vger.kernel.org

--===============68375722697481267==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

All,

On Wed, 2004-07-07 at 22:03, Randy.Dunlap wrote:
> On Wed, 07 Jul 2004 21:29:36 +0100 Mark Broadbent wrote:
> 
> The BSS section of data is cleared to zero by kernel init...
> (somewhere :)

Found a reference to it (for my peace of mind) it's done in
arch/i386/kernel/head.S:70.  It has the following comment...

...
 * Clear BSS first so that there are no surprises...
...

> |     for (i = 0; i < max; i++) {
> | -           printk(KERN_DEBUG "... PIRQ%d -> IRQ %d\n", i,
ints[i+1]);
> | +           ioapic_printk(IOAPIC_VERBOSE, KERN_DEBUG 
> | +                           "... PIRQ%d -> IRQ %d\n", i, ints[i+1]);
> 
> I'm a little confused about having both a verbosity level and a
> printk message level here.  Did you make sure that your uses of
> them are consistent?  Can the KERN_ level be removed or automatically
> inserted in ioapic_printk() ?

This is done deliberately as the apic code uses a lot of constructs
like:

printk(KERN_DEBUG "Pin map...");
for (...) {
        printk("%d->%d ", pina, pinb);
printk("...\n"); 

and I've checked the usage is consistent.

> | -   printk(" failed.\n");
> | +   ioapic_printk(IOAPIC_VERBOSE, " failed.\n");
> 
> Print always ?

OK, changed.

> | -   printk(" failed :(.\n");
> | -   panic("IO-APIC + timer doesn't work! pester mingo@redhat.com");
> | +   ioapic_printk(IOAPIC_VERBOSE, " failed :(.\n");
> 
> I'd prefer to see this print even if booted with ioapic=quiet.

OK, changed.

New patch below

Thanks
Mark

Index: linux-2.6.7/arch/i386/kernel/io_apic.c
===================================================================
--- linux-2.6.7/arch/i386/kernel/io_apic.c	(revision 1)
+++ linux-2.6.7/arch/i386/kernel/io_apic.c	(working copy)
@@ -84,7 +84,23 @@
 #define vector_to_irq(vector)	(vector)
 #endif
 
+#define IOAPIC_QUIET   0
+#define IOAPIC_VERBOSE 1
+#define IOAPIC_DEBUG   2
+
 /*
+ * Define the default level of output to be very little
+ * This can be turned up by using apic=verbose for more
+ * information and apic=debug for _lots_ of information.
+ */
+static int ioapic_verbosity;
+
+#define ioapic_printk(v, s, a...) do {       \
+		if ((v) >= ioapic_verbosity) \
+			printk(s, ##a);      \
+	} while (0)
+
+/*
  * The common case is 1:1 IRQ<->pin mappings. Sometimes there are
  * shared ISA-space IRQs, so we have to support them. We are super
  * fast in the common case, and fast for shared ISA-space IRQs.
@@ -745,13 +761,15 @@
 		pirq_entries[i] = -1;
 
 	pirqs_enabled = 1;
-	printk(KERN_INFO "PIRQ redirection, working around broken
MP-BIOS.\n");
+	ioapic_printk(IOAPIC_VERBOSE, KERN_INFO 
+			"PIRQ redirection, working around broken MP-BIOS.\n");
 	max = MAX_PIRQS;
 	if (ints[0] < MAX_PIRQS)
 		max = ints[0];
 
 	for (i = 0; i < max; i++) {
-		printk(KERN_DEBUG "... PIRQ%d -> IRQ %d\n", i, ints[i+1]);
+		ioapic_printk(IOAPIC_VERBOSE, KERN_DEBUG 
+				"... PIRQ%d -> IRQ %d\n", i, ints[i+1]);
 		/*
 		 * PIRQs are mapped upside down, usually.
 		 */
@@ -762,6 +780,21 @@
 
 __setup("pirq=", ioapic_pirq_setup);
 
+static int __init ioapic_set_verbosity(char *str)
+{
+	if (strcmp("debug", str) == 0)
+		ioapic_verbosity = IOAPIC_DEBUG;
+	else if (strcmp("verbose", str) == 0)
+		ioapic_verbosity = IOAPIC_VERBOSE;
+	else
+		printk(KERN_WARNING "IO-APIC Verbosity level %s not recognised"
+				" use ioapic=verbose or ioapic=debug", str);
+
+	return 0;
+}
+
+__setup("ioapic=", ioapic_set_verbosity);
+
 /*
  * Find the IRQ entry number of a certain pin.
  */
@@ -881,7 +914,8 @@
 		unsigned int port = 0x4d0 + (irq >> 3);
 		return (inb(port) >> (irq & 7)) & 1;
 	}
-	printk(KERN_INFO "Broken MPtable reports ISA irq %d\n", irq);
+	ioapic_printk(IOAPIC_VERBOSE, KERN_INFO 
+			"Broken MPtable reports ISA irq %d\n", irq);
 	return 0;
 }
 
@@ -1123,10 +1157,12 @@
 	if ((pin >= 16) && (pin <= 23)) {
 		if (pirq_entries[pin-16] != -1) {
 			if (!pirq_entries[pin-16]) {
-				printk(KERN_DEBUG "disabling PIRQ%d\n", pin-16);
+				ioapic_printk(IOAPIC_VERBOSE, KERN_DEBUG 
+						"disabling PIRQ%d\n", pin-16);
 			} else {
 				irq = pirq_entries[pin-16];
-				printk(KERN_DEBUG "using PIRQ%d -> IRQ %d\n",
+				ioapic_printk(IOAPIC_VERBOSE, KERN_DEBUG 
+						"using PIRQ%d -> IRQ %d\n",
 						pin-16, irq);
 			}
 		}
@@ -1216,7 +1252,7 @@
 	int apic, pin, idx, irq, first_notcon = 1, vector;
 	unsigned long flags;
 
-	printk(KERN_DEBUG "init IO_APIC IRQs\n");
+	ioapic_printk(IOAPIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
 
 	for (apic = 0; apic < nr_ioapics; apic++) {
 	for (pin = 0; pin < nr_ioapic_registers[apic]; pin++) {
@@ -1235,10 +1271,14 @@
 		idx = find_irq_entry(apic,pin,mp_INT);
 		if (idx == -1) {
 			if (first_notcon) {
-				printk(KERN_DEBUG " IO-APIC (apicid-pin) %d-%d",
mp_ioapics[apic].mpc_apicid, pin);
+				ioapic_printk(IOAPIC_VERBOSE, KERN_DEBUG 
+						" IO-APIC (apicid-pin) %d-%d", 
+						mp_ioapics[apic].mpc_apicid, 
+						pin);
 				first_notcon = 0;
 			} else
-				printk(", %d-%d", mp_ioapics[apic].mpc_apicid, pin);
+				ioapic_printk(IOAPIC_VERBOSE, ", %d-%d", 
+					mp_ioapics[apic].mpc_apicid, pin);
 			continue;
 		}
 
@@ -1279,7 +1319,7 @@
 	}
 
 	if (!first_notcon)
-		printk(" not connected.\n");
+		ioapic_printk(IOAPIC_VERBOSE, " not connected.\n");
 }
 
 /*
@@ -1339,6 +1379,9 @@
 	union IO_APIC_reg_03 reg_03;
 	unsigned long flags;
 
+	if (ioapic_verbosity == IOAPIC_QUIET)
+		return;
+		
  	printk(KERN_DEBUG "number of MP IRQ sources: %d.\n", mp_irq_entries);
 	for (i = 0; i < nr_ioapics; i++)
 		printk(KERN_DEBUG "number of IO-APIC #%d registers: %d.\n",
@@ -1476,6 +1519,9 @@
 	unsigned int v;
 	int i, j;
 
+	if (ioapic_verbosity == IOAPIC_QUIET)
+		return;
+		
 	printk(KERN_DEBUG "0123456789abcdef0123456789abcdef\n" KERN_DEBUG);
 	for (i = 0; i < 8; i++) {
 		v = apic_read(base + i*0x10);
@@ -1493,6 +1539,9 @@
 {
 	unsigned int v, ver, maxlvt;
 
+	if (ioapic_verbosity == IOAPIC_QUIET)
+		return;
+		
 	printk("\n" KERN_DEBUG "printing local APIC contents on CPU#%d/%d:\n",
 		smp_processor_id(), hard_smp_processor_id());
 	v = apic_read(APIC_ID);
@@ -1580,6 +1629,9 @@
 	unsigned int v;
 	unsigned long flags;
 
+	if (ioapic_verbosity == IOAPIC_QUIET)
+		return;
+		
 	printk(KERN_DEBUG "\nprinting PIC contents\n");
 
 	spin_lock_irqsave(&i8259A_lock, flags);
@@ -1734,8 +1786,9 @@
 		 * Read the right value from the MPC table and
 		 * write it into the ID register.
 	 	 */
-		printk(KERN_INFO "...changing IO-APIC physical APIC ID to %d ...",
-					mp_ioapics[apic].mpc_apicid);
+		ioapic_printk(IOAPIC_VERBOSE, KERN_INFO 
+			"...changing IO-APIC physical APIC ID to %d ...",
+			mp_ioapics[apic].mpc_apicid);
 
 		reg_00.bits.ID = mp_ioapics[apic].mpc_apicid;
 		spin_lock_irqsave(&ioapic_lock, flags);
@@ -1751,7 +1804,7 @@
 		if (reg_00.bits.ID != mp_ioapics[apic].mpc_apicid)
 			panic("could not set ID!\n");
 		else
-			printk(" ok.\n");
+			ioapic_printk(IOAPIC_VERBOSE, " ok.\n");
 	}
 }
 #else
@@ -2085,11 +2138,11 @@
 	 * is from Maciej W. Rozycki - so we do not have to EOI from
 	 * the NMI handler or the timer interrupt.
 	 */ 
-	printk(KERN_INFO "activating NMI Watchdog ...");
+	ioapic_printk(IOAPIC_VERBOSE, KERN_INFO "activating NMI Watchdog
...");
 
 	on_each_cpu(enable_NMI_through_LVT0, NULL, 1, 1);
 
-	printk(" done.\n");
+	ioapic_printk(IOAPIC_VERBOSE, " done.\n");
 }
 
 /*
@@ -2266,7 +2319,8 @@
 		return;
 	}
 	printk(" failed :(.\n");
-	panic("IO-APIC + timer doesn't work! pester mingo@redhat.com");
+	panic("IO-APIC + timer doesn't work! ensure you boot with "
+		"ioapic=debug and pester mingo@redhat.com");
 }
 
 /*
@@ -2390,7 +2444,8 @@
 			panic("IOAPIC[%d]: Unable change apic_id!\n", ioapic);
 	}
 
-	printk(KERN_INFO "IOAPIC[%d]: Assigned apic_id %d\n", ioapic,
apic_id);
+	ioapic_printk(IOAPIC_VERBOSE, KERN_INFO 
+			"IOAPIC[%d]: Assigned apic_id %d\n", ioapic, apic_id);
 
 	return apic_id;
 }



--===============68375722697481267==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68375722697481267==--
