From: Ray Jui <ray.jui@broadcom.com>
Date: Wed, 18 Sep 2019 16:37:45 +0000
Subject: Re: [PATCH] hwrng: iproc-rng200 - Use devm_platform_ioremap_resource() in iproc_rng200_probe()
Message-Id: <667911b3-602e-e5a9-5e83-bd8c17625bb7@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ecb0679-0558-6cbe-af2f-6ee9122a4a7e@web.de>
In-Reply-To: <0ecb0679-0558-6cbe-af2f-6ee9122a4a7e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>



On 9/18/19 12:19 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 09:09:22 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/char/hw_random/iproc-rng200.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/char/hw_random/iproc-rng200.c b/drivers/char/hw_random/iproc-rng200.c
> index 92be1c0ab99f..899ff25f4f28 100644
> --- a/drivers/char/hw_random/iproc-rng200.c
> +++ b/drivers/char/hw_random/iproc-rng200.c
> @@ -181,7 +181,6 @@ static void iproc_rng200_cleanup(struct hwrng *rng)
>   static int iproc_rng200_probe(struct platform_device *pdev)
>   {
>   	struct iproc_rng200_dev *priv;
> -	struct resource *res;
>   	struct device *dev = &pdev->dev;
>   	int ret;
> 
> @@ -190,13 +189,7 @@ static int iproc_rng200_probe(struct platform_device *pdev)
>   		return -ENOMEM;
> 
>   	/* Map peripheral */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(dev, "failed to get rng resources\n");
> -		return -EINVAL;
> -	}
> -
> -	priv->base = devm_ioremap_resource(dev, res);
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(priv->base)) {
>   		dev_err(dev, "failed to remap rng regs\n");
>   		return PTR_ERR(priv->base);
> --
> 2.23.0
> 

Change looks good to me, thanks!

Reviewed-by: Ray Jui <ray.jui@broadcom.com>
