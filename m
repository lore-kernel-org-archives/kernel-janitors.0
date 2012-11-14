From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Nov 2012 17:55:12 +0000
Subject: Re: [PATCH v2] staging: dgrp: dgrp_tty.c: return an -EFAULT if put_user fails
Message-Id: <20121114175512.GJ11515@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1352893057-27226-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1352893057-27226-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: alan@lxorguk.ukuu.org.uk, gregkh@linuxfoundation.org, wfp5p@virginia.edu, geert@linux-m68k.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 14, 2012 at 05:07:37PM +0530, Kumar Amit Mehta wrote:
> Inspect the return value of put_user() and return -EFAULT on error.
> 
> Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
> ---
>  drivers/staging/dgrp/dgrp_tty.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/dgrp/dgrp_tty.c b/drivers/staging/dgrp/dgrp_tty.c
> index e125b03..cebd3a1 100644
> --- a/drivers/staging/dgrp/dgrp_tty.c
> +++ b/drivers/staging/dgrp/dgrp_tty.c
> @@ -2265,9 +2265,7 @@ static int get_modem_info(struct ch_struct *ch, unsigned int *value)
>  		| ((mlast & DM_RI)  ? TIOCM_RNG : 0)
>  		| ((mlast & DM_DSR) ? TIOCM_DSR : 0)
>  		| ((mlast & DM_CTS) ? TIOCM_CTS : 0);
> -	put_user(mlast, (unsigned int __user *) value);
> -
> -	return 0;
> +	return put_user(mlast, (unsigned int __user *) value);
>  }
>  
>  /*
> @@ -2620,7 +2618,8 @@ static int dgrp_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
>  			       sizeof(long));
>  		if (rc = 0)
>  			return -EFAULT;
> -		put_user(C_CLOCAL(tty) ? 1 : 0, (unsigned long __user *) arg);
> +		if (put_user(C_CLOCAL(tty) ? 1 : 0, (unsigned long __user *) arg))
> +			return -EFAULT;
>  		return 0;

This one could just be return put_user() as well.

regards,
dan carpenter

