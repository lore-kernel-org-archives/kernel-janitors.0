From: Dan Carpenter <error27@gmail.com>
Date: Mon, 21 Feb 2011 17:26:09 +0000
Subject: Re: [PATCH 3/3] Staging: xgifb: Remove unused function
Message-Id: <20110221172609.GK1898@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1298279347-8825-4-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1298279347-8825-4-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Feb 21, 2011 at 06:16:45PM +0100, Javier Martinez Canillas wrote:
> --- a/drivers/staging/xgifb/XGI_main_26.c
> +++ b/drivers/staging/xgifb/XGI_main_26.c
> @@ -1741,7 +1741,7 @@ static struct fb_ops XGIfb_ops = {
>  	.fb_fillrect = fbcon_XGI_fillrect,
>  	.fb_copyarea = fbcon_XGI_copyarea,
>  	.fb_imageblit = cfb_imageblit,
> -	.fb_sync = fbcon_XGI_sync,
> +	.fb_sync = NULL,

It doesn't need to be set explicitly.  It gets initialized to NULL 
automatically by default.

regards,
dan carpenter

>  	.fb_ioctl = XGIfb_ioctl,
>  	/* .fb_mmap = XGIfb_mmap, */
>  };
> -- 
> 1.7.0.4
