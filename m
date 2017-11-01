From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Nov 2017 10:18:36 +0000
Subject: Re: [PATCH] pinctrl: pistachio: Use common error handling code in pistachio_gpio_register()
Message-Id: <20171101101836.ubko2cmxeds6735j@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b8eced6-c4d9-6b0b-ac23-de764622e91c@users.sourceforge.net>
In-Reply-To: <0b8eced6-c4d9-6b0b-ac23-de764622e91c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Damien Horsley <Damien.Horsley@imgtec.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>

On Mon, Oct 30, 2017 at 06:51:19PM +0100, SF Markus Elfring wrote:
> @@ -1409,13 +1408,15 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
>  		if (ret < 0) {
>  			dev_err(pctl->dev, "Failed to add GPIO range %u: %d\n",
>  				i, ret);
> -			gpiochip_remove(&bank->gpio_chip);
> -			goto err;
> +			goto remove_chip;


It's better code to put the gpiochip_remove() before the goto, because
say we want to add more error handling before the remove_chip: label.
Now it doesn't work.


>  		}
>  	}
>  
>  	return 0;
> -err:
> +
> +remove_chip:
> +	gpiochip_remove(&bank->gpio_chip);
> +remove_chips:
>  	for (; i > 0; i--) {
>  		bank = &pctl->gpio_banks[i - 1];
>  		gpiochip_remove(&bank->gpio_chip);

regards,
dan carpenter

