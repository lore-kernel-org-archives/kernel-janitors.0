Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81089189BB3
	for <kernel-janitors@vger.kernel.org>; Thu, 24 Oct 2024 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757844; cv=none; b=rKTOI9bOX11Mj9KCqWpv4Vbxh85+sQDt8t/6ViXTEukqrf59efH1kHWKWo4mRkl/WS0NvG/Sbwum2j3p1EMIJUzXGsD1QXgyVsaJnUG/1/sWE/KS/uI8gmKfOhD34RAIsR0WXx6g9Mx+SlVR2ZU4W+etXplBGGaEXYN5oxpuAAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757844; c=relaxed/simple;
	bh=R6bJSEFFmu/uIzX2M9bF7eXP28TQFP48lZa93VPK7mE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IwB+NdyRvPB1AB81x7Rpw2UBVzbPjpxXewrBk+SkwjKGH/p8ZnPF98EoGDI+fR0i8g1n744j9on/B2Hq+mZIPs4zEzTcgAe79X9b7mad6lmGM0gyiuzji4f7yTWQMp4LYyzG4zXUvpHNMDJSbn/eAO6BzfbJ3/91akR3vWZn59E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMf7ouO4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMf7ouO4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so6172265e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Oct 2024 01:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729757841; x=1730362641; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmI8CZ4fHAq0Xmul0DkZ8lYpCWQ/gTUaITTUgzA92+U=;
        b=zMf7ouO4dJAi1DgkDVKpup3y81eRuQmcURhu3hETZJ/Fy4CODYezlHkoJv5PE8YoSK
         bMXOI9BhTNPAfm6KDeftpgD8dXCyORD2LBOlA58eHZ9EsXOFUtAtWLYwolGwMNDezt4S
         mTKlr9IyL31u2RUhxAdGxwFDUStp4CKgVF7zqOdN6sfNsUSGakpzxm7Ye+bWNyfyrMIZ
         kAUKO3ClgSh5zvaqEg9V6KRltbuHMstw4cMSTiqNS28slpRgFkFhoOYPAge8SKyBU06h
         fWEmYGM7jSlOoT8oUoJ6+t9rFF103LoKgDqhfZUSEw6u9WledSSgrQDJhw+tDy/jXx4E
         izlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729757841; x=1730362641;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmI8CZ4fHAq0Xmul0DkZ8lYpCWQ/gTUaITTUgzA92+U=;
        b=lIZ4DYacni1tLssrhvsPXdCDv8urYHyD7kobdSoc0biAh3dNMn15Jw02kzhDd/cA0+
         pjhlu5m2psgkdYfdr/nVBeAjj0zI3Bfk0QbP5TnXkgue0QyZlLORSfqEc206FRWDpUfS
         oKHH17/yldd/zKta4nv4viO4onj4rd3X5QHxeV5T8kzbFgm/ScdI5j10tW1DxLgTwPDx
         /zwdag2yc+mDsRFJEMC2hOl9nzJJkbvtihjzKj9+0hSTI9SkqlvJUHJ8B71Q8swe+fx9
         KWgnfEeCSEXoo9DGrwsLrCVDjxQUT3mg2kF9+7YCwNMWWEmFOnOHMUeKOubcViJ60X+I
         MDMA==
X-Forwarded-Encrypted: i=1; AJvYcCXcJ7suBxUFmQpOcXiHq9PnQR6Nx8FDlZ32Sp/CgVO9NsS4bh0Ux6ODB4dxR/laAkAoFQ2vGlniJ6kBQsLpRTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLNFs9Opy/M5eCedqQ8C9hCAZhKkSzmMmzIYgzOcdu6qXYUoQL
	/oVyOYEkGdIxJLIiQ0AS0SG7lIHK0JK7JypayeQjYlFzSPiWNQWzTBVyuDpFCz8=
X-Google-Smtp-Source: AGHT+IE3Nx3OTYwJ2zj5wQUJ52gt4WAcF+S2WAkAz8S9e4+HmoQbErAeCCyoj3cZNQaSJWvWbko8rg==
X-Received: by 2002:a05:600c:1c11:b0:42c:a574:6360 with SMTP id 5b1f17b1804b1-431841aff4emr45292785e9.29.1729757840836;
        Thu, 24 Oct 2024 01:17:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c0f4cbsm38315275e9.38.2024.10.24.01.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:17:20 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:17:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Ma Jun <Jun.Ma2@amd.com>, Victor Lu <victorchengchi.lu@amd.com>,
	Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix amdgpu_ip_block_hw_fini()
Message-ID: <f4fc849e-4e76-4448-8657-caa4c69910b0@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This NULL check is reversed so the function doesn't work.

Fixes: dad01f93f432 ("drm/amdgpu: validate hw_fini before function call")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 91c1f2188498..f12fab13386a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3309,7 +3309,7 @@ static void amdgpu_ip_block_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
 
-	if (ip_block->version->funcs->hw_fini) {
+	if (!ip_block->version->funcs->hw_fini) {
 		DRM_ERROR("hw_fini of IP block <%s> not defined\n",
 			  ip_block->version->funcs->name);
 	} else {
-- 
2.45.2

