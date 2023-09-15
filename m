Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBB7CD37AF
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Sep 2023 23:43:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbjIOXnI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Sep 2023 19:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235345AbjIOXml (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 19:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 632A4A0
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 16:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694821308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=edIC9kHaNwOD1pTTtXCPXcwng2iTsOm0qnQsvYt9crA=;
        b=F6ThmuDN9ED2sLno5eLgNJ3TOSZQhpyLX57KgErm7KOqMJ5mOmG+0aS+EUAJZPms7ja1ws
        ceODlCr3WEzenjsR6wo3IcUfo893rxQQ0znEDyVPBxS2/EjKnxhORzXiBV8d6kL6rg8DLR
        /y07wrvRVtljsobOS1/40ZIbACUyZWo=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-fwJOcDCXPq2Sox9lpJ7eMg-1; Fri, 15 Sep 2023 19:41:47 -0400
X-MC-Unique: fwJOcDCXPq2Sox9lpJ7eMg-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ba1949656bso33662141fa.0
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 16:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694821305; x=1695426105;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edIC9kHaNwOD1pTTtXCPXcwng2iTsOm0qnQsvYt9crA=;
        b=Cc+9C+UTfGW7iUYO0jcmj7rMQEd9HBz+fpWkrLDZVjsIYv4aoVN++t6+UpkSZm2Q4X
         7pbfs/Eb6xhxpZ9XjRAhTdJTX03x0xBBAEiLYONulPP2uHzlvap3G8srcR2p/ACtktSL
         SV1TB3luJ1LEtlPRbw1DCXY2nXtcMXRjMwNzJA4aJPL/55z6RR9C1WSFlEdPJdV56i1X
         zQLfWdt+ptvQfPldCjVUnvxy6aYYsjngpuFYe8j70DQOg4yXsZUVcusx4l1yxQILbXxV
         aycrd8JT1qP3j0BlJJS892GL1AwBGgp5Lu3qctTTbOgcjlX6z/ZyImaAFFAlONf+WfYt
         KQDw==
X-Gm-Message-State: AOJu0YyfqyLXrM1QCPlG8HLMz5wjYUPQa3NJqN4YccfE9UZdDby4GW/w
        ffzqWjK7p0g+zyS3LTai6X2Xsi36AT04X954dTUnqCGnKX/rG+ny+WXeszGsGO6HEf9UvWXGWI7
        ZxLCJGO2elWRblROU+AO2xU+PhdIB
X-Received: by 2002:a2e:9253:0:b0:2bc:cdcf:d888 with SMTP id v19-20020a2e9253000000b002bccdcfd888mr2658335ljg.46.1694821305683;
        Fri, 15 Sep 2023 16:41:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9+l585nVbXHSkBW0mkzB95UWueF5p/qZnXWYxc2gJoge0k2BB4n4o2GvzYDyCESm4Esitfg==
X-Received: by 2002:a2e:9253:0:b0:2bc:cdcf:d888 with SMTP id v19-20020a2e9253000000b002bccdcfd888mr2658325ljg.46.1694821305374;
        Fri, 15 Sep 2023 16:41:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id t2-20020a1709064f0200b0099bcf1c07c6sm2989814eju.138.2023.09.15.16.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 16:41:44 -0700 (PDT)
Message-ID: <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
Date:   Sat, 16 Sep 2023 01:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Danilo Krummrich <dakr@redhat.com>
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer
 bug
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Dave Airlie <airlied@redhat.com>
Cc:     nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
Content-Language: en-US
Organization: RedHat
In-Reply-To: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 9/15/23 14:59, Dan Carpenter wrote:
> The u_memcpya() function is supposed to return error pointers on
> error.  Returning NULL will lead to an Oops.
> 
> Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 3666a7403e47..52a708a98915 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
>   	size_t bytes;
>   
>   	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);

I plan to replace this function with an upcoming vmemdup_array_user() helper,
which returns -EOVERFLOW instead, hence mind using that?

Unless you disagree, no need to resubmit the patch, I can change it before applying
the patch.

- Danilo

>   	return vmemdup_user(userptr, bytes);
>   }
>   

