From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Wed, 07 Jul 2004 00:25:59 +0000
Subject: Re: [Kernel-janitors] [PATCH] IO-APIC debug message reduction at
Message-Id: <20040707002559.GB16690@conectiva.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36833211803468213=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1089145628.2957.9.camel@tigger>
In-Reply-To: <1089145628.2957.9.camel@tigger>
To: kernel-janitors@vger.kernel.org

--===============36833211803468213==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Em Tue, Jul 06, 2004 at 09:27:08PM +0100, Mark Broadbent escreveu:
> Hi All,
> 
> Below is a patch that reduces the amount of debug information given out
> by the IO-APIC initialisation.
> 
> Comments welcome, please be gentle as this is my first patch.
> 
> Thanks
> Mark
 
comments: 

> --- linux-2.6.7/arch/i386/kernel/io_apic.c	2004-07-06 21:07:29.000000000 +0100
> +++ linux/arch/i386/kernel/io_apic.c	2004-07-06 21:15:26.000000000 +0100
> @@ -84,6 +84,17 @@
>  #define vector_to_irq(vector)	(vector)
>  #endif
>  
> +#define IOAPIC_QUIET   (0)
> +#define IOAPIC_VERBOSE (1)
> +#define IOAPIC_DEBUG   (2)

What is the point of those parens?

> +
> +/*
> + * Define the default level of output to be very little
> + * This can be turned up by using apic=verbose for more
> + * information and apic=debug for _lots_ of information.
> + */
> +static int ioapic_verbosity = 0;
> +

no need to init static variables to zero, not doing so has the advantage of
moving this variable to the .bss kernel section.

>  /*
>   * The common case is 1:1 IRQ<->pin mappings. Sometimes there are
>   * shared ISA-space IRQs, so we have to support them. We are super
> @@ -734,6 +745,26 @@
>  
>  __setup("noapic", ioapic_setup);
>  
> +static int __init ioapic_set_verbosity(char *str)
> +{
> +	if (strcmp("debug", str) == 0)
> +	{
> +		ioapic_verbosity = IOAPIC_DEBUG;
> +	}

follow kernel coding style:

if (condition) {
	j--;
	bleh();
} else if (condition) {
	i++;
	blah();
}

Also why the braces?

> +	else if (strcmp("verbose", str) == 0)
> +	{
> +		ioapic_verbosity = IOAPIC_VERBOSE;
> +	}
> +	else
> +	{
> +		printk(KERN_WARNING "IO-APIC Verbosity level %s not recognised, use ioapic=verbose or ioapic=debug", str);
> +	}
> +
> +	return 0;
> +}
> +
> +__setup("ioapic=", ioapic_set_verbosity);
> +
>  static int __init ioapic_pirq_setup(char *str)
>  {
>  	int i, max;
> @@ -745,13 +776,16 @@
>  		pirq_entries[i] = -1;
>  
>  	pirqs_enabled = 1;
> -	printk(KERN_INFO "PIRQ redirection, working around broken MP-BIOS.\n");
> +
> +	if (ioapic_verbosity > IOAPIC_QUIET)
> +		printk(KERN_INFO "PIRQ redirection, working around broken MP-BIOS.\n");

Humm, why not having something like ioapic_printk(), just like all the
dprintk in lots of places instead of testing ioapic_verbosity all the time,
polluting kernel sources? Sure, there are some places where directly
testing against ioapic_verbosity is better, like on a function that only
prints information... wait, this is the definition of ioapic_printk() :-)

Stopping here.

Regards,

- Arnaldo

--===============36833211803468213==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36833211803468213==--
