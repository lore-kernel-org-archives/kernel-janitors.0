From: walter harms <wharms@bfs.de>
Date: Tue, 03 Jul 2007 12:28:12 +0000
Subject: Re: [KJ] [PATCH] cris/arch-v32: Remove unnecessary cast of return
Message-Id: <468A40DC.1020903@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46857CC8020000F40000AA4A@lucius.provo.novell.com>
In-Reply-To: <46857CC8020000F40000AA4A@lucius.provo.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Suresh Jayaraman wrote:
> Remove unnecessary cast of return value of kmalloc() in
> cris/arch-v32/mm/intmem.c
> 
> Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
> ---
> 
> diff --git a/arch/cris/arch-v32/mm/intmem.c b/arch/cris/arch-v32/mm/intmem.c
> index 41ee7f7..d1e0bf4 100644
> --- a/arch/cris/arch-v32/mm/intmem.c
> +++ b/arch/cris/arch-v32/mm/intmem.c
> @@ -27,8 +27,8 @@ static void crisv32_intmem_init(void)
>  {
>  	static int initiated = 0;
>  	if (!initiated) {
> -		struct intmem_allocation* alloc > -		  (struct intmem_allocation*)kmalloc(sizeof *alloc, GFP_KERNEL);
> +		struct intmem_allocation *alloc = kmalloc(sizeof *alloc,
> +							  GFP_KERNEL);

IMHO every kmalloc() should check if it worked at all

	if (!alloc) {
	  kprintf("no memory panic !\n");
	   return;
          }
	
re,
 wh


>  		INIT_LIST_HEAD(&intmem_allocations);
>  		intmem_virtual = ioremap(MEM_INTMEM_START, MEM_INTMEM_SIZE);
>  		initiated = 1;
> @@ -55,8 +55,7 @@ void* crisv32_intmem_alloc(unsigned size, unsigned align)
>  		if (allocation->status = STATUS_FREE &&
>  		    allocation->size >= size + alignment) {
>  			if (allocation->size > size + alignment) {
> -				struct intmem_allocation* alloc > -					(struct intmem_allocation*)
> +				struct intmem_allocation *alloc >  					kmalloc(sizeof *alloc, GFP_ATOMIC);
>  				alloc->status = STATUS_FREE;
>  				alloc->size = allocation->size - size - alignment;
> @@ -65,8 +64,7 @@ void* crisv32_intmem_alloc(unsigned size, unsigned align)
>  
>  				if (alignment) {
>  					struct intmem_allocation* tmp;
> -					tmp = (struct intmem_allocation*)
> -						kmalloc(sizeof *tmp, GFP_ATOMIC);
> +					tmp = kmalloc(sizeof *tmp, GFP_ATOMIC);
>  					tmp->offset = allocation->offset;
>  					tmp->size = alignment;
>  					tmp->status = STATUS_FREE;
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
