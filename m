Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7B5C433F5
	for <kernel-janitors@archiver.kernel.org>; Sun,  7 Nov 2021 16:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCFCB60FC2
	for <kernel-janitors@archiver.kernel.org>; Sun,  7 Nov 2021 16:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235762AbhKGQ2i (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 7 Nov 2021 11:28:38 -0500
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:53628 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234664AbhKGQ2h (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 7 Nov 2021 11:28:37 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id jkzNmTDaKf6fnjkzNmDULC; Sun, 07 Nov 2021 17:25:53 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 07 Nov 2021 17:25:53 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, lee.jones@linaro.org,
        jiapeng.chong@linux.alibaba.com, abaci-bugfix@linux.alibaba.com,
        shubhrajyoti.datta@xilinx.com
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] usb: gadget: udc-xilinx: Fix an error handling path in 'xudc_probe()'
Date:   Sun,  7 Nov 2021 17:25:48 +0100
Message-Id: <ec61a89b83ce34b53a3bdaacfd1413a9869cc608.1636302246.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

A successful 'clk_prepare_enable()' call should be balanced by a
corresponding 'clk_disable_unprepare()' call in the error handling path
of the probe, as already done in the remove function.

Fixes: 24749229211c ("usb: gadget: udc-xilinx: Add clock support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index f5ca670776a3..857159dd5ae0 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -2136,7 +2136,7 @@ static int xudc_probe(struct platform_device *pdev)
 
 	ret = usb_add_gadget_udc(&pdev->dev, &udc->gadget);
 	if (ret)
-		goto fail;
+		goto err_disable_unprepare_clk;
 
 	udc->dev = &udc->gadget.dev;
 
@@ -2155,6 +2155,9 @@ static int xudc_probe(struct platform_device *pdev)
 		 udc->dma_enabled ? "with DMA" : "without DMA");
 
 	return 0;
+
+err_disable_unprepare_clk:
+	clk_disable_unprepare(udc->clk);
 fail:
 	dev_err(&pdev->dev, "probe failed, %d\n", ret);
 	return ret;
-- 
2.30.2

