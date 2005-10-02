From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 02 Oct 2005 09:45:40 +0000
Subject: Re: [KJ] [PATCH] printk: arch/i386/kernel/doublefault.c
Message-Id: <20051002094540.GB1162@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92971524917969628=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <433DA691.6080804@users.sourceforge.net>
In-Reply-To: <433DA691.6080804@users.sourceforge.net>
To: kernel-janitors@vger.kernel.org

--===============92971524917969628==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2005-10-01 at 19:54:40 +0200, Powerflash <contact@powerflash.atspace.org> wrote:
> printk() should include the appropriate KERN_* constant.
> 
> Signed off by: Anton Brondz (anton.slack@tele2.no)
> 
> *--- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c	2005-09-20 05:00:41.000000000 +0200*
> *+++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c	2005-10-01 00:02:07.000000000 +0200*
  ^
  Huh? It doesn't seem to appear in the attached patch file.

> @@ -23,23 +23,23 @@ static void doublefault_fn(void)
>  	store_gdt(&gdt_desc);
>  	gdt = gdt_desc.address;
>  
> -	printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
> +	printk(KERN_ERR "double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);

I don't think KERN_ERR is appropriate here. Again, see
include/linux/kernel.h for all KERN_* constants and pay attention to the
comments. Or see the many patches Christophe already sent for this TODO
entry.

>  	if (ptr_ok(gdt)) {
>  		gdt += GDT_ENTRY_TSS << 3;
>  		tss = *(u16 *)(gdt+2);
>  		tss += *(u8 *)(gdt+4) << 16;
>  		tss += *(u8 *)(gdt+7) << 24;
> -		printk("double fault, tss at %08lx\n", tss);
> +		printk(KERN_ERR "double fault, tss at %08lx\n", tss);

Ditto

>  		if (ptr_ok(tss)) {
>  			struct tss_struct *t = (struct tss_struct *)tss;
>  
> -			printk("eip = %08lx, esp = %08lx\n", t->eip, t->esp);
> +			printk(KERN_ERR "eip = %08lx, esp = %08lx\n", t->eip, t->esp);

Ditto

> -			printk("eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",
> +			printk(KERN_ERR "eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",

Ditto

>  				t->eax, t->ebx, t->ecx, t->edx);
> -			printk("esi = %08lx, edi = %08lx\n",
> +			printk(KERN_ERR "esi = %08lx, edi = %08lx\n",

Ditto

--===============92971524917969628==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92971524917969628==--
