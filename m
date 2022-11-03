Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4DAC4332F
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Nov 2022 06:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiKCGli (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 3 Nov 2022 02:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbiKCGlg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Nov 2022 02:41:36 -0400
Received: from smtp.smtpout.orange.fr (smtp-11.smtpout.orange.fr [80.12.242.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95ECDEA5
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Nov 2022 23:41:34 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id qTuto9Kl2Fv0OqTutoMxwL; Thu, 03 Nov 2022 07:41:32 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 03 Nov 2022 07:41:32 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] firmware: ti_sci: Use devm_bitmap_zalloc when applicable
Date:   Thu,  3 Nov 2022 07:41:30 +0100
Message-Id: <43ab1a7dd073d0d037d5d4bbbd5f8335de605826.1667457664.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'xfer_alloc_table' is a bitmap. So use 'devm_bitmap_zalloc()' to simplify
code and improve the semantic of the code.

While at it, remove a redundant 'bitmap_zero()' call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Nishanth Menon <nm@ti.com>
---
Change in v2:
  * sync with -next
  * add R-b

v1: https://lore.kernel.org/all/1bd77909ff75f62a2228a39db208c4c6d1b3e0e2.1632659746.git.christophe.jaillet@wanadoo.fr/
---
 drivers/firmware/ti_sci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 6d2fd0ff7ff3..039d92a595ec 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3398,13 +3398,11 @@ static int ti_sci_probe(struct platform_device *pdev)
 	if (!minfo->xfer_block)
 		return -ENOMEM;
 
-	minfo->xfer_alloc_table = devm_kcalloc(dev,
-					       BITS_TO_LONGS(desc->max_msgs),
-					       sizeof(unsigned long),
-					       GFP_KERNEL);
+	minfo->xfer_alloc_table = devm_bitmap_zalloc(dev,
+						     desc->max_msgs,
+						     GFP_KERNEL);
 	if (!minfo->xfer_alloc_table)
 		return -ENOMEM;
-	bitmap_zero(minfo->xfer_alloc_table, desc->max_msgs);
 
 	/* Pre-initialize the buffer pointer to pre-allocated buffers */
 	for (i = 0, xfer = minfo->xfer_block; i < desc->max_msgs; i++, xfer++) {
-- 
2.34.1

