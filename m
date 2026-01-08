Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668E032D0E7
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Jan 2026 19:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767902252; cv=none; b=tBQxUZKAUliVMItkP8koXMNhlhJm1W5JrupyCCj89Jqyft7YW3qRT3sdQjShoMHUClByQROs775eVhYuDNU14KixkxrsBhEUzo4gy+cfVQ+OQyPJjNNcSlbU2EvcJ2fz21uv4acXmK+QJMvG1qCnf0O12RUjCUhff5ILj7ra1Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767902252; c=relaxed/simple;
	bh=c7jMhN8XtvfpyVorUkznyAzrFKyWQ17Srg5BEIXNWfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eozq4FHOnxIkB3SqsLzz7AqEUSD0pfIt+QaL9pjJQyMRrK1gjL0Y23SLrwBi+C3r/W2QWGjKNJK5y+NdJZT/bbN/r3iL1gHfOGJbcTSj5LkKVFGKnA4V6oweUrSElbBDubm0KA61m9MRLcKtZN+Qg/U4nsKz5QmEAkjaBlg6UXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xsYvxyEb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xsYvxyEb"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so1933701f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jan 2026 11:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767902247; x=1768507047; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QCRWVLE8KYqwVCUSR+leEM1QO2iDsc6SFUmiGPEHzWo=;
        b=xsYvxyEbzVUkGTzlfYVMFJ/vUAuvbRawquZVff+08OVYyYuDMQ7g9Dsvqk4e4UcL7K
         ASESN3IWIMURW7YlXIbUKNH9gzZ8KUFTs9NT6ecvcOJfqKUH8lGn0OhQqGyWUNjTF1bd
         daicfrBQPuVIWjCZAMB/1YA0O/BmKL7dEC0cF5lDabJaRIRyF5yE+5llXTiRAvaw0yOs
         DABOchO0eGNgeVHEBLWR1korUzpoG6ydFtLm4XDbbmcHudX/P2Ij2Few21Ws5D2J+qOd
         9/krazfEPNn3r76DDN5RXT43hy7jty6KwzaM6DpWAoWr5+QgaSWgMp0vYwn+QBlHJD9d
         Pm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767902247; x=1768507047;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCRWVLE8KYqwVCUSR+leEM1QO2iDsc6SFUmiGPEHzWo=;
        b=HvQAFDKEyZTvDyJK2A8MBIJBO1JeTqeOKJLJEMHAPP8YEU6XJ1VLti2SRI4RUBSuHz
         gVUuh9fJjYkdGKOHnIS60wB0q7RM02wrbxPnP64Mt+GDmau8wpPU5BoFH3JWktJhml9M
         Ph4p4erw6r6P8241giHMRJGUIWuYXdt/GAXjIf7uLeZEsPZfSc9HC0cisFrz1sxbn72e
         hmzgeJkjlgsUyjwBd/j/p0+tfsknjX4lNhcHVGfbH1vwyUl4kTqF+XniBkcUwd8ZQFgb
         e8K3kN+1/9Nr65FC6MxkHJ5G+YnPSJXlM5tY/aeTcAOnQmsv8GAdXg33BgX5E7Hx/fmB
         Vwgw==
X-Forwarded-Encrypted: i=1; AJvYcCWsMQMwiwBqNX/ZLdHRq5NXYfxFNhvmqaunvELYd/ZStWqez2ghk2kXWfy7jwejqOyfEinbmEpOJ+WryeNaS54=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxi2cWhrTwBGTeZLRs7SWKvojNffE1tVYKop8z+MmlvXeb6WVh
	ISyy6wG/W03a2bIcl0pB4An5dpEGgYj6vGAr802EwApmvu0udq5sm35gcMbQMNMjZ5A=
X-Gm-Gg: AY/fxX6AifN09iuggcuqkND9VIgRlcMmOcplYgKhTYEcJi8AAdLxN0xZY1mxBgdml3w
	vESShZh5VtloixodQLbP5J8GB3qAC1DuWKWs8GCWQXqBI6dcZPTAmMyVsDM6bgy0XWYEOOTlCk8
	5VNsWW3gUVv0u+wIro1RbM+ghaRSX/SJLwKqJBuotjo7p++52BUHvKQuVo6lQzUFGS+tfDJItn1
	Zdtll/7BJsaEy+hdlibu4JPNjSQqwO96VyccHm2rwg+oZp8nuD6c7Fgq6KrALM+Fn8J+plZU5A2
	EpovOdrr+KGkv9sLYbdUPEW513eeZ1LqIw7CiMigk7UFCdDHq7BdtwiR7yGhvKN315zkYNEBaKU
	HS1v65ror5x391chmYqM4RegFrz36Q5xeJlp5WrbC5OaavfTxk1btWBjyAniK4tWaQ9Z//lryNl
	KPS2gxMh0OX2d2CrqM
X-Google-Smtp-Source: AGHT+IFcp3VtHt/q/Alt1immzh6zHpZoD2LnzhIVd+S2uek5Z3OEZpx2nKLWt2bXAXJEShIrU12xOw==
X-Received: by 2002:a05:6000:24c6:b0:430:f742:fbb4 with SMTP id ffacd0b85a97d-432c37a4f66mr8711115f8f.43.1767902246566;
        Thu, 08 Jan 2026 11:57:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df91fsm18529516f8f.23.2026.01.08.11.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 11:57:26 -0800 (PST)
Date: Thu, 8 Jan 2026 22:57:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm: remove some dead code
Message-ID: <aWAMIhZLxUcecbLd@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This is supposed to test for integer overflow but it is wrong and
unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
an integer overflow.  This code saves the SIZE_MAX to a u64 and then
tests if the result is greater than SIZE_MAX which it never will be.
Fortunately, when we try to allocate SIZE_MAX bytes the allocation
will fail.  We even pass __GFP_NOWARN so the allocation fails
harmlessly and quietly.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 8 +-------
 1 file changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 71d5238437eb..7968c2dccff0 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -947,15 +947,9 @@ vm_bind_job_create(struct drm_device *dev, struct drm_file *file,
 		   struct msm_gpu_submitqueue *queue, uint32_t nr_ops)
 {
 	struct msm_vm_bind_job *job;
-	uint64_t sz;
 	int ret;
 
-	sz = struct_size(job, ops, nr_ops);
-
-	if (sz > SIZE_MAX)
-		return ERR_PTR(-ENOMEM);
-
-	job = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
+	job = kzalloc(struct_size(job, ops, nr_ops), GFP_KERNEL | __GFP_NOWARN);
 	if (!job)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.51.0

