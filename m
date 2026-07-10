Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D0E36C9ED
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Jul 2026 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712093; cv=none; b=rMEQLmGmcuHHw40LKdUrl4jcKnxgGw1L/jzu9xCF9KrKav/23q/YOocRymD5jb6QObylT8uJAkMGVqxGRezHJiSwwXDNFzX4ve2LG7Gu7s9qHQn7JvE0RQcT2SeI3+j1NJEkfC0nUrcH44RfO9iTiVjzWPOag7b4CH798v5c8eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712093; c=relaxed/simple;
	bh=KmBGpsdU90+XcIpNlny7ColdyT1dxXntHoxal9Hypzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rdSe0V738oHcGBp8s5ddjV9FtHTbc93mCChYV7nfr/XoebcCopfYhqoRXMAOB8BD3gRQQ9Oy/OMD8X9IraEHkd/Ks9N/Cx9WKTode74k5w34IM8xr+6KcXQDoZM9sqUdalogJQohXBYHrbCpNBDpCGa9JsoxGtZTq6TlLJWAVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8kEU2yv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8kEU2yv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c733f15aso12246215e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Jul 2026 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783712088; x=1784316888; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7NmwwroSRG4UcBUsiNQaC1xyIcCpFcVskhrEQYEsBc=;
        b=N8kEU2yvPCfs3KJbWEHf+Zs3b0mUziCr+8XzQzGgQiZcoAygVixr9E5vlft5XZs+gR
         nsIXwxIy6O9qn6iMClhEWdg1x/QtUX2u3VRfDnNSE2WgDvjhSlu0PXsxFOGuNlro2OTn
         zY4MnPQCOf8IIRG5Yef7IJuG3V4Dtt3J+y6c9RyOzq+2SM67vPdWDn151G48FWGLyIBn
         mDE/1L9flF4vLjhZsyCKZFlX36QH/MXoKSGm07GBwdO6f+i6OoXIpkzkxaemti+HQx3f
         w8TU3bCAnJZAgiIs3FuKykmve2BOz/gj3/72WESLBUXfsxFvxHqdgsIy/pNBSlU/tw9P
         ot0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783712088; x=1784316888;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7NmwwroSRG4UcBUsiNQaC1xyIcCpFcVskhrEQYEsBc=;
        b=F5Lhb+1Gk5oRqxw6QItbvzboyqNurM45U7hCtV3YBC6R08SGs1OIPAEy8S04swPfds
         1fYd4ap0ZQ4/LXQ5AslR/zKsgt0EQAJ/gWItuXT8zFx3EHF+tS6g9jATvTR1BvwfrErJ
         AoR3WcgYRmGK9WK1sKE5qK8A5PNF/PMAOEbxCKsPdujPOGoJsvmsV8oXs3I8O+kVAbyA
         rsW1wIhfH+J9nzDMGtI8ynnOdI47XrbKNQSxfQVCzJ1hbhgfVi6WDA1A9rP1MY6Rx0vs
         pp0I377rqcz0X+u9+agg206lia3a1gY1tiMmkAOluzUW0V0nxhc4euOTYx5virvxUtjp
         bHgg==
X-Forwarded-Encrypted: i=1; AHgh+RoBpqokMcW9/V/ZxzIpFfpOiXvWPFB/7Thfo49SVgEwnG+kpH1F0Qjofyb0xOS613FruoCTiP5zHUO6cMwdHs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxznnFifru2IYlJXmRK82bFV97JjY1+C/wrmdz94+9pgVWgtFlm
	aL17M+l7/iQon4pySXKGYVAyVKHzMWhsHKdCGge6WclZqrNdkGmybViw
X-Gm-Gg: AfdE7cmMPQiws0tkIn/DpIfJj2/ic0ud2YZpDCVtFwYfSbkFX3XYDC7/uapHEdUtfjI
	CQEwqXmP9wofgEYeVntjgYuSvENGkjlQW/oxbhzVhNAd2pAy0H/MRPEAGtbRsEBRa946RimJPWo
	nQvsMH74OlUgXiTh/HI8r43Nx7E6kL/SmMppCiYqQ1OUnWyTRc+GUChZ+0RSQMdUUqF99BvXCAe
	zjikJ/+wvb31cT76WyjSkdfA1dAtnWTLAIaEtHdObk0ib4nrVUAPswWu71kmB0gy/awbREkh2M4
	LY8UlyBkHBGhk0Vh3n4KYlXnSD5fYGWBLnUeA02pQFYmIkUx1st7S63HD+n6e4GBHWrWOiLHCz2
	mjBwiM9rQUiJ4VBhE8kYJ3YiHraGZEC9aDwZFyJznKrVSiL2aJ9vR51ata+hlLXVCfwaaUbUAm5
	kyc4ISihuA
X-Received: by 2002:a05:600c:4f94:b0:493:c0c1:3930 with SMTP id 5b1f17b1804b1-493f87d9dd1mr1807215e9.1.1783712088295;
        Fri, 10 Jul 2026 12:34:48 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f3a60404sm67839735e9.1.2026.07.10.12.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:34:47 -0700 (PDT)
Date: Fri, 10 Jul 2026 22:34:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] regulator: adp5055: Fix error code in adp5055_of_parse_cb()
Message-ID: <alFJVBbiFNxhqa_1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code accidentally returned the wrong variable instead of a negative
error code.  Return -EINVAL.

Fixes: 147b2a96f24e ("regulator: adp5055: Add driver for adp5055")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/regulator/adp5055-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/adp5055-regulator.c b/drivers/regulator/adp5055-regulator.c
index a79274d530df..194dcfe4f527 100644
--- a/drivers/regulator/adp5055-regulator.c
+++ b/drivers/regulator/adp5055-regulator.c
@@ -224,7 +224,7 @@ static int adp5055_of_parse_cb(struct device_node *np,
 		adp5055->dvs_limit_upper[id] = pval;
 
 	if (adp5055->dvs_limit_upper[id] > 192000 || adp5055->dvs_limit_upper[id] < 12000)
-		return dev_err_probe(config->dev, adp5055->dvs_limit_upper[id],
+		return dev_err_probe(config->dev, -EINVAL,
 			"Out of range - dvs-limit-upper-microvolt value.");
 
 	ret = of_property_read_u32(np, "adi,dvs-limit-lower-microvolt", &pval);
-- 
2.53.0

