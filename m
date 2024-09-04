Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558221474A2
	for <kernel-janitors@vger.kernel.org>; Wed,  4 Sep 2024 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436912; cv=none; b=BgmhiU7ZPf6deObED7ilXsHNf6PlTf7jZjS10bbqLJlv5ymbgdfKo8PvWbFDgzNDB42ZHIlz9maw4ek7RkFonWK2XcGEZgnSIcQBTHMfrbO4nneqFRinqsbqP5U415zOCwFqq/DZjoZty8tOs89uZnNxwlDl6aDxgtPL8O++sjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436912; c=relaxed/simple;
	bh=APWfeT1fxJI1indcIyDuFdWS6Mb3IjNuk4/9AjF6lNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZO+gNhB0wn4RsDqRJzb2qqS66DF6uSp61BjHEke1ekcTJwFysRz7u9+ceAhK/X73VjTwM8Vxnfa1rU9zCBi6mij0XxYRX87yk910I47OR2TPdEG4kBD4AxqWZN57TEJw1T3UGpaoDHsant+x66wtIZzUBvnr8PRyXGaWml1XQ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fZ/qnxgL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fZ/qnxgL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374b25263a3so2720878f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Sep 2024 01:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725436908; x=1726041708; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RPGRyZgor+ICRd/PoCXOyw7qG7eZQ2SIyPr9G8EXgT8=;
        b=fZ/qnxgLmIC3DDPXOkHdLjzREWRCFbxawCxqngmrzQxkoVtCskLB8Ti1mK7gwpJgir
         vCG3HbRUFyMCOOzwrMJzpJCu8lj2/sxKsGWKtCrhHU/tZFqvbVdy2FuMd6V6wBJOby6b
         PA0zk9IufhXeKc9TCaBG0nbh+HsFky1BY93TwjeICQ1YnA3zrLxnn3FgXJgYjki5fZ0s
         tt4+v5e9K8PZez6NxeUyP8KltfDCmtskJ45THsC2QLGVfJL4tdcmp8T+o9mhhdETef8Q
         Mc9iyyXoAMwSMfylt3aXt/E0uGR5vYjN4ArybFxxpREo8BIu9c4EpQzACFgx7tV/gG0B
         V3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725436908; x=1726041708;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPGRyZgor+ICRd/PoCXOyw7qG7eZQ2SIyPr9G8EXgT8=;
        b=liCOpQqN5k6VmUucIxKDXl9bfbtqnzTrkMarXpKsGUGAtTaLzS3YSugLtBL0A/4K1+
         oxQAcZGZmYav0tomLBjjDK3stAxi9gQhSQj06Rj1JvUUMa2G+V5707zg19IM4FyO5zzJ
         h6vqxdjilemAzzkTAM37hQTrJbyLWt/ZF5GnUrcBBMLCZRLUV3rmiZG0Xcw93b82Zi/q
         UOM9dBpfAiG+MsgVcC68zGKITCuxfmTuUPbQjLClAslFe0nuVBV5QXLroZBVHbNNfAff
         6busG1jvQeGoKkz2wquRstXN3UN6cRb1PCG96u4K73dufeu+Lx6y9itOCknZEJeCmAM8
         v4kg==
X-Forwarded-Encrypted: i=1; AJvYcCV3QYzFEAAEeMpBtUr8yOWQ3lBr5C6YhHKBOU8DjbhLVhdwgPx7UDZPO+Z5NwVo8YXbfgpOe0Daao+mhdVLWDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu3HFQIiGCFyuvx7jqdPheQw8jqzAMkViM93TvFy4+oCGbKDLc
	sZGK2JLelWYVnh6DRvMkcctfGMyMEIO8mdbdzeVKu2vNVlGKFW5DO/kupSXkirA=
X-Google-Smtp-Source: AGHT+IHKnu53nThpZGWQqPEljZp+OwL7w/w0X/6FdYop1bPaA9q53NpXOxJ4zAW3vWCLnYcSEXQUDw==
X-Received: by 2002:a05:6000:144e:b0:374:d2a3:9806 with SMTP id ffacd0b85a97d-374d2a3989cmr5576698f8f.2.1725436908416;
        Wed, 04 Sep 2024 01:01:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c4059811sm10059317f8f.4.2024.09.04.01.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:01:47 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:01:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jiadong Zhu <Jiadong.Zhu@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Jack Xiao <Jack.Xiao@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>, shaoyunl <shaoyun.liu@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>, Tim Huang <Tim.Huang@amd.com>,
	chongli2 <chongli2@amd.com>, amd-gfx@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu/mes11: Indent an if statment
Message-ID: <4152e10c-2ec5-4ac3-be47-c97fcafdb35f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Indent the "break" statement one more tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 0f055d1b1da6..ee91ff9e52a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -415,7 +415,7 @@ static int mes_v11_0_reset_queue_mmio(struct amdgpu_mes *mes, uint32_t queue_typ
 		/* wait till dequeue take effects */
 		for (i = 0; i < adev->usec_timeout; i++) {
 			if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
-			break;
+				break;
 			udelay(1);
 		}
 		if (i >= adev->usec_timeout) {
-- 
2.45.2

