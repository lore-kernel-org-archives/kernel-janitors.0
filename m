From: Jie Deng <Jie.Deng1@synopsys.com>
Date: Wed, 22 Mar 2017 04:16:36 +0000
Subject: Re: [patch -next] net: dwc-xlgmac: fix an error code in xlgmac_alloc_pages()
Message-Id: <7542f1f3-eb36-125a-a030-49b02cb92e0b@synopsys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170321204227.GB22118@mwanda>
In-Reply-To: <20170321204227.GB22118@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jie Deng <Jie.Deng1@synopsys.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2017/3/22 4:42, Dan Carpenter wrote:

> The dma_mapping_error() returns true if there is an error but we want
> to return -ENOMEM and not 1.
>
> Fixes: 65e0ace2c5cd ("net: dwc-xlgmac: Initial driver for DesignWare Enterprise Ethernet")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/ethernet/synopsys/dwc-xlgmac-desc.c b/drivers/net/ethernet/synopsys/dwc-xlgmac-desc.c
> index 55c796ed7d26..39b5cb967bba 100644
> --- a/drivers/net/ethernet/synopsys/dwc-xlgmac-desc.c
> +++ b/drivers/net/ethernet/synopsys/dwc-xlgmac-desc.c
> @@ -335,7 +335,6 @@ static int xlgmac_alloc_pages(struct xlgmac_pdata *pdata,
>  {
>  	struct page *pages = NULL;
>  	dma_addr_t pages_dma;
> -	int ret;
>  
>  	/* Try to obtain pages, decreasing order if necessary */
>  	gfp |= __GFP_COLD | __GFP_COMP | __GFP_NOWARN;
> @@ -352,10 +351,9 @@ static int xlgmac_alloc_pages(struct xlgmac_pdata *pdata,
>  	/* Map the pages */
>  	pages_dma = dma_map_page(pdata->dev, pages, 0,
>  				 PAGE_SIZE << order, DMA_FROM_DEVICE);
> -	ret = dma_mapping_error(pdata->dev, pages_dma);
> -	if (ret) {
> +	if (dma_mapping_error(pdata->dev, pages_dma)) {
>  		put_page(pages);
> -		return ret;
> +		return -ENOMEM;
>  	}
>  
>  	pa->pages = pages;
Thanks for fixes.
Reviewed-by: Jie Deng <jiedeng@synopsys.com>
