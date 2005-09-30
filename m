From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 30 Sep 2005 21:32:51 +0000
Subject: Re: [KJ] [PATCH] printk: arch/i386/kernel/doublefault.c [UPDATED]
Message-Id: <20050930213251.GA10658@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56685940879832941=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <433DA691.6080804@users.sourceforge.net>
In-Reply-To: <433DA691.6080804@users.sourceforge.net>
To: kernel-janitors@vger.kernel.org

--===============56685940879832941==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Still no Signed-off-by and line-wrapped.

Thanks,
Nish

On 01.10.2005 [00:04:47 +0200], Dinolinux wrote:
> --- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c    2005-09-20
> 05:00:41.000000000 +0200
> +++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c    2005-10-01
> 00:02:07.000000000 +0200
> @@ -23,23 +23,23 @@ static void doublefault_fn(void)
>      store_gdt(&gdt_desc);
>      gdt = gdt_desc.address;
>  
> -    printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
> +    printk(KERN_ERR "double fault, gdt at %08lx [%d bytes]\n", gdt,
> gdt_desc.size);
>  
>      if (ptr_ok(gdt)) {
>          gdt += GDT_ENTRY_TSS << 3;
>          tss = *(u16 *)(gdt+2);
>          tss += *(u8 *)(gdt+4) << 16;
>          tss += *(u8 *)(gdt+7) << 24;
> -        printk("double fault, tss at %08lx\n", tss);
> +        printk(KERN_ERR "double fault, tss at %08lx\n", tss);
>  
>          if (ptr_ok(tss)) {
>              struct tss_struct *t = (struct tss_struct *)tss;
>  
> -            printk("eip = %08lx, esp = %08lx\n", t->eip, t->esp);
> +            printk(KERN_ERR "eip = %08lx, esp = %08lx\n", t->eip, t->esp);
>  
> -            printk("eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",
> +            printk(KERN_ERR "eax = %08lx, ebx = %08lx, ecx = %08lx, edx
> = %08lx\n",
>                  t->eax, t->ebx, t->ecx, t->edx);
> -            printk("esi = %08lx, edi = %08lx\n",
> +            printk(KERN_ERR "esi = %08lx, edi = %08lx\n",
>                  t->esi, t->edi);
>          }
>      }
> 
> Fixed the missing spaces.
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 

--===============56685940879832941==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56685940879832941==--
