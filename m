Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0173EE7849A
	for <kernel-janitors@archiver.kernel.org>; Mon,  2 Oct 2023 07:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235664AbjJBHDR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 2 Oct 2023 03:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235694AbjJBHDQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Oct 2023 03:03:16 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B37106
        for <kernel-janitors@vger.kernel.org>; Mon,  2 Oct 2023 00:03:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so60969815e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Oct 2023 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230189; x=1696834989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8xam3PZVeEtEQPfmOLn7BWSBTDM+HLGUGDwJNItVyho=;
        b=u5TYZ0LML/BHbbUO6ZE8ywCKS+bO6q05F7c/5FxThqpm8FhB4hPosnXNY9BnVoo/43
         0PFrjY9hlaivK8J/qDvWj7tIo83hAYbJPQyBWpYAKI6xZ7NcZ/ZyvZo/LG4fsDUDK40E
         DviiDfcPlkvBmpgTF8VyLnbXv0c3z9a3p4j+mmM1BVENrk4aMMo99BJJesCxf/pHVcWG
         Bytpy6hLrV46l5rHbyTbuTtr+bynREab8Qt5/KZlqy+3lGD1wGOVHjJVcD8VpGl3ztSU
         oYC/V6LRaCQs3ZcnhU6Hfp3QxFrgibTEZWiZzfF9Du+PDTKKDrPKvUM2Wxs+sOQbO1h8
         aUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230189; x=1696834989;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xam3PZVeEtEQPfmOLn7BWSBTDM+HLGUGDwJNItVyho=;
        b=mzmzMV2F2KajEWlS+agrt+rrp5xJVqARlyU5aIcajVgkmr4iLyu6EDXdoXcVbOu3ll
         FUhqJ9BmoUhprkggL8w0HHw0Y7dYid7Qa4IfwWVTMJScrpwq5F22DpSr073UdNAxKyc5
         tR7OZTFRD0fc43dZO0E+eWqqelrIfslASFuUDYBf1aQlkOOvPndZI/fgXmKyrQaaiBhA
         3iQuofx+mfIWSzdgayv5zcoLqCJzNOwU+fmcl7j3e3qNnh+qysN8hd0dwHEtr3krmcM6
         BIP4IoPeatH1/XlKKfWwRDfM1b7VFS2QAHc4oFsM63bSJ+nNNCYyH/fgjFrSutgyhVf1
         o0Iw==
X-Gm-Message-State: AOJu0YyEeA/nlphfB1KTMxkD3QCrgMl+IJ+QgPDd/CzmmK+1iG47GHGc
        3Jb3TJEWkCXcNmbkQvKvkMOq0A==
X-Google-Smtp-Source: AGHT+IHe/uakDLQktyMmNkscQDeTYcwcQmvAInoA17Wx3S0bsUubjmPjLLx5Je6hz+4d9qyLvWv7uA==
X-Received: by 2002:a7b:cbc8:0:b0:3ff:ca80:eda3 with SMTP id n8-20020a7bcbc8000000b003ffca80eda3mr8715560wmi.10.1696230189198;
        Mon, 02 Oct 2023 00:03:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d4-20020a05600c34c400b003feea62440bsm6649360wmq.43.2023.10.02.00.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:03:08 -0700 (PDT)
Date:   Mon, 2 Oct 2023 10:03:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] clk: imx: imx8: Fix error code in probe
Message-ID: <06727485-a142-4ebb-b764-49841537d44b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44bacaba-848b-4e62-908c-16538330d4dd@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Preserve the error code from devm_clk_hw_register_mux_parent_data_table()
instead of returning success.

Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/imx/clk-imx8-acm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index 83019b986622..550ceac45ff2 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -372,6 +372,7 @@ static int imx8_acm_clk_probe(struct platform_device *pdev)
 										0, NULL, NULL);
 		if (IS_ERR(hws[sels[i].clkid])) {
 			pm_runtime_disable(&pdev->dev);
+			ret = PTR_ERR(hws[sels[i].clkid]);
 			goto err_clk_register;
 		}
 	}
-- 
2.39.2

