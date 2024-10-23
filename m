Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EBA158DD0
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672238; cv=none; b=BEgBdeWFyTFmhj8FA2Ae+hap6DiHZUk+d0InXTc3NeUwFIlFDU+GsbyBtmKYkxUILnVEMMQJZHDWtvCMm4dRI/eBf7vyLEeFM+dJfMQ0065wuGvApevVHdoGTzJd2eImW2X2qZQqZu6HDttkjC1k+z1+ANnBI9uxGvPGuYO2ETk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672238; c=relaxed/simple;
	bh=c0Vwk6WOOc2/MYBaUvlMbC6aKVmZwQj130v5adtmU0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sMrTpNc0Z0/mHKhvAQw7tPJmlwcrEywDdbOEDkNkG7xxaMs5/AqqInla0uBP6rQ+4uYKUe4+BkvrV8B0ziuTniUgrcBuLklUJ0mjwB/qZXrUWs7kEEgH9rJ3hn4SPhq/ywCFgu+p3ZBHoDvuTBRSKD+GqN1cnl3Ozol6NeIEs8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cbq2YyCI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cbq2YyCI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso64938115e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672235; x=1730277035; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=95Cs3StsmPVbQEmy5DYBdaAp5pMh1zUcYS64FB9PkOw=;
        b=cbq2YyCIySlJzXT+WTBnWsfwA91kDCgYKS6s9hXuu71gTnneYBWsSoGDz0jY4v+PFs
         jgXlT8fvYKUuyL1LBm7zyxTNyLfbTtaoqBQO27qmODtJJeJSfPc7BfhwC+AnirwBhEB1
         2/iQ+ogh4Z1J3Ywo0fVTEsxF2WVlwI1C+sppbzmKn/XmPHv/keBDos3IFVtjDg4orDa9
         O9QZcfWsW7Z9TPUzWQ4zMQmw1U8RdSemDZaSfu1xwoZ+Gntl68g+ztsOTayFVRO0qonw
         BhbNSYg1/XJDCUxF9CY0AMSysq33fOE52dQ2EuI9sQ3m5yLBd7fdhxxOtFZixAdDLEnJ
         C/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672235; x=1730277035;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=95Cs3StsmPVbQEmy5DYBdaAp5pMh1zUcYS64FB9PkOw=;
        b=b3J/Zs5pzL1xSWbf3TvbmBo4+7Di2cUgfJPP5S14TUZoZ6bQlhigfrNtJmwgo96xY/
         UD7cD83WYDVCGoOnTmzVmaXMck/xNdJ8/pnutybkfR1Z8HkJFiVpkxZz51BL519TmcpH
         oRRaQqtk/ug8JFcDBm8PRiR6BK82Kf1lvJpNoXGiTneckpLkQyqzPy2tuoZs+4lNru87
         n/F5gMSakzPmEUnodu2nuenbssyvCq8iKyaoZCiuorT7J0Go6M9e248xbQowSd15Wbn0
         OPafA+LNgQCTnhNtxUjfT2xOFeEu224B1mFRA0Hik5Hn3zNVKRUT26f9dj2p+M6As2ih
         VECg==
X-Forwarded-Encrypted: i=1; AJvYcCUH6Z/IfCzIgc/WpOvHIVDbLWQbdbMqc2227tQtF7HgD8xJfQ6veZaguF21ylV4aW4inejAq+n/3uxGJHuqQN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YykT/kpxseIwLH6eylTv+Zy3/by2x/yA9ioVawrtU16h/gbQ9/S
	HEo9yrYnTDXdLaLRVT1izk3uG9n+/20HK0iFp/rm4x+gqQi5omkS+RW5+5ZXI1g=
X-Google-Smtp-Source: AGHT+IGb/UB2CSjQVVmaOHKT/K4GreGbDp8bdWYCdX3b6WAbVqGRAZOZ8sPRqWUJoRUK+LtTVQFvnw==
X-Received: by 2002:a05:600c:46d0:b0:431:57e5:b251 with SMTP id 5b1f17b1804b1-4318424ea03mr15362385e9.28.1729672235246;
        Wed, 23 Oct 2024 01:30:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4317d03ea4asm24552605e9.0.2024.10.23.01.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:30:34 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:30:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/sharp-memory: Fix some checks in
 sharp_memory_probe()
Message-ID: <0d307349-c141-49ee-8b34-67caf5f8b638@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_drm_dev_alloc() function returns error pointers, it never
returns NULL.  Change that check to IS_ERR().

The devm_gpiod_get_optional() function returns a mix of error pointers
if there is an error, or NULL if there is no GPIO assigned.  Add a check
for error pointers.

Fixes: b8f9f21716fe ("drm/tiny: Add driver for Sharp Memory LCD")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/tiny/sharp-memory.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
index 2d2315bd6aef..1bcdd79166a4 100644
--- a/drivers/gpu/drm/tiny/sharp-memory.c
+++ b/drivers/gpu/drm/tiny/sharp-memory.c
@@ -543,8 +543,8 @@ static int sharp_memory_probe(struct spi_device *spi)
 
 	smd = devm_drm_dev_alloc(dev, &sharp_memory_drm_driver,
 				 struct sharp_memory_device, drm);
-	if (!smd)
-		return -ENOMEM;
+	if (IS_ERR(smd))
+		return PTR_ERR(smd);
 
 	spi_set_drvdata(spi, smd);
 
@@ -555,6 +555,8 @@ static int sharp_memory_probe(struct spi_device *spi)
 		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
 
 	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(smd->enable_gpio))
+		return PTR_ERR(smd->enable_gpio);
 	if (!smd->enable_gpio)
 		dev_warn(dev, "Enable gpio not defined\n");
 
-- 
2.45.2

