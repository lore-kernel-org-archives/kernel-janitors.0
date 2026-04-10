Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1640B37C0F2
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815935; cv=none; b=gTcfiFwS0n5EIw+sU6F+MPXYzxpsmTSHgG80hyfP/NU1sazI2YtxfQgtr/u0MgFqw0OtoWOzjtSYuk61J9O5jJ/PeCyHRdxf1whYYurlz4lmLg9lU0Q9bAKmf9daCohJFRBvbefmOp8tamBdsqhxklnrYtTelsLTaAmhsBgqcX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815935; c=relaxed/simple;
	bh=gT+USVlr6D6SbUBhI2YPyiIlQCKMO43Y6KsB/Rb1ggE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bxd3Ywery0MAvs7opi7GUf7G9mJnPblknvHTCyNQmHpWK2RaAuMKYh8OBtqJn8FN1NHcj7CAIHrzUlge7cs9NLWCM0ATQ5dyv3jSrPccftDgFl6bOd77x2nhV8gYieB08S3FUNcWr8jo5aLrp7/wzp6GQxGoJvOFdBjj3TEb3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fn09RndM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fn09RndM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso29156065e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815932; x=1776420732; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=22v578vS3urScHwXah/EGJm4oQZ5Dq0jM06OD1zJsnE=;
        b=fn09RndMlPAdhKuXtrVWcfcr3wtxQjy38dLA/5yOVIpzrMuWuatelm1dRHUe5ZdLnm
         z+H/eaYea3W5cblPlyOCnYL9tahzMUbrnRgQV/tjW9NNs7fkMyTBg2GCdy5jKq63IIeI
         82jVRXcOkjyBYlzDWiaCF4XY1SKWUWiwlN4WIYEpUKxSinWBCy8/QrHDcuiMRUmgifQn
         x/mEAoII6sPxXE4qUMlzlqZUOJoAvk3aRzapih+3eFbLntqnInn+dZcUaqhGD6duESkb
         qrSYkOC2KHzB+tTaD2AQ9XbtIc00o8J29hEdxqG5kJaBvHxsP4dAZRqzIofn9jcUjf3m
         mdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815932; x=1776420732;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22v578vS3urScHwXah/EGJm4oQZ5Dq0jM06OD1zJsnE=;
        b=sP6nehpCZtGejAPCWOGWB5ukpyt328Bb3tk6GU8+9pgXRVaWYlnv0gWXCdPiYuW2BD
         fuyis9gubiXYuaId4mlBFEbIiAJUpr7K99yrQUXIGN/NLSkNnRKocgSWy63+RwqNpNF4
         3XEK7S+/Lidn8RogKK6wfg7190rUt0x0RHoHc45Ewc+d6AONyTuiH3dgxpK4rVw3UyOl
         AaPHMEs0QrN7+n/ieiBLqsCZ8Di+zg6qEHIiaxkFNjCc0BE1l4jw8uFlebdhSI71o6CH
         3j1/B+EheUfRwBS3R+qNgo2Vsn+RF9bwtRr0eQxQLkzM2HwBPPsxCApucmtcWIo+BGX/
         7g+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqGkmKjaLJAMZqlSK37sw03dSYmSyUC//PQ4Q8fhAw1t306xnFwO6pbynWv3eOj/kIb5p0E1eMOfnfDVlaZq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YytijFaCKVjKy9z28gH+MjGGuV5OOjO5Lr+snp57B26abEAlDz5
	DA7l7WJl+qRF7GGkUcwOrpG/HN46sQ5VeAU9abfURRieq8FRCh3cI6pj
X-Gm-Gg: AeBDies5RHOR+vegvi3hZZo91IeQSxTz+UdCjP7HukP7HsQrXGoIJNj6F+EOF8ZCgSC
	SA51531iQvYwd5AwhiJ0wmB7CP4Qh3FGN07816LK9t4zWeBnrE759UZs+MLeIqHNhW1WqtfLTJi
	zp0cdCbbMBeW0KChxEqndW0r7E4Sys/aSUTG3eIeHCub2oQe3+vaj6W8yEj8zayinEaulN8B9Bf
	T0f+qSdgJsP7zguEOJi9dE2B/8BOKQhg1T07x9zBwO+1JnVUlPykQSU9ScVEEUaBBwUOZnOb0/O
	IsMnhhr5rQQqOBd3XihqHVEZdvtTWwD+IlrQ+w57uveQQxvQeNGikcGBKSvQAv4TBGz44KUEP4+
	WGLsZCgl+VyeCCgO/2anFKT4F0KDSGCGANZ7Tne/wq02cRKAjG+1RILIXcDfvcQNzGXJaybuNkS
	tFY1GdE/1WCT519A6qhH8=
X-Received: by 2002:a05:600c:3ba1:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-488d67c704amr32809435e9.5.1775815932319;
        Fri, 10 Apr 2026 03:12:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d683c902sm17472615e9.22.2026.04.10.03.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:12:11 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:12:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/panel: himax-hx83121a: Fix NULL vs IS_ERR() check
 in probe()
Message-ID: <adjM-IhvtrghMDnB@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_drm_panel_alloc() function never returns NULL, it returns error
pointers on failure.

Fixes: a7c61963b727 ("drm/panel: Add Himax HX83121A panel driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This email is a free service from the Smatch-CI project [smatch.sf.net].

 drivers/gpu/drm/panel/panel-himax-hx83121a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83121a.c b/drivers/gpu/drm/panel/panel-himax-hx83121a.c
index ebe643ba4184..bed79aa06f46 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83121a.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83121a.c
@@ -596,8 +596,8 @@ static int himax_probe(struct mipi_dsi_device *dsi)
 
 	ctx = devm_drm_panel_alloc(dev, struct himax, panel, &himax_panel_funcs,
 				   DRM_MODE_CONNECTOR_DSI);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ret = devm_regulator_bulk_get_const(&dsi->dev,
 					    ARRAY_SIZE(himax_supplies),
-- 
2.53.0

