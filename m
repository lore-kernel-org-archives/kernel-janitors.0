Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CB6EB64DA
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Jul 2023 08:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjGSIpS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Jul 2023 04:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbjGSIpM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jul 2023 04:45:12 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A472173B
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jul 2023 01:45:09 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3142970df44so6257334f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jul 2023 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689756307; x=1692348307;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1FyC6zEm9TMtTPVUEw2n+UcHqrKcRbzPUWVgkBDBFoM=;
        b=rwNddAijnLPiw5y3y4EYfaIaNs8T518h4pfNJbJ69EVrVk1+En8hWcweGVy0vWmGrV
         tkmxuV0hzpNGg5adpenAIF7lBY5FdET/r5XzBuM49+rF+lhM0Gf6JSCkl+CX0fMQ2HlW
         8uCf5kekuq0DorVYK2L40T6ORwR+mmlVft+XZdpVyi7WuFBKFLTqgp0P7//hInaEQi2K
         rh8jAkePw2FBsr06ozfFs8hi7lBi4fKYTPfQNSR5eZcWf9dBJEJRxqhUKYk9oLaLGEMp
         JKKnE6G2ahTopbmjt9Id27rVvW/jZL97YjGu7h4k7pDYHBNnKzz3rx8g7hXdbmKwzzhL
         0M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689756307; x=1692348307;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FyC6zEm9TMtTPVUEw2n+UcHqrKcRbzPUWVgkBDBFoM=;
        b=jvam4+IUDYzm0gmiA02jtXFxs3zPkp1UP8AGyCBodlG6ol5D8TGMmZsi5e93dHQ9/d
         hih7CPogkccKnYE8Ym3E4/OJCPmzR+NDEgYg1+xWa5U5wAFbNAff1VIIqF0KYtIW8fPs
         i5g3sj92nMhK38nvhrydDnMTUpVMbQI7MfG8Q4utTJ6Nf0XHVHpFX+FbJiLJ/nOcEH9c
         9wpBDyNCG/QoE/gXIUrhPjkNZ6CMf8ND8TgYo5TWzkhJA3XkBtBE7ymwyrrKs4vjfdAE
         AiGMXfbr44L6aL66zrCMjhbe/CLpvDGecUtxgC0jFJ5KKzorQFWVLrDwfngyczbmp59D
         IuuA==
X-Gm-Message-State: ABy/qLZHsp+yL0kX5Br0lNNoVVrOpAf1gzds5f6PMR+nZlONtvBUQl92
        7usae82yVHrr3ILMOH2xBktwRQ==
X-Google-Smtp-Source: APBJJlHtS5n+8mchPfLTIlIfdrpQnISpfFAdY/VOIMePLqRBqm7K6iQK5Vkj9hr7sAlj4NqhX/rPDQ==
X-Received: by 2002:a5d:4590:0:b0:313:f86f:2858 with SMTP id p16-20020a5d4590000000b00313f86f2858mr14364312wrq.2.1689756307626;
        Wed, 19 Jul 2023 01:45:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u17-20020adff891000000b0031424f4ef1dsm4689257wrp.19.2023.07.19.01.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 01:45:05 -0700 (PDT)
Date:   Wed, 19 Jul 2023 11:45:02 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Sui Jingfeng <suijingfeng@loongson.cn>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/loongson: Add a check for lsdc_bo_create() errors
Message-ID: <ZLeijglIMPve2Iio@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code doesn't check for lsdc_bo_create() failure and it could lead
to a crash.  It can fail for a variety of reasons, but the most common
cause would be low memory.  Add a check.

Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
v2: change subject and re-word the commit message

 drivers/gpu/drm/loongson/lsdc_ttm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index bb0c8fd43a75..bf79dc55afa4 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -496,6 +496,8 @@ struct lsdc_bo *lsdc_bo_create_kernel_pinned(struct drm_device *ddev,
 	int ret;
 
 	lbo = lsdc_bo_create(ddev, domain, size, true, NULL, NULL);
+	if (IS_ERR(lbo))
+		return ERR_CAST(lbo);
 
 	ret = lsdc_bo_reserve(lbo);
 	if (unlikely(ret)) {
-- 
2.39.2
