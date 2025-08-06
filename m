Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD3B21E087
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Aug 2025 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754480743; cv=none; b=StscFUbjXkzVh5jfh3rEHJkZD1XQxQOrbi0/dGxrFzU5qhtQgo4BpZizqn2NLzO4crtIL5mFj0pbcYi6wVQBwSsfd95J6+1yKFsIYGKAjDaGOce+vZe6tG58NSAZomWV2XCzhB9JME71KkWvpqzvMv89uCAew19T44PJ2Sq+IWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754480743; c=relaxed/simple;
	bh=BwF/YJpQUxxPDXEnj+T63E/nd73tgHkdKkgilFUSKzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a2SmATJnPGxCo41n43cVmdQJbxm5aZAjXNM0+87633Jle7pi4spjkCATDC98n2h7QCOqtxBnej6+RlGBgYq2Pwc3Q2A+9E637vButINkbVToQQNo+1AB6JI+3aH52KM2PohoApfv5L+nUcqpe/by3QfP+sb8+U82ZE7qFZSAK84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OvJ0z8i+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OvJ0z8i+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-459e1338565so19129135e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Aug 2025 04:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754480740; x=1755085540; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9DepA2B68/EdYA4QL8eVRTLevm19pdHVt7YsUtnKFMQ=;
        b=OvJ0z8i+V4iumD6/ciZSuunM/p2cKePK/Y1riG2Cbe6CWZMRzQ32PRG7Y3YyTtJ8l3
         2WraPthW3xiZSMio7raZ8/+OkNNeRCXXvKcY+IwN1t4b5mU4TQY5wdgU5kghQH+1gLTW
         QKigVNV7I9XZR7upIpZfcXKydf9cO0WnVkbXva7EkMaIZx4e2iovZ45HDfUPi243n0rN
         pN56mZDOcHzKc/jqDjjZ33NPF1E21zO2ZNuamE+8K2T2QaYulDBJJX6NqcANTmlliGxV
         eJtJFuYhPWbrZHCcyPwEWYrJ+I0S/wqVL2YSLtn6UMlVs2k2hM1ifn3CUmjyLuYAGe6d
         7Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754480740; x=1755085540;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9DepA2B68/EdYA4QL8eVRTLevm19pdHVt7YsUtnKFMQ=;
        b=Hhkg0h26rNvq6U+9coBz+Q+FJdP06t4eN8ftLV0Vvbcp2fsXFFNcdGgfxQmAKAT25+
         1zX80cOD5I2fqoscUOaqjsHGa5kdTqXXFYTwII83VfmNy9kp13iCD58YtoK94xhdtcMo
         +yM0gVN8MCS4Svy5e3ypu0EAjKxfRcqao2/i7XHXHWnJnLirZvSgaf9beCH/gSr4SBbG
         krL73lOUz0mWP/qPobI5FRXI9OB6U4KrtXY2KNXMoC50vQ+KRpLsUnf/CA113cG6ijS4
         epvlpbS5PWTMtL7D+x03NfGLivvNDnltnvF7jpc4dOcSoMToPOTCp8+0JFU/9H+1sfrm
         ITUA==
X-Forwarded-Encrypted: i=1; AJvYcCWwx93TbU1Wuqp5HMiQAFWc2hrZ/6LI0M5zDomYMgWohS90cWqzCRnRVwLsVxIMljuFQpLEXe8yc2U+2aTvLxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd7LQI+inbNnfSOiRVGeMzB/zBZLs6aTdmh6p8CdF4m09JrmKX
	0dnL6JQa2SUiBwINE6996bS5NVu+vdeVkiSDOYyzIFtqoU9x7t61oHE/1X70IL4oacI=
X-Gm-Gg: ASbGnctqWCZ04v94ouzZoofAbXkJ5IJC02QQ4HUDhJDV2OFDzB3JPZx2yh+uldGDCiz
	dNCW3Dz4f3fYLnyqc3jLlJ5RVT4tscWqMiz11h91SlMzm/vPr6FE/Ea6iJU6ETIquun6FlXrX9E
	eLjAtZMi7ZSscikmdsX0dd9Trac/aFm/NBEVfMbpRWL0honoQaU/7CyQQZot+iSPLeumWZ8+VtK
	ifgK8J/fHKLDH7s5Wi5dnDxCDOikpTt8R1l/YzAno5CSXIelazn4Bl/0YSgtYNmIGa+y0MLL6jw
	GtLJQrAg9JZ1yPydk+/yaYws0DPmO59ZAGnmgMhsA7RnJPeCAlKP1ZdSt37g2uHbSEWGf05F5de
	pw6oyfW6S1YOX3xixRXXL8Ng+bt3AJKq8zUmeNw==
X-Google-Smtp-Source: AGHT+IEE3g4jSi9GsUDwto+AdTCsAW5WpR+TQz9Q8Z7q9dZe8YHCctfVsvsgs8q3UFKvnWq1hWll/Q==
X-Received: by 2002:a05:600c:1546:b0:458:a847:671e with SMTP id 5b1f17b1804b1-459e74a807cmr19125025e9.23.1754480739775;
        Wed, 06 Aug 2025 04:45:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4533e6sm23416702f8f.35.2025.08.06.04.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:45:39 -0700 (PDT)
Date: Wed, 6 Aug 2025 14:45:36 +0300
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
Subject: [PATCH] drm/bridge: analogix_dp: Fix a NULL vs IS_ERR() check in
 probe()
Message-ID: <aJNAYCXKTaT1bjyL@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_drm_bridge_alloc() function doesn't return NULL pointers, it
returns error pointers.  Update the error checking to match.

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

