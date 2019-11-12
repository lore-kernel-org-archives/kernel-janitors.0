From: Joe Perches <joe@perches.com>
Date: Tue, 12 Nov 2019 19:29:41 +0000
Subject: Re: [PATCH][next] ASoC: tas2770: clean up an indentation issue
Message-Id: <dfb2c158308e0e9cb790ad3c17eb2563ac192f2b.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191112190218.282337-1-colin.king@canonical.com>
In-Reply-To: <20191112190218.282337-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2019-11-12 at 19:02 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a block that is indented too deeply, remove
> the extraneous tabs.
[]
> diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
[]
> @@ -761,12 +761,12 @@ static int tas2770_i2c_probe(struct i2c_client *client,
>  	tas2770->reset_gpio = devm_gpiod_get_optional(tas2770->dev,
>  							  "reset-gpio",
>  						      GPIOD_OUT_HIGH);
> -		if (IS_ERR(tas2770->reset_gpio)) {
> -			if (PTR_ERR(tas2770->reset_gpio) = -EPROBE_DEFER) {
> -				tas2770->reset_gpio = NULL;
> -				return -EPROBE_DEFER;
> -			}
> +	if (IS_ERR(tas2770->reset_gpio)) {
> +		if (PTR_ERR(tas2770->reset_gpio) = -EPROBE_DEFER) {
> +			tas2770->reset_gpio = NULL;
> +			return -EPROBE_DEFER;
>  		}
> +	}

This could remove the IS_ERR and and also remove another indentation level

	if (PTR_ERR(tas2770->reset_gpio) = -EPROBE_DEFER) {
		tas2770->reset_gpio = NULL;
		return -EPROBE_DEFER;
	}

or if _really_ desired, (but it seems not really necessary)
but this form is used in a few other sound drivers:

	if (IS_ERR(tas2770->reset_gpio) &&
	    PTR_ERR(tas2770->reset_gpio) = -EPROBE_DEFER) {
		tas2770->reset_gpio = NULL;
		return -EPROBE_DEFER;
	}
