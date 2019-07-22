From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Date: Mon, 22 Jul 2019 08:43:18 +0000
Subject: Re: [PATCH] leds: ktd2692: Fix a typo in the name of a constant
Message-Id: <578003f3-d4a6-1788-b819-166e4203744f@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721210539.25669-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721210539.25669-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 21.07.19 23:05, Christophe JAILLET wrote:
> There is a typo in KTD2962_MM_MIN_CURR_THRESHOLD_SCALE. 6 and 9 are
> switched in 2962.
> 
> Define and use KTD2692_MM_MIN_CURR_THRESHOLD_SCALE instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/leds/leds-ktd2692.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
> index 45296aaca9da..44db748c570e 100644
> --- a/drivers/leds/leds-ktd2692.c
> +++ b/drivers/leds/leds-ktd2692.c
> @@ -22,7 +22,7 @@
>   /* Value related the movie mode */
>   #define KTD2692_MOVIE_MODE_CURRENT_LEVELS	16
>   #define KTD2692_MM_TO_FL_RATIO(x)		((x) / 3)
> -#define KTD2962_MM_MIN_CURR_THRESHOLD_SCALE	8
> +#define KTD2692_MM_MIN_CURR_THRESHOLD_SCALE	8
>   
>   /* Value related the flash mode */
>   #define KTD2692_FLASH_MODE_TIMEOUT_LEVELS	8
> @@ -253,7 +253,7 @@ static void ktd2692_setup(struct ktd2692_context *led)
>   	ktd2692_expresswire_reset(led);
>   	gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
>   
> -	ktd2692_expresswire_write(led, (KTD2962_MM_MIN_CURR_THRESHOLD_SCALE - 1)
> +	ktd2692_expresswire_write(led, (KTD2692_MM_MIN_CURR_THRESHOLD_SCALE - 1)
>   				 | KTD2692_REG_MM_MIN_CURR_THRESHOLD_BASE);
>   	ktd2692_expresswire_write(led, KTD2692_FLASH_MODE_CURR_PERCENT(45)
>   				 | KTD2692_REG_FLASH_CURRENT_BASE);
> 

Reviewed-By: Enrico Weigelt <info@metux.net>

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
