From: "Jan-Simon =?iso-8859-1?q?M=F6ller?=" <jansimon.moeller@gmx.de>
Date: Thu, 26 Jul 2012 08:05:16 +0000
Subject: Re: [patch 2/2 -next] LEDS: propagate error codes in blinkm_detect()
Message-Id: <201207261005.16359.jansimon.moeller@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120726080025.GB10842@elgon.mountain>
In-Reply-To: <20120726080025.GB10842@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Ack'ed.

Regards,
Jan-Simon
Am Donnerstag, 26. Juli 2012, 10:00:25 schrieb Dan Carpenter:
> Use the error codes from the lower levels instead of -ENODEV.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index ae6ad63..f7c3d7f 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -617,11 +617,11 @@ static int blinkm_detect(struct i2c_client *client,
> struct i2c_board_info *info) /* Step 1: Read BlinkM address back  - 
> cmd_char 'a' */
>  	ret = blinkm_write(client, BLM_GET_ADDR, NULL);
>  	if (ret < 0)
> -		return -ENODEV;
> +		return ret;
>  	usleep_range(20000, 30000);	/* allow a small delay */
>  	ret = blinkm_read(client, BLM_GET_ADDR, tmpargs);
>  	if (ret < 0)
> -		return -ENODEV;
> +		return ret;
> 
>  	if (tmpargs[0] != 0x09) {
>  		dev_err(&client->dev, "enodev DEV ADDR = 0x%02X\n", tmpargs[0]);

