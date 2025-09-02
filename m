Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBE52E2661
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Sep 2025 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794839; cv=none; b=TWi8ZCxId1ENT1WmNZkxXIJkh4emYKAU/GaFQGs2/QKA7jZ093FqXtDGLiDbEIfZOMNRbecQWhfoYwAl0L/7Q8ybmJbQqyUBLFeOFz86Myx1uYSg6N9j9Ns3aPdYBBv5thFIihRnJPJ/AxZz3Q4nuUh9Zpa4XjMaO6W5KhA2aI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794839; c=relaxed/simple;
	bh=++wXYqYgn9MXRhgojQOCRcAmHUnAXz4lTJ8R4B11SPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OBhEG9+cPhWekgdOxPUPhwWUVLXsJ/cY+rgJD2xQuXWR42JrJyzfErzyGzntsL/JqiEAl1qgNV33SqE/jzfcEfp+Ztynho9MOjjctAaJqbdK8GyGCMDxNWFoDKDjRFLoZ7WLEMgM8cVaqCH8GDv72pX6ZsqMrtnoGa0FJ1BXflE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nIef9fJt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nIef9fJt"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so34060185e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Sep 2025 23:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756794836; x=1757399636; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ympzDmmI8MhfVPuR62lP77gCJMNp5uNIli2mbJ4bZQ=;
        b=nIef9fJtOuIpNPltP6uf812Mjqtg7avdF+Lgt57i8VoaxmokIaGoec3dznT+LLR3Vb
         E4VgGDzbxwobGW6fmBYK6Q0WdHSYq4e46MHxI8WZwc9rC+Oj432uJyjifctHjhj2JpdN
         KyKaR1587TLpeNgywIxm+11FwehteK9M87Jm/Su3jfnOjjTyKruDtJ9r+hS/lZlTrX1k
         QeRYwPCDrKZ/5eRG1aHnkY0GtSHXScXSJ1/Y8CKA/QeRyUV1pF7G4fzz7o+0UOYD/6Xu
         23A2sTlvUQ+bU0tQDY6PRBwKgRYR5o952issE/7wQKqUdu7f012eFyRE1TeeKZn3SN2M
         XUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794836; x=1757399636;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ympzDmmI8MhfVPuR62lP77gCJMNp5uNIli2mbJ4bZQ=;
        b=Z/kcftXQ+K3i0PVZcdwC6DbRaPNN5qUOAXdIZChQ0Ti14cIT0v0QbrLBdTtBcU3p4B
         tlf7fabCzyk+OXiSgXMrXA6u0Rr/vL3JfBScpapxpTK3ZaWkDn2WeYPWdEXmBZytYuV3
         pSdmVpvou+lKf/u7TFWUFlKpgvU5AyhLQcHeOVsfEzPpyVTZ8zQU9iCTVkkSafNIdNt5
         Lzih+3HYwn49ULiRF/B7gtgqGykFyNLbol4BRjyihvtRX6+BPwiPUciNt/RaHpPf1POP
         N9IuSg9TUQttpiTgeWSGpzgIa3ojAdoaLOmh6KU1fM7XO7EB+2mAIOTDxELWZLGFt95C
         5ORA==
X-Forwarded-Encrypted: i=1; AJvYcCUqLvDXJLIOXoHENLbjrwkcC2Gl6RnXryLbYkouBDa/u2lPVfWdfvTL7ZAa1WSi6Qrbkn8pwD5kvuEKqXNQ6Kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlAMyb+NTMFzUWieScqk18PywAvW065iO5Gbx038jCdk6tzG2
	KoHKeV8eRbOgv65oqFgaHVLPnPjLD4SMrvWC/gOq5ZFFWs1cbkuBSCwJHc8xbxtFNhk=
X-Gm-Gg: ASbGncvWXxHl7N4awK/YkZw9V0og6PeICkRJ3FJBMrKbACxfigKAFd0oPH+93YIcjjO
	ofW++dUODf/MFzDMBc49U7sJ6PjnzBh8ktE7heLkjMchYnkfzs6t9ArwzD0PuBA29LXpX8l1V1v
	9DqXnWp5KxkEUHzN1mkyK0hcvN6ncHA325kxBzo1uRkwcF1Ffu49edgz/OdlzOt72cKvurAJ5Gz
	+y4oeZIK/QhpS0vfifHNIjNEfCAfbLcaF52v8uF9rbnV1LPvRXFm9f2Wi1ByyXDYqGHtBqwbOIz
	db8esqKDPqJbxNPdCvndCd4XOVF6EeBETPsBV56u2o5zggkGNMM+7XB5cdQAO8oIHjJVqjIXxsC
	4DN43QKEBtfkjkIafHxRNKvGjTW9NvKnKyqe1ESLEsaHJpg7M
X-Google-Smtp-Source: AGHT+IGczOOV8MWINPPIkYniAwwdymVO48SZpByPT7RWy59E5cu+BCfrp0a+JKywzdS+lIUS1DG3Dw==
X-Received: by 2002:a05:6000:2112:b0:3d2:6129:5505 with SMTP id ffacd0b85a97d-3d261295a85mr6792091f8f.36.1756794836310;
        Mon, 01 Sep 2025 23:33:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d26f22f5bdsm13043671f8f.37.2025.09.01.23.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:33:55 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:33:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/bridge: synopsys: Return correct variable in
 dw_dp_bind()
Message-ID: <aLaP0JVagRyL0f_O@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a copy and paste bug here so we accidentally return "ret"
which is zero instead of "dp->irq" which is an error code.  Return
the correct variable.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 33be4eae2b20..22e8b08ecb74 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2077,7 +2077,7 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 
 	dp->irq = platform_get_irq(pdev, 0);
 	if (dp->irq < 0)
-		return ERR_PTR(ret);
+		return ERR_PTR(dp->irq);
 
 	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
 					IRQF_ONESHOT, dev_name(dev), dp);
-- 
2.47.2

