From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Dec 2015 06:58:29 +0000
Subject: Re: [PATCH 1/2] zram: Less checks in zram_bvec_write() after error detection
Message-Id: <566E6895.5050603@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566B13C1.50907@users.sourceforge.net>
 <566B14DA.1080709@users.sourceforge.net> <20151214002702.GA718@swordfish>
In-Reply-To: <20151214002702.GA718@swordfish>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
>> index 47915d7..69d7fcd 100644
>> --- a/drivers/block/zram/zram_drv.c
>> +++ b/drivers/block/zram/zram_drv.c
>> @@ -652,9 +652,9 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec, u32 index,
>>  	size_t clen;
>>  	unsigned long handle;
>>  	struct page *page;
>> -	unsigned char *user_mem, *cmem, *src, *uncmem = NULL;
>> +	unsigned char *user_mem, *cmem, *src, *uncmem;
>>  	struct zram_meta *meta = zram->meta;
>> -	struct zcomp_strm *zstrm = NULL;
>> +	struct zcomp_strm *zstrm;
>>  	unsigned long alloced_pages;
>>  
>>  	page = bvec->bv_page;
>> @@ -664,13 +664,11 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec, u32 index,
>>  		 * before to write the changes.
>>  		 */
>>  		uncmem = kmalloc(PAGE_SIZE, GFP_NOIO);
>> -		if (!uncmem) {
>> -			ret = -ENOMEM;
>> -			goto out;
>> -		}
>> +		if (!uncmem)
>> +			return -ENOMEM;
> 
> ok.

Thanks for your terse acknowledgement.


>>  		ret = zram_decompress_page(zram, uncmem, index);
>>  		if (ret)
>> -			goto out;
>> +			goto free_uncmem;
> 
> here and later, I don't want to split `out' label.

I guess that corresponding software design concerns can evolve a bit.


> you still need to do both 'if zstrm' and 'if is_partial_io' checks anyway, what's the gain?

How are the chances to reduce the number of dispensable sanity checks?


> the more labels we have the trickier it may get.

I hope that more unique jump labels can make the involved exception handling also clearer.


>> @@ -762,11 +760,13 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec, u32 index,
>>  	/* Update stats */
>>  	atomic64_add(clen, &zram->stats.compr_data_size);
>>  	atomic64_inc(&zram->stats.pages_stored);
>> -out:
>> +check_strm:
>>  	if (zstrm)
>>  		zcomp_strm_release(zram->comp, zstrm);
>> -	if (is_partial_io(bvec))
>> +	if (is_partial_io(bvec)) {
>> +free_uncmem:
>>  		kfree(uncmem);
>> +	}
> 
> a label inside of `if'?   no.

Do any more software developers find such an use case interesting?


> keep it the way it is please.

I suggest to make the affected exception handling a bit more efficient.
Such source code fine-tuning has got a few special consequences.

Regards,
Markus
