Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540852101BE
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406991; cv=none; b=ObsrTUzwmZR4pcp8KoYDvDxa2MGHMGNM1koZSB0/mAqGo6ozShBu6vf/1WsGcOSNtjyw36FlItV7tQOdCDLwgTXau9YBdBoAEdHlCIBWWORjYfS7fPLmuHUCg/Ktd2rK8K2wiw21URWdPSCLaNwyEZ1LbklCggCpcxyLeKAN8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406991; c=relaxed/simple;
	bh=e/QqDzlVLbsFjZCG9tc6aZaGsN5YICbP0g+qKrCy2XM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bJhjduzEyFh+PnrVaqq3jWd5zyXr8IX6Kr2elJRq8lt0dE2FnY1G1Lzi7AOoQuJ+TbpEqLvZrVuu+fcE+XY3f4oABEOMqg+Q388poEOpkwM3jmE0lK4crnkBd6TEEMVrLsOGzmkD1XZmPqTMH4mcrpRZbgAK2Trbz60Xe2Guylw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qjUh3xZj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qjUh3xZj"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a4031f69fso901182966b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 02:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731406988; x=1732011788; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ezd42G+JwcNpijWol87RV7vPAsy6HdlYEXoioaZ3yUM=;
        b=qjUh3xZjuf2V4Kddsrd7fwDSoiID/KN/poQOgn6lFjGqf4cDP60PVTGIp5iIspKcsa
         FFtdv/GuG9/g6uff3JulmtVQoZsUwwVelUPid7NrEWHF7ty9W2R7RfZ70gp466kIk76h
         DbhTaN2id+s+R1c/qSyXIXdyP4B70zFL1Sq3fvjowOvu4pKb76+Md0FCJ1dacCCg5AS3
         OdedmMS/fwSLeNObBWelp8GbdqzofpMInQueJ29DsmQgj8ef38Sbfd4rmqdDnvEFr1BC
         y9G11KNFoADEQ4x26C+WAfVr6A9V+KhYXTkKKfHaqePkMXTzjRwxPd/hkjoo1xGIf/E5
         vf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731406988; x=1732011788;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ezd42G+JwcNpijWol87RV7vPAsy6HdlYEXoioaZ3yUM=;
        b=jx54AqiIyuHtzLPhrR+eFr6xeXEUeb+SoqRv4sdHpYJYaAlfP/sbR4B3QLCSHqfI84
         mgOCO3xlhbbvBxn22tM944JpevOYwL2zbWgLUHrOYv+hYMpGd3yNHuuZwfvdRMa78hYq
         HojV0vkHinASWshIFgUqCUe90TTkr7WusN1o9BNCKLjL12e7lFpnuNt/pGs78S6uYPsL
         vamGFcwG6JR/j3zW2PeuxJ3w+Bi4n4/pCwRBOfOnNHe+0Beifmx7L6/u9WjUpkPbn8At
         +/XOHgkGVwBVqE5ndz9jr1XM1XRBT5GwJrJDRJ+sjmlyZOTGOjDx1bJJ2oK3Epnsu8qX
         QYmg==
X-Forwarded-Encrypted: i=1; AJvYcCVC+0hg5rJ7R3hR3fwL+WxXgDv1qtssXX/0D6cqDav90EmdcSOsBLdAUGsukWmt0DJDVWLXMMnKlFB3D08mbP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyco7JZS5v6aY+fMs4Q+K/+eZ4rBlDO94GUb7LNHMgxMnu38uc0
	vi/TpSv84xarfD2xdx4dlR/83YU4f64/I7XcnOdwwBIpF7WweLt3fmeWJ0XJIJA=
X-Google-Smtp-Source: AGHT+IGt4j9ZZSe9rgo5rLVKL7Sw0JNMnKYRedUbOwvl2VfIbz2NdhXaY+7ntI9ZFHojloYTONpjJw==
X-Received: by 2002:a17:907:7d8e:b0:a9a:14fc:44a2 with SMTP id a640c23a62f3a-a9eeff44f6emr1650475766b.30.1731406987590;
        Tue, 12 Nov 2024 02:23:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9f08c9ae30sm394026966b.55.2024.11.12.02.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:23:07 -0800 (PST)
Date: Tue, 12 Nov 2024 13:23:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/bridge: ite-it6263: Prevent error pointer
 dereference in probe()
Message-ID: <804a758b-f2e7-4116-b72d-29bc8905beed@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If devm_i2c_new_dummy_device() fails then we were supposed to return an
error code, but instead the function continues and will crash on the next
line.  Add the missing return statement.

Fixes: 049723628716 ("drm/bridge: Add ITE IT6263 LVDS to HDMI converter")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cbabd4e20d3e..5f138a5692c7 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -845,8 +845,8 @@ static int it6263_probe(struct i2c_client *client)
 	it->lvds_i2c = devm_i2c_new_dummy_device(dev, client->adapter,
 						 LVDS_INPUT_CTRL_I2C_ADDR);
 	if (IS_ERR(it->lvds_i2c))
-		dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
-			      "failed to allocate I2C device for LVDS\n");
+		return dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
+				     "failed to allocate I2C device for LVDS\n");
 
 	it->lvds_regmap = devm_regmap_init_i2c(it->lvds_i2c,
 					       &it6263_lvds_regmap_config);
-- 
2.45.2

