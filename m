Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1412F5E
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779438; cv=none; b=MlSfR1OzTtcGBQeR5rdAWT8vck3cs5H+c5ojUCtYBMlGkwamq4GAh14hop0a00jmLe98M0JmenG83W2Chi/RxUplczC7f3nB7+OEyg1qbW8FUA0UfIPausB72C88sD+86LOmaF851acJtqsth1SjfRxej+71mtXy7sFD+6GSg6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779438; c=relaxed/simple;
	bh=1Zs0xoFLNF/NAdBxulvALY6NhTUH+VNltZfx4Sa1MQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ogmnzt4s0Qc7ChWWQztNwYY8A94XxIqRSxMskjhXR5qIOTWGIbeoLlc1HuuR6GIwjwEb4MeY7zyuLO9N/0d6v6Q9lRFZZkDZtRcsld8HaGG1imZOuzEWs59a1bnpwLyi6x8wANlkkheOqXfJglB+qMnoUG530BH2DDoawiS2iGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKm3RU9d; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKm3RU9d"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9edf504e6so640927f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779435; x=1756384235; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bt/Zd5DPOzcwiv9QP5TYavZsENkthIU6GtnKmDspSLI=;
        b=rKm3RU9dZmrbjWJQBBFR0gBxG7FBMh+7gyrJHD3cxT2IuVT4D79s1YWGJ8fb64/d2W
         7ZxWvuYDSOMejEGkqTPFxCeFrtj6TsG0cmWUeLcuxauP5BdcyW2EAjuRD4ppBUUhferK
         uASHKS+H2bvEHY+zkv3W54hN5bZYh9NoLogACMVaEz1idxPFMS26/taw1NvvL5YsZ9vY
         a1/1ApC6IT8C8voZ0y8Jtv9Gcu54flx2ihX4WLXucHQa9oKcWb0TGp+ltUMGq+TG1meS
         qpH3ci71wdt8oTCTQ73NkK9+MX8c8MsoOw5YC95YTEThqQPZSOGmPaqhWac6pMRUfJCV
         0iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779435; x=1756384235;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt/Zd5DPOzcwiv9QP5TYavZsENkthIU6GtnKmDspSLI=;
        b=pd7zCQZ1pKAxeDjSmdpDFmHG8UGWfqLZs7T/9qGmaNiogomOtZ6zjW52SZ9unnYLuC
         YdYHYpxhDNdyYH4KxHcxJQaRpaOC4ABdNzR8MG1oArA8kC5e7uWvOxgbtaG5dvhMX9V1
         PwX9gWDOH5nQ0ZuNqzUv9aZv2RVoJroQE/KAOZhZ7heKF0A6j24imPaUg8g61Mjh1w9b
         6eJuI54acp+1O2rtJK6j8vR3LrgB1k/5wGRxsBClMqee9Lt1biMsymKaA3LnK8vPI4yC
         c6njt+Y1M7aFtaFN7gPncjC7bIOh1XoMYwhqyYp8jYSeWCxh9g/sz2pU+/QrGvs6qpdC
         hPOw==
X-Forwarded-Encrypted: i=1; AJvYcCXrFmIp1u6sc0G3Wmz7rKcrJpvPYXrinZySkqVvaFXJ9SOESxBPirE1xKMDftTZSaEcyW61EMcnWrUr2DGjRfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpzIl1cKcgFC5aTxTyvl9Ldv0GxrZ6DESlKVNRR93XpybY4PgS
	7sUZOQCZ1ATNIZElBwsisO2zc5sdgS7rgAbaE/TnfpmZbkbdgeykun2fnFPahpcg9l4=
X-Gm-Gg: ASbGnctVQVNCZdw9V21Gl2BwCdmjHm4LB1yZs6U03lcK4qARAiOmzr7+Cs8TyjJ13Sk
	jbQbhuPPsowQ0d1nIFvaPYGV26xNamsn/sDqxxjkZhqdQi2TzqZHhr/QQyXMxOPIjxjzCqnRN7O
	t1KSgANHQ2CNeGb/7IkdL9Dzb4eDjnVQzPAFdZMQ+ibpqiIienRVRPNWZPvn7ed4PS1ffaGCYj5
	cSIzcMXpBgAHIcji58cyspg6/Lb9JyPVWtXQrm5Zh6eMIduQb90yrm4mVQ0zZomW/N7eStu5Oep
	g0ljx1/UQs8WzPnWx8dNf7bmc/q6wuCUoEJHEsNU3uQxamXuFuW9bhh1ToWN9PPXu0keTxtq85V
	NqkocXAvtHhXwRYgbp+BuHvN9bng=
X-Google-Smtp-Source: AGHT+IHczsI0rrLUONRdJrdFfmVYfViMf6wrSC9S1N+ePao3CEYpjrXgB6Zm5NwMz2CppJHb6eEdYQ==
X-Received: by 2002:a5d:5f4b:0:b0:3a0:b84d:60cc with SMTP id ffacd0b85a97d-3c494fc6fcemr1981289f8f.2.1755779434797;
        Thu, 21 Aug 2025 05:30:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4db6855bsm26892795e9.17.2025.08.21.05.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:30:34 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:30:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joseph Guo <qijian.guo@nxp.com>
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
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm: bridge: waveshare-dsi: Fix NULL vs IS_ERR() check
 in probe()
Message-ID: <aKcRZo7BkfH1fD2c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_drm_bridge_alloc() function returns error pointers, it never
returns NULL.  Fix the checking to match.

Fixes: dbdea37add13 ("drm: bridge: Add waveshare DSI2DPI unit driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 01c70e7d3d3b..43f4e7412d72 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -147,8 +147,8 @@ static int ws_bridge_probe(struct i2c_client *i2c)
 	int ret;
 
 	ws = devm_drm_bridge_alloc(dev, struct ws_bridge, bridge, &ws_bridge_bridge_funcs);
-	if (!ws)
-		return -ENOMEM;
+	if (IS_ERR(ws))
+		return PTR_ERR(ws);
 
 	ws->dev = dev;
 
-- 
2.47.2

