Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0672DC4167B
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 13:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbiKONQe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbiKONQd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 08:16:33 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41836BA
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:16:32 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so10239052wmg.2
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vauApsbc4UItGo8j86KlPEM6J2rbnw+bhzYXpI7YoWM=;
        b=isLPesBDOxojosEmqtH37oSLsnYQ+jBvATAQRBQCEEE7sNeleCbC0h30hD94qv2TC8
         oiNkbHcykai/3l5VZvnw3WKaReQwa3PSZ5U0oqfyKYBTMcBSkFTDfKxTXoyzwGGGNTf5
         DSp9iZ4p1iRFcas/U1VyWFjwym52luX8ZlyM2LieSuwWGDKVd4pz6cgeq6s9ojuWqJGJ
         1+7dfq0sPaMt27W1d3AGiBGAp1SfylFopjH3/cJoYUdRsbSn42EJ9/lVP+L62EMq7TVu
         d6H/H+587hDQTR+PKhUTl2o6k4qFlaf6Bl0NLt3r8MekefsZFpHo0JNdsO8y8fao7zA3
         lYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vauApsbc4UItGo8j86KlPEM6J2rbnw+bhzYXpI7YoWM=;
        b=03qylv8bKnvD6PsMp/sk8HWUx6FbxMKmmo99HcXwwi/ydAyKxs3AeRjFq8VBGc8/Xe
         QW4WSUCxBeKyxK+jbNX97Kxa62Jyu4uM0i1W3t0ui+tUTcRzSwaLtFoiAY0xaz0MIpbX
         JvLvvKdQqZiqIQYYuxWUCF2zBAG7Md8KeOb8arelxM31NQCj5GU285FbZ5OQ4nabFx+5
         K5wQXcjMUGIUGtyhMIcuG6ZRoUFzAkw/j7rQH/hj4veT7mBv0ot1aiSVrwYAdsbJR9uK
         9OEfyoNVzK6LklUOKkBVUh41C3+kKT+YDefzGptHZN9ES1gcNTFNtN+/Q8AHh2M9nwvm
         8YrA==
X-Gm-Message-State: ANoB5plHlRQrYvivht7pRvSEnb90VEAIkbx/Wv4pUjv8bSZ27GlBFzqS
        AU0fv+Zhk6HcXZgbJ0DefNQ=
X-Google-Smtp-Source: AA0mqf7caGDVbLS846G0EB5PU7FYFbjEvGpWyiaMSjJd8HX8o7LSMxw/oKEE2kXNf9icY5Gm3sWPQQ==
X-Received: by 2002:a05:600c:212:b0:3cf:cfea:904c with SMTP id 18-20020a05600c021200b003cfcfea904cmr456990wmi.33.1668518190808;
        Tue, 15 Nov 2022 05:16:30 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a11-20020a5d570b000000b0022ca921dc67sm12422379wrv.88.2022.11.15.05.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:16:30 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:16:27 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/gr/gv100-: unlock on error in gf100_gr_chan_new()
Message-ID: <Y3Jd0JYhjPe4wTXh@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Drop the "gr->fecs.mutex" lock before returning on this error path.

Fixes: ca081fff6ecc ("drm/nouveau/gr/gf100-: generate golden context during first object alloc")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 5f20079c3660..24bec8f8f83e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -442,6 +442,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
 	if (gr->data == NULL) {
 		ret = gf100_grctx_generate(gr, chan, fifoch->inst);
 		if (ret) {
+			mutex_unlock(&gr->fecs.mutex);
 			nvkm_error(&base->engine.subdev, "failed to construct context\n");
 			return ret;
 		}
-- 
2.35.1

