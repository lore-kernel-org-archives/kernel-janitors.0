From: Grant Likely <grant.likely@secretlab.ca>
Date: Mon, 02 Jan 2012 08:44:39 +0000
Subject: Re: [PATCH 1/6] drivers/gpio/gpio-tegra.c: use
Message-Id: <20120102084439.GI18381@ponder.secretlab.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324994491-21828-1-git-send-email-julia@diku.dk>
 <1324994491-21828-2-git-send-email-julia@diku.dk>
In-Reply-To: <1324994491-21828-2-git-send-email-julia-dAYI7NvHqcQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Dec 27, 2011 at 03:01:26PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>

Merged, thanks.

g.

> 
> Reimplement a call to devm_request_mem_region followed by a call to ioremap
> or ioremap_nocache by a call to devm_request_and_ioremap.
> 
> The semantic patch that makes this transformation is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @nm@
> expression myname;
> identifier i;
> @@
> 
> struct platform_driver i = { .driver = { .name = myname } };
> 
> @@
> expression dev,res,size;
> expression nm.myname;
> @@
> 
> -if (!devm_request_mem_region(dev, res->start, size,
> -                              \(res->name\|dev_name(dev)\|myname\))) {
> -   ...
> -   return ...;
> -}
> ... when != res->start
> (
> -devm_ioremap(dev,res->start,size)
> +devm_request_and_ioremap(dev,res)
> |
> -devm_ioremap_nocache(dev,res->start,size)
> +devm_request_and_ioremap(dev,res)
> )
> ... when any
>     when != res->start
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/gpio/gpio-tegra.c |    9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 61044c8..bdc2937 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -361,14 +361,7 @@ static int __devinit tegra_gpio_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	if (!devm_request_mem_region(&pdev->dev, res->start,
> -				     resource_size(res),
> -				     dev_name(&pdev->dev))) {
> -		dev_err(&pdev->dev, "Couldn't request MEM resource\n");
> -		return -ENODEV;
> -	}
> -
> -	regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	regs = devm_request_and_ioremap(&pdev->dev, res);
>  	if (!regs) {
>  		dev_err(&pdev->dev, "Couldn't ioremap regs\n");
>  		return -ENODEV;
> 
