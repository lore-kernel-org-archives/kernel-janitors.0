Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C1EC433B4
	for <kernel-janitors@archiver.kernel.org>; Wed,  5 May 2021 20:17:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6AF1613C3
	for <kernel-janitors@archiver.kernel.org>; Wed,  5 May 2021 20:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbhEEUST (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 5 May 2021 16:18:19 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:48502 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233891AbhEEUSS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 May 2021 16:18:18 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d16 with ME
        id 18HL2500121Fzsu038HLyU; Wed, 05 May 2021 22:17:20 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 05 May 2021 22:17:20 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     prabhakar.csengg@gmail.com, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, bparrot@ti.com,
        hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH V2] media: i2c: ov2659: Fix an error message
Date:   Wed,  5 May 2021 22:17:17 +0200
Message-Id: <d995e27db003a26e5b5eb53b0f40b55f8015d873.1620245794.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'ret' is known to be 0 here and printing -ENODEV wouldn't be really
helpful. So remove it from the error message.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
V2: Remove the Fixes tag. It doesn't really fix something, it just removes
    a useless information.
    Just remove ret. No need to add something else.
---
 drivers/media/i2c/ov2659.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 42f64175a6df..6bbbb94fdda4 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1368,8 +1368,7 @@ static int ov2659_detect(struct v4l2_subdev *sd)
 		id = OV265X_ID(pid, ver);
 		if (id != OV2659_ID) {
 			dev_err(&client->dev,
-				"Sensor detection failed (%04X, %d)\n",
-				id, ret);
+				"Sensor detection failed (%04X)\n", id);
 			ret = -ENODEV;
 		} else {
 			dev_info(&client->dev, "Found OV%04X sensor\n", id);
-- 
2.30.2

