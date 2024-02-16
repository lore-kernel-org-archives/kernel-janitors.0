Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF61135A7A
	for <kernel-janitors@vger.kernel.org>; Fri, 16 Feb 2024 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708108089; cv=none; b=IpH6GwH35i+dHsuBPE4Pv8EQH65dhZ+Nr0xPrk23wPGUb8k6Bm/CLWKmBohF9k4zbcMi7izc0fZV9DBHgdlTcC/uyxbCpAfzX384ndWwp5p2+ZTSfP8Y6rYGOLbCY1S1WPAF2EZb60xivGsv7NKJzPeB+C9xnxYjgjETAxtXJGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708108089; c=relaxed/simple;
	bh=JpCJOojqx/HfeVTgc5nG9gyIcDxyi7NBWEmokq6KIOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rl6Qdt6eUKASb7r7tkUcIaxO6emuM+jyEKpO1m9jSOXsKkMVvEwNV3vycM92/0jxnL/KJzVxh6pmp+KKwUZBGAA3b/552Q85KHyXZ88lWYcYDoQCLbheYes7yvSa4PGKkSgvgny8nIae2snS3ESStd1cTi0kbnBMmMa9OZYJkUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JwhJwy5q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JwhJwy5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708108086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04otk5iNZ32itm1hBkllWfSwBWl7wL1ic55X2+oUtF8=;
	b=JwhJwy5qe+xVS8UwmsC5swxdPPnMfzjYbXz7tcoP0AaOYmujgufdlQP0Q3ngauVP6qrofx
	g7S7xBz18BrsdM0yHDB8Fsyg+1qtJouRbJtIWergcXwAxeR34IfUw4bovO75KJBCCl+iAv
	9Gj/Zva6gycutX72Mf9A8QhAzXPSiD8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-c5qGbGsWPeCGEh07XASxlw-1; Fri, 16 Feb 2024 13:28:05 -0500
X-MC-Unique: c5qGbGsWPeCGEh07XASxlw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-511681b1fc4so2240250e87.1
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Feb 2024 10:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708108082; x=1708712882;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04otk5iNZ32itm1hBkllWfSwBWl7wL1ic55X2+oUtF8=;
        b=diSHWZDXWjkr2wYVL1dqnLgkGLxVi7ohIHr4UVsHY3P/eO3v/S2vmkpNEMaBbtIk2g
         IJs+janjWLv8fCfdapZDQBQ80jBvsD+UbfF785u3xljb8CMUTnF1wd1X17AYBi2YC07+
         EaVB874HOS/c5/cItnYqWnIjGHJXDp/guYLeaELe3bJNny1GHvYv24bAkGiMEW+Hn7N9
         hN1AFqgie4p82EW2dPUlzt3W9brX8vF/r0zmRgoDeMsRCxjPKLga1aUtv+ICCn/KWo2z
         EVEZhjW57fJYWs0wOWKtYN8x0zJ9PVMhe0HLYpmNscMkXim5N3YD+hTXfGP+2hw1rQ1S
         qZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3YD6bFzfccVK65545ikFZZqYx28KhFbJcp+EX08bKo95PQlbCS2DqBcgel1cOwqIlUUpeHP5ItLUDJqQvLj8N/EgKU/VN1OtqP+ie2K7J
X-Gm-Message-State: AOJu0Yx5qrvohFnBF+QVqHmQz8s1dvEzC8toOjYr/gyJuvBFu1Iil8ZX
	p4kuLEKDwhsi6VnXlKLttAnhhtoQXcAG3mFh99xtSbn0shXDReSJmE/AlpLH64cPGF9cdNC9JHZ
	Oo/0+kfw/OUR0YrSK2DYXQIJtEqrIRtXrTCJlBFug5krCgp1WVY1izJfF4UjeoceFzQ==
X-Received: by 2002:a05:6512:6d5:b0:512:86fa:a781 with SMTP id u21-20020a05651206d500b0051286faa781mr5126920lff.62.1708108082046;
        Fri, 16 Feb 2024 10:28:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlTdqcYB6gYrq3Gc55U5e1iav+rzbv+UkBZ9iNFp6WAozBF1MgQrgrIw9sAy+0/Uzd7DC4mA==
X-Received: by 2002:a05:6512:6d5:b0:512:86fa:a781 with SMTP id u21-20020a05651206d500b0051286faa781mr5126912lff.62.1708108081675;
        Fri, 16 Feb 2024 10:28:01 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id p27-20020a056402501b00b00562d908daf4sm224163eda.84.2024.02.16.10.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 10:28:01 -0800 (PST)
Message-ID: <6536ebe0-4577-41dd-b3f1-1525b9fe30b7@redhat.com>
Date: Fri, 16 Feb 2024 19:28:00 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/mmu/r535: uninitialized variable in
 r535_bar_new_()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>
References: <dab21df7-4d90-4479-97d8-97e5d228c714@moroto.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <dab21df7-4d90-4479-97d8-97e5d228c714@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/13/24 19:09, Dan Carpenter wrote:
> If gf100_bar_new_() fails then "bar" is not initialized.
> 
> Fixes: 5bf0257136a2 ("drm/nouveau/mmu/r535: initial support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied to drm-misc-fixes, thanks!

> ---
> It looks like this was intended to handle a failure from the "rm" func
> but "rm" can't actually fail so it's easier to write the error handling
> for the code as-is.
> 
>   drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> index 4135690326f4..3a30bea30e36 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> @@ -168,12 +168,11 @@ r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
>   	rm->flush = r535_bar_flush;
>   
>   	ret = gf100_bar_new_(rm, device, type, inst, &bar);
> -	*pbar = bar;
>   	if (ret) {
> -		if (!bar)
> -			kfree(rm);
> +		kfree(rm);
>   		return ret;
>   	}
> +	*pbar = bar;
>   
>   	bar->flushBAR2PhysMode = ioremap(device->func->resource_addr(device, 3), PAGE_SIZE);
>   	if (!bar->flushBAR2PhysMode)

