Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671F1C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri,  7 May 2021 17:02:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F95761460
	for <kernel-janitors@archiver.kernel.org>; Fri,  7 May 2021 17:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236591AbhEGRDx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 7 May 2021 13:03:53 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:29166 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236467AbhEGRDw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 May 2021 13:03:52 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d33 with ME
        id 1t2p2500d21Fzsu03t2pdH; Fri, 07 May 2021 19:02:51 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 07 May 2021 19:02:51 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     srinivas.kandagatla@linaro.org, orsonzhai@gmail.com,
        baolin.wang7@gmail.com, zhang.lyra@gmail.com,
        gregkh@linuxfoundation.org, freeman.liu@unisoc.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] nvmem: sprd: Fix an error message
Date:   Fri,  7 May 2021 19:02:48 +0200
Message-Id: <5bc44aace2fe7e1c91d8b35c8fe31e7134ceab2c.1620406852.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'ret' is known to be 0 here.
The expected error status is stored in 'status', so use it instead.

Also change %d in %u, because status is an u32, not a int.

Fixes: 096030e7f449 ("nvmem: sprd: Add Spreadtrum SoCs eFuse support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/nvmem/sprd-efuse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
index 5d394559edf2..e3e721d4c205 100644
--- a/drivers/nvmem/sprd-efuse.c
+++ b/drivers/nvmem/sprd-efuse.c
@@ -234,7 +234,7 @@ static int sprd_efuse_raw_prog(struct sprd_efuse *efuse, u32 blk, bool doub,
 	status = readl(efuse->base + SPRD_EFUSE_ERR_FLAG);
 	if (status) {
 		dev_err(efuse->dev,
-			"write error status %d of block %d\n", ret, blk);
+			"write error status %u of block %d\n", status, blk);
 
 		writel(SPRD_EFUSE_ERR_CLR_MASK,
 		       efuse->base + SPRD_EFUSE_ERR_CLR);
-- 
2.30.2

