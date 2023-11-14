Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388F22AEE1
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Nov 2023 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U1vwk2vi"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE48D2
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Nov 2023 13:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699997935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fxB7ExxiHdS0NZmPKiG+1iSonlk/ZPL9t612T7W2Wvs=;
	b=U1vwk2vik+J7Y9uZzndKTHji2ZcnBM3BFJKdzkhRXfJLGGWJMkOSr43OTH7AgRsCF68Gr0
	dUD/Zko0HqXvJj86u/z/4xs5WKyr9GcmHPSZ6Ibe5Zswib2XZOEn0II1GCZHVeCMmwE2cv
	v5R66/y5jz+rwvZrPnNzG9ZHZJERrJ4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-3CxJ_QcePCuRedTvG9BgLw-1; Tue, 14 Nov 2023 16:38:54 -0500
X-MC-Unique: 3CxJ_QcePCuRedTvG9BgLw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9e1fb0308d6so414313266b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Nov 2023 13:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699997933; x=1700602733;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxB7ExxiHdS0NZmPKiG+1iSonlk/ZPL9t612T7W2Wvs=;
        b=AULHNY/FWbDJyN17Sh2z/du41umG/vQGZh8PRyVGsCbQEJ3hNFm7I2hDM1bd135h6y
         Gs7eT8/YjFI/aE6HlGoDtL8aAY2Xa6eCb/AYpcdmJX4t9xTFIzCiMjI6SflJ8/ZsWfq8
         FpRGjivgYOJJBG4pbg7O6fKSqZLXYOVldQKMyei8dWNWn79AryYsCJTCO+7qx2112uxH
         s393MjDUGxgK+LhE3wp3xnHxYNJPhL+8jW/EHfVe192PNuVMp/vFUHS3UYYOleY++PBR
         9ISB7Ft4U8qi2Jrz2nhz9gDbfM8lCxQnOINGIXovnxdbarkrxbk3lW/IL3fTJQk8d1SA
         NlLA==
X-Gm-Message-State: AOJu0YxWLvgou8D75/zN/1+FhOkNjkj+XN0ySQl6wxuUflLFqb6PG9lZ
	9SYgWgLg3o3OR1E2Y5fvUE6JxCgZaXCtH9djTru/3mBi6kx3/vFIs/lFWPurMZVgdLhS9P86/N/
	qPrEmaIj7AFISSBxU3uTpNab5I7fw
X-Received: by 2002:a17:906:1cd7:b0:9bf:60f9:9b7c with SMTP id i23-20020a1709061cd700b009bf60f99b7cmr7074759ejh.62.1699997932937;
        Tue, 14 Nov 2023 13:38:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/9iRKgXF6DJ3fn43Xtb+gxWEoFWTgaYWdvlj3Io7rcxIF4OMTWAGkrBbxvkMRlsAxzGi7Qw==
X-Received: by 2002:a17:906:1cd7:b0:9bf:60f9:9b7c with SMTP id i23-20020a1709061cd700b009bf60f99b7cmr7074754ejh.62.1699997932665;
        Tue, 14 Nov 2023 13:38:52 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b? ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id f17-20020a170906085100b009b654751c14sm5992443ejd.47.2023.11.14.13.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 13:38:52 -0800 (PST)
Message-ID: <a5b76425-1fe7-4031-8b88-d163e6e78dc2@redhat.com>
Date: Tue, 14 Nov 2023 22:38:50 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/gsp/r535: Fix a NULL vs error pointer bug
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <me@dakr.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
References: <f71996d9-d1cb-45ea-a4b2-2dfc21312d8c@kili.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f71996d9-d1cb-45ea-a4b2-2dfc21312d8c@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/23 08:40, Dan Carpenter wrote:
> The r535_gsp_cmdq_get() function returns error pointers but this code
> checks for NULL.  Also we need to propagate the error pointer back to
> the callers in r535_gsp_rpc_get().  Returning NULL will lead to a NULL
> pointer dereference.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index e31f9641114b..f8409e2f9fef 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -689,8 +689,8 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
>   	struct nvfw_gsp_rpc *rpc;
>   
>   	rpc = r535_gsp_cmdq_get(gsp, ALIGN(sizeof(*rpc) + argc, sizeof(u64)));
> -	if (!rpc)
> -		return NULL;
> +	if (IS_ERR(rpc))
> +		return ERR_CAST(rpc);
>   
>   	rpc->header_version = 0x03000000;
>   	rpc->signature = ('C' << 24) | ('P' << 16) | ('R' << 8) | 'V';

