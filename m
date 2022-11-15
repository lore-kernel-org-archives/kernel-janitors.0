Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD1EC4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 13:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbiKONQZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:16:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiKONQY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 08:16:24 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5347228E3E
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:16:21 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id o30so9640766wms.2
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pyuO5Hk4hHm9DC9pX7v9hEWX1AWbI34zrlY39Dkt8LA=;
        b=k5xZD9EYCCiLHjTqbOSGy5SJ44glhLSSng/C7rhLuAFsoPgUk2KdN4XflzRa8X/Smm
         Uh18mtBZHpQFN1/9KxIR2sDEh/l6ZbutwJZPMqNmVp98PTWGjiRKSOBr4w7euIUCWZR9
         BErFAfNpFiFRPaHVH0EklNZQNNCH2B+Oq2gFhCSN7DA5DRKxATA1PtMlGQB6gzBZUKBy
         r6tghkDmtHrPGeAfM9wMTn4+7MHG7Ukt5Giu37HzM1P64tQvq1fejmx32t+799SggifC
         BEZLWR6erc7cAq8dPBPRw1rg7Y2tWbgFD5l3M7vR4Ai+z1jwJi+35I2YOCd5vBvpBBq+
         2sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyuO5Hk4hHm9DC9pX7v9hEWX1AWbI34zrlY39Dkt8LA=;
        b=bbWJJng19egkLg3BbuNo2r0yMjI2uqZWWqmTl9+5ENQNwxPJSF+4mePZ9OLjWzY7dM
         e02WtVdbzgzOmN3hpBnDod6wjUn6dVhjQNYChdwsraE6G4s/CfyIhAWWWt09THe17b/f
         94L9m1uAePtkZ+va/2dq0DjzeymyAVgXZxyRWOG//xNQy/Fhdc7nsfH2gTky9ew8HwX5
         jRliNgzkVMkTCu4pW+eruYSHCMHnrHH31tgdTyB0rorO4OC++TOkpbtgDtkmMrV0nYGE
         fI3ADk7mjqul8rTlh6t1KHA2tzKmh4fjGZbzmubHmyCt6jbhjioFHJuLJIj1fP0+49wW
         GM7g==
X-Gm-Message-State: ANoB5pmSrxt3ExjRgQlitO7ZNvhm0mCTYM5jstRmoqGj9YWlPnpl7GMY
        B/gOKKUwGOAva1IQ/uNt1yw=
X-Google-Smtp-Source: AA0mqf4HjMwos42pICW3yeahWx8vGQWgHT9rZm93eePobYAPWie2WJTR8Scy0xUWSP0haRFqMm+6XA==
X-Received: by 2002:a05:600c:706:b0:3cf:9a6a:c72a with SMTP id i6-20020a05600c070600b003cf9a6ac72amr309994wmn.168.1668518179738;
        Tue, 15 Nov 2022 05:16:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c155400b003c6f3e5ba42sm25738865wmg.46.2022.11.15.05.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:16:19 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:16:15 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/fifo: small cleanup in nvkm_chan_cctx_get()
Message-ID: <Y3Jdx+pFyv0CWLZm@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "&chan->cgrp->mutex" and "&cgrp->mutex" variables refer to the same
thing.  Use "&cgrp->mutex" consistently.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index b7c9d6115bce..790b73ee5272 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -105,7 +105,7 @@ nvkm_chan_cctx_get(struct nvkm_chan *chan, struct nvkm_engn *engn, struct nvkm_c
 	if (cctx) {
 		refcount_inc(&cctx->refs);
 		*pcctx = cctx;
-		mutex_unlock(&chan->cgrp->mutex);
+		mutex_unlock(&cgrp->mutex);
 		return 0;
 	}
 
-- 
2.35.1

