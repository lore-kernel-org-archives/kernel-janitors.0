Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9FBC4167B
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Dec 2022 15:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbiL3Pen (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 30 Dec 2022 10:34:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235148AbiL3Pei (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Dec 2022 10:34:38 -0500
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11E21B1D6
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Dec 2022 07:34:37 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id BHP1pigEwSTJGBHP1p2nrE; Fri, 30 Dec 2022 16:34:36 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 30 Dec 2022 16:34:36 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] bus: bt1-apb: Use devm_clk_get_enabled() helper
Date:   Fri, 30 Dec 2022 16:34:34 +0100
Message-Id: <206396623f7a9c475c915896c3990bee2d3384dd.1672414440.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The devm_clk_get_enabled() helper:
   - calls devm_clk_get()
   - calls clk_prepare_enable() and registers what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the need of a dedicated function used
with devm_add_action_or_reset().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/bus/bt1-apb.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
index 63b1b4a76671..9ed8d10c489b 100644
--- a/drivers/bus/bt1-apb.c
+++ b/drivers/bus/bt1-apb.c
@@ -186,34 +186,13 @@ static int bt1_apb_request_rst(struct bt1_apb *apb)
 	return ret;
 }
 
-static void bt1_apb_disable_clk(void *data)
-{
-	struct bt1_apb *apb = data;
-
-	clk_disable_unprepare(apb->pclk);
-}
-
 static int bt1_apb_request_clk(struct bt1_apb *apb)
 {
-	int ret;
-
-	apb->pclk = devm_clk_get(apb->dev, "pclk");
+	apb->pclk = devm_clk_get_enabled(apb->dev, "pclk");
 	if (IS_ERR(apb->pclk))
 		return dev_err_probe(apb->dev, PTR_ERR(apb->pclk),
 				     "Couldn't get APB clock descriptor\n");
 
-	ret = clk_prepare_enable(apb->pclk);
-	if (ret) {
-		dev_err(apb->dev, "Couldn't enable the APB clock\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(apb->dev, bt1_apb_disable_clk, apb);
-	if (ret) {
-		dev_err(apb->dev, "Can't add APB EHB clocks disable action\n");
-		return ret;
-	}
-
 	apb->rate = clk_get_rate(apb->pclk);
 	if (!apb->rate) {
 		dev_err(apb->dev, "Invalid clock rate\n");
-- 
2.34.1

