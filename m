From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Sat, 29 Sep 2012 22:09:14 +0000
Subject: Re: [patch 1/2] memstick: use after free in msb_disk_release()
Message-Id: <1348956554.7401.1.camel@maxim-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120929071104.GB10993@elgon.mountain>
In-Reply-To: <20120929071104.GB10993@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>

On Sat, 2012-09-29 at 10:11 +0300, Dan Carpenter wrote: 
> The original code dereferenced "msb" after freeing it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index c815fe5..a8e8915 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -1983,9 +1983,9 @@ static int msb_disk_release(struct gendisk *disk)
>  			msb->usage_count--;
>  
>  		if (!msb->usage_count) {
> -			kfree(msb);
>  			disk->private_data = NULL;
>  			idr_remove(&msb_disk_idr, msb->disk_id);
> +			kfree(msb);
>  			put_disk(disk);
>  		}
>  	}

Oops, I added this bug in latest iteration, when removed support for
major.
Acked-by: Maxim Levitsky <maximlevitsly@gmail.com>

Best regards,
Maxim Levitsky

