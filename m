From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 14 Jul 2004 05:24:19 +0000
Subject: Re: [Kernel-janitors] [PATCH] IO-APIC debug message reducti
Message-Id: <20040713222419.7a01d558.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47844456515968981=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1089145628.2957.9.camel@tigger>
In-Reply-To: <1089145628.2957.9.camel@tigger>
To: kernel-janitors@vger.kernel.org

--===============47844456515968981==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Jul 2004 20:20:31 +0100 Mark Broadbent wrote:

| Index: linux-2.6.7/include/asm-i386/apic.h
| ===================================================================
| --- linux-2.6.7/include/asm-i386/apic.h	(revision 1)
| +++ linux-2.6.7/include/asm-i386/apic.h	(working copy)
| @@ -7,13 +7,26 @@
|  #include <asm/apicdef.h>
|  #include <asm/system.h>
|  
| -#define APIC_DEBUG 0
| -
| -#if APIC_DEBUG
| -#define Dprintk(x...) printk(x)
| -#else
|  #define Dprintk(x...)
| -#endif
| +
| +/* 
| + * Debugging macros
| + */
| +#define APIC_QUIET   0
| +#define APIC_VERBOSE 1
| +#define APIC_DEBUG   2
| +
| +/*
| + * Define the default level of output to be very little
| + * This can be turned up by using apic=verbose for more
| + * information and apic=debug for _lots_ of information.
| + * apic_verbosity is defined in apic.c
| + */
| +#define apic_printk(v, s, a...) do {       \
| +		if ((v) <= apic_verbosity) \
| +			printk(s, ##a);    \
| +	} while (0)
| +

Isn't "##a" a problem with some versions of gcc, or am I thinking
of something else?  Sometimes we have to use "## a" instead....



| Index: linux-2.6.7/arch/i386/kernel/apic.c
| ===================================================================
| --- linux-2.6.7/arch/i386/kernel/apic.c	(revision 1)
| +++ linux-2.6.7/arch/i386/kernel/apic.c	(working copy)
| @@ -625,6 +640,21 @@ static int __init lapic_enable(char *str
|  }
|  __setup("lapic", lapic_enable);
|  
| +static int __init apic_set_verbosity(char *str)
| +{
| +	if (strcmp("debug", str) == 0)
| +		apic_verbosity = APIC_DEBUG;
| +	else if (strcmp("verbose", str) == 0)
| +		apic_verbosity = APIC_VERBOSE;
| +	else
| +		printk(KERN_WARNING "APIC Verbosity level %s not recognised"
| +				" use apic=verbose or apic=debug", str);
| +
| +	return 0;
| +}
| +
| +__setup("apic=", apic_set_verbosity);

Is this patch separate from the ioapic=<verbosity_level> patch?
The reason I ask is this message:

+	panic("IO-APIC + timer doesn't work! ensure you boot with "
+		"ioapic=debug and pester mingo@redhat.com");

which uses ioapic=<level>.  So are there both ioapic=level and apic=level?

Thanks,
--
~Randy

--===============47844456515968981==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47844456515968981==--
