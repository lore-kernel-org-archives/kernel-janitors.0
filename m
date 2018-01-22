From: Andi Shyti <andi@etezian.org>
Date: Mon, 22 Jan 2018 07:43:03 +0000
Subject: Re: [PATCH] Input: edt-ft5x06: Delete an error message for a failed memory allocation in edt_ft5x06_
Message-Id: <20180122074303.GB26752@brancaleone.zhora.eu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45f8a6c2-423b-5bc1-6512-c5b954c5620b@users.sourceforge.net>
In-Reply-To: <45f8a6c2-423b-5bc1-6512-c5b954c5620b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, Andi Shyti <andi@etezian.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, =?iso-8859-15?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Martin Kepplinger <martink@posteo.de>, Rob Herring <robh@kernel.org>, Simon Budig <simon.budig@kernelconcepts.de>, Stefan =?iso-8859-15?Q?Sch=F6fegger?= <stefan.schoefegger@ginzinger.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus,

On Sun, Jan 21, 2018 at 08:19:00PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 21 Jan 2018 20:10:03 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Andi Shyti <andi@etezian.org>

Thanks,
Andi

> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index c53a3d7239e7..9d2799c90150 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -978,10 +978,8 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  	dev_dbg(&client->dev, "probing for EDT FT5x06 I2C\n");
>  
>  	tsdata = devm_kzalloc(&client->dev, sizeof(*tsdata), GFP_KERNEL);
> -	if (!tsdata) {
> -		dev_err(&client->dev, "failed to allocate driver data.\n");
> +	if (!tsdata)
>  		return -ENOMEM;
> -	}
>  
>  	chip_data = of_device_get_match_data(&client->dev);
>  	if (!chip_data)
> -- 
> 2.16.0
