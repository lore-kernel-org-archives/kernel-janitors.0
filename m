Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F6CC4332F
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Nov 2022 17:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiKTRGC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 20 Nov 2022 12:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiKTRGB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Nov 2022 12:06:01 -0500
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A8E5800B
        for <kernel-janitors@vger.kernel.org>; Sun, 20 Nov 2022 09:05:59 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id wnlTouwJkx4XXwnlUoEiow; Sun, 20 Nov 2022 18:05:57 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 20 Nov 2022 18:05:57 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Lee Jones <lee.jones@linaro.org>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] mfd: qcom_rpm: Fix an error handling path in qcom_rpm_probe()
Date:   Sun, 20 Nov 2022 18:05:53 +0100
Message-ID: <e39752476d02605b2be46cab7115f71255ce13a8.1668949256.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20221120170553.B29XLNBIo2h0O2S8t2PjSqTrurSQ-Yak-JHNx1npKBk@z>

If an error occurs after the clk_prepare_enable() call, a corresponding
clk_disable_unprepare() should be called.

Simplify code and switch to devm_clk_get_enabled() to fix it.

Fixes: 3526403353c2 ("mfd: qcom_rpm: Handle message RAM clock")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This changes the order of the clean-ups if the .remove() function is called
but it looks fine to me.
---
 drivers/mfd/qcom_rpm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/qcom_rpm.c b/drivers/mfd/qcom_rpm.c
index 71bc34b74bc9..ea5eb94427c4 100644
--- a/drivers/mfd/qcom_rpm.c
+++ b/drivers/mfd/qcom_rpm.c
@@ -547,7 +547,7 @@ static int qcom_rpm_probe(struct platform_device *pdev)
 	init_completion(&rpm->ack);
 
 	/* Enable message RAM clock */
-	rpm->ramclk = devm_clk_get(&pdev->dev, "ram");
+	rpm->ramclk = devm_clk_get_enabled(&pdev->dev, "ram");
 	if (IS_ERR(rpm->ramclk)) {
 		ret = PTR_ERR(rpm->ramclk);
 		if (ret == -EPROBE_DEFER)
@@ -558,7 +558,6 @@ static int qcom_rpm_probe(struct platform_device *pdev)
 		 */
 		rpm->ramclk = NULL;
 	}
-	clk_prepare_enable(rpm->ramclk); /* Accepts NULL */
 
 	irq_ack = platform_get_irq_byname(pdev, "ack");
 	if (irq_ack < 0)
@@ -681,7 +680,6 @@ static int qcom_rpm_remove(struct platform_device *pdev)
 	struct qcom_rpm *rpm = dev_get_drvdata(&pdev->dev);
 
 	of_platform_depopulate(&pdev->dev);
-	clk_disable_unprepare(rpm->ramclk);
 
 	return 0;
 }
-- 
2.34.1

