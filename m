Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED22EB64DA
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 07:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjGRHDA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 03:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbjGRHC5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 03:02:57 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB611B5
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:02:56 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so8723761e87.2
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 00:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663774; x=1692255774;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bG4Gx1r967zeIAmFVh7HaIXrYyoqtUrm+PE+5CcrQ0Q=;
        b=UV2a3zWVG67FpBgM02Vq235xIfJqY8fdHcFvwU2XaCuyHhmDXYXggsijJlpYJkoe+U
         OO0cDn9Hdc5Sf3eKYlrf+JUt7gGvUMx6+WNusK4m5iZZFKxk2XJV3m6ZhTnsOWj1Mi8+
         3cO31j+G1EePdCKDXBo6lF4LkedI0A87RzzqlFr0d6BlK3zR6RG2uIudH9OOMPnY6tO0
         Di/+ahlfEp1s3RRaY4P8+xGtiROW6BPOmKXMIa/qe6DdfDftTMUjsGwVAeeXt9FZoN3Z
         tNbIYbvwQC3i3QkY1+sV0XGzdgAfjelvrZ8PNiP89olPfeAXfRYOM//aF/Zr29QVCd3W
         8dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663774; x=1692255774;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bG4Gx1r967zeIAmFVh7HaIXrYyoqtUrm+PE+5CcrQ0Q=;
        b=VKZfaYpVkqCKMvDmhHw/F70mjRad7Iak4fj2s0VR3prtYl4fnnFwER+f82cSymU7bM
         QUPSjBR18E+/5DAHzj1ovYEaUlM/++yzQtiEpZp34r45vvOOCezyfQ9r/9Zb7tTVHaX+
         7hOaAKNF6eK1UO0kqIopMyiez0erMHqyS1LfWGYKZoGn/SUXmXVVGcNZVIf47qEsqr9/
         9p5iDdqoR5yljMccpzzaccl+BN9NObaeCUt2se55BGEohxakQ1o2OzLR2Q3Esw3D0V2f
         rFtGKJzd1hX4MLomvA9huwUR+myEKp44ifH0g1k0ZmZIyP2vRRXx/qVJE3tKRIJMT17E
         CW8A==
X-Gm-Message-State: ABy/qLZfQqY2syZKFp4q87+2lpeeyTVpbDGRFsB+oO19kg3OF85iDUP6
        zo60PlRJDDBUSepirlK7fQbS8qep2i9lJr56gqE=
X-Google-Smtp-Source: APBJJlEfO0vlpxHTle2tSQS6B5dc1OXhx+xoMrBGuDDfxGMmbx+fo7H8//sWJfifOYJa7dfGE5T6Bg==
X-Received: by 2002:ac2:4559:0:b0:4f7:604f:f4c8 with SMTP id j25-20020ac24559000000b004f7604ff4c8mr966844lfm.18.1689663774421;
        Tue, 18 Jul 2023 00:02:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c248200b003faef96ee78sm9682608wms.33.2023.07.18.00.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:02:53 -0700 (PDT)
Date:   Tue, 18 Jul 2023 10:02:49 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Minda Chen <minda.chen@starfivetech.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: starfive: fix error code in probe
Message-ID: <3cc81f2a-efd7-4ef7-ae6b-e38c91efe153@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is using the wrong pointer, "phy->regs" vs "phy->phy".

Fixes: 26cea0e28057 ("phy: starfive: Add JH7110 PCIE 2.0 PHY driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/starfive/phy-jh7110-pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/starfive/phy-jh7110-pcie.c b/drivers/phy/starfive/phy-jh7110-pcie.c
index cbe79c1f59d3..734c8e007727 100644
--- a/drivers/phy/starfive/phy-jh7110-pcie.c
+++ b/drivers/phy/starfive/phy-jh7110-pcie.c
@@ -151,7 +151,7 @@ static int jh7110_pcie_phy_probe(struct platform_device *pdev)
 
 	phy->phy = devm_phy_create(dev, NULL, &jh7110_pcie_phy_ops);
 	if (IS_ERR(phy->phy))
-		return dev_err_probe(dev, PTR_ERR(phy->regs),
+		return dev_err_probe(dev, PTR_ERR(phy->phy),
 				     "Failed to map phy base\n");
 
 	phy->sys_syscon =
-- 
2.39.2

