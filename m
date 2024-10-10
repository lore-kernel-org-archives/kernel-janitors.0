Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5929C1D31B2
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 18:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728585344; cv=none; b=EC38/lSo+0xsUV3qLtqu5n7dRw+CsppfVeKKzPzuijtR7JQ+e1+2VSBPjwIylGWpCVymoVgLvsy/9nD8jAAyQcF7L4TN7bqV/31gYdQ6uvtg3QIqs65VuX7V0eG9TeoFUgi5A6qNO1VGBmI+aNybVa2TbsTB33PEt5EbmYciNog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728585344; c=relaxed/simple;
	bh=Qg0cyUVyy1O4wW+CdehmC7fuPIH0q34vLfKIH8t65f4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fj8g8TAfx74mv7k2bWSafiMWJY255Hah4YLbQCKldTdom4ydzp2BUXnbjKYl9+RtQVTHR2ve/kqe64lFRITH2WF6LybxUN60k4gZghLokvJx7sY8Flk4J49WYbZyjn8Kh9Q4J5ctW4tY+0yIkaTm3itvmoOw5EQeu3SUITtmER0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v48goLmr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v48goLmr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4305724c12eso9311515e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 11:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728585341; x=1729190141; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iy+C4p8CaCgRadOFK5HsELQcw6dO91MMQyaigcmnelk=;
        b=v48goLmrRGH14F3dYLjYrvUFJ+OyOPVxCx/h2OIsgwC2dwwUo8B/rPYQKS6l01BxVC
         1F8aQOKh3qZLtFpm7TF8k3KgnMELajOuLyMEKgOAEvYHj1txiRFL42MdIvZupot8vAgC
         1dELv+1e8plB14yhSqOQdy6QdJA83/872teLoQgSVrujbfj8rR6dI4k1XyOsicjeKTo1
         muBJlGdBoMtlN9mt9T2jeC2oqRM4XTmhPKJETGkLw+5GxeRWn5aktRCpM9uWvOtrKVJt
         avu/hQX1m34Q3RiB21eJ29ODkbeVByXr9V9yJ77aMCbXTacq99VqUUL2ka/Ew+UUQ977
         82sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728585341; x=1729190141;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iy+C4p8CaCgRadOFK5HsELQcw6dO91MMQyaigcmnelk=;
        b=DN23fEsFUUlI7Igc/dtWtASqOqW4WbjJ6bmwvlLjKdu6a5KGKeQYdbNrb+1PVOlsxP
         QQ015pp3nHaYl/LhV3Uko0Gq+8NQS11BY2xpO2TCrlfRS3C3TKN+ys8VXsX2L1RPjAoH
         X9nKvZQoICSgxJvc7GLkqzGSsioZq76JJD67lVLrbMEjL5fNR78aiIpTjD75L/flsSNL
         mT8ZyR/oPE2+lgcv9uZmyraDnTr+wHABJokaUOb7jVcxGFhzEcjiT0BgBbP1SXPbWxsE
         CMjYGyd3TU0lSdmONLrA/3AM24gstOHaKkuY+0nG2eJrf1aJHzyIF3T+IChNLUw7M6vx
         y9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVkeq0W30Ep0w1To5gmZVagRjcnKyioz23oYTp7ZDVCUQadDEERFUnbxvtWMKtqQglSDkn4pah/jUXIyfCwUag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4bbhO3iWWMuOb4Q2nD0UjSMQZdCEbnRgvruJrStOXtdzcoS+8
	R/jSUZzbi+wVHvVjYcuGTRB3DJeRHVn3Ai8OeplaAT/xQFn2xPalvJArh9TdulU=
X-Google-Smtp-Source: AGHT+IEG5XeqWq0+eyA+3/83jP6vMylO+zmJtnB5SbNtZ56GnxMRoNYSys5K69hCWruqjJKATBUPqg==
X-Received: by 2002:a05:600c:3b9b:b0:430:5846:7582 with SMTP id 5b1f17b1804b1-430ccf1b335mr57690205e9.7.1728585340737;
        Thu, 10 Oct 2024 11:35:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43118305ab8sm22967065e9.21.2024.10.10.11.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:35:40 -0700 (PDT)
Date: Thu, 10 Oct 2024 21:35:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Yunxiang Li <Yunxiang.Li@amd.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix off by one in
 current_memory_partition_show()
Message-ID: <f3cf409f-2b04-444f-88f0-9b4cfe290667@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The >= ARRAY_SIZE() should be > ARRAY_SIZE() to prevent an out of
bounds read.

Fixes: 012be6f22c01 ("drm/amdgpu: Add sysfs interfaces for NPS mode")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index ddf716d27f3a..75c9291ac3eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -1199,7 +1199,7 @@ static ssize_t current_memory_partition_show(
 	enum amdgpu_memory_partition mode;
 
 	mode = adev->gmc.gmc_funcs->query_mem_partition_mode(adev);
-	if ((mode > ARRAY_SIZE(nps_desc)) ||
+	if ((mode >= ARRAY_SIZE(nps_desc)) ||
 	    (BIT(mode) & AMDGPU_ALL_NPS_MASK) != BIT(mode))
 		return sysfs_emit(buf, "UNKNOWN\n");
 
-- 
2.45.2

