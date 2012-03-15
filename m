From: Guan Xuetao <gxt@mprc.pku.edu.cn>
Date: Thu, 15 Mar 2012 08:38:19 +0000
Subject: Re: [PATCH] arch/unicore32/kernel/dma.c: eliminated unneeded free_irq
Message-Id: <1331800699.2389.63.camel@epip-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331798498-13606-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331798498-13606-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2012-03-15 at 09:01 +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The device remains functional if the second request_irq fails, so the first
> one should not be freed.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Guan Xuetao <gxt@mprc.pku.edu.cn>

Thanks,
Guan Xuetao

> 
> ---
> diff --git a/arch/unicore32/kernel/dma.c b/arch/unicore32/kernel/dma.c
> index ae441bc..6184ff2 100644
> --- a/arch/unicore32/kernel/dma.c
> +++ b/arch/unicore32/kernel/dma.c
> @@ -172,8 +172,9 @@ int __init puv3_init_dma(void)
>  
>  	ret = request_irq(IRQ_DMAERR, dma_err_handler, 0, "DMAERR", NULL);
>  	if (ret) {
> +		/* the device remains function if this fails, so don't free
> +		   the previously allocated irq */
>  		printk(KERN_CRIT "Can't register IRQ for DMAERR\n");
> -		free_irq(IRQ_DMA, "DMA");
>  		return ret;
>  	}
>  


