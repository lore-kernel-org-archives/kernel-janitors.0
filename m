Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C627531353C
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Dec 2025 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764932975; cv=none; b=sNTv0sF2z1d5SIjVQfmBc4YrQJ++7B9ljTs/YdWROUIwOIL1scisOU2U5eSYXhZcSgloMXdXWNrshcvT+HuC/2NElgyWpegkDy7riOVo6Z+4aAxB3KZDWZpuPBU7FJ1jXfZANpEcWIFdFHJhKz1dJRbNScxvdG+rvkVGk42mnQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764932975; c=relaxed/simple;
	bh=HQEN6OeKnX1NuKSfZHIbuNkIh3NrW5bHqOizNUsFAbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FZ/RkLO7PNgz0JNG6CHNgZn2P2sffpg/ZYtjO6I2XQrr8wq7Z59pF1t/1Zb3vRJaaImQ3nU1yokwYKKbTw17JXdARfyxQBIAz/9V4ArauUFHuqsRdUZ2pcUvNP5qnhFT5jLpsqkEcrTFmhR2tKdGySJW3D4qgHFyLBQDEjNYafk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KPLJYvsw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KPLJYvsw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso25491035e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Dec 2025 03:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764932970; x=1765537770; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/C0PagtTMInOFxe3qelV765/5mfYdQN+er9ThsJgfE=;
        b=KPLJYvswEribdTCcfMAIfjQ3Gw5DpoyzSYrfb7OE3ssBevV6V2XnSbeVBCdsozajEN
         02JR6iY5NZp7gizNdFPP+zl5w+pxU5nJ7p61BTwtHoMXy4jJkhZBiLOFa5DhsU+vGrRS
         3/jrd2y0kzBMQrpnBLQINTlOZY8IOTuU/7swPijwqyQWdKJhmuEy2GznYJGbFG3MCnJF
         zJyeGrfeMaEyPHslA3VwMqJeoT+/AwNbXxsOAiw1J078zflFbXDHZFQKVGb0T2i7kP5P
         ED80htgxQNwp8yv07iiMtvU1XziVOSd84ljTKOdBFJiNJg5dtpo2iM0kfM9OqmcD4oSA
         V9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764932970; x=1765537770;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/C0PagtTMInOFxe3qelV765/5mfYdQN+er9ThsJgfE=;
        b=h/qylTnmMvqREbjp1W1IJucIDKjyRtlks+24HOWQ/l86R8JxGQ07vrX/TdgTLHTuTX
         XOE72HJ+QVAPR2OcfpD7LRXsXrEuOrIM/M7nSqMg+rjAc0Q4p3RHwq/dt6tsL0mRkarx
         /3SxlI3PsQS6DabPrCLPKBjhv+HxdY/S3vXZr8wYy32kCuXIPVxuffl9BTHZ7L8iQr09
         ZsKs3dpYFdq0nGr0v9SZ+SyHOuNPw6j72FaXcWlyAxL3B9+bhw0JPvNG1dPl1PwwbaXk
         XZodbBNWy05YJwByMZ7yTUB2ajRgXW/PILTxzTzHP0w3qvQKu5nl6aXMZRNB+EJSvtxd
         OOcA==
X-Forwarded-Encrypted: i=1; AJvYcCW8N1i1/Y0rVlGod6B2k6WMc/KER2Toiy/N3/L2R2MWb73wxcKWYNfjHPDduKh5eZQp+z+UAObMlV8PqH0hC+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsk3Oij2DWfzzFfP36GKT6cTB/UjjQ9xMLynaP/V6kR8CDvEP8
	U8ORuq3JvrtfWXs7xZPXJ417QITbedxvaklVu7Cq4Gr+FHyxfYBAKRRqh5nzMWYCgxA=
X-Gm-Gg: ASbGncsXhCV32ZiNz59xeGFGrCqFfTZjI/IIx74BXJvj6Vjvt8+cLYr1IKiiIkCpRo+
	xVdldmmyDHXqwMRKNuDflzbqrZNcY3IwyXrWM8rXa4bzglig1BzvqgZUNXmgcwr5CmWYDenLDjn
	8nt+u7vdbhvtdrKhRRDnxzXOtfo80Mo4nh1ZXkc2yeJnl429opjtxNOEVeZjKBY3Axeqyi56y1W
	8+wWu7wZxEUIJv8evfyBrieZd4Q/Zm/YNT+SKbLz7/QF7GrajBUKwmwkEUNJwMSb2BJn5jBgvH6
	C5UkAr1ttrIRX+g+V5JaQNY5PwY1YdCxRcj4uxPjecRc9OQiQfjdg3jlYptAbjzQiNbZCbxShx1
	UkUye42MIHPf5km9Y01f/iUZnySP1Be023MPFbOEN2mjArGcBQ2sD3RJb1QbYdsEdWq8slLohU9
	YSsaH3PY9hTOvZoaMR
X-Google-Smtp-Source: AGHT+IHCkU5CgfbT6Uz9t3Nb4ylQ2nrafmcxdx4Hm3Q2PBKnBoGZ/U3wVfqkqFkieDHCTVyrSxNH0A==
X-Received: by 2002:a05:600c:1d0e:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-4792af321b8mr94681325e9.20.1764932969765;
        Fri, 05 Dec 2025 03:09:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479310b8e70sm78214345e9.5.2025.12.05.03.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:09:29 -0800 (PST)
Date: Fri, 5 Dec 2025 14:09:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Daniel Stone <daniels@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/plane: Fix IS_ERR() vs NULL bug
 drm_plane_create_color_pipeline_property()
Message-ID: <aTK9ZR0sMgqSACow@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The drm_property_create_enum() function returns NULL on error, it never
returns error pointers.  Fix the error checking to match.

Fixes: 2afc3184f3b3 ("drm/plane: Add COLOR PIPELINE property")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index ce76c55913f7..e32c7ea8551c 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1867,9 +1867,9 @@ int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
 	prop = drm_property_create_enum(plane->dev, DRM_MODE_PROP_ATOMIC,
 					"COLOR_PIPELINE",
 					all_pipelines, len);
-	if (IS_ERR(prop)) {
+	if (!prop) {
 		kfree(all_pipelines);
-		return PTR_ERR(prop);
+		return -ENOMEM;
 	}
 
 	drm_object_attach_property(&plane->base, prop, 0);
-- 
2.51.0

