Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88842C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Apr 2022 18:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352427AbiDZSul (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 26 Apr 2022 14:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352459AbiDZSuj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Apr 2022 14:50:39 -0400
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1709A8C7C8
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Apr 2022 11:47:29 -0700 (PDT)
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1njQDf-0005eQ-UC
        for kernel-janitors@vger.kernel.org; Tue, 26 Apr 2022 20:47:27 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 1/2] drm/amdkfd: Use bitmap_zalloc() when applicable
Date:   Tue, 26 Apr 2022 20:47:20 +0200
Message-ID: <80a426b3-ece2-129c-edca-03556e1ecbb6@wanadoo.fr>
References: <f12820f6c5fca9b10ac8f82b3689c50ccb6966aa.1638117878.git.christophe.jaillet@wanadoo.fr>
 <14268d5a-9a4a-2921-9961-d5d36fad47b2@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: fr
In-Reply-To: <14268d5a-9a4a-2921-9961-d5d36fad47b2@amd.com>
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20220426184720.wzu7-wb5evfDzG-zYGx32bhmbsYYe-mMR7J2sl_Hvz0@z>

Le 26/04/2022 à 20:01, Felix Kuehling a écrit :
> Hi Christophe,
> 
> I just stumbled over this patch series while cleaning up my inbox. Sorry 
> for dropping it back in November. I'm about to apply it but I noticed 
> that patch 1 is missing a Signed-off-by. Is it OK to add that in your name?

Hi,

No problem for me if you can add it. Thanks.
But if you prefer a v2, it is also fine for me.

BTW sorry for missing the SoB tag. This definitively means that I forgot 
the checkpatch.pl step for this patch, which is bad.

CJ

> 
> Thanks,
>    Felix
> 
> 
> Am 2021-11-28 um 11:45 schrieb Christophe JAILLET:
>> 'kfd->gtt_sa_bitmap' is a bitmap. So use 'bitmap_zalloc()' to simplify
>> code, improve the semantic and avoid some open-coded arithmetic in
>> allocator arguments.
>>
>> Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
>> consistency.
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_device.c | 12 +++---------
>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> index e1294fba0c26..c5a0ce44a295 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> @@ -1252,8 +1252,6 @@ int 
>> kgd2kfd_schedule_evict_and_restore_process(struct mm_struct *mm,
>>   static int kfd_gtt_sa_init(struct kfd_dev *kfd, unsigned int buf_size,
>>                   unsigned int chunk_size)
>>   {
>> -    unsigned int num_of_longs;
>> -
>>       if (WARN_ON(buf_size < chunk_size))
>>           return -EINVAL;
>>       if (WARN_ON(buf_size == 0))
>> @@ -1264,11 +1262,8 @@ static int kfd_gtt_sa_init(struct kfd_dev *kfd, 
>> unsigned int buf_size,
>>       kfd->gtt_sa_chunk_size = chunk_size;
>>       kfd->gtt_sa_num_of_chunks = buf_size / chunk_size;
>> -    num_of_longs = (kfd->gtt_sa_num_of_chunks + BITS_PER_LONG - 1) /
>> -        BITS_PER_LONG;
>> -
>> -    kfd->gtt_sa_bitmap = kcalloc(num_of_longs, sizeof(long), 
>> GFP_KERNEL);
>> -
>> +    kfd->gtt_sa_bitmap = bitmap_zalloc(kfd->gtt_sa_num_of_chunks,
>> +                       GFP_KERNEL);
>>       if (!kfd->gtt_sa_bitmap)
>>           return -ENOMEM;
>> @@ -1278,13 +1273,12 @@ static int kfd_gtt_sa_init(struct kfd_dev 
>> *kfd, unsigned int buf_size,
>>       mutex_init(&kfd->gtt_sa_lock);
>>       return 0;
>> -
>>   }
>>   static void kfd_gtt_sa_fini(struct kfd_dev *kfd)
>>   {
>>       mutex_destroy(&kfd->gtt_sa_lock);
>> -    kfree(kfd->gtt_sa_bitmap);
>> +    bitmap_free(kfd->gtt_sa_bitmap);
>>   }
>>   static inline uint64_t kfd_gtt_sa_calc_gpu_addr(uint64_t start_addr,
> 


