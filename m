From: Dan Carpenter <error27@gmail.com>
Date: Sun, 20 Feb 2011 17:53:49 +0000
Subject: Re: [PATCH 1/2] Staging: xgifb: Remove CRIT[FLAGS | BEGIN | END]
Message-Id: <20110220175349.GD1898@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1298220798-2942-1-git-send-email-martinez.javier@gmail.com>
 <1298220798-2942-2-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1298220798-2942-2-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Javier Martinez Canillas <martinez.javier@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaud Patard <apatard@mandriva.com>

Hi Javier,

Your idea was good but there are a couple problems with this patch.  I'm
afraid you're going to need to fix it and resend.

You put the patch description in the 0/2 patch.  It was a pretty decent
patch description.  Unfortunately the 0/2 descriptions get thrown away,
and do not get included in the final git log.  So they should go with
the individual patches.

On Sun, Feb 20, 2011 at 05:53:17PM +0100, Javier Martinez Canillas wrote:
>  int fbcon_XGI_sync(struct fb_info *info)
>  {
> -    if(!XGIfb_accel) return 0;
> -    CRITFLAGS
> +	unsigned long critflags = 0;

It's better to just call it "flags" instead of "critflags" so that it's
consistent with the rest of the kernel.

It's also not a good idea to initialize it to zero.  I know that gcc
prints a warning, but you can't just set it to zero to silence the
warning. Also this change should have been mentioned in the patch
description.  Every behavior change should be described in the change
log.

>  
> -    XGI310Sync();
> +	if (!XGIfb_accel)
> +		return 0;
> +
> +	XGI310Sync();
>  
> -   CRITEND
> -   return 0;
> +	spin_unlock_irqrestore(&xgi_video_info.lockaccel, critflags);

I know you didn't introduce it, but this makes no sense at all.  It's a
random unlock, and in the original code critflags was uninitialized.

The only reason this works is because XGIfb_accel is always 0.  So you 
can remove this function, and remove all the code that depends on
XGIfb_accel.  (In a separate patch of course).

regards,
dan carpenter


