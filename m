Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEDC22ACFA
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 14:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567785; cv=none; b=gsjE0qjicrxvGM3dq1upymzhStw4bhw3GZOIrWTA+pbcLuky+oiHWWiIPJqo32MIGgbysmRaM30LYmDBU2n8ezjkfEht6OY4dFtN7uRmWXIPXxbjsoHkzZKZ4pfhbJfH7BTLa/nXCPQ77pgL+9YJhr/yxjHmhaWaNAzKfRX4YjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567785; c=relaxed/simple;
	bh=kBJwR7yqL0mQVL1xW7vBVyuWNi2t1Nj7PNvDRyuKSQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gj5QReygQCP4dsLMEMYZ/CK5FHUeM7FLxoyGEP1H0vgWIi7E90MTTeGbh4OE4xlAH+eDeTF2ZQNR1HMu2FfS2p+gsDJzLWPrZk0ifVzox2ZdYS0yd/VXwd7gLM5Id5rdnEWxtSigFEYx/Ps3lvXCkDfivaRT4oRfNPZmj+wrC5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M1VScosh; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M1VScosh"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so1265280f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 07:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567781; x=1743172581; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3fsDQxf7sE00cNo/2u31jHrQzeoPoyXMSlWbib8RZb4=;
        b=M1VScoshw+SzSRL9dSsBDwgqmKiVUXUX/wNZn4vO40SOggGpt4LN1lLwk4SUfqLm8h
         uitZ9sqUaa1QZXRERNeiLY58GmfJywy9HhRpqzMFAehMQeDylWxCPuL5jHD1U22vljkW
         hxOYoin7/4JzMNFpVXRkk50aUh+GurSB9uBPOCDYv+vmFNdk5W3SuOsV6u+Rsmt6v2rV
         O2FYG6jHIDgtZtrTo5B7At1HHZaRS3BGYyEdyEh017NxrDX869tHLvnc4rfSk4eiMVnA
         lbE/pnJhhIFpOlDK81hEoJKPYGwHU3kjzgpGGmQumW9cosK6eAz+tY37kXfaiYVlid/a
         qt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567781; x=1743172581;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3fsDQxf7sE00cNo/2u31jHrQzeoPoyXMSlWbib8RZb4=;
        b=lPXLRQ/B8J82504dDNraeHV/hmmYKFGTShiUeZ9nC2pUywDypE3feyBsWWXgJofu22
         7k7Hth5iD7jrAC54/cLK4jYLaVU2mH00fsuqMREVPhPYLs7mewXxutWTTET600+Dfawu
         nZsVQU6S/+qi8iMcvlSGRT+xhlvfOnbKaTulur/xqkm4O+ezcPF6MbYZfaq8SrGUOE7t
         S6YLoJVEWiqZV9tdgMVaBIzqGZ+6a4mDW8QlqMtxPiIVm5Nj1NabG1cfXMDcUxOoEnRp
         91X5OjkDlR+FbH/Lq0nM1Ejbmbx9TD4C00SQUTPsLGEMBASKm13A/zh/OMrlT2QTkk48
         9bdg==
X-Forwarded-Encrypted: i=1; AJvYcCXL3MlpTTmCKUFS48eByfxMKTb0kxy4Pt1JJkJmalrSyg7QOs82I9A30tJiSpaJIxwIgOt83ixh+KhALBhG/os=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0lyrPLFqzW06mZcx9BB1u8APQDzgk8z2veVZoWtxAsymbvfq/
	Q6pOcm2BAW8TpI2uzxkRdbgLnORbCbCCbJf5yvocrTECeN3KG+Zv0FJo1mXcCfo=
X-Gm-Gg: ASbGnctLpQyKEJ8j8NN2k/tVj2hHnjbXaaHqcK/K8ENFhLAX//4SPXspZ83I7WPT9d/
	Bc5iKbdyy2KBQ2UFm+ob6Vsp2K7oQOmqGFYrNFdcB9urQeYpSuI5oTOUHk28IgQBtGHKZ5DfWhD
	oNxyqVPpzbLXfzSTw4jRK13sS1ZHFFCU8ObNebeXdUX2ga4I99CrZ/dFT3wVflLjbaP9gkGRc0W
	g3oE0bocgPieQwIc2uXO+tExi8nfnXj5Whb47eEeuRphD++/nXSvwe8Am7Oo3nKlf4LCvWD3kel
	3kGKHDEQRv53FKvcwaVz3SBipNdeZu0+P08HN1Zmh2o3c1oGEA==
X-Google-Smtp-Source: AGHT+IEgYecXG1++S76XR+sJROCwf96bxZG3f1zzap9S0mQvYbpTt9wv6b4eLg8AyhHlqK1JOitUsw==
X-Received: by 2002:a5d:64e4:0:b0:38f:355b:13e9 with SMTP id ffacd0b85a97d-3997f8fa36emr3786610f8f.15.1742567781323;
        Fri, 21 Mar 2025 07:36:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fd277d5sm28710235e9.19.2025.03.21.07.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:36:20 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:36:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lubomir Rintel <lkundrak@v3.sk>
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
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/bridge: chrontel-ch7033: Fix precedence bug in
 ch7033_bridge_mode_set()
Message-ID: <20c0422d-b4fc-4ec7-b3e5-4c4679f499f5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The problem is that the bitwise OR operation has higher precedence than
the ternary expression.  The existing code will either set
HPO_I, VPO_I, or "mode->clock >> 16" but not a combination of the three
which is what we want.

Fixes: e7f12054a1b9 ("drm/bridge: chrontel-ch7033: Add a new driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested!

 drivers/gpu/drm/bridge/chrontel-ch7033.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index da17f0978a79..1b858a8ced57 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -404,9 +404,9 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
 	/* Input clock and sync polarity. */
 	regmap_update_bits(priv->regmap, 0x19, 0x1, mode->clock >> 16);
 	regmap_update_bits(priv->regmap, 0x19, HPO_I | VPO_I | GCLKFREQ,
-			   (mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_I : 0 |
-			   (mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_I : 0 |
-			   mode->clock >> 16);
+			   ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_I : 0) |
+			   ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_I : 0) |
+			   (mode->clock >> 16));
 	regmap_write(priv->regmap, 0x1a, mode->clock >> 8);
 	regmap_write(priv->regmap, 0x1b, mode->clock);
 
@@ -427,8 +427,8 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
 
 	/* Output sync polarity. */
 	regmap_update_bits(priv->regmap, 0x2e, HPO_O | VPO_O,
-			   (mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_O : 0 |
-			   (mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_O : 0);
+			   ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? HPO_O : 0) |
+			   ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? VPO_O : 0));
 
 	/* HDMI horizontal output timing. */
 	regmap_update_bits(priv->regmap, 0x54, HWO_HDMI_HI | HOO_HDMI_HI,
-- 
2.47.2

