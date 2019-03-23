From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Date: Sat, 23 Mar 2019 18:20:16 +0000
Subject: Re: [PATCH v2 -next] leds: lt3593: Remove unneeded assignment in lt3593_led_probe
Message-Id: <4df0d0e9-863a-3c76-b951-df0c7abd80ad@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323112659.109934-1-yuehaibing@huawei.com>
In-Reply-To: <20190323112659.109934-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi YueHaibing,

Thank you for the update.

On 3/23/19 12:26 PM, YueHaibing wrote:
> As the chip can't be queried for it's current state, the "keep" option
> doesn't make sense. The only option in DT should be turn the LED on or
> off at probe time.Also 'flags' is never used since introduction.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2ï¼š remove 'keep' branch, fix patch title and description
> ---
>   drivers/leds/leds-lt3593.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
> index 54f0e5dbdbd0..83e8e58d81cb 100644
> --- a/drivers/leds/leds-lt3593.c
> +++ b/drivers/leds/leds-lt3593.c
> @@ -66,7 +66,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
>   	struct lt3593_led_data *led_data;
>   	struct fwnode_handle *child;
>   	int ret, state = LEDS_GPIO_DEFSTATE_OFF;
> -	enum gpiod_flags flags = GPIOD_OUT_LOW;
>   	const char *tmp;
>   
>   	if (!dev->of_node)
> @@ -99,13 +98,8 @@ static int lt3593_led_probe(struct platform_device *pdev)
>   				    &led_data->cdev.default_trigger);
>   
>   	if (!fwnode_property_read_string(child, "default-state", &tmp)) {
> -		if (!strcmp(tmp, "keep")) {
> -			state = LEDS_GPIO_DEFSTATE_KEEP;
> -			flags = GPIOD_ASIS;
> -		} else if (!strcmp(tmp, "on")) {
> +		if (!strcmp(tmp, "on"))
>   			state = LEDS_GPIO_DEFSTATE_ON;
> -			flags = GPIOD_OUT_HIGH;
> -		}
>   	}
>   
>   	led_data->cdev.name = led_data->name;
> 
> 
> 
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
