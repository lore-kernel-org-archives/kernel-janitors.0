From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Fri, 30 Sep 2005 19:33:57 +0000
Subject: Re: [KJ] [PATCH] printk: arch/i386/kernel/doublefault.c
Message-Id: <29495f1d0509301233m10482010hd04be6fd7409aa2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <433DA691.6080804@users.sourceforge.net>
In-Reply-To: <433DA691.6080804@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Your patch is line-wrapped. Also, you need to include a Signed-off-by
line. Please see Documentation/SubmittingPatches.

Thanks,
Nish

On 9/30/05, Dinolinux <slackfan@users.sourceforge.net> wrote:
> printk() should include the appropriate KERN_* constant.
>
> --- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c    2005-09-20
> 05:00:41.000000000 +0200
> +++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c    2005-09-30
> 22:40:50.000000000 +0200
> @@ -23,23 +23,23 @@ static void doublefault_fn(void)
>      store_gdt(&gdt_desc);
>      gdt = gdt_desc.address;
>
> -    printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
> +    printk(KERN_ERR"double fault, gdt at %08lx [%d bytes]\n", gdt,
> gdt_desc.size);
>
>      if (ptr_ok(gdt)) {
>          gdt += GDT_ENTRY_TSS << 3;
>          tss = *(u16 *)(gdt+2);
>          tss += *(u8 *)(gdt+4) << 16;
>          tss += *(u8 *)(gdt+7) << 24;
> -        printk("double fault, tss at %08lx\n", tss);
> +        printk(KERN_ERR"double fault, tss at %08lx\n", tss);
>
>          if (ptr_ok(tss)) {
>              struct tss_struct *t = (struct tss_struct *)tss;
>
> -            printk("eip = %08lx, esp = %08lx\n", t->eip, t->esp);
> +            printk(KERN_ERR"eip = %08lx, esp = %08lx\n", t->eip, t->esp);
>
> -            printk("eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",
> +            printk(KERN_ERR"eax = %08lx, ebx = %08lx, ecx = %08lx, edx
> = %08lx\n",
>                  t->eax, t->ebx, t->ecx, t->edx);
> -            printk("esi = %08lx, edi = %08lx\n",
> +            printk(KERN_ERR"esi = %08lx, edi = %08lx\n",
>                  t->esi, t->edi);
>          }
>      }
>
>
> This is my first patch so please be nice to me ;-)  . I've tried to make
> it as good and correct as I could so there shouldn't be _too_ much
> errors. Hope this is the right way to do this...
>
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
