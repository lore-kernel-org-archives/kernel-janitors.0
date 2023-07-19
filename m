Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE07C001B0
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Jul 2023 10:18:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbjGSKSH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Jul 2023 06:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbjGSKSE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jul 2023 06:18:04 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E761BEF
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jul 2023 03:18:02 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3159d5e409dso406710f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jul 2023 03:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689761881; x=1690366681;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6uSqq8iwHxn9/tpT05qWIJPin2r3B4nv+yMTWooWZQ=;
        b=SIOzxz0kITZK8LFNRze7JYjdZtc1YCSgzt3hjwJAeBkNjc+AvJSC1N7/zvWKNFT2fv
         habMlKdbAGHy8hqKFFxFqyYlUrjOI6uRKLk+Ni/S2VBmCgF1LFsed+EYzwSdN5UFx91f
         aezEQDv//EXlkk3QwhCTMiggeTDLMoMyewr9wQvN2WrVfUHviIG2KxRw8tZRLxtNVIiY
         gP5B7vwTv7lxPkt2x42ee8/nZRvPZOh07ZkazAYYdBGTrQm1kl91YnKxjIZZ8Ms8YsBG
         sqUJS0uFKrDKXDHslsHEwC29cDCuqfnJHZXVRKPkhxEOvPpVXdJehP3jJFd4a0GWRWwf
         cLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689761881; x=1690366681;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6uSqq8iwHxn9/tpT05qWIJPin2r3B4nv+yMTWooWZQ=;
        b=G6NRlpyhMi6a2BFZT6SeMI28tS3GxLVEUXNsDZeT5MsjMf1sZ4TeMMJhZXEG6QoUcj
         cFB9DITHRgImU7H0+orTeWcr5ztUseNcMiC+B9pdFAbp+GZBOKlDZICWdJGChHl8OTLz
         Wv9Bnz+pvPPKf12odPwJkZAoA/THD1nhBHIxjwC9sGDX9j3Gd7RgHRp45jWOrLiH2C7A
         0aQMnNXqC/HYPhtC/0cR2UPSYlj5Q9i9+6QRSMSoXTpARIZX24wWDosv1e38BRfkvgWB
         zOG1PSHrWAo/hU5mw8DRIvwUejG7Orwl7Vu+TrJma+8RWLdh2QeQNtPtDSvDZJHpN7YK
         QVXg==
X-Gm-Message-State: ABy/qLZ/DTTjdoydPtrQCxrXlETS+ZAaMHAzJ7r445T07p5nJ6Nb2+3U
        /KPkQeNmGnL48/7sIaBQfQddJw==
X-Google-Smtp-Source: APBJJlFM7viFvauoAMlySNo6VSSvtQdCoXkaiQxlJ4pgb0dZ2e8PBGcQhfI7IlseoQSuVvfamADMQg==
X-Received: by 2002:adf:f082:0:b0:314:2c77:681b with SMTP id n2-20020adff082000000b003142c77681bmr1387870wro.30.1689761881437;
        Wed, 19 Jul 2023 03:18:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d15-20020adff84f000000b00313f9085119sm4896291wrq.113.2023.07.19.03.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 03:18:00 -0700 (PDT)
Date:   Wed, 19 Jul 2023 13:17:56 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, etnaviv@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/etnaviv: fix error code in event_alloc()
Message-ID: <53fc5292-669a-4fca-8b99-e35a49da0b0f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There are two "ret" variables declared in this function so setting
"ret = -EBUSY;" sets the wrong one.  The function ends up returning an
uninitialized variable.

Fixes: f098f9b8042a ("drm/etnaviv: move runtime PM handling to events")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index f54f12090685..0382cd91eebf 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1158,18 +1158,18 @@ static int event_alloc(struct etnaviv_gpu *gpu, unsigned nr_events,
 	int ret;
 
 	for (i = 0; i < nr_events; i++) {
-		unsigned long ret;
+		unsigned long remaining;
 
-		ret = wait_for_completion_timeout(&gpu->event_free, timeout);
+		remaining = wait_for_completion_timeout(&gpu->event_free, timeout);
 
-		if (!ret) {
+		if (!remaining) {
 			dev_err(gpu->dev, "wait_for_completion_timeout failed");
 			ret = -EBUSY;
 			goto out;
 		}
 
 		acquired++;
-		timeout = ret;
+		timeout = remaining;
 	}
 
 	spin_lock(&gpu->event_spinlock);
-- 
2.39.2

