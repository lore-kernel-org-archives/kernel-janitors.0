From: Greg KH <greg@kroah.com>
Date: Thu, 22 Jul 2010 17:58:46 +0000
Subject: Re: [PATCH 3/3] Correct: fix staging/spectra: don't use
Message-Id: <20100722175846.GA28783@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278734855.1725.52.camel@lenovo>
In-Reply-To: <1278734855.1725.52.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jul 10, 2010 at 12:07:35AM -0400, Javier Martinez Canillas wrote:
> Last patch has a style problem. Sending the correct one. Sorry for the noise
> 
> Since BKL was removed from block ioctl handling code, locked_ioctl doesn't 
> exist anymore. 
> 
> Using ioctl instead and doing the locking manually.
> 
> >From b2bfc3da2c83066ad773df81787fc9416f5382c2 Mon Sep 17 00:00:00 2001
> From: Javier Martinez Canillas <martinez.javier@gmail.com>
> Date: Sat, 10 Jul 2010 00:00:16 -0400
> Subject: [PATCH 3/3] fix staging/spectra: don't use locked_ioctl
> 
> 
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> ---
>  drivers/staging/spectra/ffsport.c |   15 ++++++++++++++-
>  1 files changed, 14 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/spectra/ffsport.c b/drivers/staging/spectra/ffsport.c
> index 00a0ac0..7b34635 100644
> --- a/drivers/staging/spectra/ffsport.c
> +++ b/drivers/staging/spectra/ffsport.c
> @@ -27,6 +27,7 @@
>  #include <linux/kthread.h>
>  #include <linux/log2.h>
>  #include <linux/init.h>
> +#include <linux/smp_lock.h>
>  
>  /**** Helper functions used for Div, Remainder operation on u64 ****/
>  
> @@ -589,11 +590,23 @@ int GLOB_SBD_ioctl(struct block_device *bdev, fmode_t mode,
>  	return -ENOTTY;
>  }
>  
> +int GLOB_SBD_unlocked_ioctl(struct block_device *bdev, fmode_t mode,
> +		unsigned int cmd, unsigned long arg)
> +{
> +	int ret;
> +
> +	lock_kernel();

No, we are trying to get rid of the lock_kernel() calls, care to just
make this a local lock instead?

thanks,

greg k-h


