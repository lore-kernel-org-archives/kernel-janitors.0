Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E26319D074
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 11:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130982; cv=none; b=oIdHiczYP84ftaaUE+toJGFM3JwiZcvl8IWmk/kxxCbsDAMCAwOoxmBoP7mEPomzpBondftdpKHshMqHm6GcO3Ode+ixa90X/KXHoA0dquXIZcpgE0ateOoEqc0dHGkKQxPqI4rRXsrG3lOYqCsgsF+uTr9iH0n6iYW+6Fu0H/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130982; c=relaxed/simple;
	bh=4+w7XkrS1+QRdCahEtOYBcgFXdxrPu2UNwNYO31Dthc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1yZIcl6xTsXpn55WXZZeP/aKHswrPn2LEysMpTlPR4v/+8htB1co7R+wakHSq++SKESnSgHTf8j5KxbcnfyH/JOLDTlHwvieOMBZpNyipcjjSbfB2k74VJxQkXeBN39z+VLFWS+Dd586o69otWxozAE/32jldfJ7o0WEyhh00Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ccJHk/a/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ccJHk/a/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso34754455e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761130978; x=1761735778; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9oIpyKZKP65JjkSPCQNgE2Eec7phDpEBv4WlPPRGpA=;
        b=ccJHk/a/OyBWvpylPY+/8NUG5D3LvAJ+cBMwo62fZYxYyQUHXELTs4WWBODtpd9grS
         AaSqpRvibqz5+FPhPZ5drm1cIagWAZRcgnEcgSjunRzgO/cK5djEeC5d0fdAFFhUhg3v
         2WiB6muEl7elx7z+/518NP/LiFO5SbmuzljznyN1LNc3uxjkQennobdcVWYbpzslHYTS
         /MVQMC2efhsWsUIdcAyMV2QGuUKWDkl2B06RupR2e5xBG0JCsMFzHIGvnKfD7bqjRnei
         JwV0u1dG2+dlbIQTbz6DjB/2xi3ZVJimRwKNb+oj8mMNp+Dv9x3vLxwIqAtmFhyXLQVE
         YPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761130978; x=1761735778;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9oIpyKZKP65JjkSPCQNgE2Eec7phDpEBv4WlPPRGpA=;
        b=EaCGwtegVfyvN1pZ/XS6esMPX9qd9DmtaNw0xC+bVnTxf4sBDEbzbPLJ0gqPqzaNsF
         EHvmyixudyaewRS20X9Hb46oDwojVSxX6SCULJhlgWCLzJFy5YjlxqXS54Ud8CME5EMK
         8clKxXld6dejjPJ8gw4XrhBsa35NVQOqF8Bhna1nnQ2t7WgffzZ2sSnJcPEkhYQrHIBm
         LArB7/ExybAoW5ghh+U+gMxFi+zQuTvBLR9zPXWJLVpq9OveVNp/HNVCfdr8J6+GFUJa
         QZzVj1X+RNmZwbdSPQXZqXrI/lry40qJqZfOEEVN+OtlqPL/sA6AOoNvSrT6U7dAbIq9
         jgOw==
X-Forwarded-Encrypted: i=1; AJvYcCWwoDef8UXOcU1Pn7Ngbo9xyihMS3AqbErB8s/ds+lR8m4BI3pFco78gijZ1Dad6aev5iAmDHYna9ZWTlIfEns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpu59iNb7ShSgqaZU135uihp4ksAdXtTp+Kw2m+cKV5vK3iOlK
	6JJ79KEU8E9IDig6ZvlIvHomAIa6v0LkSG0JnasvLkgEhKQ1rI43AJ8FzSGJ6T0ticQ=
X-Gm-Gg: ASbGncsjSySEcYxdAUdp/8rlnIoEV+co6br2/Kp5MHObuJnJcxncZ161VsYjk2S4tpu
	HVCWn9o0mpVfPVclXaAjskWv14FpATw2GsV+mG6KzFIee7aE9YI/huqQlm3bm3d94mCB8hF12YU
	XYM/HOgCBunxatmhQMh/829v9lH5YU40QYWcX8RraoJDCf8qkPUzwkPJAndLxqjKTx+oSzaenDD
	Ak9CJlNn0XJ5Nn4XGTXFGwjc1ncsqOXiXirSBYu50NiTaztrsTt2jxM+xWyJymUenWtq9kiZhSz
	LZIodgLtyEPgsU6Ru3RgylOOnkWIMkDsQnMx3QD6sxNpTEniFqC2h3mfFjgdI8B7F+m8M21m+sx
	vls92oJjadReL4v0APLffO0BBtSIeh8Wf3g9Qjh947Z4CEHRZPTTS96cEYyO241ObZLbsy/kyPw
	I5HjLQtqgTEViJPHUn
X-Google-Smtp-Source: AGHT+IHuoJkLRfik10AD7NBPZIudPe/zz0dSg5CN+bjMkIVUA3hu11mzQRZgc9RP/6950DlYAOSGLQ==
X-Received: by 2002:a05:600c:5298:b0:46e:432f:32ab with SMTP id 5b1f17b1804b1-4711791d1e3mr152626135e9.33.1761130978504;
        Wed, 22 Oct 2025 04:02:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47494ae5510sm35646435e9.3.2025.10.22.04.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:02:58 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:02:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Liu01 Tong <Tong.Liu01@amd.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: unlock and cleanup on error in
 amdgpu_cs_parser_bos()
Message-ID: <aPi53iS_z4y4uVef@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If amdgpu_hmm_range_alloc() fails then free the previous iterations and
call mutex_unlock(&p->bo_list->bo_list_mutex) before returning.

Fixes: e095b55155ef ("drm/amdgpu: use user provided hmm_range buffer in amdgpu_ttm_tt_get_user_pages")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ecdfe6cb36cc..dac0b15823f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -892,8 +892,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		struct amdgpu_bo *bo = e->bo;
 
 		e->range = amdgpu_hmm_range_alloc(NULL);
-		if (unlikely(!e->range))
-			return -ENOMEM;
+		if (unlikely(!e->range)) {
+			r = -ENOMEM;
+			goto out_free_user_pages;
+		}
 
 		r = amdgpu_ttm_tt_get_user_pages(bo, e->range);
 		if (r)
-- 
2.51.0

