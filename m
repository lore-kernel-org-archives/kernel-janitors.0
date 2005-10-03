From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 03 Oct 2005 12:40:09 +0000
Subject: Re: [KJ] [PATCH] arch/i386/kernel/doublefault.c
Message-Id: <20051003124009.GC10630@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0034430260066700136=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051003110453.GA10630@rhum.iomeda.fr>
In-Reply-To: <20051003110453.GA10630@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============0034430260066700136==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dinolinux (anton.slack@tele2.no) wrote:
> Christophe Lucas wrote:
> 
> >slackfan@users.sourceforge.net (slackfan@users.sourceforge.net) wrote:
> >  
> >
> >>signed-off-by: Anton Brondz
> >>
> >>--- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c	2005-09-20 03:00:41.000000000 +0000
> >>+++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c	2005-10-03 12:36:30.000000000 +0000
> >>@@ -23,23 +23,23 @@ static void doublefault_fn(void)
> >> 	store_gdt(&gdt_desc);
> >> 	gdt = gdt_desc.address;
> >> 
> >>-	printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
> >>+	printk(KERN_WARNING "double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
> >>    
> >>
> >
> >When a double fault happens we are not in good terms with os ;)
> >So I don't think KERN_WARNING, KERN_NOTICE, KERN_ERR are the good flags.
> >I think the issue is in KERN_CRIT, KERN_EMERG, KERN_ALERT.
> >
> >Please read it (Debugging by printing : printk):
> >
> >	http://lwn.net/images/pdf/LDD3/ch04.pdf
> >
> >Have a nice day,
>
> Now I've made some editing on the patch. I don't want to send the whole
> thing now as there may be some more editing. I'll put only the lines
> with the constants here now.
> 
> *printk(KERN_ALERT "double fault, gdt at %08lx [%d bytes]\n", gdt,
> gdt_desc.size);*
> KERN_ALERT because it prints the address of the double fault which
> requires immediate action.
> 
> *printk(KERN_CRIT "double fault, tss at %08lx\n", tss);*
> KERN_CRIT because it prints the tss address.
> *
> printk(KERN_CRIT "eip = %08lx, esp = %08lx\n", t->eip, t->esp);
> *KERN_CRIT because it prints eip and esp address.
> 
> *printk(KERN_CRIT "eax = %08lx, ebx = %08lx, ecx = %08lx, edx = %08lx\n",
>                 t->eax, t->ebx, t->ecx, t->edx);
> *KERN_CRIT because it prints eax, ebx, ecx and edx address.
> 
> *printk(KERN_CRIT "esi = %08lx, edi = %08lx\n",
>                 t->esi, t->edi);
> *KERN_CRIT because it prints esi and edi address.
> 
> Hope this is better, so I can send the patch. ;-)

I think it will be better.

				- Christophe (clucas@rotomalug.org)


--===============0034430260066700136==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0034430260066700136==--
