Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A61EDA12
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302298; cv=none; b=n/OTridR1rSJ9rhnnGLyeRPRdQ259Uv2E9RaBIjRIfwFTdYE6jauTorciHpTyzkhILFPGulzondiiI4uojl5ExoGulvqEdlSrRlUlpOP1/uYblUg+dN9gLleYFN7itbrTSUKMYB/M6NBkyLzDlAKVGmsZtzwpGWvVqLSImbgKS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302298; c=relaxed/simple;
	bh=YJTvIbv6TimfXHhRtMtDx5p4XNNBf7yuwVHAIAtVIYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qy9vIIf94A9UL/oze6pQUTnGAGWawys0jBxyPLXmvL8INmS6eqAR4+8lTaXRJ3AhJaHpp9ej8PN2038O+H0g5s7/0c90yXS8Bl1BCBD2hhJj62+G5OFSJQHK2pdFQYIPOW+KxrFfRoy9emXgEfHsO6WxSK2WG5GwFk3kMtO2gTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zSVEyjww; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zSVEyjww"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-399749152b4so493953f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302294; x=1744907094; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Q0HEw3hrYVGi9s56H8x5ezvg01Afiad6GaTNJBgE4g=;
        b=zSVEyjwwmvS6f1YtRtG4WkfrWjba0G7qKq9Lp/TXt6oTCV+7SKNHRWknSrQCi4ETgt
         UDP8CF0xiv97v9E+ECNAM4hkz7pIhlyiLzFjJzHHghqzj7IY7PAER62p78B+ttI2J9gP
         +rW3gYagpkysNUs98ionJ4z1lT47+ZIndXgFTePGerCUL5dhU+IR60OGwsmzauA0KDKv
         F/pEv5UQE5NiM2F25zgEzB48P33FNC/ByJkr80h6HzDxpxKnkK1JXbaOV6BKX87AvfBH
         1lqKzuGOXF8hTiKnTQz+ak3DsWLClELuDZ1na6Jq1uMtVoRLyZAyOFS1GULPlFzzpWF6
         1jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302294; x=1744907094;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q0HEw3hrYVGi9s56H8x5ezvg01Afiad6GaTNJBgE4g=;
        b=PUKaSQ0j9JS7CCKu8BPhfO7YjlxjN2Cz9azho1Eg1e5BdT5mzxSYVshu4h/6bGRnXI
         bde8tQSnG7KMUdtfWr+xc85+vLmxLPpxKfT+JA1pBjOX91E0XGiWGTxOk5y8Xji4FwtJ
         2T+T0hKDNw619QJr2aKW0ELAOceQf+gE1u4nSAXPnfBj8yeHS0g0cssQEggco93bV3RK
         GIfTrPU2bFjFXLxeMoJNAlSI7Qf2/affX2CvH5y/yvyOMiwzBa8EGL92mxlOwQUfCQ0k
         hSeO+L+Phx0lhjjspKzC6ZDxmqH+SNshY/C0OIoZ2hqOiQXoG1OSNiChGvVX3UsQZXlc
         66yA==
X-Forwarded-Encrypted: i=1; AJvYcCX8u0eRmW57pD9aautUw/gFu1ABtR0L5opDW2Yp+DJHu5bojR0qwjuLDeMTpQOJmRgwspDPAtsB8n7NpAQ+N4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvnwCEfyfbAl7gbFM6Hz83cbJJNwPon/SePe9M/Ocj1XKmxVQ0
	PT2MaiToKzSVVz3t3pCx18vjmFr89tcL3puWmOdm0NB6uIpX3CvmFnZINHp2enk=
X-Gm-Gg: ASbGnctBevJX4HDLboirRVHjJNGCHCxKNeoDDJeieC+mvKyf9zU0cF9/n5lHFtI9yxj
	Q9wdWTPOXzA/n/T/wK9PeYNX36iz6X8UadoIlFfCnnBGPBJTLbcHA9fho2aI6BGh2PR/4A/nkJL
	VkcXpphfamG4ztOPpx+lNkqXyIN571T6u2N7dkIG3XgtXhluLT6T+QbbWrwYGbkbNm3o6m6VeRo
	Q65uB1n9+XvDp47E9OUa/Bii9GxocfgY1lqpRsfi1r3ax9I8UQGkSPSIJL+zMSStK9iG5ouuOZm
	C5gv7I750TS1/Fr2KV+0mvDEAcBvpN8go0m0Qa58lfh3Rw==
X-Google-Smtp-Source: AGHT+IE5gbRW9QyJ582gnS5/K6En7dv4OcdtzrH6WqFi8GhS+S5YHvq23DQaLTjIP0Syy2HVbmP5YA==
X-Received: by 2002:a05:6000:1785:b0:39c:dfa:e1bb with SMTP id ffacd0b85a97d-39d8f4dcf9amr2828748f8f.42.1744302293770;
        Thu, 10 Apr 2025 09:24:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d89402a08sm5153257f8f.100.2025.04.10.09.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:24:53 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:24:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix double free in
 amdgpu_userq_fence_driver_alloc()
Message-ID: <5ff4d367-b5bd-40ae-9529-56d08ea6c1d0@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The goto frees "fence_drv" so this is a double free bug.  There is no
need to call amdgpu_seq64_free(adev, fence_drv->va) since the seq64
allocation failed so change the goto to goto free_fence_drv.  Also
propagate the error code from amdgpu_seq64_alloc() instead of hard coding
it to -ENOMEM.

Fixes: e7cf21fbb277 ("drm/amdgpu: Few optimization and fixes for userq fence driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index a4953d668972..b012fece91e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -84,11 +84,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
 	/* Acquire seq64 memory */
 	r = amdgpu_seq64_alloc(adev, &fence_drv->va, &fence_drv->gpu_addr,
 			       &fence_drv->cpu_addr);
-	if (r) {
-		kfree(fence_drv);
-		r = -ENOMEM;
-		goto free_seq64;
-	}
+	if (r)
+		goto free_fence_drv;
 
 	memset(fence_drv->cpu_addr, 0, sizeof(u64));
 
-- 
2.47.2

