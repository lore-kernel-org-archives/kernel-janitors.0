From: Oleh Kravchenko <oleg@kaa.org.ua>
Date: Thu, 05 Sep 2019 11:22:00 +0000
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set() error handling
Message-Id: <1BD74E2A-2DB7-4B1C-A281-3E1E1488DCBB@kaa.org.ua>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905095728.GA26005@mwanda>
In-Reply-To: <20190905095728.GA26005@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Dan,
If you amend my patch, please keep my Signed-of-by.

> 5 вер. 2019 р. о 12:57 пп Dan Carpenter <dan.carpenter@oracle.com> написав(ла):
> 
> The problem is we set "led_cdev->trigger = NULL;" and then dereference
> it when we call write_lock_irqsave():
> 
> 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
>                            ^^^^^^^^^^^^^^^^^
> 
> Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate() return an error code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> drivers/leds/led-triggers.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index eff1bda8b520..13cea227277c 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -167,12 +167,12 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
> 		trig->deactivate(led_cdev);
> err_activate:
> 
> -	led_cdev->trigger = NULL;
> -	led_cdev->trigger_data = NULL;
> 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
> 	list_del(&led_cdev->trig_list);
> 	write_unlock_irqrestore(&led_cdev->trigger->leddev_list_lock, flags);
> +	led_cdev->trigger = NULL;
> +	led_cdev->trigger_data = NULL;
> 	led_set_brightness(led_cdev, LED_OFF);
> 	kfree(event);
> 
> 	return ret;
> -- 
> 2.20.1
> 
