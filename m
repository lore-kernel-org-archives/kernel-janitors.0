Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73584C49EA2
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 10:27:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58CDF611BD
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 10:27:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhFUKaE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Jun 2021 06:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhFUKaD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Jun 2021 06:30:03 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EB9C061574
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Jun 2021 03:27:48 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id nd37so27967072ejc.3
        for <kernel-janitors@vger.kernel.org>; Mon, 21 Jun 2021 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Kc8gTRhJVr4mndMt5T7ehgGK2e5385ss7fdEgOEpQTo=;
        b=YmWk+Kc4MY64T3MCmC0pNT5dWGVw+LrDGMV9GH22IfNzjkAFoKX5NB4COcFBmXpVJB
         Rm6TWSsWIhI/+Esdm4MXOK+a/sW/Wwgvr8eTdNIoh70kX+EIf4y3MOEY6C8NoCoy7A17
         3TEZshxSKv/cy8SgwDPr0bcTD0575na0MtoiKQAPjprHney1ODTxhjTH5Cv8gwfQwtLg
         Z9bBrvjh+zWyddKzUI/8jSqj/hEjYbGZbtBcYntCWt/3WvYkgMe5K12Lvg6OKQ3pnQhv
         5aX/HuKGFeD+gTaDuZiQCdgJ2bt5yCPwqNu6xC+w+VzE7CyCwjK6Cl9XpRsuT2Nt+8i1
         hI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Kc8gTRhJVr4mndMt5T7ehgGK2e5385ss7fdEgOEpQTo=;
        b=ApnWtMYgNFodZqEirHRBzoXFYkr1bzQUL1z5TcJz/ge5r6kDl031AmCh5pY7l7OkCe
         SBf57wRI1+lHsLquYvpjK/WTBs5CccQsDHIWXXxcBdMxJgXLnZWUijO8Gliyj+8YyIsW
         mxrpSfFXuVS+klr2h7b3ZZtHdaby+ZktFLd0SXyaIIeJ1q8AnQAutrnMJbhqUE8yOs2A
         gMt+2p4lBWJHvKZz9va3lTxOZainfvynFEnDhUcl3BiknP4anKKOZ1GW+0CO0E1WFvrX
         BcmiFvyGJRoJEgpO6XorgDyHX2BiwZ7LhlwykdzCUwAmAkRBE05wjk/Sx7LL5oQHPPBf
         oEwQ==
X-Gm-Message-State: AOAM533nFjtVU0h7C++Cm3Sf1yQ0qICPyzOiBGM0Nx1PcYBlxl8+HufQ
        h4YB7eTmVg9Xnn7CaGsByhA=
X-Google-Smtp-Source: ABdhPJyfI7mARehNoaiS3lUuteXfRbgWc21/TfrpBJf99V1xt5UmnZ5cjD+im8w8DLqgPIWXchAjrA==
X-Received: by 2002:a17:906:2b18:: with SMTP id a24mr15959584ejg.239.1624271267213;
        Mon, 21 Jun 2021 03:27:47 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:aae5:6e05:c:d69? ([2a02:908:1252:fb60:aae5:6e05:c:d69])
        by smtp.gmail.com with ESMTPSA id jl10sm360145ejc.56.2021.06.21.03.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 03:27:46 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_preempt_mgr_new()
To:     Alex Deucher <alexdeucher@gmail.com>,
        Felix Kuehling <felix.kuehling@amd.com>
Cc:     David Airlie <airlied@linux.ie>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        kernel-janitors@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <YMxbQXg/Wqm0ACxt@mwanda>
 <fadcee22-d830-c1be-09f0-9788b98c45ec@amd.com>
 <adee15a2-f531-688c-1121-7504163ae441@amd.com>
 <CADnq5_MtwTXEv=HitiyBfdSyBb-izSRiR3W=zxKNKRNvxdKO1A@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <79eb1bb6-b77c-73e0-31f0-028743c98a36@gmail.com>
Date:   Mon, 21 Jun 2021 12:27:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_MtwTXEv=HitiyBfdSyBb-izSRiR3W=zxKNKRNvxdKO1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Am 18.06.21 um 23:18 schrieb Alex Deucher:
> On Fri, Jun 18, 2021 at 11:40 AM Felix Kuehling <felix.kuehling@amd.com> wrote:
>> Am 2021-06-18 um 4:39 a.m. schrieb Christian König:
>>> Am 18.06.21 um 10:37 schrieb Dan Carpenter:
>>>> There is a reversed if statement in amdgpu_preempt_mgr_new() so it
>>>> always returns -ENOMEM.
>>>>
>>>> Fixes: 09b020bb05a5 ("Merge tag 'drm-misc-next-2021-06-09' of
>>>> git://anongit.freedesktop.org/drm/drm-misc into drm-next")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> Most be some fallout from merging it with the TTM changes.
>>>
>>> Anyway, patch is Reviewed-by: Christian König <christian.koenig@amd.com>
>> This is obviously not for amd-staging-drm-next. Christian, are you going
>> to apply it to the relevant branches?
> I've applied it to my drm-next branch.

I already pushed it to drm-misc-next last week.

Christian.

>
> Alex
>
>
>> Thanks,
>>    Felix
>>
>>
>>> Thanks,
>>> Christian.
>>>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> index f6aff7ce5160..d02c8637f909 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> @@ -71,7 +71,7 @@ static int amdgpu_preempt_mgr_new(struct
>>>> ttm_resource_manager *man,
>>>>        struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
>>>>          *res = kzalloc(sizeof(**res), GFP_KERNEL);
>>>> -    if (*res)
>>>> +    if (!*res)
>>>>            return -ENOMEM;
>>>>          ttm_resource_init(tbo, place, *res);
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

