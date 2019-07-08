From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 08 Jul 2019 06:36:49 +0000
Subject: Re: [PATCH] mfd: asic3: One function call less in asic3_irq_probe()
Message-Id: <20190708063649.GA4800@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <01f6a8cd-0205-8d34-2aa3-e4b691e7eb95@web.de>
In-Reply-To: <01f6a8cd-0205-8d34-2aa3-e4b691e7eb95@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>

On Fri, 05 Jul 2019, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jul 2019 20:22:26 +0200
> 
> Avoid an extra function call by using a ternary operator instead of
> a conditional statement.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/asic3.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/asic3.c b/drivers/mfd/asic3.c
> index 83b18c998d6f..50f5368fb170 100644
> --- a/drivers/mfd/asic3.c
> +++ b/drivers/mfd/asic3.c
> @@ -401,11 +401,10 @@ static int __init asic3_irq_probe(struct platform_device *pdev)
>  	irq_base = asic->irq_base;
> 
>  	for (irq = irq_base; irq < irq_base + ASIC3_NR_IRQS; irq++) {
> -		if (irq < asic->irq_base + ASIC3_NUM_GPIOS)
> -			irq_set_chip(irq, &asic3_gpio_irq_chip);
> -		else
> -			irq_set_chip(irq, &asic3_irq_chip);
> -
> +		irq_set_chip(irq,
> +			     (irq < asic->irq_base + ASIC3_NUM_GPIOS)
> +			     ? &asic3_gpio_irq_chip
> +			     : &asic3_irq_chip);

The comparison better suits an if statement IMHO.

How about:

  		struct irq_chip *chip;

		if (irq < asic->irq_base + ASIC3_NUM_GPIOS)
			chip = &asic3_gpio_irq_chip;
		else
			chip = &asic3_irq_chip);

		irq_set_chip(irq, chip);

>  		irq_set_chip_data(irq, asic);
>  		irq_set_handler(irq, handle_level_irq);
>  		irq_clear_status_flags(irq, IRQ_NOREQUEST | IRQ_NOPROBE);

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
