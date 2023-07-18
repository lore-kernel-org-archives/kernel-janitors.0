Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0F9EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 15:44:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbjGRPoy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 11:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232517AbjGRPox (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 11:44:53 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D8E6811C
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 08:44:48 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.43])
        by gateway (Coremail) with SMTP id _____8CxtPBus7ZkOdYGAA--.18063S3;
        Tue, 18 Jul 2023 23:44:46 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c5ds7ZkhnYzAA--.11134S3;
        Tue, 18 Jul 2023 23:44:46 +0800 (CST)
Message-ID: <674cc4b7-6cb1-5329-d06d-c981ac8ad240@loongson.cn>
Date:   Tue, 18 Jul 2023 23:44:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
To:     Dan Carpenter <dan.carpenter@linaro.org>, conduct@kernel.org
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
 <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
 <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
Content-Language: en-US
From:   suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Ax3c5ds7ZkhnYzAA--.11134S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxur4fCw4xur45tF4fAF45CFX_yoW5ZryrpF
        47J3WYkF4DJr1Iyas2qay0k3WFva4FqFyUWayrJw1YkwsxX3WIkryj9F1Y9Fy5uFW8u3y2
        vrWDWay3uF1avagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
        sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
        0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
        IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
        e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
        0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
        xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
        xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
        6r1DMcIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
        8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
        Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x02
        67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8rsqJUUUUU==
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 2023/7/18 21:27, Dan Carpenter wrote:
> Basically everything in this email was wrong to a kind of shocking
> degree.  For example, ignoring kmalloc() failure is a bug so the fixes
> tag is definitely warranted.  But then you called me "bare brained"
> which seems like a personal attack

Sorry, that's a misunderstanding

Sorry for my broken English.

by "bare brain",  I means that by using the brains(pure code review) only,

I conjure up this adjective from the word "bare metal".

When I reply you email, I lack a word to describe this.

I believe that many experts have this sort of ability,

they could create a patch by simply give a glimpse of the code.

because they know how does the code run at the very low level.


> so I'm going to report this as a code
> of conduct violation.

Sorry Dan,  you are welcomed.

Please withdraw this report.

I don't know why are you angry.

Because our hardware is rare,

Originally, by using the words "bare brain", I means by "pure brain",

I means that you probably without a hardware platform to do verification.

I want to know that if you have tested your patch on the board.

Or, I want to probe that if you have our hardware.

I will consider to send you one if you are long time contributor and if 
you are really interested.

I have a lot of boards, now I'm feel a little bit tired by developing 
drivers for all of them.


Please withdraw that report,  personal attack tend to continues(across) 
to multiple thread.

Sorry for my broken English. I will improve my written skill in the long 
term.

Thanks for you contribution.


> regards,
> dan carpenter
>
> On Tue, Jul 18, 2023 at 08:32:02PM +0800, suijingfeng wrote:
>> Hi,
>>
>>
>> Thanks for the patch.
>>
>>
>> The commit title generally should be 'drm/looongson: Add a check for
>> lsdc_bo_create() errors'
>>
>> not 'drm: loongson: xxxx'
>>
>>
>> On 2023/7/18 15:01, Dan Carpenter wrote:
>>> The lsdc_bo_create() function can fail so add a check for that.
>>>
>>> Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller")
>> Please drop this Fixes tag,  because you patch just add a error handling.
>>
>> Yes,  the lsdc_bo_create() function can fail, but this is generally not
>> happen.
>>
>> Even if the fail happened,  your patch is not fixing the root problem.
>>
>>
>> I know that you create this patch with the bare brain,
>>
>> I would like hear more practical usage or bugs of this driver.
>>
>> And mention more in the commit message is preferred.
>>
>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>    drivers/gpu/drm/loongson/lsdc_ttm.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
>>> index bb0c8fd43a75..bf79dc55afa4 100644
>>> --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
>>> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
>>> @@ -496,6 +496,8 @@ struct lsdc_bo *lsdc_bo_create_kernel_pinned(struct drm_device *ddev,
>>>    	int ret;
>>>    	lbo = lsdc_bo_create(ddev, domain, size, true, NULL, NULL);
>>> +	if (IS_ERR(lbo))
>>> +		return ERR_CAST(lbo);
>>>    	ret = lsdc_bo_reserve(lbo);
>>>    	if (unlikely(ret)) {

