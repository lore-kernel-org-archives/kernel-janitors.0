Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0379C6FD19
	for <kernel-janitors@archiver.kernel.org>; Mon, 13 Mar 2023 21:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjCMVwn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 13 Mar 2023 17:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjCMVwl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Mar 2023 17:52:41 -0400
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07F18C51F
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Mar 2023 14:52:39 -0700 (PDT)
Received: from localhost.localdomain ([185.117.37.92])
        by smtp.orange.fr with ESMTPA
        id bq5ppwjxtFvkEbq5pp0ucl; Mon, 13 Mar 2023 22:52:37 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 13 Mar 2023 22:52:37 +0100
X-ME-IP: 185.117.37.92
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     vkoul@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com
Cc:     dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] dmaengine: imx-dma: Remove a redundant memset() call
Date:   Mon, 13 Mar 2023 22:52:31 +0100
Message-Id: <95a81d623bffde2e5d14e22fad7e8c9a9a7203f6.1678743528.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The desc->desc structure is already zeroed when 'desc' is kzalloc()'ed.
There is no need to clear it twice.

Remove the redundant memset().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/dma/imx-dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 3bffe3ecbd1b..ee864128334a 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -750,7 +750,6 @@ static int imxdma_alloc_chan_resources(struct dma_chan *chan)
 		desc = kzalloc(sizeof(*desc), GFP_KERNEL);
 		if (!desc)
 			break;
-		memset(&desc->desc, 0, sizeof(struct dma_async_tx_descriptor));
 		dma_async_tx_descriptor_init(&desc->desc, chan);
 		desc->desc.tx_submit = imxdma_tx_submit;
 		/* txd.flags will be overwritten in prep funcs */
-- 
2.32.0

