Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C3C15855E
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672794; cv=none; b=jNGXWhxWo2ZhyI5/RHt3lSDKdFt7NE32AUdRMTeWnD8EX4hyDssQAxCPziaVUJ3PIFQWk0vm5ydnVeJwT/w4bFzlvNOGdXaZV6BpS5ZMFVq9W+uFKk4Kyun3HXnsw9zEZ/jP1+XdFm1DvABjGCOfUlEuN1EBrEk4639si4uChZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672794; c=relaxed/simple;
	bh=iJbAb8skEa4Nx/8KUs6c6Kmf1XIOGfLjcxmhZaN7zqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YcHiaZAP92ED+CktS3sTDGHaOHXA7jtsQXu5pBksIusMorfx2R7zntvUyW2+aFdQs2WlyRJ2KpH3V4UPtICx9qJH+S0cSaSzpSP7rLsmQVTfjV33PjOVEY+QNC76/Izj11xSK5s6yGRCEGjxXE0Ib2rTAgDJX0AlsvFOMSg3zaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOO/UH4u; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOO/UH4u"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43159c9f617so63097655e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 01:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672791; x=1730277591; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2q+EqKO/SmJ+LwoOc5NqrnnNgg93ONnESekHeBkrw9I=;
        b=oOO/UH4umUXL2q/W87+IPDPrskl4aHiSoJejqSZCsxo6nL2FYwK1IkobOa/6Rf3qv6
         gEPhyDnMic6+Cv+ur5cqmhhW4QhFMLwq0t10p4TyYovexoLFKJpexO2xyTfoMtxNZuBU
         9xLO6IEKCUg+TYR5lI07LxbYa0GRMLbw+6FD/g0P1zaW3Yqda4XNRq9injEsnkqD7rXE
         6pvm1YVOuNkQcSwTC2sQtj5WMzx3PKuj1ZGdZ2c6dkxLEbPY4spsJ4dIDUHIEZ1gh6TF
         /iU8vabl1/0ZlGh4fby9v/JfWQaD4i5hhQI1Pwwa+P3RVytTRfq2WDyatAT/14LNf5pd
         ugFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672791; x=1730277591;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2q+EqKO/SmJ+LwoOc5NqrnnNgg93ONnESekHeBkrw9I=;
        b=MMIF/DS4ADB0qBUyHGAFYACNiHuyXulXClBG2PWqb9PASph13vWL+MF1Fyh5BVvCfl
         bsGYmlBp99oP2YgNITUiVo1wE1MTqA6gEjMxWqm1sSN0R0bw1nAKSbkoEloN0KKSlPXA
         vEhJfYGhJkGNdlIibeyeu6ZDQSZZLlJKxQOMjB1xtSrRitzMKIg5fMVBfXCEgAtiQ+dV
         X04KZ+NQEgvfm0hr6i6nLuAxaJZnT1EqtT6SHnXNqBBUgYPq81hXC3Jyh3Jm8yo1ITyR
         ErQBC5N3o4+Lu419lBLTgCmaQLZV84ceqdpvvz+a92c4GU0S09pLxtueSTA5M1Gd0M/R
         ELLg==
X-Forwarded-Encrypted: i=1; AJvYcCVrQfZNols6ZSq7p8IAcOHC4pVWaVLLhpR4+1S8tcvuykyG8szRjnoFznjKLTc66AlRVuptavOFLAirMg5Dgdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ+ioeXgIkz8YB32uwKHK+2YSbU/2xYdxmPAxpAnf9DKUvmJ1T
	tctdVYIMHGcoVddz/RBmHAioxH3STOJT+vsM4FWN1MBJCvUqleSCwof6R0wBQx4=
X-Google-Smtp-Source: AGHT+IH33wSfSVODDvdL/yZ91O6rmVDtlC8FIWHeTBfVcquWAPxHFeIFGhVu1f0mob8q5XR3H0fZpw==
X-Received: by 2002:a05:600c:190a:b0:431:561b:b32a with SMTP id 5b1f17b1804b1-43184158e72mr14918485e9.19.1729672790992;
        Wed, 23 Oct 2024 01:39:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9413fsm8435305f8f.74.2024.10.23.01.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:39:50 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:39:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [PATCH next] pinctrl: spacemit: fix double free of map
Message-ID: <4b5f1306-dc01-4edc-96d3-b232b930ddf2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The map pointer is freed by pinctrl_utils_free_map().  It must not be a
devm_ pointer or it leads to a double free when the device is unloaded.

This is similar to a couple bugs Harshit Mogalapalli fixed earlier in
commits 3fd976afe974 ("pinctrl: nuvoton: fix a double free in
ma35_pinctrl_dt_node_to_map_func()") and 4575962aeed6 ("pinctrl: sophgo:
fix double free in cv1800_pctrl_dt_node_to_map()").

Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index c75ea27b2344..a32579d73613 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -314,7 +314,7 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (!grpnames)
 		return -ENOMEM;
 
-	map = devm_kcalloc(dev, ngroups * 2, sizeof(*map), GFP_KERNEL);
+	map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
 	if (!map)
 		return -ENOMEM;
 
-- 
2.45.2

