From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 31 Aug 2017 08:10:21 +0000
Subject: Re: [alsa-devel] [PATCH] ALSA: ac97c: Fix an error handling path in 'atmel_ac97c_probe()'
Message-Id: <20170831081021.g4luo557ggtnyfyg@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831044042.23306-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170831044042.23306-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alsa-devel@alsa-project.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, nicolas.ferre@microchip.com, tiwai@suse.com, broonie@kernel.org, garsilva@embeddedor.com, arvind.yadav.cs@gmail.com, bhumirks@gmail.com

On 31/08/2017 at 06:40:42 +0200, Christophe JAILLET wrote:
> If 'clk_prepare_enable()' fails, we must release some resources before
> returning. Add a new label in the existing error handling path and 'goto'
> there.
> 
> Fixes: 260ea95cc027 ("ASoC: atmel: ac97c: Handle return value of clk_prepare_enable.")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

And here is the fallout of the stupid, brainless "fixing" of issues
reported by static analysis tools.

This clk_prepare_enable will never fail. If it was going to fail, the
platform would never boot to a point were it is able to execute that
code. It is really annoying to have so much churn for absolutely 0
benefit.

Anyway,
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

> ---
>  sound/atmel/ac97c.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
> index 30c64ab210d9..5ffefac2fa8f 100644
> --- a/sound/atmel/ac97c.c
> +++ b/sound/atmel/ac97c.c
> @@ -785,7 +785,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
>  	}
>  	retval = clk_prepare_enable(pclk);
>  	if (retval)
> -		return retval;
> +		goto err_prepare_enable;
>  
>  	retval = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
>  			      SNDRV_DEFAULT_STR1, THIS_MODULE,
> @@ -881,6 +881,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
>  	snd_card_free(card);
>  err_snd_card_new:
>  	clk_disable_unprepare(pclk);
> +err_prepare_enable:
>  	clk_put(pclk);
>  	return retval;
>  }
> -- 
> 2.11.0
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
