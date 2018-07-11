From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Wed, 11 Jul 2018 13:03:49 +0000
Subject: Re: [PATCH -next] pinctrl: at91-pio4: remove redundant return value check of platform_get_resource()
Message-Id: <20180711130349.GP16084@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1531312447-134423-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1531312447-134423-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 11/07/2018 12:34:07+0000, Wei Yongjun wrote:
> Remove unneeded error handling on the result of a call
> to platform_get_resource() when the value is passed to
> devm_ioremap_resource().
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

I'm not sure it is worth the effort but

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/pinctrl/pinctrl-at91-pio4.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
> index 8f06197..ef7ab20 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -971,10 +971,6 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
>  	atmel_pioctrl->npins = atmel_pioctrl->nbanks * ATMEL_PIO_NPINS_PER_BANK;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(dev, "unable to get atmel pinctrl resource\n");
> -		return -EINVAL;
> -	}
>  	atmel_pioctrl->reg_base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(atmel_pioctrl->reg_base))
>  		return -EINVAL;
> 
> 
> 

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
