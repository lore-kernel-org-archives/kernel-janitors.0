Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40212E541F
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Sep 2025 06:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794831; cv=none; b=sI3nAvke5xlgNMGKIPLesm+9elFbDVGEShE4v9EWLNB3abvH57J+XWXEcZmQQx44L/qQtYckCCTHThW1DuYhHHGV2C3rNVakPIFUIry8mckgUGBKwR6zF+mFONGNsYIRs60dTvPV5Hjgr1tUCZh8KYLJm++P1WqU5UX18nJQbYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794831; c=relaxed/simple;
	bh=nc1rQH/rYDotONc1ZBxpg++WUYmfI3UMVOV7TpwVu40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cEOn4C53+TiOQg4SiQuGBnY4PuEVZIdVg0f62oe1/F7wHzY7QBeYsSovScRix4JDPlgNwb9N1VW/MVBC3QeX3PxxEtOdlFQVjgIefgXAeSUwvL8oLSKR3ZrNIb27QH6njSSp/BM++sDUL9uZ9AXZM/sU23cMzKDEjt2kvVFFEGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m0/WgrTO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m0/WgrTO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3cef6debedcso2150731f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Sep 2025 23:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756794828; x=1757399628; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amLWctIAuH5+/Kdk4fBpM4tmLqupAEviAibXHUsY0lc=;
        b=m0/WgrTO1BQscX/cyACNxSxbnz/ubCo8FAVm6qRaVJrcwpT4uKGtl2APTSllg54268
         UK63s4N0eQLgF/8P1JaFAUSoCzilxJylU7z3WQphizthMEfeNhuzKvp0jfVCuUd909PP
         5tFWKOSPKC40nsASz+NbIynews6SZYetBYwBBdG8Eo2v9z8UcOOf8MRYz+SinSEijcQp
         tDmTqQP4kNBdD6MptsaPKemt+FzkUG+4vlT77xKk76pzdUxqb+FelP6YcPwnBzttak4e
         xkFfVIgMo4MgFaicLO4zbMkNn+XmqDQa/rQFWamHEdObndg8WLdH/vH5nqhe8pIrwdiP
         wiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794828; x=1757399628;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amLWctIAuH5+/Kdk4fBpM4tmLqupAEviAibXHUsY0lc=;
        b=fKbZR2kyFEU+BpqQKX+pyLd8eFnQEwRKa21EW0EWTVqHTkdNOqPs8pXbqBqjD5G/U/
         QwvpEB3G9Fj6HQJkYrZ35rice+Jd3LD7XBlpR8X3sL89s/IvaR5DoB59ik1FNgYCRd2u
         5UDXhuTAa0uCzP/7sJtGXjNtCTFyINSFgz2IZLSw5PKDWGugWZBcdPLl1/eBhCTn6Dyr
         Kq/BuraAUFlEduDeQiBbCO+gVg6/M07mZlOEe1tnLMEmcUUJIwUgEhcGHBGdWy7bAUBo
         PxLZ0kEShK2H4hY3GT3B8KehYFaeTwc42ljT76fYhdkwY/uNyAW/vB7QSLJyz1VIVRGn
         +iHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHcHddPcXxALyF5XK7nVXB4i5ATyb8mLkMgTkJb+eKFcOmfZReUrRfmTKzgjkddtpxHXdAbMqygHXsKPGXRoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkU8+WjfyIiTZ6YyfwD04JKlGExk0Fiej4nN5tQ7Vs7XNaiCxj
	CJTGaKN9iESj7hU0Ww89UrMJ1Sp7M0Y4y/cqSCGNPfgY7eL2Y58j76n3Ly1Apz5SrRU=
X-Gm-Gg: ASbGncuCREFzYztHPfD5c9KnWvjXfDCcp3/Nehr/ULIIIFWTafzL/O+Ob4dqHCBrm+7
	hYwstOQ+IIZqDWe7RG1vNmKLE7mvJi+yxo/EzgBn/5wxmQ/9gsVAAUtRYfSNA7ACxMTseYjb7dK
	dVvGPTnMW+97trSU9RDI1UT82IM3IYWYkV8LjsHNnHy6HByNixzufi1QBfrbCpK07lDNuIAL8Tz
	QodGGuhkjHZUiTtzt8O52RGm0RRFZ6TaSiIj3m8V/3wmYwsmYDCmQZAIWNbTunploPKdSBKuOs/
	YBRz9br5TMG5Crl0Fu0oSY4+ypJJmO+Y6qXXupsbGckEYJ/7dne7Y7kTKejXLfYk/lgz6jA/7CL
	cIlgywYDcYJkN5kAA9Lb/toroD4U=
X-Google-Smtp-Source: AGHT+IHTaBzwQXFABXTkZLj+3H8VXua+1cr4mYcGe2aPMJa4T/6ZSD/WOz5v96oWEJ77tcsJ6WdpaQ==
X-Received: by 2002:a05:6000:18a3:b0:3ce:ea71:29bc with SMTP id ffacd0b85a97d-3d1de4bb61amr8138742f8f.33.1756794828243;
        Mon, 01 Sep 2025 23:33:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b7e7d23b7sm183255365e9.1.2025.09.01.23.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:33:47 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:33:44 +0300
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
Subject: [PATCH next] drm/bridge: synopsys: Fix an error return in
 dw_dp_video_need_vsc_sdp()
Message-ID: <aLaPyJrFsSFuqC1R@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This dw_dp_video_need_vsc_sdp() function is type bool so returning
-EINVAL means returning true.  Return false instead.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 9bbfe8da3de0..33be4eae2b20 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1149,7 +1149,7 @@ static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
 
 	state = dw_dp_get_bridge_state(dp);
 	if (!state)
-		return -EINVAL;
+		return false;
 
 	if (!link->vsc_sdp_supported)
 		return false;
-- 
2.47.2

