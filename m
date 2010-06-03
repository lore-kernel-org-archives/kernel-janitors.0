From: Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 03 Jun 2010 01:23:16 +0000
Subject: Re: [patch] nouveau: off by one in nv50_gpio_location()
Message-Id: <1275528196.9064.1.camel@nisroch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100422094053.GL29647@bicker>
In-Reply-To: <20100422094053.GL29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

On Thu, 2010-04-22 at 11:40 +0200, Dan Carpenter wrote:
> If "gpio->line" is 32 then "nv50_gpio_reg[gpio->line >> 3]" reads past the
> end of the array.
Thanks, picked up in the nouveau tree.

> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/gpu/drm/nouveau/nv50_gpio.c b/drivers/gpu/drm/nouveau/nv50_gpio.c
> index c61782b..bb47ad7 100644
> --- a/drivers/gpu/drm/nouveau/nv50_gpio.c
> +++ b/drivers/gpu/drm/nouveau/nv50_gpio.c
> @@ -31,7 +31,7 @@ nv50_gpio_location(struct dcb_gpio_entry *gpio, uint32_t *reg, uint32_t *shift)
>  {
>  	const uint32_t nv50_gpio_reg[4] = { 0xe104, 0xe108, 0xe280, 0xe284 };
>  
> -	if (gpio->line > 32)
> +	if (gpio->line >= 32)
>  		return -EINVAL;
>  
>  	*reg = nv50_gpio_reg[gpio->line >> 3];


