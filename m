From: Jarkko Nikula <jhnikula@gmail.com>
Date: Mon, 22 Nov 2010 07:43:53 +0000
Subject: Re: [PATCH] ASoC: atmel: test wrong variable
Message-Id: <20101122094353.f76830b5.jhnikula@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290361216-15166-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290361216-15166-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Timur Tabi <timur@freescale.com>, Liam Girdwood <lrg@slimlogic.co.uk>

On Sun, 21 Nov 2010 20:40:14 +0300
Vasiliy Kulikov <segoon@openwall.com> wrote:

> After clk_get() mclk is checked second time instead of pllb check.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> ---
>  Cannot compile this driver, so it is not tested.
> 
>  sound/soc/atmel/sam9g20_wm8731.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
> index da9c303..68072a2 100644
> --- a/sound/soc/atmel/sam9g20_wm8731.c
> +++ b/sound/soc/atmel/sam9g20_wm8731.c
> @@ -223,7 +223,7 @@ static int __init at91sam9g20ek_init(void)
>  	}
>  
>  	pllb = clk_get(NULL, "pllb");
> -	if (IS_ERR(mclk)) {
> +	if (IS_ERR(pllb)) {
>  		printk(KERN_ERR "ASoC: Failed to get PLLB\n");
>  		ret = PTR_ERR(mclk);

Update also PTR_ERR as otherwise we don't return any error code
(mclk is ok at this point but pllb has an error).

-- 
Jarkko
