From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Wed, 09 Oct 2019 07:46:42 +0000
Subject: Re: [PATCH] dmaengine: at_xdmac: Use devm_platform_ioremap_resource() in at_xdmac_probe()
Message-Id: <20191009074641.taocxbrs2vodvsgm@M43218.corp.atmel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <377247f3-b53a-a9d9-66c7-4b8515de3809@web.de>
In-Reply-To: <377247f3-b53a-a9d9-66c7-4b8515de3809@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>

On Sun, Sep 22, 2019 at 10:48:20AM +0200, Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 10:37:31 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com> 

Thanks

> ---
>  drivers/dma/at_xdmac.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> index b58ac720d9a1..f71c9f77d405 100644
> --- a/drivers/dma/at_xdmac.c
> +++ b/drivers/dma/at_xdmac.c
> @@ -1957,21 +1957,16 @@ static int atmel_xdmac_resume(struct device *dev)
> 
>  static int at_xdmac_probe(struct platform_device *pdev)
>  {
> -	struct resource	*res;
>  	struct at_xdmac	*atxdmac;
>  	int		irq, size, nr_channels, i, ret;
>  	void __iomem	*base;
>  	u32		reg;
> 
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -EINVAL;
> -
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> 
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> 
> --
> 2.23.0
> 
