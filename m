Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFED8C41513
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 Jul 2023 06:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjGYGvD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 Jul 2023 02:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjGYGvC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Jul 2023 02:51:02 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55BEBD
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 23:51:00 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so42534855e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690267859; x=1690872659;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/7YC6gNPnD4sPdY6yeSLuPXwpQ68htwMP3OyMhq17Qw=;
        b=b5pyU0m3Xf8DtZUSpLNI5iWTtnR2JJRlLq1iYS83w/W8EiOdcfgsf/MSFvp9n/o4S9
         vMNanaS/hwz7/UrzOHmHTHqTBK4DShBDSc7T3LAUyrbE2jiEmLnIaqLXIdWZAS9WTDsz
         UbOmtmzeeHLVGMLImoDkHDD3uo4inDfHi4lrUSCaQXBB3C8TrHInXZVmsNx2rBYpml3K
         DLoCy4g1woqdDNo6XY1CEAXBOtJLKlbS76jO/oUTRCIBQ577fXsMLwPUgmYLQ4Q253xH
         2tTuRoKF5AIEqb0Bzm3t+MZ2n0hXFxCO85GsP0zGyEMyItTV1Qy34vGjCEN3+Fop/2Cs
         8SAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690267859; x=1690872659;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7YC6gNPnD4sPdY6yeSLuPXwpQ68htwMP3OyMhq17Qw=;
        b=PURSNdh4QvgLPyu67nN8HcuiWmEBi9S5X30mhpL+hZ7fVUWJDxUwqofZO54RgHLG9W
         u/tCcAJ+qu+iB6vs2hfwkYYctH0+P5CnA1WSKXeVfDtOQa9sMAU8nU0Awi/sN6NBHMSy
         1mv9BzEnlNc1tap5SHkUcvKrbZdwQzsJTv//tZoIczmk+EWJdny7iYZwgsDmx40qJWlW
         5nSr8CZQOdZYNb99kOEeM9kd/uk5WkPDVVdkki+N8/Iqxsb6VFpFa7a/80vb/cchptrJ
         4buUTAuMC2wMX4kta+PuFJ+mhexxHLk1DWdUqxWjMhjYU7yQTac5WYEsHRAFsNaqFxoO
         uX5g==
X-Gm-Message-State: ABy/qLafV6F595Zf36XB3de8DuJXFO1OHQtRwX+dXJ+OJhOVsZo6DO+H
        W4bwrWos9ZJZK6Bgizb/O/wSiA==
X-Google-Smtp-Source: APBJJlHqNM99eb0ZHQXZM5f+65aTptDhOZEp2nsancdPfR1Rol7/vAlTqwOL6Py5w/39UVcsP6v7sA==
X-Received: by 2002:adf:f591:0:b0:317:6efd:3a6b with SMTP id f17-20020adff591000000b003176efd3a6bmr199262wro.24.1690267859325;
        Mon, 24 Jul 2023 23:50:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v1-20020a5d6781000000b0031434c08bb7sm15180817wru.105.2023.07.24.23.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 23:50:58 -0700 (PDT)
Date:   Tue, 25 Jul 2023 09:50:55 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Oleksij Rempel <linux@rempel-privat.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Andi Shyti <andi.shyti@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: imx: Clean up a call to request_irq()
Message-ID: <fa375cc0-893a-4e64-8bf6-cc37f9ebecf5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is passing a NULL thread to request_threaded_irq().  So it's not
really a threaded IRQ at all.  It's more readable to call request_irq()
instead.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/i2c/busses/i2c-imx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 65128a73e8a3..c0cac5bcfdd1 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1506,8 +1506,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 
 	/* Request IRQ */
-	ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
-				   pdev->name, i2c_imx);
+	ret = request_irq(irq, i2c_imx_isr, IRQF_SHARED, pdev->name, i2c_imx);
 	if (ret) {
 		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
 		goto rpm_disable;
-- 
2.39.2

