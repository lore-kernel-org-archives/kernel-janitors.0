From: "Mark Broadbent" <markb@wetlettuce.com>
Date: Wed, 14 Jul 2004 08:04:12 +0000
Subject: Re: [Kernel-janitors] [PATCH] IO-APIC debug message reducti
Message-Id: <42130.192.102.214.6.1089792252.squirrel@webmail.wetlettuce.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1089145628.2957.9.camel@tigger>
In-Reply-To: <1089145628.2957.9.camel@tigger>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


> Isn't "##a" a problem with some versions of gcc, or am I thinking
> of something else?  Sometimes we have to use "## a" instead....

I haven't seen a case like that, I did some investigating and in
include/linux/kernel.h there is a similar usage to mine:
 #define pr_debug(fmt,arg...) \
	printk(KERN_DEBUG fmt,##arg)

However if someone knows better then I'll change it.

> | +__setup("apic=3D", apic_set_verbosity);
>
> Is this patch separate from the ioapic=3D<verbosity_level> patch?

The patch was extended to include apic and io-apic with one arg.

> The reason I ask is this message:
>
> +	panic("IO-APIC + timer doesn't work! ensure you boot with "
> +		"ioapic=DEbug and pester mingo@redhat.com");
>
> which uses ioapic=3D<level>.  So are there both ioapic=3Dlevel and
> apic=3Dlevel?

It's a typo in the panic statement, it should be apic=3D, I'll ensure Andrew
gets a modified patch.
Thanks
Mark



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
