Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5596AEE6457
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Sep 2023 12:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbjIOM7u (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Sep 2023 08:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234930AbjIOM7u (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 08:59:50 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE79A8
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:59:45 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso22768715e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694782784; x=1695387584; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBjLzWWXqag1yraVARE9n+lKqu6pTxol3i6MhDouFAw=;
        b=S9AFSttRGrcbW/xiejor62H64Egzo6vZEGWY65aS/Th+ELrTpomAhGYD/du8hJlcai
         ZhzzBSuvx7owwhV7BH7Jl0vge9AH+M726l5FZEskt4t9pRXztWt7l+eyFCqiAnQIYiTl
         Cl5SBHvbO6kNGFsoFwaf70bSnL4fimbC7fse2HCv3UHYnILHkP7Ha1Rq7bAO3Tp74/0P
         KZRwOsclVaMwcFa5uPsi66h5oeglZTdJQbAVUyZpHSGls1xTtdxN+eAQaWeXhjI9hO64
         CB2OKs2LeYq3J8ipKdN/Q8l6BGsCdyKyVESJINbeGDKlM1KqXuAZpbDpyExDOJjrLp5e
         6k3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782784; x=1695387584;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBjLzWWXqag1yraVARE9n+lKqu6pTxol3i6MhDouFAw=;
        b=MOItGJMKP9o+f1dSBwrCcvUojwzJOnBAYusRWeuHGcIV7ZJudCZTl12J1nm6f/w26W
         SCgtj1+wM9taUHY8YvXz9zabofJJ3mkrCCW/OTXZWGbUQjaDN9EXDnCEFeNt03TUSjjk
         4zbuGvNVJdcGW7PtKbkX34RsmFVDFsq9+FAV8Om6Xx7bD6aIM1CvsYroJ5BDsu1qv9JR
         Vf4LzZ/QBoA+SXdk9V+ihDuonKJO+wSMSTn7qp5kWvJaV19XoxQgZIUo7WpeC3ApdUhC
         gzPy1OemBujT1lz8Ur6lMyc1CEyHES5zGEJwZgnjfolGILJ+OLQ2kjFmZ5rmK9Hyc2O+
         WNxQ==
X-Gm-Message-State: AOJu0Ywm7GMnmUP7yT3UJ6FtSn+RsSzmahiSnoN2cBJPPC4vb8luvT9Z
        RoSIby8mJ/b+ozO1rsih5eVdnQ==
X-Google-Smtp-Source: AGHT+IFc8Uw7ChZ541s7ZfDx5J0oDr/O+QkUoZ9jlAAj8nlQTtlVtdYU7vkKZ9OJ1800nSO6KAFtFQ==
X-Received: by 2002:a1c:7209:0:b0:401:bf62:9456 with SMTP id n9-20020a1c7209000000b00401bf629456mr1420706wmc.8.1694782783609;
        Fri, 15 Sep 2023 05:59:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l20-20020a1c7914000000b003fe29dc0ff2sm4635302wme.21.2023.09.15.05.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:59:43 -0700 (PDT)
Date:   Fri, 15 Sep 2023 15:59:40 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Hai Li <hali@codeaurora.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: fix irq_of_parse_and_map() error checking
Message-ID: <4f3c5c98-04f7-43f7-900f-5d7482c83eef@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The irq_of_parse_and_map() function returns zero on error.  It
never returns negative error codes.  Fix the check.

Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 5d9ec27c89d3..13da53737a6a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1894,10 +1894,9 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	}
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (msm_host->irq < 0) {
-		ret = msm_host->irq;
-		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
-		return ret;
+	if (!msm_host->irq) {
+		dev_err(&pdev->dev, "failed to get irq\n");
+		return -EINVAL;
 	}
 
 	/* do not autoenable, will be enabled later */
-- 
2.39.2

