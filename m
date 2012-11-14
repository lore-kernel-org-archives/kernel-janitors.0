From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 14 Nov 2012 08:35:28 +0000
Subject: Re: [patch] ALSA: fm801: precedence bug in snd_fm801_tea575x_get_pins()
Message-Id: <s5hsj8coa3z.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121114082354.GB31792@elgon.mountain>
In-Reply-To: <20121114082354.GB31792@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Mauro Carvalho Chehab <mchehab@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>, kernel-janitors@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans.verkuil@cisco.com>

At Wed, 14 Nov 2012 11:23:54 +0300,
Dan Carpenter wrote:
> 
> There is a precedence bug because | has higher precedence than ?:.  This
> code was cut and pasted and I fixed a similar bug a few days ago.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi

> 
> diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
> index cc2e91d..c5806f8 100644
> --- a/sound/pci/fm801.c
> +++ b/sound/pci/fm801.c
> @@ -767,9 +767,14 @@ static u8 snd_fm801_tea575x_get_pins(struct snd_tea575x *tea)
>  	struct fm801 *chip = tea->private_data;
>  	unsigned short reg = inw(FM801_REG(chip, GPIO_CTRL));
>  	struct snd_fm801_tea575x_gpio gpio = *get_tea575x_gpio(chip);
> -
> -	return  (reg & FM801_GPIO_GP(gpio.data)) ? TEA575X_DATA : 0 |
> -		(reg & FM801_GPIO_GP(gpio.most)) ? TEA575X_MOST : 0;
> +	u8 ret;
> +
> +	ret = 0;
> +	if (reg & FM801_GPIO_GP(gpio.data))
> +		ret |= TEA575X_DATA;
> +	if (reg & FM801_GPIO_GP(gpio.most))
> +		ret |= TEA575X_MOST;
> +	return ret;
>  }
>  
>  static void snd_fm801_tea575x_set_direction(struct snd_tea575x *tea, bool output)
> 
