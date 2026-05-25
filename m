Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3413D88EB
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696262; cv=none; b=M3eFcCTrGLHVf+P9uakgVnBwTv03TxJrVnUGweHKbKyrXSYg7C6m/ZPyAw6JcmsqYDHKOwafHdxMlMAvJ7AsNYCb++W2PQeA5a3nmN2iEUr1QXCP7Fh7NRGlWup9nMTesfPQwK36LgsPXKH2OoG3V0y8dfXZqC6PMVLtFsrteVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696262; c=relaxed/simple;
	bh=i4Xac1WvYFrHO/9BGwsIB1qsocvvzuES/i6rtZSMa0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uJJROk2PTiNpoIGyh1bHCw1x6VXiIg/c3bqookyDZXRXT4fK9RBO/qBPn3lQzDG4Am3XeQYXsMHmjIOIvIIDhLxte1RvK6rCnR6jV9Jw6eqbAjs4mYwSltCaV2swf58SYBvzd5FTJhq06qw/j6wcT8/sVpJeBeE2p80WDdsZsmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7GK92Qf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7GK92Qf"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so6767688f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779696257; x=1780301057; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e4TwWx9Jkv5+tXBeIF9TrY2gJYisieGsYYHEykccDJM=;
        b=W7GK92QfRmhNNU3hdEm44v1DLwg9Tupevg+ro5qWyVX7PCzsCKiUqTf0pFrURU6fKi
         l/dwpA84UHBU0JNnkiM2ioDQ3SQsPFerFyb25xgGpSZFlKeFXgHe4bKhivltG/skV9wH
         2672J27kL53U7PhU83Xpt/6344P895lEMHAn6OWs4idbynH369vt+jjCQbotGb8n+dqk
         yGFvXw6DSfEp/ln1HWFl00q0wHzoSzTzhduN8s3e6XgXv6YwKYYpHz1xd/1nwqUk1mS1
         BlJptNzo1xNYlQ1BjR2yaEvSl4mzF+1BKu2pLQGqQZe4RahOuR/xhGMob4fokxsduWqS
         beWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779696257; x=1780301057;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4TwWx9Jkv5+tXBeIF9TrY2gJYisieGsYYHEykccDJM=;
        b=sZwlm5SsdrZOZK0/L3UWBXipbNlyP7m14ua6rqRvm0FMMdPR/fGIG5cBzVJUnPn5y8
         RzmNrRg8/afqfXlj6YXgxItrrXzwlN4BVVBJ4THeg3i/2jB0esh9AEyOySBpG3jhaE9o
         oCIOcSDMMTHVBKSfmqy47TwvqfoagBECAfgXCPrCqfvbWbt+ZptO5YfTwpIgNvypeChg
         4M39iZwwx7+osFjEfYdtZAi9VGXMhOAx0S7LNrJMhFZYWhE61AaEei8Wz4micXiIeBtr
         x2+ki/+0uJGprcDeEHWSseiLP/Uw7d27q2i0u3a3Rt77NcOCN1r2PH1Cm3bP5tIye74U
         kxug==
X-Forwarded-Encrypted: i=1; AFNElJ8o2d6A3bs2/Fg80I5ZJSuJWOu699tJQPp25oVeej5cC0NyXBIV4FkP+1chAEdSMZibo9E2Ymh5yLUupSEhcOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI6FUq7YMOXH8I7mMk7b7hcJeV+6PDoC79/1BAb/Syxlbkt1rh
	l5vZa5ICv87fc3mGnLKvP43endmrux/Mb57xX0LvAGdb0szzpdwTZw+q
X-Gm-Gg: Acq92OEz8eR80G/bSskJVEH0x+HU6WUyQU9VdCwS0OweAZAo7riU9h+X+pZ9R5vrkg2
	WIG3bNphJPIO2YVborMyBPoDQV5wAr3D6RKkhh7SVMW3becnVzcapbjtzAbp99+WGpy8b1JTqBK
	H0AvwFqE1JuGLsO06uPHHfEElX20OJo720XTTvSOrYW7w33wXdCp2i4MOOCQtmRhDanXxfXnE34
	6Mp2CBOtJyph9CV8Zuji2ove/yN9oEoabBKwGRKF2aj7yYdVdAnGDNgEX2xj6HgqHMmediX/cDs
	/rD+Q27x6kpEGNLSDLYnm+A4+isp3NwVR7gLRk9rNCnX2StHBmKMrkVSFbnRo0PVncqPzFI3gYk
	T8b97PDUkoHUsN7E0GBqYJuiAqLhciWaOFLJIYp543PZStCMCKauFP5H3z0lwNIG67mWTnc116U
	gbOtdwHHDI4t4WbfZqwxnZi4hkKVfGPf9zKQ==
X-Received: by 2002:a05:600c:46cb:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-49042480f2dmr184665115e9.10.1779696256861;
        Mon, 25 May 2026 01:04:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d698fsm78263835e9.19.2026.05.25.01.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:04:16 -0700 (PDT)
Date: Mon, 25 May 2026 11:04:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Hung <alex.hung@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Ivan Lipski <ivan.lipski@amd.com>,
	Anthony Koo <anthony.koo@amd.com>,
	Lohita Mudimela <lohita.mudimela@amd.com>,
	Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
	Qingqing Zhuo <qingqing.zhuo@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: use READ_ONCE() in
 psr_su_set_dsc_slice_height()
Message-ID: <ahQCfcFVMQY4JGXM@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code has two checks for if "stream->timing.dsc_cfg.num_slices_v" is
zero so static checkers complain.  The second check was added based on
real life crashes so it suggests there is a race condition.  Use
READ_ONCE() to fix this more reliably.

In the original code we returns true for the first zero check and false
for the second check.  The caller doesn't care about returns so it
doesn't matter whether we return true or false.

Fixes: 21fc0ff38f57 ("drm/amd/display: fix a divided-by-zero error")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Untested.  Just reviewing static checker warnings.  I wanted a chance
to use READ_ONCE().

 .../gpu/drm/amd/display/modules/power/power_psr.c   | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/power/power_psr.c b/drivers/gpu/drm/amd/display/modules/power/power_psr.c
index 5ecb570c204e..92c0aed08170 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_psr.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_psr.c
@@ -635,22 +635,23 @@ bool psr_su_set_dsc_slice_height(struct dc *dc, struct dc_link *link,
 {
 	uint32_t pic_height;
 	uint32_t slice_height;
+	uint32_t num_slices_v;
 
 	config->dsc_slice_height = 0;
 	if (!(link->connector_signal & SIGNAL_TYPE_EDP) ||
 	    !dc->caps.edp_dsc_support ||
 	    link->panel_config.dsc.disable_dsc_edp ||
-	    !link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT ||
-	    !stream->timing.dsc_cfg.num_slices_v)
+	    !link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT)
 		return true;
 
+	num_slices_v = READ_ONCE(stream->timing.dsc_cfg.num_slices_v);
+	if (!num_slices_v)
+		return false;
+
 	pic_height = stream->timing.v_addressable +
 		stream->timing.v_border_top + stream->timing.v_border_bottom;
 
-	if (stream->timing.dsc_cfg.num_slices_v == 0)
-		return false;
-
-	slice_height = pic_height / stream->timing.dsc_cfg.num_slices_v;
+	slice_height = pic_height / num_slices_v;
 	config->dsc_slice_height = (uint16_t)slice_height;
 
 	if (slice_height) {
-- 
2.53.0

