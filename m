Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFF0CE79A8
	for <kernel-janitors@archiver.kernel.org>; Tue, 19 Sep 2023 22:24:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbjISWYy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 19 Sep 2023 18:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjISWYx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Sep 2023 18:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE6FBE
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Sep 2023 15:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695162241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iu9scWxa8/Kic0aeMHk9swfJe1CpFtZjtsKcvFgigt0=;
        b=N1kdmYidjS/mVMOJw1vKEOAmc0DAFHV9iZ3ZV9slwBhXJEszcttNrN1YhmoLMNNV7I3Mov
        Bz9QKwWeI5a99aJxeb4PGuR5EdCg/V/oaTzPdkhMn83oGpq4ioDoBeHa7jF861VWJl1yG5
        sUG6W+OkOiACaa4f0hQLvTWGttQwCBU=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-Zlc9GHwFMju-_niTgUtZ8g-1; Tue, 19 Sep 2023 18:23:59 -0400
X-MC-Unique: Zlc9GHwFMju-_niTgUtZ8g-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2bce272ebdfso77942981fa.1
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Sep 2023 15:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695162238; x=1695767038;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu9scWxa8/Kic0aeMHk9swfJe1CpFtZjtsKcvFgigt0=;
        b=IexBy11HgQOq0ZWrkc3DpvL8aMBSABcdnjqX6HgZSFgjRm/2rmb73TD+/eDYoPyT1W
         0CPRMOZxhmBxN0hrn1NrgDByCYSmdNy49mX7BueIqPQ+aGf3fcHCNCat4Qp0vmq+QQjB
         o/k6Q2B2WaO7S2gvuegJtN3GbbLkocpdQPY/RcJscTfKydOphGhqZtcr51ory6qAHbQD
         UAc9Ulk6c9iOkgOFaRizsz/uK2Sy5bR7gCwhmKcUzou9frgE64hXAgOrNqEz3kjaJ7RS
         zi974qyrg86WFrenbtZXbXwh3NYhkgUEY4dV7VyhsO0FEx8FkK7IiDciB2jirHL4SiiI
         Cq5w==
X-Gm-Message-State: AOJu0YwCIoLzcqZvhQlzH34uN/YFoCgk/tO8WISkx/w5bPHl4XCB/ER/
        maYSEhW7h/UFq75/yLPqIRNej0iCttJAUFl1wmzcgrLXW5tEbcn3sn9rr5ubuLEwebOA07OPE6o
        LT65gLjjAgRbOdF2sDUiDETy8qDIq
X-Received: by 2002:a2e:9dd4:0:b0:2c0:3284:64d5 with SMTP id x20-20020a2e9dd4000000b002c0328464d5mr566292ljj.47.1695162238076;
        Tue, 19 Sep 2023 15:23:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSLfTM/e2pj9i25MZfS/WM7Ty4jUCTezq3kTq4v+sE6/bvXNCRHvHUXT0YlVrk/G/yCtRqIA==
X-Received: by 2002:a2e:9dd4:0:b0:2c0:3284:64d5 with SMTP id x20-20020a2e9dd4000000b002c0328464d5mr566282ljj.47.1695162237631;
        Tue, 19 Sep 2023 15:23:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id br13-20020a170906d14d00b0099cf9bf4c98sm8464321ejb.8.2023.09.19.15.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 15:23:57 -0700 (PDT)
Message-ID: <3f643295-f742-ab49-18fa-f0d07981e59b@redhat.com>
Date:   Wed, 20 Sep 2023 00:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer
 bug
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ben Skeggs <bskeggs@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
 <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
 <813a260a-80ac-4c11-a0c5-f50edb399b5c@kadam.mountain>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <813a260a-80ac-4c11-a0c5-f50edb399b5c@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/16/23 16:24, Dan Carpenter wrote:
> On Sat, Sep 16, 2023 at 01:41:43AM +0200, Danilo Krummrich wrote:
>> Hi Dan,
>>
>> On 9/15/23 14:59, Dan Carpenter wrote:
>>> The u_memcpya() function is supposed to return error pointers on
>>> error.  Returning NULL will lead to an Oops.
>>>
>>> Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>    drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
>>> index 3666a7403e47..52a708a98915 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
>>> @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
>>>    	size_t bytes;
>>>    	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
>>> -		return NULL;
>>> +		return ERR_PTR(-ENOMEM);
>>
>> I plan to replace this function with an upcoming vmemdup_array_user() helper,
>> which returns -EOVERFLOW instead, hence mind using that?
>>
>> Unless you disagree, no need to resubmit the patch, I can change it
>> before applying the patch.
> 
> Generally, I would say that ENOMEM is the correct error code.  I feel
> like someone thinks EOVERFLOW means integer overflow and that's not
> correct.  I means like if you pass a number higher than INT_MAX to
> kstroint().
> 
> But I don't care strongly about this.  You can change it if you want to.

I seems that vmemdup_array_user() will keep using EOVERFLOW, hence aligning to
that.

Pushed the patch to drm-misc-fixes, thanks!

> 
> regards,
> dan carpenter
> 

