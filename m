Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB22135AD
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000142; cv=none; b=oz+6hEaWgQuPzWcRnm25RzifD00oIxRgTsQw7XFwTwYN6DTklTB1P1ezYJsUmb35RpRZtt7oys9UuLPezjT9k4wsiOwK8QK9xJhxyvQIPt8bqHQtK+sied8JOH18AxX9iQU8EwMz5SU75nGFwrfS1Pw0LH36qOfkuUYrfsXWKOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000142; c=relaxed/simple;
	bh=5Oaelo+K91eB6oixdrOIRt9z77ypKb7laLsiQfYJUMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AX4KxTPkpHaN5JileiqoF9KU9NeFQODX+HteriEF0oeieGyGPUDuhFrWOPnGJ9aCDPyM03f4Am3201iyRemYQi8nlOwp8I4zWLGK/EmATnfBryo5/Zilu6M4G8qe4MwDw7ZLhp93+1+4DV5ObCzFo6tuDI/opcdVxR9tBzoTVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NywtzL3x; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NywtzL3x"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe574976so47896425e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000138; x=1746604938; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5eNop9DYwAQhVzXmJiwsaAYhnwQ6MIh2/EYqFvocTWw=;
        b=NywtzL3x24eptDJE6RSL2XadAgRXjQL2Uv8GloF6d3VRL04Rxf9HgaxuQCajEiGlWX
         hV6/XnPqi5L/tyXvaCwK0/aBvS4IwHA1/jfTiMgRn1MPeRs/NAPyOYXtlyajXX0ZM2jh
         hkit5z8WOVbBexMDthxM79CGJUzlv6G5MJ+R+al10hlbwNvxZSFQi4wOskldUeZ75RA+
         yxMKVq8PsgLcGrv4QaiozcsI09HBSCnm1KyU5ITxvhykQ4BVJSbYjazjSXCUQQuqagxA
         WnWvzuf9+Ytfl4Jx4wywH9wNtrp4kwjlR6+cS3wy/vvA6MRqseFMRMruyvwPGgacpnOb
         RQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000138; x=1746604938;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5eNop9DYwAQhVzXmJiwsaAYhnwQ6MIh2/EYqFvocTWw=;
        b=CbORfEKNgTpZ6taD5vHacW08nOCli/OX2Pjuqc6ctqB3s56hdN9X1G7z1du0sf61Pm
         nEHtQNaZ3XA+gXTBOaroS2lwJn+rVnruJIhAZnB85SvoA0Gw/iY3ymKji22P5hmAEE1W
         nN0y9KY8wHKIT59OxyvxVn3Ne4p6YNaCAsuaQlshe+gUC+QdHwO6c2r/vyNotob3fJWb
         sfIwKKaapJpchhvjyGkJgF0SFeXoSZ7kQQmwTjrYBZiIsT3mrxzDJkpbx380wcp9m+zg
         pIO298aFoREbnVTgKAQQQP3qqgA3my+9XLSfeLog3pkS6IVrbpOu64+wScc/ONmlMVBy
         5Uzg==
X-Forwarded-Encrypted: i=1; AJvYcCVogZpLCd/7BoHGMbP6rCL6MtVJYfRa/mxK6ysYiBM7B/x5+9Rg+59MPwgvL0UVeIaaaKvX0efT/2i9ki5HnP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQLpRO2vvY6Ay+Uqn4LKEr1GyV6g6zwE6BGA0edQW/ICdbz0vh
	J4K29NV9Z0WIaiMCUGN43XIMsRXtJUcnLhdcBsMRXNSzwI8eDir4QIVVJ1XO4M4=
X-Gm-Gg: ASbGnctX/QcJL3zQ8sbNL3j9OdGp0eBDjE4fl7FZ+LsvN8anO/pK8WuRdfLewPKVKIi
	/R9nNSPWWz6S2rTsZsCMl9n89jH9KGw1B2DWHdh4DOOpfuMxriyr255Q6d/LzSONFd7X8YpvR8t
	i9bnyvFJ5t7iZDzBGX29hxhSN8R1Nai2TSZL6Bl9eS4PMlrUQ8lhodk8c3BGujeu+0/PEYh3qt0
	ZwpVWLX53ThO+HMuxtmQMGK26fC6faQOe1rk6ZQUBmytZNe7rcxPIKX0ldu8oZrS6DWwpxj8d6j
	j0juDYA/0eLvv7XDo0fScr/S7hoh47gas2iO6I2hgKyntA==
X-Google-Smtp-Source: AGHT+IGT1Od0xFVtaHSj+oRT01S7/5XLmHwGGeR66z6gtIE6Magc/YRwfBBoRUc6co7tzsfh+2jl/A==
X-Received: by 2002:a05:600c:a4e:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-441b1f30682mr18860075e9.5.1746000138541;
        Wed, 30 Apr 2025 01:02:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441ae3fb8fesm31939645e9.1.2025.04.30.01.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:02:17 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:02:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Lyude Paul <lyude@redhat.com>, Andy Yan <andy.yan@rock-chips.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Vitalii Mordan <mordan@ispras.ru>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/bridge: cdns-mhdp8546: unlock on error in
 cdns_mhdp_atomic_enable()
Message-ID: <aBHZBjiOVkI_8Shg@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Unlock and reschedule if drm_mode_duplicate() fails.  In real life, the
drm_mode_duplicate() function does a small allocation and those never
fail in current kernels.  So this doesn't really affect runtime but
the missing unlock triggers a static checker warning.

Fixes: 935a92a1c400 ("drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index b431e7efd1f0..172039fbfab8 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1984,8 +1984,10 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	mhdp_state = to_cdns_mhdp_bridge_state(new_state);
 
 	mhdp_state->current_mode = drm_mode_duplicate(bridge->dev, mode);
-	if (!mhdp_state->current_mode)
-		return;
+	if (!mhdp_state->current_mode) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	drm_mode_set_name(mhdp_state->current_mode);
 
-- 
2.47.2

