Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F43FCD37BD
	for <kernel-janitors@archiver.kernel.org>; Sat, 16 Sep 2023 14:37:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236702AbjIPOhD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 16 Sep 2023 10:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239301AbjIPOgp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 16 Sep 2023 10:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2AA7913E
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Sep 2023 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694874959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/mp9XkH8OUlg5iQgXOIaWNRuMOOZINkri8HGnBg221o=;
        b=f6WzHOyFtf5DwokQiuvbMmaaRjRjV+sgcOH2tzCfjIHuMehVrhTH8WWZ5zpKMAKLSJdlU3
        Pk43VYGWf7sBzhxuDN8C08f4+arj5YXGn0FNAaWMEDWc5GM/oeZTqUu0wr6lyPvlKJBzh7
        1qeXuAF8N46Dojb4OeYMvWiePGwAHCo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-wSeIl1lSOsOcRijw0nJ4Zw-1; Sat, 16 Sep 2023 10:35:56 -0400
X-MC-Unique: wSeIl1lSOsOcRijw0nJ4Zw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-502d58d14beso1770029e87.0
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Sep 2023 07:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694874955; x=1695479755;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mp9XkH8OUlg5iQgXOIaWNRuMOOZINkri8HGnBg221o=;
        b=jcjRrp69OS0e2B8qXi3oh2gRqFzTrQBJYAZeb7nGO9aZ0cqiRqHFjw6OY4ua9I88rJ
         G93Lz7tZdTjs3n2d5gGCiiUiLsB6lyW8f/R9SjzHVDEmymfYQEftuCnXoLa/55thIMIi
         yfJBrpGUS5sgCR/iIBorqQKdjW+Xq3XqDY5V27PiwFjSGbO46oaet8nZLJ43GIBK7Nsq
         z7apx7r0kAI0CotIhPIFfvyYZW4OXMTfR+RLa+fymkOolJl0ZixKfgBjpPs0aXT22MMb
         5tXbT+exImRBQ3g1jS1kDfCad7cJC61mVb+IzMHaJXfYysamlsSRf5EauV68vY1U28s/
         f3kA==
X-Gm-Message-State: AOJu0Yy+k13accnUXMVEcmHmvdZ2ezoIDNRMey2Z4MuJ+LAr9Pot7Yoz
        qHGiWD94eMUGOqvt1x9St3CIgBwljN5v1RrLWr00xvcD6c0/sFk/pINd6qupNnEjnndHUZ71jxt
        8HR7MxrRW92+4+VtbN22cGpipNetm
X-Received: by 2002:ac2:5f46:0:b0:4fe:af1:c3ae with SMTP id 6-20020ac25f46000000b004fe0af1c3aemr3571159lfz.15.1694874954965;
        Sat, 16 Sep 2023 07:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlgl0Ylz4+Dm9kk9jCkqXMN1BHISMu1BMtuNzZkQJVTmUz/b3svV55Beso1XJDaH8pjSaaCQ==
X-Received: by 2002:ac2:5f46:0:b0:4fe:af1:c3ae with SMTP id 6-20020ac25f46000000b004fe0af1c3aemr3571143lfz.15.1694874954578;
        Sat, 16 Sep 2023 07:35:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id u23-20020aa7d997000000b0052a3edff5c3sm3524909eds.87.2023.09.16.07.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 07:35:54 -0700 (PDT)
Message-ID: <27ce1aa9-ea98-479d-76ab-45aae531b1de@redhat.com>
Date:   Sat, 16 Sep 2023 16:35:52 +0200
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
 <2ab31d98-931f-4322-8e67-381d21302a7c@kadam.mountain>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <2ab31d98-931f-4322-8e67-381d21302a7c@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 9/16/23 16:26, Dan Carpenter wrote:
> On Sat, Sep 16, 2023 at 05:24:04PM +0300, Dan Carpenter wrote:
>> On Sat, Sep 16, 2023 at 01:41:43AM +0200, Danilo Krummrich wrote:
>>> Hi Dan,
>>>
>>> On 9/15/23 14:59, Dan Carpenter wrote:
>>>> The u_memcpya() function is supposed to return error pointers on
>>>> error.  Returning NULL will lead to an Oops.
>>>>
>>>> Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
>>>> index 3666a7403e47..52a708a98915 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
>>>> @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
>>>>    	size_t bytes;
>>>>    	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
>>>> -		return NULL;
>>>> +		return ERR_PTR(-ENOMEM);
>>>
>>> I plan to replace this function with an upcoming vmemdup_array_user() helper,
>>> which returns -EOVERFLOW instead, hence mind using that?
>>>
>>> Unless you disagree, no need to resubmit the patch, I can change it
>>> before applying the patch.
>>
>> Generally, I would say that ENOMEM is the correct error code.  I feel
>> like someone thinks EOVERFLOW means integer overflow and that's not
>> correct.  I means like if you pass a number higher than INT_MAX to
>> kstroint().
> 
> The most common error code for integer overflows is EINVAL because the
> user passed invalid data.

I totally agree with that, and my choice would have been EINVAL as well. It's just
that it seems (v)memdup_array_user() [1] goes with that and hence I'd just go along.

[1] https://lore.kernel.org/lkml/93001a9f3f101be0f374080090f9c32df73ca773.1694202430.git.pstanner@redhat.com/

> 
> regards,
> dan carpenter
> 

