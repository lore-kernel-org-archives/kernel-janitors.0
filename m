Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02311A8F97
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Mar 2025 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339867; cv=none; b=doOo6E/bEZmZJc7LRUqB1Zv9joENdPK74V6SsYLfNp6jwLnvVVIdPTk/Ve6Ha52az7CpWJazvOaSpVxna/nmk3G03LUHaRmamRG8xNIZJOU9mGjsPp5qyircipxmfm33gFZad/4xr1/Zc83nJFD5ddrvI7KNMl4SDKciqjD3B2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339867; c=relaxed/simple;
	bh=0clyfl35KjfOEHzeeZP6agmpTPeexmG9vqN3A0Y5WQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZD2mu9ont8jQ+MfZBapByBbuxLqcgWZGkJ+KESohXl3RUPhPYDwRjZol91c6quu6UYzn6rkw3SU+2WQzZOcowq9xUTo/Q327rpXWj7uZdOPXOuEOVS8S36fPcUKmPFKYaCXPBy9MJcJQ1uatww7VqbU+pmNRhoyhRV4HXm23bCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RNJAT/D1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RNJAT/D1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3910e101d0fso881559f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Mar 2025 01:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741339864; x=1741944664; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuKtV48t1X7LVR4XRl12tQehYIh96gIBPvAMlUyvJ9c=;
        b=RNJAT/D1soU1CFiP6IVla6knNceGmgRaR3NiZ7pyRJn4+U1Nn9aLcoTN+lvyQpJ3Kn
         F6Fol9WwLqnwYhzZ4g1pcANv5MUBtmC7OxWeNMpYFyxN0HK3VyW9P4U0eGBOUt8+NNaW
         oEgBC1XZoaayMqTHgqeJwTcGHrJt4ys8O8d9BXLOVDRhKT+WGvR27lJptgv4xNIpWowQ
         xN9QAZAMZNApIPkb+i85b9fKXrfvjCNuRnDAjjNUnevKAu1BmJxTjMuGZRUnrBtcVWJw
         8wsooTUwEeLZHH/p7l+Wsj2ISK23dPfjTTvPWzNx9xMEtfNdRwZHTvfVrAq8nzUbLRRt
         KW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339864; x=1741944664;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UuKtV48t1X7LVR4XRl12tQehYIh96gIBPvAMlUyvJ9c=;
        b=H4iYdeU4FpoALPOZRBxmEAeVBj3487Zi31WJBIPs0TMVc2dhgp7CzAwTK6SF4FtktR
         Shk6ZiRm+Agej+SdT6TINaN6O2uURDYTaCINKOgnG6hd4x8W1yOQyCC4Kg/rhXCNyzVc
         H3dyKZhlmnoBRUz4zvzPMUhz3t0w1Uq2Krzl047fFJPbgW9WQ7ggb4GSMU7b5vq4cs4b
         6PL9DuW5SSFISgcFXmFTYQyxUPIk7ROvV0xOpA86g2E7wJDkpVLdoYbcFgfg+mf8T6kU
         3R3GkpQmzfoSlXJguy+1Axjb13YRH/wKpw4qo1Abh5mtccIsLIg0GKii4GPKmfXapPCo
         FKoA==
X-Forwarded-Encrypted: i=1; AJvYcCVQO6j/qOElT36yHmpsA05zG2v1cjqawmjN9DWALe4d9DE45J3/5dO3BEGDAjL8cCeQhme54hnQAewpgASNkEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6cdXRFpFE1n4/MmqOSx7M0ZLl2LSmxu3AliBdIZXPd5C6MpM3
	NFea7KUZ+Fibh6uXPdCV1H7IdWA4Rp62LZa/nxPkYYPiHl+aIHKaa1K9YqL3Uv4=
X-Gm-Gg: ASbGncu9IiPPeF6YIkltf6kqz2/9kiMBTKix2DMGA9Qmr1glPidR/+xU1cYOihMfx5z
	41QtrmSWf1Iv159SqKbg8xN7EAnB15PeHAS4BWAfHcnjRj8s1atSntbEB7NU1YcJ9j2/yQh+Vvp
	oGcQ6fXnNB68sHLCBsmPmh4tl5rHh2lr/W9gFpPzs1qf0G5dJK6LhwYaOYe1fp5jl7F9k2NDb04
	6+v1JmuGBg43MiehU0l0cE7LkrIh9hcFR5ZPEZa8pTS+FjUzK3JoNwOexXJCLxpP1L6vgg1Yhvg
	T3+CofC1I7rDBGQF5alRzxoTj3ZnhsTkCZGBtAHjU6P2UI9dgQ==
X-Google-Smtp-Source: AGHT+IHGgil9XvvJ/78/5L3MyKGSYheLPT+najegLrndXP1vKPLf/Ab1cHu+/RbdCgsBcMvfznnH8w==
X-Received: by 2002:a05:6000:402b:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-39132db746amr1441891f8f.49.1741339864000;
        Fri, 07 Mar 2025 01:31:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e2f39sm4690339f8f.80.2025.03.07.01.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:31:03 -0800 (PST)
Date: Fri, 7 Mar 2025 12:30:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Janne Grunau <j@jannau.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Neal Gompa <neal@gompa.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm: adp: Fix NULL vs IS_ERR() check in adp_plane_new()
Message-ID: <14a845e8-54d0-45f8-b8b9-927609d92ede@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The __drmm_universal_plane_alloc() function doesn't return NULL, it
returns error pointers.  Update the check to match.

Fixes: 332122eba628 ("drm: adp: Add Apple Display Pipe driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/adp/adp_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 0a39abdc9238..db36807005a6 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -232,9 +232,9 @@ static struct drm_plane *adp_plane_new(struct adp_drv_private *adp)
 					     ALL_CRTCS, &adp_plane_funcs,
 					     plane_formats, ARRAY_SIZE(plane_formats),
 					     NULL, DRM_PLANE_TYPE_PRIMARY, "plane");
-	if (!plane) {
+	if (IS_ERR(plane)) {
 		drm_err(drm, "failed to allocate plane");
-		return ERR_PTR(-ENOMEM);
+		return plane;
 	}
 
 	drm_plane_helper_add(plane, &adp_plane_helper_funcs);
-- 
2.47.2

