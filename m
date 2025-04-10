Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EB61EE004
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302321; cv=none; b=pf5LG9dKWLu8Pel6/Gg3w9xQSQhgGYV+HXbSsln+BxR5y73crCe7wDyajVvvdQ1oSXA3ph5MtFBK35Rr4F3Hiknpr9boLBSeN1YS8CjhcE+cz1GRyS9JnwYs0P3tDh5/BvCOPVzfR5uuBSYMnrXdq08uFzcYeptLLvYbJwQ3yxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302321; c=relaxed/simple;
	bh=Xyqh31/up32k9QyjvOp1tbHBRtZxHnBYUmmh3lPeV3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gs+EBk4F6t6aiQ6uAwPcG+lwD1fLvbxDlM9ng+Ho9sewcf2vCnsEB3rB2iFSb+ntcHustpQKfKBCiALoHvLCCDq25gpY+j6COuwAedVD/DywpLrq2ynGiv9xkpBSCnKsMVE6ez4GL1ea80SNR6Eb+Rl0oNsnU6hNxUdIKIxkSeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ineRWtWX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ineRWtWX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c266c1389so655221f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 09:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302318; x=1744907118; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wB7GpXUjol0KQ/YbX53LBVb2Ev80ElCPLnkY+8Zk89U=;
        b=ineRWtWXQW7mvtsTlMk6+UVf38cq23wMxvihzK7sCHY+qm6x6JJsG994OH4HzFeruY
         P3IB5HIyR2d0DaKYeVZlYhJGqYSWN8JgK3m9UBSIyPFD8I+D7pZY9JVI8qeQ0pbrDhVu
         LTZU3q9S9xD8zF5om89+oRB6cwYoyAbnh6QhwUNPPrjAz+L7kkcwmtVBJfJ1lpV8OW4Y
         RV7+fdra4lWO0XVH8yG6CK9iWb18iHuUZNj3BaU1EjR7vFqH9lsuFNL2cZIsLNt1ha7F
         1nzzOe5fw/gc15YvscoFdkO7twPQFYmp+0u77le3tUURLG9WNyuGn2kVGwlCXa74YjKQ
         4bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302318; x=1744907118;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wB7GpXUjol0KQ/YbX53LBVb2Ev80ElCPLnkY+8Zk89U=;
        b=ARgJuqspIWenP+Rc3tdYOKOMJLlT/IphnKVI1Mifr3SQag0XhCnESjtZlFSFGE2pKQ
         xnBXPM6pIO17f+dXOjW41QKTI6l1JmHkvmkseWd567Zc8lFj6bByzWDhwGcj+XmWAx+1
         s+0e8cT5BKRVQpbcyZtMFgQALGcGDxV16s7TUT9pWTrjUAkBMdZ2XEty7I4ooSmqbbZC
         FZZnHMwY0wEG9OOwk7x6Gnb0E+quIzF0jwzg5wLPvEez2A1V0+O6XTZepsDl5/sSiVRx
         bv0nXwcrYKcF4er2oOd3lUyMNPQeJqnIrO9UMrpXly/UY3SHfrdDrIhQwtU9OYvB7Z2f
         mLOA==
X-Forwarded-Encrypted: i=1; AJvYcCUto3YdGhFB0PRK0IcnvB1hyByAJ44UAINR4qZOXsObE0cr4bEOyFVY7cLT9NaFca+weDUs0bo6+QetCHNenqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwluSJbwxztxEEQV2d4YczPxZJvjfC98ZmK/dMuVPBlk9XuN9p8
	mgPf6L1D0xmuxWTaDswlBM+KmK5xcupA1qOBz4/qUsFBKDBJr1JWOXM+8DlUsv8=
X-Gm-Gg: ASbGncu/Ez2A6I/BJ7kiqsDu3UfBgRkTYBzzGx+hVhTRTeKsJZ6ffcsCKGq4WMNNXoi
	jerAUFUYvXkWqUUzc/Q2FNBy/veBW0kNGEJosX8l1MSbmj9q3WOVOCnc8asyaoXcYCX97W+6/A+
	scQOJZqakfIMY5c34bzLTbrbUp1HneapxSgbEBCGkCvdZcaaKkBbIkMlKSlyF9MnausaoolCdfP
	3QACfNOC3Ez3T41nCwjZuq+SwH0QPUZycT4YAl+L1Rra5QLMIpqR6NOJylF1juRVqotcm1RqlSx
	LB6rd2HNjFg0oXs8yEQtCSrXFnFhrqhkT3WGKZr7P/B9iw==
X-Google-Smtp-Source: AGHT+IFeTZmUdQ2vt1x1tnJcXZclhQ5dTgbaFR30GmeNzwyzvcpuB5z3WB17x7rprpf4keTp6EzbIA==
X-Received: by 2002:a05:6000:2903:b0:391:4999:778b with SMTP id ffacd0b85a97d-39d8fd522b7mr2970676f8f.28.1744302317763;
        Thu, 10 Apr 2025 09:25:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d89362fd6sm5398648f8f.16.2025.04.10.09.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:25:17 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:25:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@intel.com>,
	Imre Deak <imre.deak@intel.com>, Lyude Paul <lyude@redhat.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Abel Vesa <abel.vesa@linaro.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/display: dp: delete some dead code
Message-ID: <de03fbc6-ca8d-4d3d-b80f-d1235b2b346f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We re-worked this code a bit in commit af67978ee37e ("drm/display: dp:
use new DCPD access helpers") but there was a little bit of stray
dead code left over.  Clean it up.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a..f38b4dc14e1c 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3570,7 +3570,6 @@ EXPORT_SYMBOL(drm_dp_pcon_frl_configure_1);
 int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
 				u8 frl_type)
 {
-	int ret;
 	u8 buf = max_frl_mask;
 
 	if (frl_type == DP_PCON_FRL_LINK_TRAIN_EXTENDED)
@@ -3579,10 +3578,6 @@ int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
 		buf &= ~DP_PCON_FRL_LINK_TRAIN_EXTENDED;
 
 	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
 }
 EXPORT_SYMBOL(drm_dp_pcon_frl_configure_2);
 
@@ -4044,7 +4039,7 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	ret = drm_edp_backlight_set_level(aux, bl, level);
@@ -4192,7 +4187,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
-- 
2.47.2

