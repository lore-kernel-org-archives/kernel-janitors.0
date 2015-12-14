From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Mon, 14 Dec 2015 00:27:02 +0000
Subject: Re: [PATCH 1/2] zram: Less checks in zram_bvec_write() after error detection
Message-Id: <20151214002702.GA718@swordfish>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566B13C1.50907@users.sourceforge.net>
 <566B14DA.1080709@users.sourceforge.net>
In-Reply-To: <566B14DA.1080709@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On (12/11/15 19:24), SF Markus Elfring wrote:
[..]
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index 47915d7..69d7fcd 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -652,9 +652,9 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec, u32 index,
>  	size_t clen;
>  	unsigned long handle;
>  	struct page *page;
> -	unsigned char *user_mem, *cmem, *src, *uncmem = NULL;
> +	unsigned char *user_mem, *cmem, *src, *uncmem;
>  	struct zram_meta *meta = zram->meta;
> -	struct zcomp_strm *zstrm = NULL;
> +	struct zcomp_strm *zstrm;
>  	unsigned long alloced_pages;
>  
>  	page = bvec->bv_page;
> @@ -664,13 +664,11 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec, u32 index,
>  		 * before to write the changes.
>  		 */
>  		uncmem = kmalloc(PAGE_SIZE, GFP_NOIO);
> -		if (!uncmem) {
> -			ret = -ENOMEM;
> -			goto out;
> -		}
> +		if (!uncmem)
> +			return -ENOMEM;

ok.

>  		ret = zram_decompress_page(zram, uncmem, index);
>  		if (ret)
> -			goto out;
> +			goto free_uncmem;

here and later, I don't want to split `out' label.
you still need to do both 'if zstrm' and 'if is_partial_io' checks anyway, what's the gain?
the more labels we have the trickier it may get.

>  	}
>  
>  	zstrm = zcomp_strm_find(zram->comp);
> @@ -696,7 +694,7 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec, u32 index,
>  
>  		atomic64_inc(&zram->stats.zero_pages);
>  		ret = 0;
> -		goto out;
> +		goto check_strm;
>  	}
>  
>  	ret = zcomp_compress(zram->comp, zstrm, uncmem, &clen);
> @@ -708,7 +706,7 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec, u32 index,
>  
>  	if (unlikely(ret)) {
>  		pr_err("Compression failed! err=%d\n", ret);
> -		goto out;
> +		goto check_strm;
>  	}
>  	src = zstrm->buffer;
>  	if (unlikely(clen > max_zpage_size)) {
> @@ -722,7 +720,7 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec, u32 index,
>  		pr_err("Error allocating memory for compressed page: %u, size=%zu\n",
>  			index, clen);
>  		ret = -ENOMEM;
> -		goto out;
> +		goto check_strm;
>  	}
>  
>  	alloced_pages = zs_get_total_pages(meta->mem_pool);
> @@ -731,7 +729,7 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec, u32 index,
>  	if (zram->limit_pages && alloced_pages > zram->limit_pages) {
>  		zs_free(meta->mem_pool, handle);
>  		ret = -ENOMEM;
> -		goto out;
> +		goto check_strm;
>  	}
>  
>  	cmem = zs_map_object(meta->mem_pool, handle, ZS_MM_WO);
> @@ -762,11 +760,13 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec, u32 index,
>  	/* Update stats */
>  	atomic64_add(clen, &zram->stats.compr_data_size);
>  	atomic64_inc(&zram->stats.pages_stored);
> -out:
> +check_strm:
>  	if (zstrm)
>  		zcomp_strm_release(zram->comp, zstrm);
> -	if (is_partial_io(bvec))
> +	if (is_partial_io(bvec)) {
> +free_uncmem:
>  		kfree(uncmem);
> +	}

a label inside of `if'?   no.
keep it the way it is please.

>  	return ret;
>  }

	-ss
