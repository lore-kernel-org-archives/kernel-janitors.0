From: Samuel Ortiz <sameo@linux.intel.com>
Date: Fri, 18 Jun 2010 21:39:39 +0000
Subject: Re: [PATCH 2/4] drivers/mfd: introduce missing kfree
Message-Id: <20100618213938.GH3582@sortiz.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1006011634200.12546@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1006011634200.12546@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Julia,

On Tue, Jun 01, 2010 at 04:34:38PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Error handling code following a kmalloc should free the allocated data.
> 
> The semantic match that finds the problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
Patch applied, many thanks.

Cheers,
Samuel.


> // <smpl>
> @r exists@
> local idexpression x;
> statement S;
> expression E;
> identifier f,f1,l;
> position p1,p2;
> expression *ptr != NULL;
> @@
> 
> x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
> ...
> if (x = NULL) S
> <... when != x
>      when != if (...) { <+...x...+> }
> (
> x->f1 = E
> |
>  (x->f1 = NULL || ...)
> |
>  f(...,x->f1,...)
> )
> ...>
> (
>  return \(0\|<+...x...+>\|ptr\);
> |
>  return@p2 ...;
> )
> 
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
> 
> print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
>  drivers/mfd/davinci_voicecodec.c |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/davinci_voicecodec.c b/drivers/mfd/davinci_voicecodec.c
> index 3e75f02..33c923d 100644
> --- a/drivers/mfd/davinci_voicecodec.c
> +++ b/drivers/mfd/davinci_voicecodec.c
> @@ -94,7 +94,8 @@ static int __init davinci_vc_probe(struct platform_device *pdev)
>  	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
>  	if (!res) {
>  		dev_err(&pdev->dev, "no DMA resource\n");
> -		return -ENXIO;
> +		ret = -ENXIO;
> +		goto fail4;
>  	}
>  
>  	davinci_vc->davinci_vcif.dma_tx_channel = res->start;
> @@ -104,7 +105,8 @@ static int __init davinci_vc_probe(struct platform_device *pdev)
>  	res = platform_get_resource(pdev, IORESOURCE_DMA, 1);
>  	if (!res) {
>  		dev_err(&pdev->dev, "no DMA resource\n");
> -		return -ENXIO;
> +		ret = -ENXIO;
> +		goto fail4;
>  	}
>  
>  	davinci_vc->davinci_vcif.dma_rx_channel = res->start;

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
