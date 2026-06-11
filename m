Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECF23CC7DC
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 10:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173658; cv=none; b=JRln+XIe8V1fArtGLZsKZNtTY1OBJfiQ7dKtsXuOyJ/hE/cbHDYO3oEnooK86W2hQzNqSeUPa9xmfouSYif09LsB6UybiKTC9jspVQyVgKxoD9e/cZgoP4mdCCL13JzwMdiOGdc+W5XXT43daT7TDKIwbWpbEFjrKJzh0/52+EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173658; c=relaxed/simple;
	bh=fXKbee91Nqu7cJHnMhqQL9Q3B32VX3O8hKOJ+Vq54Og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SHnu8Nf/MlHVH6nNHMnEFiKS0CMv1shPy870janpVthO5fZ1/hl0wgzpwlturm8hiKX14Cqk6B/+nJXvY1lBUk8db6GWoIBPrwZYZbVO0B0HxQjwC2gESwqnYnQknAENEs5BeqxG+rJ1ykJaT0pV8p25y/k8X0Q9IjoxmUbBC1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWzFXU56; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWzFXU56"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-91578122305so1227608485a.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781173656; x=1781778456; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tIFb7lA47yKA03mD5eNYLcNFMgrB7SUavs+fhnXbFgg=;
        b=JWzFXU56FTDIePDWdBVAny5xCsG+miaLP9Az2m2LU9VieDCmViakcI2rATIRPshsic
         h5wFm9/W1F+z5KWjy9j7Q8pX08MvySgo6aHncBNP4SAYkPI0g94XHG5reNmNn4T7jtLH
         mrLxjopfrR34x65Pn//11VCHXpDHeG6mDb1xlrGLYK1IwgBpQRE9yMsmNbn/ACWByVtv
         D1ZXbWvmQfH0uaFrDdpX5Ct/vUPWwCCtictIls7svY+tbQ1LftOezNlxItybVX+pvKaI
         aRkS/L+Eh7SECQn96HoEGd8xHTJwFoMchKag7k0BFBPAGFQfzPjxryNjDIWO4Xl7fEza
         pO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781173656; x=1781778456;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIFb7lA47yKA03mD5eNYLcNFMgrB7SUavs+fhnXbFgg=;
        b=FouwF9aE6DGiU74To9maNrB/TaOs1HCHoxF+odxuhryB1v3f5eOfPVjvVUTLGkXW47
         ZWJ0rYmyyKt+BJV8Q2cRKOUqQTfeMbvLTT8SBgth+wTZiQTXSQxqup+yLUZ9KljqQGmx
         BJU7lRvPz6AMZFJCQ1uC9FU6ELBzcVOm8rlsM/R4v9EBMXCj9aFb1jZQwBCOyH4fEgFG
         nX4MShdhAevnCiZe5iNlGM3WLw0i9wg+2PF960fvXSUme6F0GgrJGSTM+oDpsXdMJxTh
         L/3epMGSEGLH4HMOV1rfkcvUZ6X928vA/vEhkt0/c2QnvoVcKBs58McR/p1sIs+fawIt
         oUgg==
X-Forwarded-Encrypted: i=1; AFNElJ9Xqj1mkeiu/BwFzPnSECPoR8bWBB5CFDBhgOnLFua1AxicqNu8bRJRJp9NafAVaIdjSWBRPKHWFnyhP52qW74=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3l5Fq53d+2Tj+lTtxinKTsqFTk0OBK3SGUwF8wkM0lT71Hz4f
	b2+Dwqd4xBhe11fEa7g5Swhrs3NJc9Bo+usmZUhnWUvp2F1IzJqsagGd
X-Gm-Gg: Acq92OGcazjyYpXxeBZVUH9SpvcBbgqR+bm3E3VA8zfV26JpUcO3VlJA/G3zDuTsHsH
	oIn70EWs7VkqTH9DZXAea512LJ8zlGqBUfj4Yn9FWHWGhqzrG1Roa8/Y1KbJ7nh73q3GJID8v6Q
	1aZKulruvUSjZB3SIYrayDqY1IukVw+bozJ1+d76PbPPnXVzC4CM+aOPVw6va8ppdsD9UcFh7+A
	oONY+t22ntVHr8Q8XrElB78McMtayOA8UsQOiZrM0KOaBb6RfKN7wqserUE3aNovBTEQyRcZun7
	CW+XXNcFzFPDF3lHEQBDwpdfQgC9uMvA9EJRGdzJZmgY9kRpjvyiNSbpddKc4UrBKqKZxcjjlcC
	xsnP5rtGjY8ZpzzcklGnr7YhNFaHoA/XdsaihM/T8cj+qIkWtcC+ZH//+VIZPpArmmdVKf82GBG
	aW9FyaMhp+vSoHOgV9Xw95sCHe21M=
X-Received: by 2002:a05:620a:710b:b0:915:8055:3f91 with SMTP id af79cd13be357-9160b042de9mr330058185a.43.1781173656224;
        Thu, 11 Jun 2026 03:27:36 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160aca325csm147320685a.11.2026.06.11.03.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:27:35 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:27:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [PATCH next] drm/msm/adreno: fix use after free on error path in
 a6xx_gpu_init()
Message-ID: <aiqNktNfXiaPhje3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The a6xx_destroy() function frees "a6xx_gpu" and so "adreno_gpu" points
to freed memory.  Preserve the error code before freeing the memory to
avoid a use after free.

Fixes: d158886cba08 ("drm/msm/adreno: Trust the SSoT UBWC config")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8b3bb2fd433b..a44380316aaa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2770,8 +2770,9 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
 	if (IS_ERR(adreno_gpu->ubwc_config)) {
+		ret = PTR_ERR(adreno_gpu->ubwc_config);
 		a6xx_destroy(&(a6xx_gpu->base.base));
-		return ERR_CAST(adreno_gpu->ubwc_config);
+		return ERR_PTR(ret);
 	}
 
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
-- 
2.53.0

