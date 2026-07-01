Received: from mail-oo1-f97.google.com (mail-oo1-f97.google.com [209.85.161.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735C352022
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Jul 2026 18:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782931160; cv=none; b=B/KAAajgcshVT/4RTnICsOhBg/eqobbGFFQ1vlxJ/bM3O7hWlurzn0rjyRZdR7KGfAVGSYYyeNBejFMWKNON2fkNRhXkB6IHPfieNR3u6lpZwJf/qDIuSizo7fMdnBa4DF0hxCgPuNBqFtG3ZlMX549rirgbld0NGhW6gbzLj2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782931160; c=relaxed/simple;
	bh=Umva64T0GNMd81yvWTwLoVqmHq79H/NFxEmArtYx5qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRU5rSwxGrWHN+xuJSdPDkxdjdk+GxsfgsgbB3sEH1wCjydQgZjjURfaz7BsfLVPun9L2yoEu6LjxjdZTa9phFpCqlvh//vkqr1m6Pa28qDbyc0tv8ihjA/fv52wiwl/0d0pprGOnNE7YWJy4toV1o/v9xviZjiuT7jaH/L+USs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=agDxFpPo; arc=none smtp.client-ip=209.85.161.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="agDxFpPo"
Received: by mail-oo1-f97.google.com with SMTP id 006d021491bc7-6a183eb9689so607171eaf.1
        for <kernel-janitors@vger.kernel.org>; Wed, 01 Jul 2026 11:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782931158; x=1783535958;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/JxzyIbMWOBgcLE6PUDXiCIrbfQPnTTq4sO8ZawTQs=;
        b=RncwhNhWAPjZ2zUxsCkR8AJwhLhSKS25pKYWz/C5I7sYO711hLgB7bcMSFzufKTmmA
         +x5/0O6qQOHoDl7l2NCurtBJf7ZUvy0WhTnAOprRMZZRIu70DAoQeMwmRsOwtB7MZbzA
         RmSXKnOzc2rDzOVGsS78/4K6ZD6LjhCWEkuB3wnbpspIX7lk56YhGnuBBy+vPSEtu3Hh
         HVjM6LDkwShZ06o1xA44AfnO4i4q3FF7VFfMLj8JhG7zkQ6HovbgOwy4UrZhJqnBS2Lz
         nrm7+uKYwwjJX8M6BvO0k400J1YM9yAEFtRioddPcPdzHTpkD1Y6j9eFAbc7JANjNHD5
         9wWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GRzZ0hb2rWjK6K3NnDTBem23mcQKIKU5+8pdhAyhZsT0WKKPvYdnSEZMGyEi3+Fi3iWnhxvaretOcsqmRzL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3JoogXomJLQX/NhF+v9ToqGJsbI5mDybjeqtUSRjNw3hh2PHq
	URhMyamyAFIyELTTw8gggHpQMFKSMgmUqK2KQXHOI97Px/vCZ5CjtIUwc4rrRMZUT5lQFgJl8H2
	CbUg4bkr6b18fRcWz0fteQQfcYH/JK3C4KyRnyPwc2vqR3vpTACeUruF7lMwg9gGEcJxHr7gZTy
	Xr3/GfsmPFwZm39jpWD6iaiRSpIwMbIZKkr8hLm7I2MeM4P3yM4AC+OV/S5wXPUDI7lxFxwQbZi
	mq/h/6bIARpi/w+S8z94HGcXqJq
X-Gm-Gg: AfdE7cmFxo9tA2Dz/EG9FsDwNujW26JKRRTHm/s3DFEbYMFH+TfLSnRJtmd2O1oQinS
	0RHfrzYs9j48jr99SkKWdIMxx/u9uQKfblRbLdy8NeYUh68FfFYjwad1Lg1kkH+xtAk+tSY+C1S
	X10pTYvjZmodvcXfTmrvLQ6X1vL6sJhTF841bO9p0wrn6uvuM73+XS/A1wclvwyBOvwBD3ndqM/
	08Dxa8DLyuy1TMzN6Z9C2LMDs0H7xYR/YGnlOjKa9Rn2bMytsvn9F89ATgE+5VsG0tK8acNppHr
	YrODxm6lkAWJ2zhSWx+vZGegw0Q74ztZ46A5f4x8K+jRZh3Kk4yQEdKi4ZpjhP1CPN3SmuUpWdO
	gWGNAmWSx1KWc5cJ3PJni1TpRhKfT9kKrNDfv0xEurgjNtBBNeUYafh34KaoVR5XanjkA7xcs6c
	5RBE5MVG8KFgwytlybnKAw8WuHyrcD3BOMgpKEg2T2VT4nSrs4t1I=
X-Received: by 2002:a05:6820:138e:b0:6a1:3d69:1a67 with SMTP id 006d021491bc7-6a30d8a81c3mr1214232eaf.33.1782931157934;
        Wed, 01 Jul 2026 11:39:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-77.dlp.protect.broadcom.com. [144.49.247.77])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7eb5446ea32sm62391a34.7.2026.07.01.11.39.17
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jul 2026 11:39:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48a4c610ebdso1285386b6e.0
        for <kernel-janitors@vger.kernel.org>; Wed, 01 Jul 2026 11:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782931157; x=1783535957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/JxzyIbMWOBgcLE6PUDXiCIrbfQPnTTq4sO8ZawTQs=;
        b=agDxFpPoCxj5nFAOnsrIU8kJK/zWvEwAydS9XBynwMqTpdmQ8OH54S/Q5iZ7fl4s2n
         pyhMqQqZaOiqlhuUpKv2C/DjhnW4vR4m4C9Uym5LWijAUuxV1EasSrts6NTQ8zhLFmmB
         TZ9RSvjJrqQ6SQnpE3FEu0yQvoNy1IU9DkgkU=
X-Forwarded-Encrypted: i=1; AFNElJ9qBIdWCvf5+qZLahfsskGjmVZECDnUp5DKp2d+vWCiYhLOv4/f9Ri86VeERzEzNWRTPXYUTSLNyhyqjkLMtzs=@vger.kernel.org
X-Received: by 2002:a05:6808:190c:b0:48c:4c00:596a with SMTP id 5614622812f47-4962d70ee64mr1114558b6e.5.1782931157026;
        Wed, 01 Jul 2026 11:39:17 -0700 (PDT)
X-Received: by 2002:a05:6808:190c:b0:48c:4c00:596a with SMTP id 5614622812f47-4962d70ee64mr1114533b6e.5.1782931156582;
        Wed, 01 Jul 2026 11:39:16 -0700 (PDT)
Received: from [10.211.247.235] ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-49606ad4774sm1995857b6e.9.2026.07.01.11.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 11:39:16 -0700 (PDT)
Message-ID: <11cd2e26-1af5-4085-a589-060b96a51076@broadcom.com>
Date: Wed, 1 Jul 2026 11:43:34 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Fix NULL vs error pointer bug in
 vmw_prime_import_sg_table()
To: Dan Carpenter <error27@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Martin Krastev <martin.krastev@broadcom.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <akIR3WlKLCiCTb5T@stanley.mountain>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <akIR3WlKLCiCTb5T@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 6/28/26 11:34 PM, Dan Carpenter wrote:
> The vmw_prime_import_sg_table() function is expected to return error
> pointers on error and not NULL.  Otherwise it leads to a NULL dereference
> in the caller drm_gem_prime_import_dev().
> 
> Change the NULL to ERR_PTR(-ENOMEM).
> 
> Fixes: b32233acceff ("drm/vmwgfx: Fix prime import/export")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index 39f8c46550c2..f25db04f8777 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -184,7 +184,7 @@ struct drm_gem_object *vmw_prime_import_sg_table(struct drm_device *dev,
>  {
>  	int ret;
>  	struct vmw_private *dev_priv = vmw_priv(dev);
> -	struct drm_gem_object *gem = NULL;
> +	struct drm_gem_object *gem = ERR_PTR(-ENOMEM);
>  	struct vmw_bo *vbo;
>  	struct vmw_bo_params params = {
>  		.domain = (dev_priv->has_mob) ? VMW_BO_DOMAIN_SYS : VMW_BO_DOMAIN_VRAM,

LGTM!

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
