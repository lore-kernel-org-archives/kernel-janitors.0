Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48798C43381
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 002FE64DDA
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355226AbhCDAVV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:21:21 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:58334 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241433AbhCCK2t (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 05:28:49 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lHO1m-0000ol-IK; Wed, 03 Mar 2021 09:42:46 +0000
From:   Colin King <colin.king@canonical.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-mtd@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: nand: Fix error handling in nand_prog_page_op
Date:   Wed,  3 Mar 2021 09:42:46 +0000
Message-Id: <20210303094246.5724-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The less than zero comparison with status is always false because status
is a u8. Fix this by using ret as the return check for the call to
chip->legacy.waitfunc() and checking on this and assigning status to ret
if it is OK.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 52f67def97f1 ("mtd: nand: fix error handling in nand_prog_page_op() #1")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/raw/nand_base.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 0f6babefaed2..4f263c22c80d 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1462,9 +1462,10 @@ int nand_prog_page_op(struct nand_chip *chip, unsigned int page,
 				     page);
 		chip->legacy.write_buf(chip, buf, len);
 		chip->legacy.cmdfunc(chip, NAND_CMD_PAGEPROG, -1, -1);
-		status = chip->legacy.waitfunc(chip);
-		if (status < 0)
-			return status;
+		ret = chip->legacy.waitfunc(chip);
+		if (ret < 0)
+			return ret;
+		status = ret;
 	}
 
 	if (status & NAND_STATUS_FAIL)
-- 
2.30.0

