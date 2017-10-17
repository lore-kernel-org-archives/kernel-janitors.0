From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Tue, 17 Oct 2017 10:15:07 +0000
Subject: Re: [PATCH] zram: make function zram_page_end_io static
Message-Id: <20171017101507.GE6915@jagdpanzerIV>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171016173336.20320-1-colin.king@canonical.com>
In-Reply-To: <20171016173336.20320-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

(Ccing Andrew, message id: 20171016173336.20320-1-colin.king@canonical.com )

On (10/16/17 18:33), Colin King wrote:
> The function zram_page_end_io is local to the source and
> does not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'zram_page_end_io' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss

> ---
>  drivers/block/zram/zram_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index 88564222f473..d70eba30003a 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -428,7 +428,7 @@ static void put_entry_bdev(struct zram *zram, unsigned long entry)
>  	WARN_ON_ONCE(!was_set);
>  }
>  
> -void zram_page_end_io(struct bio *bio)
> +static void zram_page_end_io(struct bio *bio)
>  {
>  	struct page *page = bio->bi_io_vec[0].bv_page;
>  
> -- 
> 2.14.1
> 
