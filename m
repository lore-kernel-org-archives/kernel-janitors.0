From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 04 Apr 2012 16:20:03 +0000
Subject: Re: [patch] Input: wacom: NULL dereference on allocation failure
Message-Id: <20120404162003.GB9229@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120404111938.GB23719@elgon.mountain>
In-Reply-To: <20120404111938.GB23719@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tatsunosuke Tobita <tobita.tatsunosuke@wacom.co.jp>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 04, 2012 at 02:19:38PM +0300, Dan Carpenter wrote:
> If the "wac_i2c" alloction fails, then it leads to a NULL dereference.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Doh! I'll fold it up into original...

Thanks Dan!

> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index b29f064..b8ca4a6 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -252,7 +252,7 @@ static int __devinit wacom_i2c_probe(struct i2c_client *client,
>  err_free_irq:
>  	free_irq(client->irq, wac_i2c);
>  err_free_mem:
> -	input_free_device(wac_i2c->input);
> +	input_free_device(input);
>  	kfree(wac_i2c);
>  
>  	return error;

-- 
Dmitry
