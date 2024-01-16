Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C2613AC3
	for <kernel-janitors@vger.kernel.org>; Tue, 16 Jan 2024 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JSHuHUi1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e586a62f7so75872385e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Jan 2024 04:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705408292; x=1706013092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT+z5kO7NZ0JfHwGBIqmnXCQBjLsapUuYK3PYHhWBbs=;
        b=JSHuHUi1WRIxLVeXXtfdfW/Hxah71RjDE67142Ymip/DuBVC2LdPS9CTDqEKLcvV9m
         awSkL4pqcv+XVP2O90ASIaIn2VaceBsfKok9bdon4bAiCPU1oZ60V0BZnigqHN7V58tD
         QRR4L0mHiO3K7z20UF7CUgBlOyLiqWUIH/v+SmjKVycClpf4N3BGAxw80EZiB3WRQ1ZV
         /Lf8CQDeWytc57np3dQGDQeOZezbV8+ihTwYpr3t5wOlMiauXl+cROD6IbqChJp8SMMN
         XpQ75YfGMx1jBgob0h1V7Mnk6VCtKAkln0dtk5CHXwRIDUybFkDcZkCEc31dJhisStmx
         ObbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705408292; x=1706013092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZT+z5kO7NZ0JfHwGBIqmnXCQBjLsapUuYK3PYHhWBbs=;
        b=igRjPnrWGcDLJvxCQZwN23yh/KYjoITwJ7woKPMT6BClDLQb3FkYcmjjJdW8+OpMQS
         HJOmdyjFM3lZWeufBFmQGqjQ1gNesCH3XEcKeMeH8996HpHwC0mTLBp53Tzw5ghb9Hpn
         OAtO2n1okRqbur5yYOkXkdjeRjNs1u/1HHfOfH0MvXfBo2DbJoaWXcsjVSg/TOns12yn
         EHNKRcShdIVah6uCYb8d4Bfujwi+GOQ1eMvjQE5ibvRuzl34q09x+BJEmdvOaPXuNN+1
         UgHU7gIUWs89MCPTgpYwo7j6XpWWvAwhqZcyLmvunLpcdy+QMuoY1B4BLFBHQxWZ6Pav
         JPwA==
X-Gm-Message-State: AOJu0YyTi3k8BUBZ3XYy7r6pne42b7XFYB5EO/md3U4eWYwttVapEXG3
	0SEHmxHPEvMh79Cu/6OsYwrgGoaXXhzfdg==
X-Google-Smtp-Source: AGHT+IEE+TByEl7XVOYopKpmNFuQHPmwYwCI1LrdzsQYzrF0eXV1Q8x8cWXCEoLTXlRQR5WPDNP8Hw==
X-Received: by 2002:a1c:740b:0:b0:40d:8815:afff with SMTP id p11-20020a1c740b000000b0040d8815afffmr3913595wmc.39.1705408291854;
        Tue, 16 Jan 2024 04:31:31 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id d15-20020adf9c8f000000b00336c43b366fsm14493657wre.12.2024.01.16.04.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 04:31:31 -0800 (PST)
Date: Tue, 16 Jan 2024 15:31:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau/fifo/gk104: remove redundant variable
 ret
Message-ID: <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
References: <20240116111609.2258675-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116111609.2258675-1-colin.i.king@gmail.com>

On Tue, Jan 16, 2024 at 11:16:09AM +0000, Colin Ian King wrote:
> The variable ret is being assigned a value but it isn't being
> read afterwards. The assignment is redundant and so ret can be
> removed.
> 
> Cleans up clang scan build warning:
> warning: Although the value stored to 'ret' is used in the enclosing
> expression, the value is never actually read from 'ret'
> [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvif/fifo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
> index a463289962b2..e96de14ce87e 100644
> --- a/drivers/gpu/drm/nouveau/nvif/fifo.c
> +++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
> @@ -73,9 +73,9 @@ u64
>  nvif_fifo_runlist(struct nvif_device *device, u64 engine)
>  {
>  	u64 runm = 0;
> -	int ret, i;
> +	int i;
>  
> -	if ((ret = nvif_fifo_runlists(device)))
> +	if (nvif_fifo_runlists(device))
>  		return runm;

Could we return a literal zero here?  Otherwise, I'm surprised this
doesn't trigger a static checker warning.

regards,
dan carpenter

