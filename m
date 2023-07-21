Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3533CEB64DC
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jul 2023 14:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjGUO4q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jul 2023 10:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjGUO4p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jul 2023 10:56:45 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7F430D2
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:56:40 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-315adee6ac8so1557554f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689951399; x=1690556199;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=In8T5OsGtRpxMtj85EqpIN0ZR1mnlPUN+P5ckad+btA=;
        b=eKyfGFRUlNMWchE9XXYzqjbwM5uVsWWNUMm828Tvyd1V1mYv+1G2emJePZZDvMgrUD
         y8K8S0XaXLLXCGJ5M49Za8Q876uTyDivqR5ZTeXs3il3jc2pZw0CfpbW/idiP5crMkzB
         lajAelAx67AhHM0wqTgv1lcIngYlg5qHgpjhv98QyzUEICGp9fR+Tijst08Rpmhdgys6
         xpXrsuVtsp9wNH8iTSqXDorcciPLoXW3UVSv9qNYtcAMUzWz++U/yvpyfhsErni8zP7S
         /sj0deswOJp4zr91Pd3EOfzrIHQwgLp7qlmpa158ALT3nJTMkWiHIac1s3EtXc0qJHIn
         i3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689951399; x=1690556199;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=In8T5OsGtRpxMtj85EqpIN0ZR1mnlPUN+P5ckad+btA=;
        b=L3+KlByYFcm8yKkhnF5eDU4s07yogtk+bsfce5ds8VaZ4BJJ1rZkm/tm2Y3nFQqL+I
         rlZApjuf9Ds/d+1kgNvN5UhAFW8V0mQJnZdrjLmRySinA9f8DaMDH7n6eOq7CWP5pfer
         gLtMp5NmmQrZf4/kj27w37RnAuVPR6ZsksStrR3ic1LHaXtL13JNiODGHENovsEvKQXI
         sfabVBhhTEqzBW79OuLkqeTdRlg+Q8BVW4E5G37EHOzdwovd5HNQZljDQzz2Vt/YEobM
         oCYsUKywhht0qLtFCaewfG18UeBVrnfdnLMNqvMR9IT/sUDjZrbvHE06JC3EHD5huyPI
         K1Xg==
X-Gm-Message-State: ABy/qLY5wd32W5YuIQW0q5+v3f+YTDBiVFf0S1OUngQ0cLl0fvwQ5gMo
        UVboTjoPqbiBv1TGNKZHD9W3pQ==
X-Google-Smtp-Source: APBJJlHEfwVc5QNwet+IfWzXMoxUEDrd837ZTLEG4fHbusmtYBoz0tijlh8MpDp7LrFCWhYG7LN21A==
X-Received: by 2002:a05:6000:10d1:b0:314:38e4:259f with SMTP id b17-20020a05600010d100b0031438e4259fmr1666827wrx.37.1689951398706;
        Fri, 21 Jul 2023 07:56:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m9-20020a5d56c9000000b00313e2abfb8dsm4428241wrw.92.2023.07.21.07.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 07:56:36 -0700 (PDT)
Date:   Fri, 21 Jul 2023 17:56:17 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Inki Dae <inki.dae@samsung.com>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: bridge: samsung-dsim: Clean up a call to request_irq()
Message-ID: <1c921fe0-2758-44dd-85f3-2ef8eb6583bb@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is calling request_threaded_irq() but the thread parameter is NULL
so it's actually not a threaded irq.  Which is a bit misleading.  Call
request_irq() instead.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9b7a00bafeaa..9d81dbbc6680 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1637,8 +1637,8 @@ static int samsung_dsim_register_te_irq(struct samsung_dsim *dsi, struct device
 
 	te_gpio_irq = gpiod_to_irq(dsi->te_gpio);
 
-	ret = request_threaded_irq(te_gpio_irq, samsung_dsim_te_irq_handler, NULL,
-				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
+	ret = request_irq(te_gpio_irq, samsung_dsim_te_irq_handler,
+			  IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
 	if (ret) {
 		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
 		gpiod_put(dsi->te_gpio);
-- 
2.39.2

