Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E572BC4167B
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Dec 2022 15:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235018AbiL3P3T (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 30 Dec 2022 10:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiL3P3S (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Dec 2022 10:29:18 -0500
Received: from smtp.smtpout.orange.fr (smtp-12.smtpout.orange.fr [80.12.242.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EACB19295
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Dec 2022 07:29:17 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id BHJope39eoBUEBHJopwrqH; Fri, 30 Dec 2022 16:29:15 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 30 Dec 2022 16:29:15 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: tc358767: Use devm_clk_get_enabled() helper
Date:   Fri, 30 Dec 2022 16:29:10 +0100
Message-Id: <4f855984ea895e1488169e77935fa6e044912ac2.1672414073.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/gpu/drm/bridge/tc358767.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 2a58eb271f70..b95c36ca660d 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2022,13 +2022,6 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 	return -EINVAL;
 }
 
-static void tc_clk_disable(void *data)
-{
-	struct clk *refclk = data;
-
-	clk_disable_unprepare(refclk);
-}
-
 static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
@@ -2045,21 +2038,13 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (ret)
 		return ret;
 
-	tc->refclk = devm_clk_get(dev, "ref");
+	tc->refclk = devm_clk_get_enabled(dev, "ref");
 	if (IS_ERR(tc->refclk)) {
 		ret = PTR_ERR(tc->refclk);
 		dev_err(dev, "Failed to get refclk: %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(tc->refclk);
-	if (ret)
-		return ret;
-
-	ret = devm_add_action_or_reset(dev, tc_clk_disable, tc->refclk);
-	if (ret)
-		return ret;
-
 	/* tRSTW = 100 cycles , at 13 MHz that is ~7.69 us */
 	usleep_range(10, 15);
 
-- 
2.34.1

