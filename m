Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAF5C636CC
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Feb 2023 11:09:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjBOLJB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Feb 2023 06:09:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjBOLJA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Feb 2023 06:09:00 -0500
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C1D28D36
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Feb 2023 03:08:55 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id SFebpT64kwevESFebpYEea; Wed, 15 Feb 2023 12:08:54 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 15 Feb 2023 12:08:54 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: mxic-ecc: Fix mxic_ecc_data_xfer_wait_for_completion() when irq is used
Date:   Wed, 15 Feb 2023 12:08:45 +0100
Message-Id: <beddbc374557e44ceec897e68c4a5d12764ddbb9.1676459308.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

wait_for_completion_timeout() and readl_poll_timeout() don't handle their
return value the same way.

wait_for_completion_timeout() returns 0 on time out (and >0 in all other
cases)
readl_poll_timeout() returns 0 on success and -ETIMEDOUT upon a timeout.

In order for the error handling path to work in both cases, the logic
against wait_for_completion_timeout() needs to be inverted.

Fixes: 48e6633a9fa2 ("mtd: nand: mxic-ecc: Add Macronix external ECC engine support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This is really spurious.
If I'm right, this means that it never worked!

Can any one with the hardware test?
---
 drivers/mtd/nand/ecc-mxic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/ecc-mxic.c b/drivers/mtd/nand/ecc-mxic.c
index 8afdca731b87..6b487ffe2f2d 100644
--- a/drivers/mtd/nand/ecc-mxic.c
+++ b/drivers/mtd/nand/ecc-mxic.c
@@ -429,6 +429,7 @@ static int mxic_ecc_data_xfer_wait_for_completion(struct mxic_ecc_engine *mxic)
 		mxic_ecc_enable_int(mxic);
 		ret = wait_for_completion_timeout(&mxic->complete,
 						  msecs_to_jiffies(1000));
+		ret = ret ? 0 : -ETIMEDOUT;
 		mxic_ecc_disable_int(mxic);
 	} else {
 		ret = readl_poll_timeout(mxic->regs + INTRPT_STS, val,
-- 
2.34.1

