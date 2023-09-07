Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7CBEC873E
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 15:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233991AbjIGPqr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345271AbjIGPfU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 11:35:20 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC8D1FC6
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Sep 2023 08:34:49 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso136367166b.1
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Sep 2023 08:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100862; x=1694705662; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ro+pKVjgj+qjW5pgqGuvDVB8LEkYu3AYgnnmwQIWsbs=;
        b=YrYSBxTgBsy9IYSRDmmhfvsrJoPL3uZ34KK+Lour2LXAI2T8nIlPxmIHV/4oSayuOL
         v0uwalZhuFvVMIONdSp8gXJHUZaPsUadG7pHM2NBOBTKgBgs6TKM2T90TVIhHqAAXsZI
         hxIbVqI60P5w/0+OrjCGXD2lCHWkQYNgKi/fh5O+AHCRewVk6Y80IyxzXEXM2sEHvbOJ
         4cZbuZtQltI3j1uzn+TVRvP3MV0UBkJr9eVis1ihWCyvsXN4dwJ+ymIFDnzuq3lQF+EP
         TkuH1tFG3E8i5sodi8ENrI2cm+dxMFXCt0zsW9dMDdYqtO03sgO58D1QqQiLve/HAJGO
         6cBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100862; x=1694705662;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ro+pKVjgj+qjW5pgqGuvDVB8LEkYu3AYgnnmwQIWsbs=;
        b=YfFx+fb27UENxVqJeolmcncWvNKy/UU+9E8qkzvffrRY/8piS4ajUgJMUaew9F7K07
         W4zkF+p94hMOe0QW89zCpAO4ovyqd0QE0Gx9VcTeaN57LfGWAU2J2flCDy3CRoKwkQkj
         fPc1ZgcBT45jGVqKJNOKgLscz6feyR94mLSIfHGcvSFYWW+0ze9YDxB+RaSKtDalvWXc
         TaRgbAWddis2VkpPUjWUEX6nEHaHh4JOWksNoHeVeNg/2ONiFby50kx6VHKTaSyBDZvf
         cGoEF9qkPmZO2VOEHiGg2MzH2X/AskeUkMjou5cn91fkXCmrUD0e5WHChz/IicKO38Tz
         e/hg==
X-Gm-Message-State: AOJu0Yy6+SPuhhNI8+hTyoQhM2JjhyQ0xVnezk4ThBGHNcW4OSSAnkvv
        SpIu/E1F3Z1Up7upAdYJUvOagkcIVJrTzCazeVA=
X-Google-Smtp-Source: AGHT+IFg0bFSC0lzaqVqa/PY0sh6IBWdUUoK9G2NFmiJdxUui9GFWOqDAfoxG2ThzfavR6oiUtxwag==
X-Received: by 2002:adf:e508:0:b0:317:6e08:ed35 with SMTP id j8-20020adfe508000000b003176e08ed35mr4543247wrm.1.1694080483294;
        Thu, 07 Sep 2023 02:54:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f7-20020a7bcd07000000b00401c595fcc7sm2026280wmj.11.2023.09.07.02.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:54:43 -0700 (PDT)
Date:   Thu, 7 Sep 2023 12:54:39 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: qcom-m31: Fix error code in probe()
Message-ID: <7926c8e6-630e-4d7a-b0b2-d29b3c8b2c09@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This accidentally returns the wrong variable.  It should be "qphy->vreg"
instead of "qphy->phy".

Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
When we're adding new drivers then we should use the new driver
prefix instead of the subsystem prefix.  For example:

 Bad: [PATCH] phy: qcom: Introduce M31 USB PHY driver
Good: [PATCH] phy: qcom-m31: Introduce M31 USB PHY driver

That way it's obvious to the first person who sends a bugfix
what the driver prefix is.

 drivers/phy/qualcomm/phy-qcom-m31.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
index ed08072ca032..99d570f4142a 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31.c
@@ -256,7 +256,7 @@ static int m31usb_phy_probe(struct platform_device *pdev)
 
 	qphy->vreg = devm_regulator_get(dev, "vdda-phy");
 	if (IS_ERR(qphy->vreg))
-		return dev_err_probe(dev, PTR_ERR(qphy->phy),
+		return dev_err_probe(dev, PTR_ERR(qphy->vreg),
 						"failed to get vreg\n");
 
 	phy_set_drvdata(qphy->phy, qphy);
-- 
2.39.2

