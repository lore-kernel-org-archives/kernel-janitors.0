From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Date: Tue, 27 Aug 2013 09:39:12 +0000
Subject: Re: [patch] pinctrl: s3c24xx: off by one in s3c24xx_eint_init()
Message-Id: <201308271139.13333.heiko@sntech.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130826233217.GA17061@elgon.mountain>
In-Reply-To: <20130826233217.GA17061@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Am Dienstag, 27. August 2013, 03:11:26 schrieb Dan Carpenter:
> If "irq = NUM_EINT" then it writes one space beyond the end of the
> eint_data->domains[] array.

Thanks for catching this.


> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> 
> diff --git a/drivers/pinctrl/pinctrl-s3c24xx.c
> b/drivers/pinctrl/pinctrl-s3c24xx.c index 24446da..ad3eaad 100644
> --- a/drivers/pinctrl/pinctrl-s3c24xx.c
> +++ b/drivers/pinctrl/pinctrl-s3c24xx.c
> @@ -549,7 +549,7 @@ static int s3c24xx_eint_init(struct
> samsung_pinctrl_drv_data *d) irq = bank->eint_offset;
>  		mask = bank->eint_mask;
>  		for (pin = 0; mask; ++pin, mask >>= 1) {
> -			if (irq > NUM_EINT)
> +			if (irq >= NUM_EINT)
>  				break;
>  			if (!(mask & 1))
>  				continue;
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

