Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B62C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 13:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbiKONQH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiKONQG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 08:16:06 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8EA428E36
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:16:04 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id a14so24217978wru.5
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDR217x86eHv/O2MIJhnIDN/LEOiRAy9N41xfhJ3Nqk=;
        b=YyWv9BqEL9CrEcH+u2dhpebWMAeYJ29kCNHj+Rk5fRm4KofEXDKHzUcvg9c2kwkf36
         dM56gfOKBqDYI2OF8FinIh1qM98PPgztfN6sAJE8INImFZ42TtA/1jo/aPLTGVVhwbHC
         dYEQbUMJkp47JbH6E5+LvJurNunoxC2uSnMhSkf/L8D0GXeO9ANO2uqYe8RYHOhJR17N
         Q02RCbKZNnBEu7uNz7ck0GRSDsB5BuvvdHRCznEi8XfYhSshT6lUMiVW7dU7E/FA8aiP
         /0pwjpAScfINHlPpH3wrCTZzAq6b080jjkPxGKjub1c11yrLO8us9FoP5fXs8WnTLpoD
         bUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDR217x86eHv/O2MIJhnIDN/LEOiRAy9N41xfhJ3Nqk=;
        b=5jiwpyvyIaFONPxGUnqard/xy51bjgHny7Yd9/UlekiOXC809HAV68/9ilnTzNNJT9
         3APg3kR2M1eqMIEZ0j/c88UWnEsSxFWfXb68CWDV54FcAfwbs4s+fQtXj/YTdHcBQclu
         Empx9aLsCyofkkxCq4eJ+eyP/BITHFOzEV0dAoH2IYy/ZvuIv4U35oSRnIf8xpKldK2Y
         jluGaGu0cMIu2wGABmQ61Rs3q0lYuBi0GbJwPauFed1SPhafYS2DhuAZERT4rsiC28Bs
         YpmWbbqtReEN3yGZRIQAI6GArbJOCZKPQKWVyFKbk7pRiJPo10stDr+T48I6ZvDvFC54
         YFpg==
X-Gm-Message-State: ANoB5pktHua0jO+gLOp39ePguPB2O2aL3nKDlPVGcsqsDlGDj90yVgbq
        H8UR0ZPk/+g7ej/3DIrXK4fNjiejdnBUQw==
X-Google-Smtp-Source: AA0mqf6anvzacpwGbfPmwCJwNcs0zplfHCs35EcuMnktxA5cZzn2SR5okgnQ2mmLJOdidn4tV5o4uA==
X-Received: by 2002:a05:6000:18c5:b0:23a:cdf5:3676 with SMTP id w5-20020a05600018c500b0023acdf53676mr11416313wrq.336.1668518163349;
        Tue, 15 Nov 2022 05:16:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v10-20020adf8b4a000000b00235da296623sm12429028wra.31.2022.11.15.05.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:16:02 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:16:00 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/fifo: make nvkm_runl_new() return error pointers
Message-ID: <Y3JdtQYrWonlhwW0@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

All six callers expect error pointers instead of NULL so make the
nvkm_runl_new() return error pointers as expected.

Fixes: d94470e9d150 ("drm/nouveau/fifo: add common runlist/engine topology")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
index b5836cbc29aa..adc4a9544ebc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
@@ -399,7 +399,7 @@ nvkm_runl_new(struct nvkm_fifo *fifo, int runi, u32 addr, int id_nr)
 	int ret;
 
 	if (!(runl = kzalloc(sizeof(*runl), GFP_KERNEL)))
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	runl->func = fifo->func->runl;
 	runl->fifo = fifo;
@@ -419,7 +419,7 @@ nvkm_runl_new(struct nvkm_fifo *fifo, int runi, u32 addr, int id_nr)
 		    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, id_nr, 0, id_nr, &runl->chid))) {
 			RUNL_ERROR(runl, "cgid/chid: %d", ret);
 			nvkm_runl_del(runl);
-			return NULL;
+			return ERR_PTR(ret);
 		}
 	} else {
 		runl->cgid = nvkm_chid_ref(fifo->cgid);
-- 
2.35.1

