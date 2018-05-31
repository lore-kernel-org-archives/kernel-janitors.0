From: Phil Edworthy <phil.edworthy@renesas.com>
Date: Thu, 31 May 2018 14:48:33 +0000
Subject: RE: [PATCH] gpio: dwapb: fix a signedness bug handling IRQs
Message-Id: <TY1PR01MB1769FA633588A28A55A54636F5630@TY1PR01MB1769.jpnprd01.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180531062424.3pfqikwzxryi6teu@kili.mountain>
In-Reply-To: <20180531062424.3pfqikwzxryi6teu@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Hoan Tran <hotran@apm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

On 31 May 2018 07:24 Dan Carpenter wrote:
> Smatch flags a couple bugs here:
> 
> drivers/gpio/gpio-dwapb.c:447 dwapb_configure_irqs() warn: always true
> condition '(pp->irq[i] >= 0) => (0-u32max >= 0)'
> drivers/gpio/gpio-dwapb.c:627 dwapb_gpio_get_pdata() warn: always true
> condition '(pp->irq[j] >= 0) => (0-u32max >= 0)'
> 
> The problem is that we're storing error codes in pp->irq[] so it needs to be
> signed for the error handling to work correctly.
> 
> Fixes: da069d5d2b81 ("gpio: dwapb: Rework support for 1 interrupt per port
> A GPIO")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch, I had already noticed the mistake and sent a patch.

Thanks
Phil

> diff --git a/include/linux/platform_data/gpio-dwapb.h
> b/include/linux/platform_data/gpio-dwapb.h
> index 5a52d69c13f3..419cfacb4b42 100644
> --- a/include/linux/platform_data/gpio-dwapb.h
> +++ b/include/linux/platform_data/gpio-dwapb.h
> @@ -19,7 +19,7 @@ struct dwapb_port_property {
>  	unsigned int	idx;
>  	unsigned int	ngpio;
>  	unsigned int	gpio_base;
> -	unsigned int	irq[32];
> +	int		irq[32];
>  	bool		has_irq;
>  	bool		irq_shared;
>  };
