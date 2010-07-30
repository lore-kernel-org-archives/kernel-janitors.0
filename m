From: Willy Tarreau <w@1wt.eu>
Date: Fri, 30 Jul 2010 21:11:27 +0000
Subject: Re: [PATCH 4/9] staging: panel: fix error path
Message-Id: <20100730211127.GG19782@1wt.eu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280488100-20819-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280488100-20819-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Peter Huewe <peterhuewe@gmx.de>, Andy Shevchenko <andy.shevchenko@gmail.com>, Julia Lawall <julia@diku.dk>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Looks fine,

Acked-by: Willy Tarreau <w@1wt.eu>

On Fri, Jul 30, 2010 at 03:08:20PM +0400, Kulikov Vasiliy wrote:
> panel_attach() poorly handles errors. On error unregister everything we
> have registered.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/staging/panel/panel.c |   22 +++++++++++++++++++---
>  1 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/panel/panel.c b/drivers/staging/panel/panel.c
> index 8bd7182..f58da32 100644
> --- a/drivers/staging/panel/panel.c
> +++ b/drivers/staging/panel/panel.c
> @@ -2127,12 +2127,18 @@ static void panel_attach(struct parport *port)
>  				       NULL,
>  				       /*PARPORT_DEV_EXCL */
>  				       0, (void *)&pprt);
> +	if (pprt = NULL) {
> +		pr_err("panel_attach(): port->number=%d parport=%d, "
> +		       "parport_register_device() failed\n",
> +		       port->number, parport);
> +		return;
> +	}
>  
>  	if (parport_claim(pprt)) {
>  		printk(KERN_ERR
>  		       "Panel: could not claim access to parport%d. "
>  		       "Aborting.\n", parport);
> -		return;
> +		goto err_unreg_device;
>  	}
>  
>  	/* must init LCD first, just in case an IRQ from the keypad is
> @@ -2140,13 +2146,23 @@ static void panel_attach(struct parport *port)
>  	 */
>  	if (lcd_enabled) {
>  		lcd_init();
> -		misc_register(&lcd_dev);
> +		if (misc_register(&lcd_dev))
> +			goto err_unreg_device;
>  	}
>  
>  	if (keypad_enabled) {
>  		keypad_init();
> -		misc_register(&keypad_dev);
> +		if (misc_register(&keypad_dev))
> +			goto err_lcd_unreg;
>  	}
> +	return;
> +
> +err_lcd_unreg:
> +	if (lcd_enabled)
> +		misc_deregister(&lcd_dev);
> +err_unreg_device:
> +	parport_unregister_device(pprt);
> +	pprt = NULL;
>  }
>  
>  static void panel_detach(struct parport *port)
> -- 
> 1.7.0.4
