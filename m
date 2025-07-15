Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1A52D0C9E
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 22:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620352; cv=none; b=fKDObKhZ9WKiXb7Iuiups02w2LoorkPaJCxkD7rhydS44/NJYlxSg0znVUw/lCrakcPbZbwlzlSMOHFoNGhyod8cuWQN0plvv2LA5cWT7CNhfQh++u1GfQzTwOnqMQQJ1efAyrDfgRHrGUF5HDYYKwhTQXC6jZHrfTstp0zN49M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620352; c=relaxed/simple;
	bh=ladniYXQzoOq1dlEinYXT4FdNPfN5teSP7HGcso+KCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p7uTY778nET10pPiFOFpdsGcpGj8dbVeZTp8GRW2kgj0aQzdFzkJEuGGqCmWFIpIVKrORBcrhIoulCYrlTU6ME+7TUdy++JWP+rbe3ggHCBPMiTQ+YcfPrCD2V+T7DJqWKYqidqfFAno9jV2hy7YkoBJ83QsI+uvQ5L/a7m7d6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y6uChJK/; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y6uChJK/"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2ff94cc4068so424492fac.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 15:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620350; x=1753225150; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q0r+lpi8NsNWVA/Sm1KkgGo1zMZG7gsRbU/VLszDSOI=;
        b=Y6uChJK/xs2e3YRxYpjF40dYGYfePuE13HqN/2mqepk65Kgb0Q8pxrC/o7yCzfEHwD
         5jzWd7QhV3KiLfmMUEnNNn9KQxDR0faE3GR6HS1wob72x/NHJ2yoSQtEtHOxTxrGPn7O
         STOl1FkrrRDH+LY8xsQdqvUZzXXzWsWK7lED0znB5NzeFdOFKkVyWtKIQRKyYwtUCMc3
         SazUgLuJaCjV2oPG8W7+UWWnrGaBI3zHRC7GqnrJBMIm4L4diJMpQC29tVhWFdlO9SCY
         ARoltydklo2lh7DGjRiB2TaB+X/Ht/fxH8PvcLYxsQX+MA2KYEyIfJy4lIjsXdMvD6WS
         UkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620350; x=1753225150;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0r+lpi8NsNWVA/Sm1KkgGo1zMZG7gsRbU/VLszDSOI=;
        b=Jh2TUJbkhlC5XTGg2Wj+aX54IkKu4ejO2ocdHpmWt+sUTbzMvCfEnnYPKh6IxMNgq4
         3JOUjOHnzNCDFc/R6UUCg2KzPSF00IHHR4HW/aTvvaotS+Lz6zv7hQm2iyR2CHOoiEKo
         YaC6HpYe8h9md1/rQKDaZ33jk3tLdmXbOt8PW9kKr+IDQyll4H9jRTpxVRo284qeUM5f
         tZTfzKVuVoKoPHiWG3ZsM0q2AHgWhoAYy3EFpauev6+BI7Ipx5L+/digROz4PS9VxNoG
         zjTyCMWBSZ5/sXf0jy4h6/HfaxsgTt/fyRMOSu33feO1ekS3kXUXBSziqUgu9tw7b7OD
         +SfA==
X-Forwarded-Encrypted: i=1; AJvYcCW91QMzEwi+GwMd7qRCVDanrKURIO9IgoyqKblCuANFiX2juebNE5m5YF/0jaHz0a9t9UxuS35O/+NV1JJ9xlM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ5sUBHeb41t2EzJGk7K34Qj5o+RCf1jNBLvwU2O+Ayw7v4u7T
	1YZuS0+mXBY4ZFnjuliKqv6WdxjkFLAKre7qDf8Ohbqr84CL+QpBQqjEFX8d0PRKjhs=
X-Gm-Gg: ASbGncv2qvwvalIMUC8Wz1l3dqxd/QeFXqQDiO4q5rIUoLoVDTvvs5QO+XpI+idjSSm
	KCnkjHhfXO7+hE0CFNUg75FQ/TVx45YGHqnWmWggoz2ji+98+UL5a1hw6hbuf6cd5/EbORZsE8f
	vAtDsb7b3vVmPgyv8ql6ISRYo9xQfxJSEncBurhJ1+SqGwVG8LU4beT363Y3Ki9LWLqEnx1UX7B
	2ZLwc9yQ0mA2gLINhfETiQE00eDaYvDrX/Gy0MN7aon9FWgW7+v7LcCYy0cEzk87aDUnPo+1A+5
	GtbKzTU2g7NWuXDS+osLhlDpZHjRlaPYnrqu3NL3sTczxTlND4ywFbRRnMcWojrnwRg+K9wg2yQ
	KTlJXJE3JiH9rlbAWIxK8Hj3SovdF
X-Google-Smtp-Source: AGHT+IHc/xJFBpogquGRvh2ovITPRrvj17Yzf/CgNYUFXPyrDzsqrw22DAEVZ/OJFSPIbJX0w4xOgg==
X-Received: by 2002:a05:6871:b12:b0:2ef:9aa7:becb with SMTP id 586e51a60fabf-2ffaf4dcd06mr1050952fac.18.1752620350028;
        Tue, 15 Jul 2025 15:59:10 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff8bc75ac3sm1100244fac.20.2025.07.15.15.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:59:08 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:59:06 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
	Douglas Anderson <dianders@chromium.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/bridge: analogix_dp: Fix a NULL vs IS_ERR() bug
Message-ID: <d679e2f0-f449-41c4-83ed-c3e26e440a4a@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_drm_bridge_alloc() function returns error pointers on error.  It
never returns NULL.

Fixes: 48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index ed35e567d117..4b9b444bd249 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1474,8 +1474,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 
 	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
 				   &analogix_dp_bridge_funcs);
-	if (!dp)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(dp))
+		return dp;
 
 	dp->dev = &pdev->dev;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
-- 
2.47.2

