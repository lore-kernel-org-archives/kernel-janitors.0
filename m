Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14B2EB64D9
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 09:45:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjFSJou (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 05:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjFSJor (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 05:44:47 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E941683
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 02:44:46 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-311275efaf8so1895472f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 02:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687167885; x=1689759885;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSP09R2WaLxxohUJ/p3vcrxW5xitvCM8OwtEijG+zc4=;
        b=W0R8EmNyXVsRacDc44gsxRQa/YhhdNa2z8F0AeJdc9qwWNwpB8l/vGm4FYTLev0TG+
         yf8wcc9/vpvjK+roKvQq70CCXtwxKZgPA6+ynmbT3foP0+1kfN+FcQRMCRXZ5Ya+y+gD
         1eHf58RK/F3f7jOrfVF5kmsxdA7xq4NU1vfDpzvKKux18PkgCsL89u6F8SauowS9DKyA
         XFdqUbwP4jrKaXlgMCWpOm32ycHGQyyOqybcoAPV4xHtq+a8KVxUnunkEPVAtI59gkgj
         O1+m++im3NrdIJt7/eSKk2DojWwZoVoC+s4nDSOajXwVyefMl+HktnjZ6zUKyoys+LIv
         5rEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687167885; x=1689759885;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSP09R2WaLxxohUJ/p3vcrxW5xitvCM8OwtEijG+zc4=;
        b=bB9NL/xll6EBzF5Dj87pxQ/AtCRMF4OlbSQcsXwSt/unJ7eyPBF4LKr59Dob7EvYsa
         Z7yxmWUwaiNVc/hcuDd0pUBQ4S6pMBX/bNCPe9+FP9P6Fu55bqIs54cSUamMtuvvj7Zi
         nnk5Bf6zOr/bMNPDG97t5uRKOIud2sVrvA36LpT6g/SxnPfH17Xir4Y8ZrJlN9Wh+vCG
         jMCVESM8FGecaity/2ynmmeI5dDABL9rh732Cj0Lm8mPeCy8cATaLTo5dGj3PF3HC/9N
         n/U5s8LTLPEe68x6eN4JUzmJ4TvraQCFclN3wYekoBudvhZanRyODd/zb0fwR60/sEjC
         gt2A==
X-Gm-Message-State: AC+VfDxmc6vnQ5XgvneLUrHtVDIeCTDNV+FhQ2E8rwEHaBpp1zRVK9YU
        ZmmNn/luySc8to1WxWsiXKmZSg==
X-Google-Smtp-Source: ACHHUZ5Zg5Z8LszP8AT8/SbmuWuU1V/RGxNU9GmhxgyQY6KcTSaIYtGjr5UlnR6za/yLFaeXETkP0g==
X-Received: by 2002:adf:ea90:0:b0:30f:c5b1:23ef with SMTP id s16-20020adfea90000000b0030fc5b123efmr6215351wrm.41.1687167885502;
        Mon, 19 Jun 2023 02:44:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d43d2000000b0030ae93bd196sm30902612wrr.21.2023.06.19.02.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:44:44 -0700 (PDT)
Date:   Mon, 19 Jun 2023 12:44:40 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     David Airlie <airlied@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/sprd: Remove unnecessary variable in
 calc_video_size_step()
Message-ID: <e3f65945-4a93-4d4c-afd7-8d68586ea591@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "video_size_step" variable is never used so it can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/sprd/sprd_dsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index ab0e5cce7adb..adeff6b2fb4b 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -324,8 +324,6 @@ static u16 calc_bytes_per_pixel_x100(int coding)
 
 static u8 calc_video_size_step(int coding)
 {
-	u8 video_size_step;
-
 	switch (coding) {
 	case COLOR_CODE_16BIT_CONFIG1:
 	case COLOR_CODE_16BIT_CONFIG2:
@@ -334,14 +332,14 @@ static u8 calc_video_size_step(int coding)
 	case COLOR_CODE_18BIT_CONFIG2:
 	case COLOR_CODE_24BIT:
 	case COLOR_CODE_COMPRESSTION:
-		return video_size_step = 1;
+		return 1;
 	case COLOR_CODE_20BIT_YCC422_LOOSELY:
 	case COLOR_CODE_24BIT_YCC422:
 	case COLOR_CODE_16BIT_YCC422:
 	case COLOR_CODE_30BIT:
 	case COLOR_CODE_36BIT:
 	case COLOR_CODE_12BIT_YCC420:
-		return video_size_step = 2;
+		return 2;
 	default:
 		DRM_ERROR("invalid color coding");
 		return 0;
-- 
2.39.2

