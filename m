From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Feb 2019 14:40:30 +0000
Subject: Re: [PATCH][next][V2] block: don't dereference a potential null bio pointer until is has been null c
Message-Id: <20190219144030.GL17104@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219143702.11926-1-colin.king@canonical.com>
In-Reply-To: <20190219143702.11926-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 19, 2019 at 02:37:02PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The bio pointer is being null checked hence it can be potentially null,
> however earlier it is being derefefenced on the assignment of front_seg_size.
> Avoid the dereference issue by only assigning front_seg_size after bios has
> been null sanity checked.
> 
> Fixes: dcebd755926b ("block: use bio_for_each_bvec() to compute multi-page bvec count")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: remove front_seg_size assignment when it is declared
> 
> ---
>  block/blk-merge.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/block/blk-merge.c b/block/blk-merge.c
> index bed065904677..096947413ea9 100644
> --- a/block/blk-merge.c
> +++ b/block/blk-merge.c
> @@ -363,7 +363,7 @@ static unsigned int __blk_recalc_rq_segments(struct request_queue *q,
>  	struct bio_vec bv, bvprv = { NULL };
>  	int prev = 0;
>  	unsigned int seg_size, nr_phys_segs;
> -	unsigned front_seg_size = bio->bi_seg_front_size;
> +	unsigned front_seg_size;

Smatch says bio is non-NULL but I didn't verify by hand.

regards,
dan carpenter
