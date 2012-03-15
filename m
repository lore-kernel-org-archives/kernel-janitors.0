From: walter harms <wharms@bfs.de>
Date: Thu, 15 Mar 2012 08:09:42 +0000
Subject: Re: [PATCH] arch/unicore32/kernel/dma.c: eliminated unneeded free_irq
Message-Id: <4F61A3C6.8000607@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331798498-13606-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331798498-13606-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 15.03.2012 09:01, schrieb Julia Lawall:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The device remains functional if the second request_irq fails, so the first
> one should not be freed.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
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

obviously we had the same idea ... i did not see that her it came in the moment i send my reply
sorry for the noise,
re,
 wh

