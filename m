From: walter harms <wharms@bfs.de>
Date: Thu, 10 May 2007 14:02:08 +0000
Subject: Re: [KJ] [KJ PATCH] Replacing alloc_pages(gfp, 0) with alloc_page(gfp)
Message-Id: <464325E0.1030603@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178711839.2280.21.camel@shani-win>
In-Reply-To: <1178711839.2280.21.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


hi Shani,
i do not know if that is useful because
alloc_page(mask) is actualy a macro for alloc_pages(mask,0)

re,
 wh






Shani Moideen wrote:
> Hi,
>  
> Replacing alloc_pages(gfp,0) with alloc_page(gfp) in
> arch/i386/mm/pageattr.c.
> 
> Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
> ----
> 
> diff --git a/arch/i386/mm/pageattr.c b/arch/i386/mm/pageattr.c
> index 412ebbd..12f7f14 100644
> --- a/arch/i386/mm/pageattr.c
> +++ b/arch/i386/mm/pageattr.c
> @@ -45,7 +45,7 @@ static struct page *split_large_page(unsigned long address, pgprot_t prot,
>  	pte_t *pbase;
> 
>  	spin_unlock_irq(&cpa_lock);
> -	base = alloc_pages(GFP_KERNEL, 0);
> +	base = alloc_page(GFP_KERNEL);
>  	spin_lock_irq(&cpa_lock);
>  	if (!base) 
>  		return NULL;
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
