Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3407C47082
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 13:17:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4BED61406
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 13:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhFENTh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 5 Jun 2021 09:19:37 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:59330 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhFENTg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 5 Jun 2021 09:19:36 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d78 with ME
        id DRHj2500C21Fzsu03RHkfm; Sat, 05 Jun 2021 15:17:47 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 05 Jun 2021 15:17:47 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     kishon@ti.com, vkoul@kernel.org, tony@atomide.com
Cc:     linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] phy: ti: dm816x: Fix the error handling path in 'dm816x_usb_phy_probe()
Date:   Sat,  5 Jun 2021 15:17:43 +0200
Message-Id: <ac5136881f6bdec50be19b3bf73b3bc1b15ef1f1.1622898974.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Add an error handling path in the probe to release some resources, as
already done in the remove function.

Fixes: 609adde838f4 ("phy: Add a driver for dm816x USB PHY")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/phy/ti/phy-dm816x-usb.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-dm816x-usb.c b/drivers/phy/ti/phy-dm816x-usb.c
index 57adc08a89b2..9fe6ea6fdae5 100644
--- a/drivers/phy/ti/phy-dm816x-usb.c
+++ b/drivers/phy/ti/phy-dm816x-usb.c
@@ -242,19 +242,28 @@ static int dm816x_usb_phy_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(phy->dev);
 	generic_phy = devm_phy_create(phy->dev, NULL, &ops);
-	if (IS_ERR(generic_phy))
-		return PTR_ERR(generic_phy);
+	if (IS_ERR(generic_phy)) {
+		error = PTR_ERR(generic_phy);
+		goto clk_unprepare;
+	}
 
 	phy_set_drvdata(generic_phy, phy);
 
 	phy_provider = devm_of_phy_provider_register(phy->dev,
 						     of_phy_simple_xlate);
-	if (IS_ERR(phy_provider))
-		return PTR_ERR(phy_provider);
+	if (IS_ERR(phy_provider)) {
+		error = PTR_ERR(phy_provider);
+		goto clk_unprepare;
+	}
 
 	usb_add_phy_dev(&phy->phy);
 
 	return 0;
+
+clk_unprepare:
+	pm_runtime_disable(phy->dev);
+	clk_unprepare(phy->refclk);
+	return error;
 }
 
 static int dm816x_usb_phy_remove(struct platform_device *pdev)
-- 
2.30.2

