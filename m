Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cVK9pH2C"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01866172E
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 18:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701223754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yaVTVjwPsRLQvhHQX/AWNDhOssIGmmbDVerq5y+xWjc=;
	b=cVK9pH2C8oaOZB0ftmGGxrX/oKtjJGoWr/MxSy00smhpQe1n0hUax04hMjyq7nkptaLYhF
	IRenx8DoTFNzI1ooSG9M0ul8yWckLlXUd57FJFBRpI6gV/h0XgSGF3CjQ/jiwJDIkUqHTL
	3wi2gYh2S5Q/5SwNfMnVf29kik2jR6o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-CeQPACP-PnCqcyMdEzgyaw-1; Tue, 28 Nov 2023 21:09:12 -0500
X-MC-Unique: CeQPACP-PnCqcyMdEzgyaw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-54bc66b3726so473355a12.3
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 18:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701223751; x=1701828551;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaVTVjwPsRLQvhHQX/AWNDhOssIGmmbDVerq5y+xWjc=;
        b=lO48OX05/FXdIt+A3lLpyqjxttwr60Yj1p1T9W2FBys5vinbXs33NZea1Gtz+Iup73
         weulMQnFTdqTyPuKSCkfzWpSLJWNoMv1LM2b97LbkAtNLqz/s7O+tdTaSjuzp69UwDfa
         EJacOglkU/HCj6aNRcXRFUBEDxE0MnCMrlfrtdnF531quBriJ1iCVMzYdywOWdp8vmsr
         ANGw1eBMUbyTyNfcf4WFaQxj9N8qdUaQ//PjQJ9S1C7UZKpgT9DEK0QPJKzd/XIubmcb
         6XWQyW2IAUbSbn2GwkkNDF3woU3b+pNJi+kAdud5AG2oQEuv0ELefgreYrL75WYuGX2B
         tnyw==
X-Gm-Message-State: AOJu0YznVOUDPsF9fmQi4xrlJGB6MtUvQQhHnR0122H3b+gWHdxSqQIP
	TWZ+tCbh+54KidTOxojnu9i/1zgR7goNGPSRRz3GB7YiOs8nX+4jHewlffrBVG3P40RTDRM9KNq
	XdUEVL66sO98eyghDud7bg5pXv9K1
X-Received: by 2002:a50:c014:0:b0:548:5629:81d0 with SMTP id r20-20020a50c014000000b00548562981d0mr10471183edb.42.1701223751276;
        Tue, 28 Nov 2023 18:09:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTXj86sNva9Z5Ps9fdWD2v7xHrgnGPL6vZZMQ7VdHN3+53HEGJpmfV2bjKoyYKGVn9NipKGA==
X-Received: by 2002:a50:c014:0:b0:548:5629:81d0 with SMTP id r20-20020a50c014000000b00548562981d0mr10471168edb.42.1701223751013;
        Tue, 28 Nov 2023 18:09:11 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b? ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id eg36-20020a05640228a400b0054bc5624616sm540233edb.53.2023.11.28.18.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 18:09:10 -0800 (PST)
Message-ID: <0dd7741c-b2f0-4593-b286-de918ffe8955@redhat.com>
Date: Wed, 29 Nov 2023 03:09:09 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/gsp/r535: remove a stray unlock in
 r535_gsp_rpc_send()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>
References: <a0293812-c05d-45f0-a535-3f24fe582c02@moroto.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <a0293812-c05d-45f0-a535-3f24fe582c02@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/23 13:56, Dan Carpenter wrote:
> This unlock doesn't belong here and it leads to a double unlock in
> the caller, r535_gsp_rpc_push().
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Good catch - applied to drm-misc-fixes.

- Danilo

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index dc44f5c7833f..818e5c73b7a6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -365,10 +365,8 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
>   	}
>   
>   	ret = r535_gsp_cmdq_push(gsp, rpc);
> -	if (ret) {
> -		mutex_unlock(&gsp->cmdq.mutex);
> +	if (ret)
>   		return ERR_PTR(ret);
> -	}
>   
>   	if (wait) {
>   		msg = r535_gsp_msg_recv(gsp, fn, repc);

