Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8ED1B3938
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Jan 2025 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329294; cv=none; b=Yr6tZr89M+swfjNdXH6GqEIW6C4z/G19n3doZ0ovi6++bzM4nq9cKe5VpyKC9oqJ5cTyrXhDuHy61PQSzVGRYcQfGZxqisRgVmfVcm9pQotnIiH/wLyKP6F5Nc6ozcnZdnEhUslogYn2AGeUtaB09VJq0TGvLdQmf5q+7alAw/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329294; c=relaxed/simple;
	bh=PHtGowL/XAuxW5yOf8yS9NWR7H/GWen38IWBTnsqDu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ernS79G4YX9Xql9eyfefYjva8ASbPpVAnskJ6dBnw+vstnBIUhQcjoTzF6zB+DDdp4EuuO943ftjci3K8O6KrIZBlGo0t3MOB5bG3sU4Fn0qXQ5iG9dCTVXUMTuJLy51kCKWVXEigXFCOA4BIevef6bYmvDZfq8thgrl1EPmwF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iAfNrEkg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iAfNrEkg"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso163890245e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2025 01:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736329291; x=1736934091; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g54O8YkwZGrgLT3edof7A4TrnCHNhhKENcG6SumtW14=;
        b=iAfNrEkgQBTPCdnbaAl3ZpwuFrcgUDBFO+Up7vPyBY4KOASigzFIxEJIt8kn5Mpc7J
         6hj3z+1UXhqDn9kmuYdz7sj42rJSZhLGoO3gDk1Aw0AVJXGl8s82EzgYL8Xl1WVSX4Cg
         LVsjy7+MbecgbVHdrDb+bjt+eA5w2D0aaWy9/hqKa94Sk+CLzF13Mk7bSOMXoYTaqxXY
         siKjM6g2oQqVmKTEiehcDP4+ASECQQy1PXdQacpgErdgGYLqGUoNA02SPSIcEOOXfAqw
         5wMT+s4+cP0HyNe2HJIESqt8cFY9iAGPNVefEglCGc8+zT6pfs66JODoQ2u1Uen1ul5H
         fsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329291; x=1736934091;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g54O8YkwZGrgLT3edof7A4TrnCHNhhKENcG6SumtW14=;
        b=eepYhy0ug0Qzrm7af3KRdyuBiM5juxn2QfxaJigJ2xU98QxAcsj11FSICP1G4JpieL
         gTmZvD6732Juow9ezgd8P9LqDhF8kskl2VXvaIudAcmc1hBwgilWCYIvHbJJ+YGR6vil
         aSuV419TV4+cvIQ84+oX1zK7w47vha5F/x9PPwBlXIpukmIPe0Cb1CUrMLWwPqe//a+u
         6Ugpwc+eFC0EjuLbd/GRbvGtlOzun9BU6pdHFAaI4sFNb2YEyCtkJroz46t4XJ3uVpTH
         OAotD4abLiC5GL2/Co4MUsIA7EvdzIZPj+iJ1raG1d7Ne63S2uyPlbmz8KxRHCgOymaZ
         5BrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVirv4XWX/HWe2JprhqKmSruXib1zX71lUNAYYsaHLxChX3QysrsmEmS16LP9QVdAOICjsYcuD/pLsONBqsBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT0TWazXVkrfyjk42BwZZV2PhQtY7c9M6gPB7p5HkMzW/v8UeG
	N4BesnUjC1cx+8Rg6lPAxe7F0AkU41mQLGGR6oGQoZPtqpzDu3T7s4ogaQD/84g=
X-Gm-Gg: ASbGncu9nuzvm7vICQdOjK6S2Q5wbTzlHAOuNbi4pdH4KcubiCaKeBWsTTWDVqea5hk
	UOZTuOD6cci4xUbtizG6MCr2KIZBz4uVY0Jz3Cm5kR4ZEVI8LjA6MHUZVcavVUruO0zkkTHOiEE
	AU3ZBk6/UK6Cpu+EB38u2Ul5UF1vkbpNxt75Ixd1k/66V+PlLkjUz020/6lIC5AneOH3GDEt6k8
	uweFomZqh/cC4fWt0upLBYgtkfjOgIXb+xYB6o7CcEmhHaGzLktV83a9MoXug==
X-Google-Smtp-Source: AGHT+IHkhtjxU/+Fjus/E3cnU1FkrZVIFQ90dsX1DLhvXda8HEgNw6w3TvBh5/m1vuuiaw6SkOOZIQ==
X-Received: by 2002:a05:6000:490e:b0:385:ef39:6cf7 with SMTP id ffacd0b85a97d-38a872ec3c7mr1392758f8f.32.1736329291503;
        Wed, 08 Jan 2025 01:41:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2c27b54sm14879005e9.0.2025.01.08.01.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:41:31 -0800 (PST)
Date: Wed, 8 Jan 2025 12:41:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Tim Huang <tim.huang@amd.com>,
	"Jesse.zhang@amd.com" <Jesse.zhang@amd.com>,
	Likun Gao <Likun.Gao@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yang Wang <kevinyang.wang@amd.com>, Le Ma <le.ma@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix shift type in
 amdgpu_debugfs_sdma_sched_mask_set()
Message-ID: <d39a9325-87a4-4543-b6ec-1c61fca3a6fc@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "mask" and "val" variables are type u64.  The problem is that the
BIT() macros are type unsigned long which is just 32 bits on 32bit
systems.

It's unlikely that people will be using this driver on 32bit kernels
and even if they did we only use the lower AMDGPU_MAX_SDMA_INSTANCES (16)
bits.  So this bug does not affect anything in real life.

Still, for correctness sake, u64 bit masks should use BIT_ULL().

Fixes: d2e3961ae371 ("drm/amdgpu: add amdgpu_sdma_sched_mask debugfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 632295bf3875..174badca27e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -362,13 +362,13 @@ static int amdgpu_debugfs_sdma_sched_mask_set(void *data, u64 val)
 	if (!adev)
 		return -ENODEV;
 
-	mask = (1 << adev->sdma.num_instances) - 1;
+	mask = BIT_ULL(adev->sdma.num_instances) - 1;
 	if ((val & mask) == 0)
 		return -EINVAL;
 
 	for (i = 0; i < adev->sdma.num_instances; ++i) {
 		ring = &adev->sdma.instance[i].ring;
-		if (val & (1 << i))
+		if (val & BIT_ULL(i))
 			ring->sched.ready = true;
 		else
 			ring->sched.ready = false;
-- 
2.45.2

