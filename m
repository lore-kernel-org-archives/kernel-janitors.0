From: Jesse Millan <jessem@cs.pdx.edu>
Date: Tue, 28 Jun 2005 23:00:45 +0000
Subject: Re: [KJ] [PATCH] Fix GCC4 warning: 'current_time.tv_sec &
Message-Id: <42C1D69D.2060603@cs.pdx.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42C0D349.4010008@cs.pdx.edu>
In-Reply-To: <42C0D349.4010008@cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Jesse Millan wrote:
> 
> ------------------------------------------------------------------------
> 
> 
> The timeval current_time is conditionally initialized and unconditionally
> used. Moving the call to do_gettimeofday() above the #if directive eliminates
> the possibility of using current_time uninitialized.
> 
> Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>
> 
> --- linux-2.6.12-rc6/drivers/net/wireless/prism54/isl_38xx.c.orig	2005-06-27 21:22:42.914051560 -0700
> +++ linux-2.6.12-rc6/drivers/net/wireless/prism54/isl_38xx.c	2005-06-27 21:22:42.914051560 -0700
> @@ -122,8 +122,10 @@ isl38xx_trigger_device(int asleep, void
>  	/* check whether the device is in power save mode */
>  	if (asleep) {
>  		/* device is in powersave, trigger the device for wakeup */
> -#if VERBOSE > SHOW_ERROR_MESSAGES
> +
>  		do_gettimeofday(&current_time);
> +
> +#if VERBOSE > SHOW_ERROR_MESSAGES
>  		DEBUG(SHOW_TRACING, "%08li.%08li Device wakeup triggered\n",
>  		      current_time.tv_sec, (long)current_time.tv_usec);
>  #endif
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

Disregard this patch. This was fixed by pulling the last DEBUG above the
#endif directive as of git10.

-- 
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Mobile: (503) 453-0748
GPG key: www.system-calls.com/gpg.php

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
