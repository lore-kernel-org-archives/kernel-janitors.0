Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F25C4338F
	for <kernel-janitors@archiver.kernel.org>; Sat, 21 Aug 2021 07:17:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FEA0611C3
	for <kernel-janitors@archiver.kernel.org>; Sat, 21 Aug 2021 07:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhHUHSG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 21 Aug 2021 03:18:06 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:19624 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbhHUHSF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 21 Aug 2021 03:18:05 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d09 with ME
        id k7HP2500Z3riaq2037HQhN; Sat, 21 Aug 2021 09:17:25 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Aug 2021 09:17:25 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] i2c: busses: i2c-nomadik: Remove a useless call in the remove function
Date:   Sat, 21 Aug 2021 09:17:22 +0200
Message-Id: <4f4c2c5c20b61c4bb28cb3e9ab4640534dd2adec.1629530169.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Since commit a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of
git://git.pengutronix.de/git/wsa/linux"), there is no more
'request_mem_region()' call in this driver.

So remove the 'release_mem_region()' call from the remove function which is
likely a left over.

There is no details in the above commit log, but at its end we can read:
   Conflicts:
	   drivers/i2c/busses/i2c-nomadik.c

This may explain why this call has been left here.

Fixes: a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of git://git.pengutronix.de/git/wsa/linux
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is completely speculative and without details about commit
a410963ba4c0 it's hard to be sure of the intent.

All I can say is that it looks logical to me and that it compiles!
---
 drivers/i2c/busses/i2c-nomadik.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index a2d12a5b1c34..e215a7357873 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1057,7 +1057,6 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 
 static void nmk_i2c_remove(struct amba_device *adev)
 {
-	struct resource *res = &adev->res;
 	struct nmk_i2c_dev *dev = amba_get_drvdata(adev);
 
 	i2c_del_adapter(&dev->adap);
@@ -1067,7 +1066,6 @@ static void nmk_i2c_remove(struct amba_device *adev)
 	/* disable the controller */
 	i2c_clr_bit(dev->virtbase + I2C_CR, I2C_CR_PE);
 	clk_disable_unprepare(dev->clk);
-	release_mem_region(res->start, resource_size(res));
 }
 
 static struct i2c_vendor_data vendor_stn8815 = {
-- 
2.30.2

