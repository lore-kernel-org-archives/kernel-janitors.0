From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Wed, 14 Nov 2012 11:57:35 +0000
Subject: Re: [PATCH] staging: dgrp: dgrp_tty.c: return an -EFAULT if put_user fails
Message-Id: <20121114115735.19883baf@pyramind.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1352874741-18526-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1352874741-18526-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: gregkh@linuxfoundation.org, wfp5p@virginia.edu, geert@linux-m68k.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 14 Nov 2012 12:02:21 +0530
Kumar Amit Mehta <gmate.amit@gmail.com> wrote:

> This fix adds checks for inspecting the return value of put_user() and return
> -EFAULT on error.
> 
> Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
> ---
>  drivers/staging/dgrp/dgrp_tty.c |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/dgrp/dgrp_tty.c b/drivers/staging/dgrp/dgrp_tty.c
> index e125b03..b294197 100644
> --- a/drivers/staging/dgrp/dgrp_tty.c
> +++ b/drivers/staging/dgrp/dgrp_tty.c
> @@ -2265,7 +2265,8 @@ static int get_modem_info(struct ch_struct *ch, unsigned int *value)
>  		| ((mlast & DM_RI)  ? TIOCM_RNG : 0)
>  		| ((mlast & DM_DSR) ? TIOCM_DSR : 0)
>  		| ((mlast & DM_CTS) ? TIOCM_CTS : 0);
> -	put_user(mlast, (unsigned int __user *) value);
> +	if (put_user(mlast, (unsigned int __user *) value))
> +		return -EFAULT;


	return put_user(mlast, ....)

is shorter and neater and does the same thing.

Alan
