From: Jeff Garzik <jgarzik@pobox.com>
Date: Thu, 08 Jul 2004 23:09:36 +0000
Subject: Re: [Kernel-janitors] [PATCH] IO-APIC debug message reducti
Message-Id: <40EDD430.7000307@pobox.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21777204490754176=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1089145628.2957.9.camel@tigger>
In-Reply-To: <1089145628.2957.9.camel@tigger>
To: kernel-janitors@vger.kernel.org

--===============21777204490754176==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Mark Broadbent wrote:
> All,
> 
> On Wed, 2004-07-07 at 22:03, Randy.Dunlap wrote:
> 
>>On Wed, 07 Jul 2004 21:29:36 +0100 Mark Broadbent wrote:
>>
>>The BSS section of data is cleared to zero by kernel init...
>>(somewhere :)
> 
> 
> Found a reference to it (for my peace of mind) it's done in
> arch/i386/kernel/head.S:70.  It has the following comment...
> 
> ...
>  * Clear BSS first so that there are no surprises...
> ...
> 
> 
>>|     for (i = 0; i < max; i++) {
>>| -           printk(KERN_DEBUG "... PIRQ%d -> IRQ %d\n", i,
> 
> ints[i+1]);
> 
>>| +           ioapic_printk(IOAPIC_VERBOSE, KERN_DEBUG 
>>| +                           "... PIRQ%d -> IRQ %d\n", i, ints[i+1]);
>>
>>I'm a little confused about having both a verbosity level and a
>>printk message level here.  Did you make sure that your uses of
>>them are consistent?  Can the KERN_ level be removed or automatically
>>inserted in ioapic_printk() ?
> 
> 
> This is done deliberately as the apic code uses a lot of constructs
> like:
> 
> printk(KERN_DEBUG "Pin map...");
> for (...) {
>         printk("%d->%d ", pina, pinb);
> printk("...\n"); 
> 
> and I've checked the usage is consistent.
> 
> 
>>| -   printk(" failed.\n");
>>| +   ioapic_printk(IOAPIC_VERBOSE, " failed.\n");
>>
>>Print always ?
> 
> 
> OK, changed.
> 
> 
>>| -   printk(" failed :(.\n");
>>| -   panic("IO-APIC + timer doesn't work! pester mingo@redhat.com");
>>| +   ioapic_printk(IOAPIC_VERBOSE, " failed :(.\n");
>>
>>I'd prefer to see this print even if booted with ioapic=quiet.
> 
> 
> OK, changed.
> 
> New patch below
> 
> Thanks
> Mark
> 
> Index: linux-2.6.7/arch/i386/kernel/io_apic.c
> ===================================================================
> --- linux-2.6.7/arch/i386/kernel/io_apic.c	(revision 1)
> +++ linux-2.6.7/arch/i386/kernel/io_apic.c	(working copy)
> @@ -84,7 +84,23 @@
>  #define vector_to_irq(vector)	(vector)
>  #endif
>  
> +#define IOAPIC_QUIET   0
> +#define IOAPIC_VERBOSE 1
> +#define IOAPIC_DEBUG   2
> +
>  /*
> + * Define the default level of output to be very little
> + * This can be turned up by using apic=verbose for more
> + * information and apic=debug for _lots_ of information.
> + */
> +static int ioapic_verbosity;
> +
> +#define ioapic_printk(v, s, a...) do {       \
> +		if ((v) >= ioapic_verbosity) \
> +			printk(s, ##a);      \
> +	} while (0)
> +
> +/*
>   * The common case is 1:1 IRQ<->pin mappings. Sometimes there are
>   * shared ISA-space IRQs, so we have to support them. We are super
>   * fast in the common case, and fast for shared ISA-space IRQs.
> @@ -745,13 +761,15 @@
>  		pirq_entries[i] = -1;
>  
>  	pirqs_enabled = 1;
> -	printk(KERN_INFO "PIRQ redirection, working around broken
> MP-BIOS.\n");
> +	ioapic_printk(IOAPIC_VERBOSE, KERN_INFO 
> +			"PIRQ redirection, working around broken MP-BIOS.\n");
>  	max = MAX_PIRQS;
>  	if (ints[0] < MAX_PIRQS)
>  		max = ints[0];
>  
>  	for (i = 0; i < max; i++) {
> -		printk(KERN_DEBUG "... PIRQ%d -> IRQ %d\n", i, ints[i+1]);
> +		ioapic_printk(IOAPIC_VERBOSE, KERN_DEBUG 
> +				"... PIRQ%d -> IRQ %d\n", i, ints[i+1]);
>  		/*
>  		 * PIRQs are mapped upside down, usually.
>  		 */
> @@ -762,6 +780,21 @@
>  
>  __setup("pirq=", ioapic_pirq_setup);
>  
> +static int __init ioapic_set_verbosity(char *str)
> +{
> +	if (strcmp("debug", str) == 0)
> +		ioapic_verbosity = IOAPIC_DEBUG;


IOAPIC_DEBUG should also activate the Dprintk() statements normally 
activated via editing include/asm-i386/apic.h:

#define APIC_DEBUG 0

#if APIC_DEBUG
#define Dprintk(x...) printk(x)
#else
#define Dprintk(x...)
#endif


--===============21777204490754176==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21777204490754176==--
