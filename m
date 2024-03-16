Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DEE171AD
	for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710581296; cv=none; b=k3pWRg2UuHZaXvV/vgOmpP4Z5mtSDCClZy3V2IKJW4wFxjkOnLLa694NpAOGTUVcyudT9jJy4FJ9WQJ4PKxopXBw7XdosSSvUjkxfabgtrOMJ1M1b02LYlWy4lcgZ15NCPBWgGZM867iJgaN8qkSb43QW+IaNK8muhzd6OorjxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710581296; c=relaxed/simple;
	bh=Sk3IUMq+ynWrhub4+s7U0qctho1XK9mVRiKtEWsFTG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hwOS9L/A8XsR9XAwlS/ustE8dc2MP5VZmByLGgOJn518koXiqyy9YSNgmyGiz6l28hXYHwjpwyL0zMVW8EnMZJpEi/Hhb067PcTlwAVh5fItkVe3iJ1hlVe8nJtXKpkXEFmRfwEuOUnBkrMMJ8wzEoxSdr7jDbyYwirBslU0gbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDu55L3S; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDu55L3S"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513d23be0b6so2867563e87.0
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 02:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710581291; x=1711186091; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aohr4d7BClKxelEDFFKHCRuY2eGHwzyMDzY2KtCl00o=;
        b=vDu55L3SUpAwQhATy9P+ivNW+VyK+Gn7qM01kDVzqJ4lYauDbTmO5zsQraO76vRu7/
         2j4OQIdFeUIbkIOTbQkj2asMQN0Ihm2c5Sg4ar9ljBUt8P3Ddf4CpEY34qgI2gQExDRe
         TashIZkLVa3YS2Q7QCRkWDsf746UFfcNxs0MYFaSF8wXBFa2OutzdbMxxoCB0ToOLv9c
         F2FYt4QIks5S4BZT8LsL4AgUpWadrLSlawF6okpu9X6PgzyUrzP55iw56QXw1J86Cfym
         oJ7CPZ3C9eAcmEgSLIUpg3p7iCLVOD7hO9ZKzkFzbmzVpShVmPupgRGDLY5UnETdoAwG
         9Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710581291; x=1711186091;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aohr4d7BClKxelEDFFKHCRuY2eGHwzyMDzY2KtCl00o=;
        b=heDeHjHDT+BXH6Ojj+yeX+7+J2NL05bjw04VGWYPDuv7Dl/WBGLeKVn9A/FVn+t0G0
         bX1pVxhdbos7+qHsvnUVR7flI1kBL7M8ZvuXLkS5WeTCJWJf5Lz6wdyrFGbzC4vOwFle
         DXmY13P25tKOGEUJXQgyTi4GvyIV76nKeK0UaZXILdRnHbcTCU6AUTBKc82x3wDmcaae
         sKn/wQ6xZztVNGAUDWTPj7zkvBb/BMON9+67VVzWVarj4++YmyFvyd0rYYIwEnz9jiMT
         Tyy9ER6CHce9/4VTNQAcxOPVQpoVzTrEbX7uEenOrgCYv4+rDZMFL2NgdXSRQG5QO8/V
         hDMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOCcQakh1c1GtYPQFaglQXbLNfYMKHgOsLBBp5uM/wnQly7N9y8myhhb7wQ/XCM2vFCxLbQp3gQvCDM3MowP/M+nUcbVUIyywKPdtUd3qE
X-Gm-Message-State: AOJu0YyMOMspBl82zGTe61OKimYbYj95hyEpeD29+TtNKO7Bl69IfUe9
	DoU3zFh3UjcPYF6m9sxCSxv5y6hWqSVQsDzE7JdfRdWQql67/yv48YHMBFmwSUo=
X-Google-Smtp-Source: AGHT+IEcnp7qiM6IXTp0ox63XBBssfGbXKm5O93H133J9J0QTjrgFwKlcFwMjSWaSlH8P9wUdPdZJQ==
X-Received: by 2002:a19:4353:0:b0:513:cc34:342a with SMTP id m19-20020a194353000000b00513cc34342amr4706454lfj.14.1710581290898;
        Sat, 16 Mar 2024 02:28:10 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c4f9400b00412f8bf2d82sm11391125wmq.28.2024.03.16.02.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 02:28:10 -0700 (PDT)
Date: Sat, 16 Mar 2024 12:28:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
	Charlene Liu <charlene.liu@amd.com>, Jun Lei <jun.lei@amd.com>,
	Alex Hung <alex.hung@amd.com>, Daniel Miess <daniel.miess@amd.com>,
	Sung Joon Kim <sungkim@amd.com>,
	Yang Li <yang.lee@linux.alibaba.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: delete unnecessary check in
 dcn35_set_long_vblank()
Message-ID: <56712ad5-ed41-4d64-a317-10cc1275137a@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

"timing" is "&pipe_ctx[i]->stream->timing" where ->timing is not the
first struct member of ->stream.  So it's the address which points into
the middle of a struct.  It can't be NULL so delete the NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
index 2e8ec58a16eb..87cfd9f1cec9 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@ -1411,10 +1411,7 @@ void dcn35_set_long_vblank(struct pipe_ctx **pipe_ctx,
 		if (pipe_ctx[i]->stream) {
 			struct dc_crtc_timing *timing = &pipe_ctx[i]->stream->timing;
 
-			if (timing)
-				params.vertical_blank_start = timing->v_total - timing->v_front_porch;
-			else
-				params.vertical_blank_start = 0;
+			params.vertical_blank_start = timing->v_total - timing->v_front_porch;
 
 			if ((pipe_ctx[i]->stream_res.tg != NULL) && pipe_ctx[i]->stream_res.tg->funcs &&
 				pipe_ctx[i]->stream_res.tg->funcs->set_long_vtotal)
-- 
2.43.0

