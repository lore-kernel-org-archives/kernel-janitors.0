From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 07 Jul 2004 21:03:13 +0000
Subject: Re: [Kernel-janitors] [PATCH] IO-APIC debug message reducti
Message-Id: <20040707140313.390abfa1.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65676136046131917=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1089145628.2957.9.camel@tigger>
In-Reply-To: <1089145628.2957.9.camel@tigger>
To: kernel-janitors@vger.kernel.org

--===============65676136046131917==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 07 Jul 2004 21:29:36 +0100 Mark Broadbent wrote:

| Hi,
| 
| > > +static int ioapic_verbosity = 0;
| > > +
| >
| > no need to init static variables to zero, not doing so has the 
| > advantage of moving this variable to the .bss kernel section.
| 
| Does this mean it will get set to zero automagically or must it
| be set explicitly in the code?

The BSS section of data is cleared to zero by kernel init...
(somewhere :)

| As for the other comments. I have removed unneeded parens around the if
| statements and brackets around the defined constants.  I have used a
| ioapic_printk define to replace the original printk except for the
| functions labelled print_* that break out at function start, this is
| done to reduce the size of the resulting object code (saves ~1.5kB).
| 
| Thanks for the comments, a revised patch is given below:
| 
| 
| Index: linux-2.6.7/arch/i386/kernel/io_apic.c
| ===================================================================
| --- linux-2.6.7/arch/i386/kernel/io_apic.c	(revision 1)
| +++ linux-2.6.7/arch/i386/kernel/io_apic.c	(working copy)
| @@ -84,7 +84,23 @@
|  #define vector_to_irq(vector)	(vector)
|  #endif
|  
| +#define IOAPIC_QUIET   0
| +#define IOAPIC_VERBOSE 1
| +#define IOAPIC_DEBUG   2
| +
|  /*
| + * Define the default level of output to be very little
| + * This can be turned up by using apic=verbose for more
| + * information and apic=debug for _lots_ of information.
| + */
| +static int ioapic_verbosity;
| +
| +#define ioapic_printk(v, s, a...) do {       \
| +		if ((v) >= ioapic_verbosity) \
| +			printk(s, ##a);      \
| +	} while (0)
| +
| +/*
|   * The common case is 1:1 IRQ<->pin mappings. Sometimes there are
|   * shared ISA-space IRQs, so we have to support them. We are super
|   * fast in the common case, and fast for shared ISA-space IRQs.
| @@ -745,13 +761,15 @@
|  		pirq_entries[i] = -1;
|  
|  	pirqs_enabled = 1;
| -	printk(KERN_INFO "PIRQ redirection, working around broken
| MP-BIOS.\n");
| +	ioapic_printk(IOAPIC_VERBOSE, KERN_INFO 
| +			"PIRQ redirection, working around broken MP-BIOS.\n");
|  	max = MAX_PIRQS;
|  	if (ints[0] < MAX_PIRQS)
|  		max = ints[0];
|  
|  	for (i = 0; i < max; i++) {
| -		printk(KERN_DEBUG "... PIRQ%d -> IRQ %d\n", i, ints[i+1]);
| +		ioapic_printk(IOAPIC_VERBOSE, KERN_DEBUG 
| +				"... PIRQ%d -> IRQ %d\n", i, ints[i+1]);

I'm a little confused about having both a verbosity level and a
printk message level here.  Did you make sure that your uses of
them are consistent?  Can the KERN_ level be removed or automatically
inserted in ioapic_printk() ?
Or maybe it's OK as is...

|  		/*
|  		 * PIRQs are mapped upside down, usually.
|  		 */
| @@ -1123,10 +1157,12 @@
|  	if ((pin >= 16) && (pin <= 23)) {
|  		if (pirq_entries[pin-16] != -1) {
|  			if (!pirq_entries[pin-16]) {
| -				printk(KERN_DEBUG "disabling PIRQ%d\n", pin-16);
| +				ioapic_printk(IOAPIC_VERBOSE, KERN_DEBUG +						"disabling

Patch is mangled here....

| PIRQ%d\n", pin-16);
|  			} else {
|  				irq = pirq_entries[pin-16];
| -				printk(KERN_DEBUG "using PIRQ%d -> IRQ %d\n",
| +				ioapic_printk(IOAPIC_VERBOSE, KERN_DEBUG +						"using PIRQ%d ->
| IRQ %d\n",

and here...

|  						pin-16, irq);
|  			}
|  		}
| @@ -2246,13 +2303,14 @@
|  	enable_8259A_irq(0);
|  
|  	if (timer_irq_works()) {
| -		printk(" works.\n");
| +		ioapic_printk(IOAPIC_VERBOSE, " works.\n");
|  		return;
|  	}
|  	apic_write_around(APIC_LVT0, APIC_LVT_MASKED | APIC_DM_FIXED |
| vector);
| -	printk(" failed.\n");
| +	ioapic_printk(IOAPIC_VERBOSE, " failed.\n");

Print always ?

| -	printk(KERN_INFO "...trying to set up timer as ExtINT IRQ...");
| +	ioapic_printk(IOAPIC_VERBOSE, KERN_INFO 
| +			"...trying to set up timer as ExtINT IRQ...");
|  
|  	timer_ack = 0;
|  	init_8259A(0);
| @@ -2262,11 +2320,12 @@
|  	unlock_ExtINT_logic();
|  
|  	if (timer_irq_works()) {
| -		printk(" works.\n");
| +		ioapic_printk(IOAPIC_VERBOSE, " works.\n");
|  		return;
|  	}
| -	printk(" failed :(.\n");
| -	panic("IO-APIC + timer doesn't work! pester mingo@redhat.com");
| +	ioapic_printk(IOAPIC_VERBOSE, " failed :(.\n");

I'd prefer to see this print even if booted with ioapic=quiet.

| +	panic("IO-APIC + timer doesn't work! ensure you boot with "
| +		"ioapic=debug and pester mingo@redhat.com");
|  }
|  
|  /*


--
~Randy

--===============65676136046131917==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65676136046131917==--
