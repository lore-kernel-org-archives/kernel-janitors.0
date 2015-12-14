From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Mon, 14 Dec 2015 00:36:21 +0000
Subject: Re: [PATCH 2/2] z2ram: Delete a jump label in z2_init()
Message-Id: <20151214003621.GB718@swordfish>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566B13C1.50907@users.sourceforge.net>
 <566B1542.7040902@users.sourceforge.net>
In-Reply-To: <566B1542.7040902@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@fb.com>, Geert Uytterhoeven <geert@linux-m68k.org>

Cc Jens, Andrew, Geert

On (12/11/15 19:26), SF Markus Elfring wrote:
>
> This issue was detected by using the Coccinelle software.
> 
> * Let us return directly if a call of the function "register_blkdev" failed.
> 
> * Remove the jump label "err" then.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/block/z2ram.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
> index 968f9e5..b07581d 100644
> --- a/drivers/block/z2ram.c
> +++ b/drivers/block/z2ram.c
> @@ -345,9 +345,8 @@ z2_init(void)
>      if (!MACH_IS_AMIGA)
>  	return -ENODEV;
>  
> -    ret = -EBUSY;
>      if (register_blkdev(Z2RAM_MAJOR, DEVICE_NAME))
> -	goto err;
> +	return -EBUSY;
>  
>      ret = -ENOMEM;
>      z2ram_gendisk = alloc_disk(1);
> @@ -374,7 +373,6 @@ out_queue:
>      put_disk(z2ram_gendisk);
>  out_disk:
>      unregister_blkdev(Z2RAM_MAJOR, DEVICE_NAME);
> -err:
>      return ret;
>  }

z2ram and zram are different drivers, but the change looks
ok to me.

z2ram can be improved in many ways, so my question is - do
people still use it?

	-ss
