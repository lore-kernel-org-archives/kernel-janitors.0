From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Wed, 09 Dec 2015 10:26:27 +0000
Subject: Re: [patch] blk-integrity: checking for NULL instead of IS_ERR
Message-Id: <1449656787.3311.25.camel@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151209102123.GA3173@mwanda>
In-Reply-To: <20151209102123.GA3173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jens Axboe <axboe@kernel.dk>, Keith Busch <keith.busch@intel.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2015-12-09 at 13:21 +0300, Dan Carpenter wrote:
> We recently changed bio_integrity_alloc() to return ERR_PTRs instead of
> NULL but these calls were missed.
> 
> Fixes: 06c1e3902aa7 ('blk-integrity: empty implementation when disabled')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/block/bio-integrity.c b/block/bio-integrity.c
> index e6ba501..711e4d8d 100644
> --- a/block/bio-integrity.c
> +++ b/block/bio-integrity.c
> @@ -298,10 +298,10 @@ int bio_integrity_prep(struct bio *bio)
>  
>  	/* Allocate bio integrity payload and integrity vectors */
>  	bip = bio_integrity_alloc(bio, GFP_NOIO, nr_pages);
> -	if (unlikely(bip = NULL)) {
> +	if (IS_ERR(bip)) {
>  		printk(KERN_ERR "could not allocate data integrity
> bioset\n");
>  		kfree(buf);
> -		return -EIO;
> +		return PTR_ERR(bip);
>  	}
>  
>  	bip->bip_flags |= BIP_BLOCK_INTEGRITY;
> @@ -465,9 +465,8 @@ int bio_integrity_clone(struct bio *bio, struct bio
> *bio_src,
>  	BUG_ON(bip_src = NULL);
>  
>  	bip = bio_integrity_alloc(bio, gfp_mask, bip_src->bip_vcnt);
> -
> -	if (bip = NULL)
> -		return -EIO;
> +	if (IS_ERR(bip))
> +		return PTR_ERR(bip);
>  
>  	memcpy(bip->bip_vec, bip_src->bip_vec,
>  	       bip_src->bip_vcnt * sizeof(struct bio_vec));
> --
> To unsubscribe from this list: send the line "unsubscribe linux-block" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>

