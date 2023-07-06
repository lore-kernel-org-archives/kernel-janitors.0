Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61384EB64DC
	for <kernel-janitors@archiver.kernel.org>; Thu,  6 Jul 2023 12:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjGFMiK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 6 Jul 2023 08:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbjGFMiF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 6 Jul 2023 08:38:05 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3568D19B
        for <kernel-janitors@vger.kernel.org>; Thu,  6 Jul 2023 05:38:01 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31441dfbf97so611670f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Jul 2023 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688647079; x=1691239079;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F+HUvJ4QTDevtKTASgsl+F3VuwhUQ02Z1WI6sZoHENY=;
        b=Y7L2k2zULEUk2RZkC8o07CD393u9MlrprQK6eCqsaQm8oGvGshM4kpxXUkHfhKO+6/
         QrW0NAZz9RiGY4vTvZulHuyoW6duDzxM474kdiW7bSl5AlSX/XiBDZ5E0Y6RSDo7zGhn
         X201ZRb8prs1psvkVTyvqZlHqP0Q7z9JUK9MPGoapX5+BHU9V8jrzWojlyKQKWXSoJAc
         4Q3MU4gnhk8XdAVH8o2fbfkimoaQ/56A6SEVqxcTmp9emVfUOIh6NJ113EbFaP4KsYNF
         xlewu/EqBTb7T1ZJjwHbtJFx9RVlp1RtsChE07jHCg4sSQRyLYHk+M5VK+Vfe1Wh4Kk9
         5ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688647079; x=1691239079;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+HUvJ4QTDevtKTASgsl+F3VuwhUQ02Z1WI6sZoHENY=;
        b=Q8pB+jw75OxuOymfEO2e8fLGMBTxl5D5LKH6fiQKBUabfCUI4Qceta79VG6e7l7zmx
         mDGwY/eJVqlEeJj3thJmNZYkls2SKUr54MWsKFAtxz0Qcg9Zbtw+dc+wpUF279pXsLuI
         EVVRXwzykDhNqN+xC0kxCajGmpbtArUm4tffLoRgGfM76Q4I4khn0d9PClz8Ukfv7rwe
         GGPfPLrFoRLCFPOJnWqlOV86qE0KDbzddRAw/0IGnGJFMx1l3V1AuFsTcgsTExryK9G/
         xDBN/4ZBwD4lqtGCOc4/KbE0cV27lSTKDH6+8swRfEDlv9GAjp0Kq6lL51ukqKUQ5O4B
         0rhA==
X-Gm-Message-State: ABy/qLZsd3AhSY0EXbu26nCo54ovlGMxiYC7jjM5CSID0eh+/DMUrl1v
        Wn4raqbJpKaTCbmxmkuIZNIBTw==
X-Google-Smtp-Source: APBJJlGkLkipEot/qaG0ulR5j4ByuxASZM5urGdZalBCHsWht3pKbPMo60yuiZKbmAXZ7Tgw94X4Pw==
X-Received: by 2002:adf:f989:0:b0:313:fcea:db06 with SMTP id f9-20020adff989000000b00313fceadb06mr1437833wrr.12.1688647079678;
        Thu, 06 Jul 2023 05:37:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o5-20020a056000010500b0030c4d8930b1sm1780435wrx.91.2023.07.06.05.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 05:37:57 -0700 (PDT)
Date:   Thu, 6 Jul 2023 15:37:51 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2] dma-buf: fix an error pointer vs NULL bug
Message-ID: <b09f1996-3838-4fa2-9193-832b68262e43@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch detected potential error pointer dereference.

    drivers/gpu/drm/drm_syncobj.c:888 drm_syncobj_transfer_to_timeline()
    error: 'fence' dereferencing possible ERR_PTR()

The error pointer comes from dma_fence_allocate_private_stub().  One
caller expected error pointers and one expected NULL pointers.  Change
it to return NULL and update the caller which expected error pointers,
drm_syncobj_assign_null_handle(), to check for NULL instead.

Fixes: f781f661e8c9 ("dma-buf: keep the signaling time of merged fences v3")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Fix it in dma_fence_allocate_private_stub() instead of
   __dma_fence_unwrap_merge().


 drivers/dma-buf/dma-fence.c   | 2 +-
 drivers/gpu/drm/drm_syncobj.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ad076f208760..8aa8f8cb7071 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -160,7 +160,7 @@ struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
 
 	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
 	if (fence == NULL)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	dma_fence_init(fence,
 		       &dma_fence_stub_ops,
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 04589a35eb09..e592c5da70ce 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -355,8 +355,8 @@ static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
 {
 	struct dma_fence *fence = dma_fence_allocate_private_stub(ktime_get());
 
-	if (IS_ERR(fence))
-		return PTR_ERR(fence);
+	if (!fence)
+		return -ENOMEM;
 
 	drm_syncobj_replace_fence(syncobj, fence);
 	dma_fence_put(fence);
-- 
2.39.2

