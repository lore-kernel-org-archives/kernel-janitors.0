Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0C0C43334
	for <kernel-janitors@archiver.kernel.org>; Fri,  8 Jul 2022 19:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239813AbiGHTbD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 8 Jul 2022 15:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239889AbiGHTav (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 Jul 2022 15:30:51 -0400
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr [80.12.242.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2F4796B5
        for <kernel-janitors@vger.kernel.org>; Fri,  8 Jul 2022 12:30:08 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id 9tfuo7mRnJXxR9tfvojggV; Fri, 08 Jul 2022 21:30:07 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 08 Jul 2022 21:30:07 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: arm_scmi: Use the bitmap API to allocate bitmaps
Date:   Fri,  8 Jul 2022 21:30:01 +0200
Message-Id: <c073b1607ada34d5bde6ce1009179cf15bbf0da3.1657308593.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use devm_bitmap_zalloc() instead of hand-writing them.

It is less verbose and it improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/firmware/arm_scmi/driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 609ebedee9cb..b1265732d83a 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1911,8 +1911,8 @@ static int __scmi_xfer_info_init(struct scmi_info *sinfo,
 	hash_init(info->pending_xfers);
 
 	/* Allocate a bitmask sized to hold MSG_TOKEN_MAX tokens */
-	info->xfer_alloc_table = devm_kcalloc(dev, BITS_TO_LONGS(MSG_TOKEN_MAX),
-					      sizeof(long), GFP_KERNEL);
+	info->xfer_alloc_table = devm_bitmap_zalloc(dev, MSG_TOKEN_MAX,
+						    GFP_KERNEL);
 	if (!info->xfer_alloc_table)
 		return -ENOMEM;
 
-- 
2.34.1

