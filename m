From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Date: Mon, 02 Jul 2018 20:24:26 +0000
Subject: Re: [PATCH] leds: max8997: use mode when calling max8997_led_set_mode
Message-Id: <553beb33-87cd-fdf5-c287-cc6ff8b6c5be@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702165037.20035-1-colin.king@canonical.com>
In-Reply-To: <20180702165037.20035-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Pavel Machek <pavel@ucw.cz>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

Thank you for the patch.

On 07/02/2018 06:50 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable mode is assigned to pdata->led_pdata->mode[led->id] and yet
> is not being used when calling function max8997_led_set_mode. Fix
> this by using mode when calling max8997_led_set_mode.
> 
> Cleans up clang warning:
> warning: variable 'mode' set but not used [-Wunused-but-set-variable]
> 
> Fixes: 8584cb82f151 ("leds: Add suuport for MAX8997-LED driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/leds/leds-max8997.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-max8997.c b/drivers/leds/leds-max8997.c
> index 4edf74f1d6d4..8c019c28f9f5 100644
> --- a/drivers/leds/leds-max8997.c
> +++ b/drivers/leds/leds-max8997.c
> @@ -268,7 +268,7 @@ static int max8997_led_probe(struct platform_device *pdev)
>   		mode = pdata->led_pdata->mode[led->id];
>   		brightness = pdata->led_pdata->brightness[led->id];
>   
> -		max8997_led_set_mode(led, pdata->led_pdata->mode[led->id]);
> +		max8997_led_set_mode(led, mode);
>   
>   		if (brightness > led->cdev.max_brightness)
>   			brightness = led->cdev.max_brightness;
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
