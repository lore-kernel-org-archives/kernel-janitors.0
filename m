From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 11 Jul 2004 10:38:35 +0000
Subject: Re: [Kernel-janitors] [PATCH] IO-APIC debug message reducti
Message-Id: <20040711103835.GB10133@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============040659715731335311=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1089145628.2957.9.camel@tigger>
In-Reply-To: <1089145628.2957.9.camel@tigger>
To: kernel-janitors@vger.kernel.org

--===============040659715731335311==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, 10 Jul 2004, Mark Broadbent wrote:

> Hi,
> 
> > IOAPIC_DEBUG should also activate the Dprintk() statements normally
> > activated via editing include/asm-i386/apic.h:
> > 
> > #define APIC_DEBUG 0
> 
> Expanded the output reduction to covert the Dprintk's in apic.c to
> apic_printk.  Rediffed and attached.
> 
> Thanks
> Mark
> 
> Index: linux-2.6.7/arch/i386/kernel/io_apic.c
> ===================================================================
> --- linux-2.6.7/arch/i386/kernel/io_apic.c	(revision 1)
> +++ linux-2.6.7/arch/i386/kernel/io_apic.c	(working copy)
..
> @@ -1339,6 +1351,9 @@
>  	union IO_APIC_reg_03 reg_03;
>  	unsigned long flags;
>  
> +	if (apic_verbosity == APIC_QUIET)
> +		return;
> +		
>   	printk(KERN_DEBUG "number of MP IRQ sources: %d.\n", mp_irq_entries);
>  	for (i = 0; i < nr_ioapics; i++)
>  		printk(KERN_DEBUG "number of IO-APIC #%d registers: %d.\n",

that looks scary, did you actually test your changes?
looks like a big change to print_IO_APIC()

please when rediffing please use the -p switch from diff(1)
as explained in Documentation/SubmittingPatches

> @@ -1476,6 +1491,9 @@
>  	unsigned int v;
>  	int i, j;
>  
> +	if (apic_verbosity == APIC_QUIET)
> +		return;
> +		
>  	printk(KERN_DEBUG "0123456789abcdef0123456789abcdef\n" KERN_DEBUG);
>  	for (i = 0; i < 8; i++) {
>  		v = apic_read(base + i*0x10);
> @@ -1493,6 +1511,9 @@
>  {
>  	unsigned int v, ver, maxlvt;
>  
> +	if (apic_verbosity == APIC_QUIET)
> +		return;
> +		
>  	printk("\n" KERN_DEBUG "printing local APIC contents on CPU#%d/%d:\n",
>  		smp_processor_id(), hard_smp_processor_id());
>  	v = apic_read(APIC_ID);
> @@ -1580,6 +1601,9 @@
>  	unsigned int v;
>  	unsigned long flags;
>  
> +	if (apic_verbosity == APIC_QUIET)
> +		return;
> +		
>  	printk(KERN_DEBUG "\nprinting PIC contents\n");
>  
>  	spin_lock_irqsave(&i8259A_lock, flags);
..

--===============040659715731335311==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============040659715731335311==--
