From: Yang-Leo Li <leoyang.li@nxp.com>
Date: Fri, 29 Apr 2016 20:48:14 +0000
Subject: RE: [PATCH 5/5] dmaengine: fsldma: Use dma_pool_zalloc
Message-Id: <AM2PR04MB07705B52D8136609F47A18E58F660@AM2PR04MB0770.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461960552-7429-1-git-send-email-Julia.Lawall@lip6.fr>
 <1461960552-7429-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1461960552-7429-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Li Yang <leoli@freescale.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Zhang Wei <zw@zh-kernel.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



> -----Original Message-----
> From: Julia Lawall [mailto:Julia.Lawall@lip6.fr]
> Sent: Friday, April 29, 2016 3:09 PM
> To: Li Yang <leoli@freescale.com>
> Cc: kernel-janitors@vger.kernel.org; Zhang Wei <zw@zh-kernel.org>; Vinod
> Koul <vinod.koul@intel.com>; Dan Williams <dan.j.williams@intel.com>;
> linuxppc-dev@lists.ozlabs.org; dmaengine@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH 5/5] dmaengine: fsldma: Use dma_pool_zalloc
> 
> Dma_pool_zalloc combines dma_pool_alloc and memset 0.  The semantic patch
> that makes this transformation is as follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression d,e;
> statement S;
> @@
> 
>         d > -            dma_pool_alloc
> +            dma_pool_zalloc
>              (...);
>         if (!d) S
> -       memset(d, 0, sizeof(*d));
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Li Yang <leoyang.li@nxp.com>

> 
> ---
>  drivers/dma/fsldma.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c index
> aac85c3..a8828ed 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
> @@ -462,13 +462,12 @@ static struct fsl_desc_sw
> *fsl_dma_alloc_descriptor(struct fsldma_chan *chan)
>  	struct fsl_desc_sw *desc;
>  	dma_addr_t pdesc;
> 
> -	desc = dma_pool_alloc(chan->desc_pool, GFP_ATOMIC, &pdesc);
> +	desc = dma_pool_zalloc(chan->desc_pool, GFP_ATOMIC, &pdesc);
>  	if (!desc) {
>  		chan_dbg(chan, "out of memory for link descriptor\n");
>  		return NULL;
>  	}
> 
> -	memset(desc, 0, sizeof(*desc));
>  	INIT_LIST_HEAD(&desc->tx_list);
>  	dma_async_tx_descriptor_init(&desc->async_tx, &chan->common);
>  	desc->async_tx.tx_submit = fsl_dma_tx_submit;

