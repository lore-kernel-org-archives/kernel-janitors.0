Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490D4C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 22 Apr 2022 08:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445441AbiDVIEv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 22 Apr 2022 04:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445436AbiDVIEt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Apr 2022 04:04:49 -0400
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5759D527DB
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Apr 2022 01:01:57 -0700 (PDT)
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1nhoEl-0009YY-16
        for kernel-janitors@vger.kernel.org; Fri, 22 Apr 2022 10:01:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] drivers/base/memory: Fix a reference counting issue in
 __add_memory_block()
Date:   Fri, 22 Apr 2022 10:01:48 +0200
Message-ID: <ef8e4a32-bc05-2632-bc09-00a20faf49dd@wanadoo.fr>
References: <d44c63d78aafe844f920dc02ad6af25acc448fcf.1650611702.git.christophe.jaillet@wanadoo.fr>
 <YmJaoSam6g95yToH@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
In-Reply-To: <YmJaoSam6g95yToH@dhcp22.suse.cz>
Cc:     linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20220422080148.4obiau2Bq_HTaaIy4UosKDOE8EqkrHbW9c-Fk4sgzAA@z>

Le 22/04/2022 à 09:34, Michal Hocko a écrit :
> On Fri 22-04-22 09:15:21, Christophe JAILLET wrote:
>> There is no point in doing put_device()/device_unregister() on a
>> device that has just been registered a few lines above. This will lead to
>> a double reference decrement.
> 
> This is a bit confusing. I would rephrase.
> "
> __add_memory_block calls both put_device and device_unregister when
> storing the memory block into the xarray. This is incorrect because
> xarray doesn't take an additional reference and device_unregister
> already calls put_device.
> "
> 
> Btw. I do not think this failure path can be triggered, or is there a
> way to hit it?
>   
>> I guess that this put_device()/device_unregister() is a cut'n'paste from
>> remove_memory_block() (i.e. unregister_memory() at the time being) which
>> does need it.
>>
>> Fixes: 4fb6eabf1037 ("drivers/base/memory.c: cache memory blocks in xarray to accelerate lookup")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Other than that looks good to me. With the changelog clarified,
> especially the part that evaluates whether this is a real or a
> theoretical problem, feel free to add
> Acked-by: Michal Hocko <mhocko@suse.com>

I'll send a v2 with the updated changelog.

I do agree that this is certainly a theoretical issue.
Moreover, should it be triggered, I think that it would only print a 
warning message about an erroneous decrement on a ref counted resource 
that is already 0.

Well, it also saves 2 LoC and will look more logical to other readers 
(and static checkers :) )

Thanks for the quick review for both of you.

CJ
> 
> Thanks!
> 
>> ---
>>   drivers/base/memory.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>> index 7222ff9b5e05..084d67fd55cc 100644
>> --- a/drivers/base/memory.c
>> +++ b/drivers/base/memory.c
>> @@ -636,10 +636,9 @@ static int __add_memory_block(struct memory_block *memory)
>>   	}
>>   	ret = xa_err(xa_store(&memory_blocks, memory->dev.id, memory,
>>   			      GFP_KERNEL));
>> -	if (ret) {
>> -		put_device(&memory->dev);
>> +	if (ret)
>>   		device_unregister(&memory->dev);
>> -	}
>> +
>>   	return ret;
>>   }
>>   
>> -- 
>> 2.32.0
> 


