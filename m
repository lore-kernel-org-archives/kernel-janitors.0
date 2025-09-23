Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28CB322DA1
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 12:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758629997; cv=none; b=JDL20laaYAgXG4NZWJ+dMnlg26cQpsAg6Y9N1m5DJIiVWV9dLA5vKe+QStUnR/GonIQ9TOOMwBZfCJTtBaQ10V9OL5YTigFps01zp2rrgrNLZQcoBsgYjkSG/H6S/B6jzVVUj46sY817qf4CKbTrfzLs0k6C76IfMpm3Oh5N+I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758629997; c=relaxed/simple;
	bh=DL5/MM4QMDxu+y6pVcFung9FsS2xYx7OXCyD3ag7/vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQngG7eNU8cA8x9DYOqXOxkWOMEd8OD/+cQL4RuGGvCpCzXVD1dwD0vswj/CVowTif/H9xSdIbiYMO3d1mIZRmDp2kI3P/5x1mGCro83o77lEfrshxbe1NtjMns6Ik1sP48P2tlYqlnIbxixRhoDmbzXIUOVNCNzQp8MnnUCc9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qPSCy4mV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPSCy4mV"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso3176911f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 05:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758629994; x=1759234794; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sTK3npgW5FQLE4nPFWDBCNYEm3feIUUETDGkLbnmceI=;
        b=qPSCy4mVgUrc5XMvGxFAdeywp3Mz5TFMNGeFc7j4ZKOdxpukJteJ1AFNLQDgg6EUqZ
         Q0E+bWNit9SItr1nKM2vPruTJioq4OJL2XqxiCpDekrkxekEwZUzVi+FjLVErCRCNyoC
         d39zdLBFfJhskeZC6zMiDIrSbZ5dpDD8w+1LM8qG1fX2BPcskeua2FnRUuXnAsAt+itQ
         hAu1atZLae5GuViBhoGd5YeXgRmbGA8Txfx0M5sMr+2r0TQwE4ylMRfSDFYrA0minkq0
         GdmJYacqdVuFspp8EakkZRTyMbVOYXvni3yZdJ8+eU54lFW5xgWy+gsSXN5wmAtYKiSu
         3Krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758629994; x=1759234794;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTK3npgW5FQLE4nPFWDBCNYEm3feIUUETDGkLbnmceI=;
        b=vQCNJ/YU6HU9DTueB/3VxsnJVS3KvnQp/VYgxUxh2AC0LCF4pnmgS1YM4RPZB+9q6L
         pV6ehWD6eV22YngnSEilhTDp4ADM9Dw3iEJBEvFsI5WMUB3l5zTpMbhi3zbTjxerrdwq
         76oImkDlP0TV2w9I1ohpcMf59EEcjrnClfahwrSAoUeLgtDIbaUxNPa0kzMZn/RlSYci
         Hu4kFdvN0q5jz9GIE+7cH7FmqWTPkHvkY16k53PfiC2At9jSm+towLTaatGwJ5vaJ8Q9
         DjDvjUYPXS9EhaG3eNH4z1ybMtn1QzXucd0vafQrNuv5f7jW57nFpH7mKN34GXAcPLYd
         ToTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuQ61zPosnDsasXlAFNN7jcN0lH9VVeZGHauQaEX1IOX/fDCq95Uy+m0WXSuVpwJGYfZigk1Z07bviZUvZyKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoleW8/EjMbqsuFktBkEV9YbujYhUlcKJJslc35KjA2BkRA3LS
	dzyWFgKcaxbZlydAFdFa9Lk25DabW6ZcYiBUJUzkrbKBCO2oqxXl0ALkqj+T6m8wc1E=
X-Gm-Gg: ASbGnctKfhuCK6A3Q2yduVs5jfg1LNHDXGCRHNbbI5q4EHYflxQ7z+lnktzqSJ7upkJ
	OCxEkM45ptPZCtitU8L+RWawYsMkqxuyvMm0Od5UjuNcRDEEKc89q2ZpuXTqSZQFKY79rAdmUnx
	ixYWhHQF65Z7qefjpo6ZeaX6jY5SX/J8QxktkesxplJ/k/9XzbK9dm+HR98nrPoFNospqjyB+oa
	XXtaP0EHjZmT9mj6UcS+UHefQ+GDXel7JgF0m5TSh4UmWrsX3/OJT0DeKaIq1GQJW1g3thUKi4t
	xNAzWJ/Qi21aOe49Quo1F3VPOTwqW+a/LQSwDG4+YJXiNetLX8W5wm0qx7wblXkkrpDtEhncBuL
	LlOmpmBIzC2X+UIVK6rjnyWukCKX+
X-Google-Smtp-Source: AGHT+IHzh4QmoPQ01FP6OX2MtxPxTNk8wndU9qAYqgeeBa3Ms/9nlpcl+WJEjK2427UHhz9Vf1Arow==
X-Received: by 2002:a5d:5f49:0:b0:3ea:80ec:854c with SMTP id ffacd0b85a97d-405c5ccc9fcmr1639265f8f.19.1758629994203;
        Tue, 23 Sep 2025 05:19:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3f61703b206sm13621550f8f.6.2025.09.23.05.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 05:19:53 -0700 (PDT)
Date: Tue, 23 Sep 2025 15:19:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dma-buf: fix reference count leak in
 dma_buf_poll_add_cb()
Message-ID: <aNKQZqWwWu_8WesG@stanley.mountain>
References: <aNKBIcpF6kZRG6Mg@stanley.mountain>
 <7bb48401-ed99-4263-addd-ec1462d68168@amd.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bb48401-ed99-4263-addd-ec1462d68168@amd.com>

On Tue, Sep 23, 2025 at 02:00:28PM +0200, Christian König wrote:
> On 23.09.25 13:14, Dan Carpenter wrote:
> > Call dma_fence_put(fence) if dma_fence_add_callback() fails.
> 
> Well that change is obviously incorrect.
>
> When dma_fence_add_callback() fails we already call dma_fence_put() and drop the reference.
> 
> When the dma_fence_add_callback() call succeeds the callback will drop the reference.
> 
> The problem here is that the return code of dma_fence_add_callback() is an integer error code instead of a bool and basically has the reverse meaning than what people usually expect.
> 

Ah, yes.  You're exactly correct of course.  Sorry about that.

regards,
dan carpenter

