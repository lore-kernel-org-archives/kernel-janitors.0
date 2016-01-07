From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 07 Jan 2016 17:55:32 +0000
Subject: Re: [patch] Input: omap-keypad: set tasklet data earlier
Message-Id: <20160107175532.GA12332@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160107093648.GC27186@mwanda>
In-Reply-To: <20160107093648.GC27186@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Komal Shah <komal_shah802003@yahoo.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 07, 2016 at 12:36:48PM +0300, Dan Carpenter wrote:
> It feels like we should set the tasklet data before enabling it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

> 
> diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
> index 7502e46..75ad666 100644
> --- a/drivers/input/keyboard/omap-keypad.c
> +++ b/drivers/input/keyboard/omap-keypad.c
> @@ -292,8 +292,8 @@ static int omap_kp_probe(struct platform_device *pdev)
>  	setup_timer(&omap_kp->timer, omap_kp_timer, (unsigned long)omap_kp);
>  
>  	/* get the irq and init timer*/
> -	tasklet_enable(&kp_tasklet);
>  	kp_tasklet.data = (unsigned long) omap_kp;
> +	tasklet_enable(&kp_tasklet);
>  
>  	ret = device_create_file(&pdev->dev, &dev_attr_enable);
>  	if (ret < 0)

-- 
Dmitry
