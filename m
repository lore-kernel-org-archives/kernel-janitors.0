Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A20EB64DA
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 07:02:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbjGRHCZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbjGRHCN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 03:02:13 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5781B6
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:02:04 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31434226a2eso5331534f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663723; x=1692255723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6Xn2Nym15wdt3Gsh/k8fd5yRhovhKcNX6yue5YH2mI=;
        b=TOlKrTAIPqpBVjSOj/cJGUbIz3vNQhTgpCINIgJSCL8MJvSQ9PV3IeGkg6b6+5wYiz
         Lb2qqH01mnItGbPN8U2yugo6IudYPwcCe0rfc2mfm0PoDSu7ZF+u+2lAGJfkQhFoUsPm
         sSiuK4eK0x0bbicBTnaciG13WveA1riz83DFCKkFPuWwxCugCGyimGvXgE1RCnL6q9M3
         Ob4wx4mRXQFw/T6PlB94oclisKZFC4oX7Hye7d3/0fveFmRv0FQqqIE0E6oXF6dcYEe2
         Sg3qnWst5fTw6INVAX2d+bLiQGAyn0cg8F+mqORe06eJlHCgsCQ/CzFWe4G6UZpTTthe
         gAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663723; x=1692255723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6Xn2Nym15wdt3Gsh/k8fd5yRhovhKcNX6yue5YH2mI=;
        b=GCH7roUW4jJ2mr/ey/0U9wVYz4Dkz5ipg5xmwQT5IKi7mBYvk33wXkD63t0dtt6jwh
         s916Xb/geZd78LyltWa1a/MqP35ni53kHA31VyjbtO4S9sSzqN34ZgxrWvzBO0veHWBQ
         n0rTRsxmxYXNfyMZYkbxL6KXWElxhbl350tOGNPIAbtPCNlDoM8g/P5Umcoh+GA/uIeE
         N13iJuRev4cN2aGAyEX9BxzhJHTi54eYk2UBvjSpFsgWzaSc7Pm/NPk0i8H2xosOVgP1
         KRihTqpv03U0mzLEHyYHm/Tx/89E6aZw61yTb7eW5cM8VqSmYNZNWVEBFyb58L7/MbT6
         x67A==
X-Gm-Message-State: ABy/qLZP3axWwNusEd7JHbw7lcKpqQuXsz87f/JCp4QL7s/oXfw2w/wr
        9n2Y/MKEzn41Rfwb2p9cqEamKQ==
X-Google-Smtp-Source: APBJJlGlm1EuZA5YRI7QwlUl/G00TjllCRC97QoeQcg9WNYyBUjCyukkqtjh8GS6QPkbAw4Gnqq1iQ==
X-Received: by 2002:a05:6000:90e:b0:314:37ac:c896 with SMTP id cw14-20020a056000090e00b0031437acc896mr15110467wrb.44.1689663722952;
        Tue, 18 Jul 2023 00:02:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i12-20020adffdcc000000b003142e438e8csm1463707wrs.26.2023.07.18.00.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:02:01 -0700 (PDT)
Date:   Tue, 18 Jul 2023 10:01:57 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Sui Jingfeng <suijingfeng@loongson.cn>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
Message-ID: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The lsdc_bo_create() function can fail so add a check for that.

Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
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

