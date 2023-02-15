Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A929C636D4
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Feb 2023 10:38:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbjBOKiP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Feb 2023 05:38:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjBOKiO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Feb 2023 05:38:14 -0500
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1EB360B3
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Feb 2023 02:38:12 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id SFAupWaW35qOuSFAupYXwG; Wed, 15 Feb 2023 11:38:10 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 15 Feb 2023 11:38:10 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: xiic: Remove some dead code
Date:   Wed, 15 Feb 2023 11:38:07 +0100
Message-Id: <9d36938de98dc491425a51a9c07367dd9e448e60.1676457464.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

wait_for_completion_timeout() never returns negative value.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-xiic.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 8503b5016aaf..5543f372ae60 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1038,10 +1038,6 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		i2c->rx_msg = NULL;
 		i2c->nmsgs = 0;
 		err = -ETIMEDOUT;
-	} else if (err < 0) {	/* Completion error */
-		i2c->tx_msg = NULL;
-		i2c->rx_msg = NULL;
-		i2c->nmsgs = 0;
 	} else {
 		err = (i2c->state == STATE_DONE) ? num : -EIO;
 	}
-- 
2.34.1

