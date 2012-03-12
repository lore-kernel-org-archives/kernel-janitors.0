From: Guan Xuetao <gxt@mprc.pku.edu.cn>
Date: Mon, 12 Mar 2012 00:58:46 +0000
Subject: Re: [PATCH 7/7] arch/unicore32/kernel/dma.c: ensure arguments to request_irq and free_irq are compat
Message-Id: <1331513926.2048.58.camel@epip-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331494587-12196-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1331494587-12196-8-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331494587-12196-8-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2012-03-11 at 20:36 +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Convert calls to free_irq so that the second argument is the same as the
> last argument of the corresponding call to request_irq, rather than the
> second to last.  Without this property, free_irq does nothing.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  arch/unicore32/kernel/dma.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/unicore32/kernel/dma.c b/arch/unicore32/kernel/dma.c
> index ae441bc..c813fec 100644
> --- a/arch/unicore32/kernel/dma.c
> +++ b/arch/unicore32/kernel/dma.c
> @@ -173,7 +173,7 @@ int __init puv3_init_dma(void)
>  	ret = request_irq(IRQ_DMAERR, dma_err_handler, 0, "DMAERR", NULL);
>  	if (ret) {
>  		printk(KERN_CRIT "Can't register IRQ for DMAERR\n");
> -		free_irq(IRQ_DMA, "DMA");
> +		free_irq(IRQ_DMA, NULL);
>  		return ret;
>  	}
>  
Yeah, it's an obvious mistake. Thanks.
Because the dma device is just located inside PKUnity-3 SoC, and
request_irq() should always return 0, I prefer to remove this free_irq()
line.

Thanks & Regards,
Guan Xuetao

