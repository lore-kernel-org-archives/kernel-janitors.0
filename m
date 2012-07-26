From: "Jan-Simon =?iso-8859-1?q?M=F6ller?=" <jansimon.moeller@gmx.de>
Date: Thu, 26 Jul 2012 08:03:36 +0000
Subject: Re: [patch 1/2 -next] LEDS: memory leak in blinkm_led_common_set()
Message-Id: <201207261003.36211.jansimon.moeller@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120726075951.GA10842@elgon.mountain>
In-Reply-To: <20120726075951.GA10842@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Ack'ed!

Thanks, Dan!

Regards,
Jan-Simon
Am Donnerstag, 26. Juli 2012, 09:59:51 schrieb Dan Carpenter:
> This can return without freeing the bl_work struct.  Also there was no
> check for allocation failure.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index 5a9df43..ae6ad63 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -468,8 +468,7 @@ static int blinkm_led_common_set(struct led_classdev
> *led_cdev, /* led_brightness is 0, 127 or 255 - we just use it here as-is
> */ struct blinkm_led *led = cdev_to_blmled(led_cdev);
>  	struct blinkm_data *data = i2c_get_clientdata(led->i2c_client);
> -	struct blinkm_work *bl_work = kzalloc(sizeof(struct blinkm_work),
> -					      GFP_ATOMIC);
> +	struct blinkm_work *bl_work;
> 
>  	switch (color) {
>  	case RED:
> @@ -511,6 +510,10 @@ static int blinkm_led_common_set(struct led_classdev
> *led_cdev, return -EINVAL;
>  	}
> 
> +	bl_work = kzalloc(sizeof(*bl_work), GFP_ATOMIC);
> +	if (!bl_work)
> +		return -ENOMEM;
> +
>  	atomic_inc(&led->active);
>  	dev_dbg(&led->i2c_client->dev,
>  			"#TO_SCHED# next_red = %d, next_green = %d,"

