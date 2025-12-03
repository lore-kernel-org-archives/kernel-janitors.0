Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B90346E61
	for <kernel-janitors@vger.kernel.org>; Wed,  3 Dec 2025 17:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783332; cv=none; b=WFxN6wlRiEE8PCZFbeG1/OIHAK+k2xXu+IfV814OTiCwXNrG19lX+YxxgycFK+52tjjYrHJqQmiJQDHp6cv58Y61lGomsJNZtZw2RLw94jcJmg6LVlMAePfY2oEQFIvDdfrs1lg5GB4R4k/76AWK90wEoBvSkPBHNY/o5gGSOqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783332; c=relaxed/simple;
	bh=WVD8x3Fl7busnR/BI5+KZ6AUTxJK/tA0FIbCJx1+Woc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MWcrY4XBv+RlVXOk/qizKJ+PLsGcYqhXQN/3OXLIvEw3hcReXKeix71oS9URu1gxIwTu9RZe5zB14dNa+ZXDHOF3WwzY0U54N4KylPar1NPPyoE/SynOUxL8wuNPXWXw4vfZ9LRdSEH4UkPfoOaaaJlEu3c0E//3UH9uWcI4oaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m2hLeeA9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m2hLeeA9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47755de027eso223675e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Dec 2025 09:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764783327; x=1765388127; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKJI8GMtAjNrzKnACSkzNNj+w+iIpDqT7iblY7Qxnls=;
        b=m2hLeeA9Rk0IJEYPN7kuldNnlppPCSCd7tYqqBFIaS4OahDJZoCh1tyDSbLAxyuV6I
         n5g3K9iDKtzPSgN+0lAf+/c7GdYjjOq/OUvFUpKHkYBhlxqrOwVWQTONuSRWq2/Rcg8v
         ultr1lAvFyPAE5a2qlg4umGiTTFRBp974+usLnERVv3l8a+R8XsoZjcITyG5elPzBSIU
         Sm0EptERMRibi7OaAB8ILivs4Ze9LYUCzA9K6eOGgR8RTj6mRdCqCxVwaPO+e8fY/2rQ
         miCtnRkBQ+syX/pg80s66VagJGII9erg1G/wFKjW/nZCh6DWkZxvYYe/9yNw+7bYUWY4
         vdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764783327; x=1765388127;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKJI8GMtAjNrzKnACSkzNNj+w+iIpDqT7iblY7Qxnls=;
        b=o14U6zV5s6nh4oVsUVPwoajjnP+0UQoEZ9t7ATSgMOvIdahONyhoNWuGgysVcO9Qp5
         ueQx7276NuhFqV3XPPOebCsBOQ2dN8Ge69vSYiZnAmoxv4XoxkEztr+2B9U1o7+g/CJB
         iiL13oEhaJqJY1GoNBG/oEAS8uyIrvyvl4ojkYlgATn0Bd6h5utQCwqA4iDr1yVQK2Rp
         eHQBDV4WL81tXxPWd8Zgp3AHkRB1hCej1/4EQsWDjqq0TDNmJif0/0D2LOW/Oa226f6k
         oDKA7GAzCpHTxJ9yNxH3MT65SH//sC2dHRppthn3zfIfIifADmnIgATLF5aX++eMiW6g
         lxvw==
X-Forwarded-Encrypted: i=1; AJvYcCXXJUj2vJ3HUI6+V7bvRx+qtZTVlJzHn7EY1wiJvc+3ItyptCmdltFuEtvwLNRH0FTSNIvnGLTD8SsJyHRE8TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2VCGtsGbWotis4GN86dhv7SQDYc8lXx+kFEnqyQwGyzdRnLib
	23v79pwjCDthIxRdc1MLZ1sddqFkl0uYU/GHTJMaycBSgcotl8RXWjJjStQt/qvh8ng=
X-Gm-Gg: ASbGncth30JNgUrmEeQldPtAtMMaPDuHBCpSXCnRdYLiHeQFOPWSFLEoiGThDflQziq
	/tGpD0lhN7PACD6F9hHeKT2/VXq9NxhVIiVOyZl6Cd5ptkR3WjwA+nn5ehLUO1+E6saHSa+gqRW
	TJTU+8QfJcHuBdPq0QV/o/zilGpmI15dfBNVpB6Qjb61pBNx/XTbCekOUQZDC7ArsHN2nw0kF00
	pAvOXbpBEBsPG+Jy83XgbsOPSeczvrSYkhPgLCjtP8xNyGq3RIx5Ol1S/CEoH9y/kNbhuYWfZVT
	koVjlTfWnp5WDOPhCirFbJV82LBTAN3Pu0EgdjD/oHROO0abHikTJ3GaidTMBlKWLpGoi2T500X
	/MVyuxvphULWmPQbGVUVtRmxgj/TzPz+dZHIzzvGRtGPgxzDD+zz9MZ/dfUAKODBEpN/9l0MM6z
	YA/unsh6Uq8OwGUcKv
X-Google-Smtp-Source: AGHT+IEudFPB8fqTRUYo9jAjw9iQXj8WoOA1AJGB7dducQ+6U4yMLLe6rwsDuMAuj36q/yWs6CIXUA==
X-Received: by 2002:a05:600c:45ca:b0:46e:4a30:2b0f with SMTP id 5b1f17b1804b1-4792af486d7mr35170365e9.29.1764783327011;
        Wed, 03 Dec 2025 09:35:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5d613esm41252875f8f.11.2025.12.03.09.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:35:26 -0800 (PST)
Date: Wed, 3 Dec 2025 20:35:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/plane: Fix IS_ERR() vs NULL check in
 drm_plane_create_hotspot_properties()
Message-ID: <aTB023cfcIPkCsFS@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The drm_property_create_signed_range() function doesn't return error
pointers it returns NULL on error.  Fix the error checking to match.

Fixes: 8f7179a1027d ("drm/atomic: Add support for mouse hotspots")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index f72bfbdddf23..6ee752c90380 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -338,14 +338,14 @@ static int drm_plane_create_hotspot_properties(struct drm_plane *plane)
 
 	prop_x = drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_X",
 						  INT_MIN, INT_MAX);
-	if (IS_ERR(prop_x))
-		return PTR_ERR(prop_x);
+	if (!prop_x)
+		return -ENOMEM;
 
 	prop_y = drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_Y",
 						  INT_MIN, INT_MAX);
-	if (IS_ERR(prop_y)) {
+	if (!prop_y) {
 		drm_property_destroy(plane->dev, prop_x);
-		return PTR_ERR(prop_y);
+		return -ENOMEM;
 	}
 
 	drm_object_attach_property(&plane->base, prop_x, 0);
-- 
2.51.0

