Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBDE1E4110
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000320; cv=none; b=cWbxi1W3Qjz3hvXYidaGEgUUuff6ewrgAOeU/ZwJiv95vxwztEUrxnObBlwnu0IfXgkXYvxK5R2ESwS5WrlTtSpMXgG0qhE1FebFUOLPgqOOBPVA3jiyaQgQ0ByHX2UjkK91Nl9QwfY9AoorHU6SfsWWVkfmK35ZSkTFVCMnIZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000320; c=relaxed/simple;
	bh=kH6E+aEGNz9CP4yhozHj1ifZzwFtPtUsQEfaB7h5NBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mue7fkbgxkgDlCQE6s7FDEIzm6wACcA6bcaGutvoA04qfrPwQznbtavxRjLoavVkGckV80B1PUsD72W7rIGXA/K1fDjyAvfiAfJtTLxEYS/7AhK7LBGEfz1BPR1RrjA3mh57rRA8H8nhURlZjjmhSw2szOPBR1+Pv7cSE6NeaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=teLTKoZ6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="teLTKoZ6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so63690725e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 01:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000317; x=1746605117; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qD6CtIO/TisXjPtHYMRMSY8vPIJC8aCPMTopK7WpI/k=;
        b=teLTKoZ6F0L64azdy0zdwLz0qDsa5mjz3OOL5FTmAAA3Rfv7ksSTbWiXtxXctTQNcX
         orVGgySifXLhih9c4d+bRyyCwgAYlUsHVv/hlUutHHx8q4gjl4AswwJwWZ5u2VJPzw0r
         7cRebwhzU/2ISFeQM46D4Q/o6n28YZWbR66GlCeDwhpT2fTYbEJbaqNQUDBLMjJA6lQH
         UDAVIii3+uYUKr5EwDTzntlDB0rsVib55Vs0CEP95GK9JuoPz2k9AbYXLhtpyAW+ZNnJ
         64OjagBmXuEWYLjFpVOAlNE/j1ko/Uhz6uGU1X+f+w3by24RHwz41mrgVoNro5hu9jsq
         4RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000317; x=1746605117;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qD6CtIO/TisXjPtHYMRMSY8vPIJC8aCPMTopK7WpI/k=;
        b=EQwu2tO7U0/3TkM2MoQuL1ugRwBz8PWOoZIDWmwyRNr7T3kq3HYI1D/jcSPxIi8sJV
         bL0f56NPmuRcf8twp5tOc9gPEr349TRgepy9JkgA2MbhGuylf646wi6JmzJBR6rjWI7a
         yrX92lGFHxSsfCqyrqvLItO4iZzg9e8pkaY0uApcFnVwxngqBGPQD80FfFacPAxUqQ4l
         LwBMT/LmZkzYxXAzX2Cz0jg2+GWGA6FqdaVVp1gnZUXis3aElkKLhZiE0EYus0jmWVvo
         sG5TE9/Q/e7iCjGSdzGS1HZLe26rVsApsYGFnimFiySihnzj2RLbyHzHmB50xW0WUN1t
         H1eg==
X-Forwarded-Encrypted: i=1; AJvYcCUxGmN9ygEE7qWvcejgDWepYIAromuITLIw8rfBTc4LHM7t/57wwZrVjY+/vDv/e4yiTacocNcuRnD3gdTKX2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwXqzjCfhRThGcHFQvWstjHO3LhqHBUQZbvyySkgZkOO3TRykE
	chngg8QA1h+ewxJSATlWb7oX+7aEoUAv6DcMz6VZv0FWDrg6E6kxhScUm50rp3g=
X-Gm-Gg: ASbGncttmwvB8oQN4Rvuiuj9pyy6BoPmhK0EkrryoHai/y6fKl/B6dB4zKYddIEKC7Y
	LClztrOgI7ieUrfbP+xhY6Fz7831zL13b2abFa63Y3oOFJ3azqYblbIMdf2ltnBiCqki2TOPqO9
	8eQ+tx0dLienQ3CQytOCW12FUrztcuqKbxLj5ZzZCe7a7fqVGz80JdNDZzIiBQtUfKhY8XB2xT3
	PCQET/yNXQraUuS+QVvL8HOqVR5AzD9usVdlnFixSzCcccCVjQQuSXSJTwbIJcfq8PdwUVXZO8I
	koZhNs1rxiMtPwXBi10TB9zIfU9Ghfy9ogVA8fLK8TfALQ==
X-Google-Smtp-Source: AGHT+IHdEtFR63Z6oiW9IVvngwXx6ZQiZzLOjAXgoM9uBkm6EKIWAveHvb1hm/cJiMmkSf12Z002jw==
X-Received: by 2002:a05:600c:c054:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-441b1f5fffbmr15536155e9.31.1746000317302;
        Wed, 30 Apr 2025 01:05:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b20c3fsm15479405e9.28.2025.04.30.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:05:16 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:05:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shashank Sharma <shashank.sharma@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
Message-ID: <aBHZuejTTKkdnGaZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "ticket" pointer points to in the middle of the &exec struct so it
can't be NULL.  Remove the check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index b0e8098a3988..7505d920fb3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
 			clear = false;
 			unlock = true;
 		/* The caller is already holding the reservation lock */
-		} else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
+		} else if (dma_resv_locking_ctx(resv) == ticket) {
 			clear = false;
 			unlock = false;
 		/* Somebody else is using the BO right now */
-- 
2.47.2

