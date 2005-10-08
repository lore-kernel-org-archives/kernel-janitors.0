From: Dinolinux <anton.slack@tele2.no>
Date: Sat, 08 Oct 2005 14:09:48 +0000
Subject: Re: [KJ] [PATCH] arch/i386/kernel/doublefault.c
Message-Id: <43480D56.408@tele2.no>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051003110453.GA10630@rhum.iomeda.fr>
In-Reply-To: <20051003110453.GA10630@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Alexey Dobriyan wrote:

>On Mon, Oct 03, 2005 at 04:54:41PM +0000, slackfan@users.sourceforge.net wrote:
>  
>
>>--- linux-2.6.14-rc2.orig/arch/i386/kernel/doublefault.c
>>+++ linux-2.6.14-rc2/arch/i386/kernel/doublefault.c
>>    
>>
>
>  
>
>>-	printk("double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
>>+	printk(KERN_ALERT "double fault, gdt at %08lx [%d bytes]\n", gdt, gdt_desc.size);
>>
>> 	if (ptr_ok(gdt)) {
>> 		gdt += GDT_ENTRY_TSS << 3;
>> 		tss = *(u16 *)(gdt+2);
>> 		tss += *(u8 *)(gdt+4) << 16;
>> 		tss += *(u8 *)(gdt+7) << 24;
>>-		printk("double fault, tss at %08lx\n", tss);
>>+		printk(KERN_CRIT "double fault, tss at %08lx\n", tss);
>>    
>>
>
>Different priorities?
>
>  
>
>------------------------------------------------------------------------
>
>_______________________________________________
>Kernel-janitors mailing list
>Kernel-janitors@lists.osdl.org
>https://lists.osdl.org/mailman/listinfo/kernel-janitors
>  
>
Will it be better if I put KERN_CRIT on all printk lines?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
