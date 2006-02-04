From: Srdjan Todorovic <todorovic.s@googlemail.com>
Date: Sat, 04 Feb 2006 16:49:13 +0000
Subject: Re: [KJ] [PATCH] - request_region
Message-Id: <Pine.LNX.4.62.0602041641490.6459@tigerclaw.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11986481905788127=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060204104722.3vjv1fgevs0kwcs4@webmail.rongage.org>
In-Reply-To: <20060204104722.3vjv1fgevs0kwcs4@webmail.rongage.org>
To: kernel-janitors@vger.kernel.org

--===============11986481905788127==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 4 Feb 2006, Ron Gage wrote:

> Greetings:
> 
> Trial patch - want to make sure that I am doing things "correctly" before I dive
> in too far...
> 
> diff -ur linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c
> linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c
> --- linux-2.6.15.orig/arch/sh/drivers/pci/pci-sh7751.c  2006-01-02
> 21:21:10.000000000 -0600
> +++ linux-2.6.15/arch/sh/drivers/pci/pci-sh7751.c       2006-02-04
> 10:29:03.000000000 -0600
> @@ -142,9 +142,12 @@
>                 tmp = inl (PCI_REG(SH7751_PCIPAR));
>                 outl (0x80000000, PCI_REG(SH7751_PCIPAR));
>                 if (inl (PCI_REG(SH7751_PCIPAR)) == 0x80000000) {
> +                       struct resource *region;
>                         outl (tmp, PCI_REG(SH7751_PCIPAR));
>                         printk(KERN_INFO "PCI: Using configuration type 1\n");
> -                       request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI conf1");
> +                       region = request_region(PCI_REG(SH7751_PCIPAR), 8, "PCI
> conf1");
> +                       if (!region)
> +                               return -EBUSY;
>                         return 0;
>                 }
>                 outl (tmp, PCI_REG(SH7751_PCIPAR));

You should call request_region() before calling inl(), outl() etc to avoid
stepping on other driver's toes. This might mean that you have to call
request_region() before you do the above probing. That way, if the call
to request_region() fails, someone else owns that IO port and you should
probably not probe.

Without looking at the source, I'd probably put request_region() and the
check just before the first line in your patch.

Hope that helps you, and good luck!

 - Srdjan Todorovic

--===============11986481905788127==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11986481905788127==--
