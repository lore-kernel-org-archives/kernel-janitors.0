From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 03 Oct 2005 11:12:56 +0000
Subject: Re: [KJ] [PATCH] arch/i386/kernel/doublefault.c
Message-Id: <20051003111256.GB10630@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96119764311056688=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051003110453.GA10630@rhum.iomeda.fr>
In-Reply-To: <20051003110453.GA10630@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============96119764311056688==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

slackfan@users.sourceforge.net (slackfan@users.sourceforge.net) wrote:
> signed-off-by: Anton Brondz
> 
> --- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c	2005-09-20 03:00:41.000000000 +0000
> +++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c	2005-10-03 12:36:30.000000000 +0000
> @@ -23,23 +23,23 @@ static void doublefault_fn(void)
>  	store_gdt(&gdt_desc);
>  	gdt = gdt_desc.address;
>  
> -	printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
> +	printk(KERN_WARNING "double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);

When a double fault happens we are not in good terms with os ;)
So I don't think KERN_WARNING, KERN_NOTICE, KERN_ERR are the good flags.
I think the issue is in KERN_CRIT, KERN_EMERG, KERN_ALERT.

Please read it (Debugging by printing : printk):

	http://lwn.net/images/pdf/LDD3/ch04.pdf

Have a nice day,

			- Christophe (clucas@rotomalug.org)


--===============96119764311056688==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96119764311056688==--
