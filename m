Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFB6EB64DC
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 06:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjGKGNd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 02:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbjGKGNc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 02:13:32 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45EBC4
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:13:31 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so60749255e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689056010; x=1691648010;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o42Ks/tCHx59zpvkkxrFyhauoCCL1U7JUVEYu4RWWvs=;
        b=z8inQ+8MaqEzGKghYbTWt23tvZEQzsRbXLm7xauCjIH2NLhP0I3qVQSwTtGjwyLvrm
         xQ9bT7gT7LcA1bLwQyLOak1ybj9Z/QkM6HMKkFyNAMBBIsL1fREXvXYtH2IOmjZ62s7f
         8P4NpAkj5Kc/JR4uiF3A+d/Z+g+wB3ZXIvdO6nT1E99yHbQHEYY4Asd5fvJQU1gLvms0
         2Z/xX5af6r/vsvasoFMoVNK/G67xCRmzopDm0hePRoy1kwrYSPNwo9UQnM7bW33Vs5oX
         sp+8ChSIMKNfefGBojcBp+GNNAsEiGQ0YSduEIp+bWDc3VEBdsJ4C+KUSMlnPzRS0RBs
         LpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689056010; x=1691648010;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o42Ks/tCHx59zpvkkxrFyhauoCCL1U7JUVEYu4RWWvs=;
        b=NcVjo1opagvMEAcFT0+5NNCAwkUI9cWr9FR5T+AC8Zx7x0HZR3NgqNIHiRo9va3bvk
         Tb2NrCEmIPEBKCbIbKI8Gdp1ItfzIsFeDJes69Xt+xg73TXr1wdfSB3jUDZMYwaJiquy
         biRxMbGRk6lkR079MbsGRz1sy05jFo5CsW3RfRKmds24nqPzKKhe0XgkikgiCvNTmPn5
         axpZHH++JJwelxXGtRzwaYHCmkt0hb8ObvP/qHS++RhFEbCkbitqPzO23CdT6quI8+mM
         P/2ZPlOmTSMRcc+bd1Mi2AJSQn1vaTJoi7JBZh+KmZF0TgIPQRomzhnaPcWdYn9gw3i5
         L3pA==
X-Gm-Message-State: ABy/qLYMjEqAtaM19cDLm+mjAJCgSFgzgkHny/tjMUWW0o1HKoFwXLMN
        Sw0WmRY8jcqvOsLRAXKyb43ZBg==
X-Google-Smtp-Source: APBJJlHE2lKKPaUynutVNkXNfVhKn5DdgxT7YI1AidUkNO+4JOc3NtprI1IvH5G5uV7tFh1/jMariQ==
X-Received: by 2002:a05:600c:c8:b0:3fa:95c7:e891 with SMTP id u8-20020a05600c00c800b003fa95c7e891mr16791835wmm.35.1689056010209;
        Mon, 10 Jul 2023 23:13:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c230b00b003fbaade0735sm11944239wmo.19.2023.07.10.23.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:13:29 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:13:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Markus Schneider-Pargmann <msp@baylibre.com>
Cc:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Bo-Chen Chen <rex-bc.chen@mediatek.com>,
        Guillaume Ranquet <granquet@baylibre.com>,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: phy-mtk-dp: Fix an error code in probe()
Message-ID: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Negative -EINVAL was intended instead of positive EINVAL.

Fixes: 6a23afad443a ("phy: phy-mtk-dp: Add driver for DP phy")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 232fd3f1ff1b..d7024a144335 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -169,7 +169,7 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
 
 	regs = *(struct regmap **)dev->platform_data;
 	if (!regs)
-		return dev_err_probe(dev, EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "No data passed, requires struct regmap**\n");
 
 	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
-- 
2.39.2

