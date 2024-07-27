Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04194A05
	for <kernel-janitors@vger.kernel.org>; Sat, 27 Jul 2024 05:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722058341; cv=none; b=bPG0TsTa4NSByYAJhCofSehhJbVjQjq6c+/kis7YuNJk3bhmxlzbUqYUv53mXeRoshIVHB5ts/iZZVLA3tbVot4Yo4gra61nMR6eghoifC9vR8NIV82kaVns9H03pqY105sHhRfIept/5thPwtl6UEMj7TjoDqSvHLiWUzPzUyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722058341; c=relaxed/simple;
	bh=GEANmLRl3pd78CbWRm41BOno0EJdXj6oN+vaLlcrdT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KqjBXHK5x01fygw7srhF/UsDOl+NSRYBvCBQdxXXnSs4RR+YPax56IcctSav5NaPZDMS/d1ePX3YpP8N4Ic0wxc6LYSGO1kRN63FcuQcPH8s4SxJe6As+ycwfT5v7i4zGmqAcdWlyqbpQgmudtZ0IQwo/VP/L2CpyYLox62CCXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MeUtVqCH; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MeUtVqCH"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d9e13ef9aaso1040840b6e.1
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Jul 2024 22:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722058339; x=1722663139; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ll2tSeXkgEmDF6KKRHBsaNEm0CYvP0CwAGds8QRblZc=;
        b=MeUtVqCHUSjfz0Op/DKO/rkaMvO2DUVbsh2ALrMNfZfJQg2pE/uzT0D46UmKqI0lhr
         kCdVjUWMgAGlT9/srtA8QGR/o4AMi0vM3zm2kh2BE5PG7rWTIehNTR9J1iARp58ForTk
         Z90A1dC6IozAhZcW6XNjJiquIgP/42JXJ+a+ut7AI9yGv+3lTG600WUBhbZO54D3i3Dx
         Lluae7JdGPHLVOMxhtG0gUNBe/w6A6XYG6eIRNr+ol8NCO3lZAtnH7ky0usRuy4FflCS
         Jdhscb3pjoPkwxvR4VSnUsDD74AOxxPVVDpcFZ4NAinV7z6XJ4seNSU5kSYWN3zyl8Bt
         /EvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722058339; x=1722663139;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ll2tSeXkgEmDF6KKRHBsaNEm0CYvP0CwAGds8QRblZc=;
        b=NVZV9MDpSgUQEv7czSzlcSU7VKWhp4EZZUBSQ+DmvxoXVLYlV0UeHyJB7Qvdlz+79v
         ee6juvxDLx9UxOCc7CPwHFBw2ZbBUZoNgPv4U7sshiKe0neQstsmW2g5G5RFm5zEQ6p5
         LrBT+nyo++glMi9x46cC1tmkKOcb7pfynBxIJgMXhrTQsu7eR2pNubq8BbwIGBx1iZcY
         IPO8wQhXo/Y4ATgrkTJ8HpLew8GL0ATQQIlEPW6OFLj1HOYEr7WD43TBJLZ+34aezrF/
         kLtXxUAF5FwNwzspzJqPllr8074r9J6rRoq0Z0KwjOe11azq687cIuXiWqJi2UJQkHVR
         UIhA==
X-Forwarded-Encrypted: i=1; AJvYcCUelVCp3Olm/ZT3bvkp0DbNfUdmrL9i5SLFYbYzG4EZp/xBsGEOVQCuZRmD4x6IHshbbFQXhN8h0qvk8mMcIyQHWJFSVfZgvBi6ONLvT4di
X-Gm-Message-State: AOJu0YyUfoJjY/aqUdZPrTZxBXdQTUbDmXSH8pCzn7MZ0j2W4azdt2p9
	6F4aXXWwDeHpUUOPvdts+70n1c4f7oyA9IZak7MosPJy8ro8FwRLD6eqxRP+P0s=
X-Google-Smtp-Source: AGHT+IHUCPIsi7uCYJwSWeWo164OHgRFN3CFwvOwVNjz9dDYRNJ4CXpR1iCMOHy3FSP/CtE+ihndVg==
X-Received: by 2002:a05:6830:65c5:b0:703:802a:98a8 with SMTP id 46e09a7af769-70940c0eb3cmr2782964a34.9.1722058338829;
        Fri, 26 Jul 2024 22:32:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1cb1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7093070671fsm1112735a34.21.2024.07.26.22.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 22:32:18 -0700 (PDT)
Date: Sat, 27 Jul 2024 00:32:15 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/plane: Fix IS_ERR() vs NULL bug
Message-ID: <83d9bb89-1a16-4ca4-80b4-1965fca498c1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The drm_property_create_signed_range() function returns NULL on error,
it doesn't return error pointers.  Change the IS_ERR() tests to check
for NULL.

Fixes: 8f7179a1027d ("drm/atomic: Add support for mouse hotspots")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index a28b22fdd7a4..4fcb5d486de6 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -328,14 +328,14 @@ static int drm_plane_create_hotspot_properties(struct drm_plane *plane)
 
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
2.43.0

