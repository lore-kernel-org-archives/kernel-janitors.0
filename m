From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 18 Oct 2010 08:02:31 +0000
Subject: Re: [PATCH] dma: imx-dma: fix signedness bug
Message-Id: <20101018080230.GH28242@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287327110-9158-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1287327110-9158-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org

On Sun, Oct 17, 2010 at 06:51:50PM +0400, Vasiliy Kulikov wrote:
> mxdmac->channel was unsigned, so check (imxdmac->channel < 0) for
> failed imx_dma_request_by_prio() made no sence.  Explicitly check
> signed values.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

> ---
>  drivers/dma/imx-dma.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
> index 346be62..75d870f 100644
> --- a/drivers/dma/imx-dma.c
> +++ b/drivers/dma/imx-dma.c
> @@ -335,7 +335,7 @@ static int __init imxdma_probe(struct platform_device *pdev)
>  
>  		imxdmac->imxdma_channel = imx_dma_request_by_prio("dmaengine",
>  				DMA_PRIO_MEDIUM);
> -		if (imxdmac->channel < 0)
> +		if ((int)imxdmac->channel < 0)
>  			goto err_init;
>  
>  		imx_dma_setup_handlers(imxdmac->imxdma_channel,
> -- 
> 1.7.0.4
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
