Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E381C433EF
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 Jan 2022 12:51:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbiAIMvs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 9 Jan 2022 07:51:48 -0500
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:55592 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233052AbiAIMvs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 9 Jan 2022 07:51:48 -0500
Received: from pop-os.home ([90.11.185.88])
        by smtp.orange.fr with ESMTPA
        id 6XfmnCKJUUujj6XfmnIRy3; Sun, 09 Jan 2022 13:51:47 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 09 Jan 2022 13:51:47 +0100
X-ME-IP: 90.11.185.88
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-usb@vger.kernel.org
Subject: [PATCH] thunderbolt: Remove useless DMA-32 fallback configuration
Date:   Sun,  9 Jan 2022 13:51:31 +0100
Message-Id: <4b40fc065771fadc1a5187d533bd760e034ece58.1641732679.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

As stated in [1], dma_set_mask() with a 64-bit mask never fails if
dev->dma_mask is non-NULL.
So, if it fails, the 32 bits case will also fail for the same reason.

Simplify code and remove some dead code accordingly.


While at it, include directly <linux/dma-mapping.h> instead on relying on
indirect inclusion.

[1]: https://lkml.org/lkml/2021/6/7/398

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/thunderbolt/nhi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index c73da0532be4..4a582183f675 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/delay.h>
@@ -1229,8 +1230,6 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	spin_lock_init(&nhi->lock);
 
 	res = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
-	if (res)
-		res = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (res) {
 		dev_err(&pdev->dev, "failed to set DMA mask\n");
 		return res;
-- 
2.32.0

