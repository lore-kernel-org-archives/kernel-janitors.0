Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA40CCA480
	for <kernel-janitors@archiver.kernel.org>; Sun,  3 Jul 2022 06:50:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbiGCGud (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 3 Jul 2022 02:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbiGCGuc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 3 Jul 2022 02:50:32 -0400
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA906589
        for <kernel-janitors@vger.kernel.org>; Sat,  2 Jul 2022 23:50:26 -0700 (PDT)
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1o7tR2-00047P-8z
        for kernel-janitors@vger.kernel.org; Sun, 03 Jul 2022 08:50:24 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 3/4] bitmap: Introduce bitmap_size()
Date:   Sun, 3 Jul 2022 08:50:19 +0200
Message-ID: <4dc5d50a-2291-1d3a-efac-3f6378a15d69@wanadoo.fr>
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
 <98f5d3d855a9c687ccc035edf62016b02a6876b7.1656785856.git.christophe.jaillet@wanadoo.fr>
 <YsC0GpltMVaCPhkJ@yury-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
In-Reply-To: <YsC0GpltMVaCPhkJ@yury-laptop>
Cc:     dm-devel@redhat.com, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20220703065019.fHqCFHD90prty1WErbRm8FAFkPMuMsC0qnUOYlo0qdI@z>

Le 02/07/2022 à 23:09, Yury Norov a écrit :
> On Sat, Jul 02, 2022 at 08:29:36PM +0200, Christophe JAILLET wrote:
>> The new bitmap_size() function returns the size, in bytes, of a bitmap.
>>
>> Remove the already existing bitmap_size() functions and macro in some
>> files.
>> These files already use the bitmap API and will use the new function
>> in bitmap.h automatically.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/md/dm-clone-metadata.c | 5 -----
>>   include/linux/bitmap.h         | 6 ++++++
>>   lib/math/prime_numbers.c       | 2 --
>>   3 files changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/md/dm-clone-metadata.c b/drivers/md/dm-clone-metadata.c
>> index c43d55672bce..47c1fa7aad8b 100644
>> --- a/drivers/md/dm-clone-metadata.c
>> +++ b/drivers/md/dm-clone-metadata.c
>> @@ -465,11 +465,6 @@ static void __destroy_persistent_data_structures(struct dm_clone_metadata *cmd)
>>   
>>   /*---------------------------------------------------------------------------*/
>>   
>> -static size_t bitmap_size(unsigned long nr_bits)
>> -{
>> -	return BITS_TO_LONGS(nr_bits) * sizeof(long);
>> -}
>> -
>>   static int __dirty_map_init(struct dirty_map *dmap, unsigned long nr_words,
>>   			    unsigned long nr_regions)
>>   {
>> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
>> index f091a1664bf1..f66fb98a4126 100644
>> --- a/include/linux/bitmap.h
>> +++ b/include/linux/bitmap.h
>> @@ -48,6 +48,7 @@ struct device;
>>    *  bitmap_equal(src1, src2, nbits)             Are *src1 and *src2 equal?
>>    *  bitmap_intersects(src1, src2, nbits)        Do *src1 and *src2 overlap?
>>    *  bitmap_subset(src1, src2, nbits)            Is *src1 a subset of *src2?
>> + *  bitmap_size(nbits)                          Size, in bytes, of a bitmap
>>    *  bitmap_empty(src, nbits)                    Are all bits zero in *src?
>>    *  bitmap_full(src, nbits)                     Are all bits set in *src?
>>    *  bitmap_weight(src, nbits)                   Hamming Weight: number set bits
>> @@ -124,6 +125,11 @@ unsigned long *bitmap_alloc_node(unsigned int nbits, gfp_t flags, int node);
>>   unsigned long *bitmap_zalloc_node(unsigned int nbits, gfp_t flags, int node);
>>   void bitmap_free(const unsigned long *bitmap);
>>   
>> +static __always_inline size_t bitmap_size(unsigned long nbits)
>> +{
>> +	return BITS_TO_LONGS(nbits) * sizeof(unsigned long);
>> +}
>> +
>>   /* Managed variants of the above. */
>>   unsigned long *devm_bitmap_alloc(struct device *dev,
>>   				 unsigned int nbits, gfp_t flags);
>> diff --git a/lib/math/prime_numbers.c b/lib/math/prime_numbers.c
>> index d42cebf7407f..d3b64b10da1c 100644
>> --- a/lib/math/prime_numbers.c
>> +++ b/lib/math/prime_numbers.c
>> @@ -6,8 +6,6 @@
>>   #include <linux/prime_numbers.h>
>>   #include <linux/slab.h>
>>   
>> -#define bitmap_size(nbits) (BITS_TO_LONGS(nbits) * sizeof(unsigned long))
>> -
> 
> This should be dropped, for sure, and kmalloc() at line 128 should be
> replaced with bitmap_alloc().

This kmalloc() is for a structure and a flexible array.

You mean re-arranging the code to allocate the structure alone at first, 
then the bitmap?

CJ

> 
> For the driver, we need to introduce bitmap_kvmalloc/bitmap_kvfree etc.
> 
>>   struct primes {
>>   	struct rcu_head rcu;
>>   	unsigned long last, sz;
>> -- 
>> 2.34.1
> 


