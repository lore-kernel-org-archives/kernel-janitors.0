Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968CBC636CD
	for <kernel-janitors@archiver.kernel.org>; Sat,  4 Feb 2023 20:32:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbjBDUcO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 4 Feb 2023 15:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbjBDUcN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 4 Feb 2023 15:32:13 -0500
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD922B092
        for <kernel-janitors@vger.kernel.org>; Sat,  4 Feb 2023 12:32:08 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id OPCRpn7kE4UotOPCRphKuG; Sat, 04 Feb 2023 21:32:06 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 04 Feb 2023 21:32:06 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        iommu@lists.linux.dev
Subject: [PATCH] iommu/intel: Do not use GFP_ATOMIC when not needed
Date:   Sat,  4 Feb 2023 21:31:45 +0100
Message-Id: <e2a8a1019ffc8a86b4b4ed93def3623f60581274.1675542576.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is no need to use GFP_ATOMIC here. GFP_KERNEL is already used for
some other memory allocations just a few lines above.

Commit e3a981d61d15 ("iommu/vt-d: Convert allocations to GFP_KERNEL") has
changed the other memory allocation flags.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iommu/intel/irq_remapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index 6d01fa078c36..013ccc25ee4f 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -552,7 +552,7 @@ static int intel_setup_irq_remapping(struct intel_iommu *iommu)
 		goto out_free_table;
 	}
 
-	bitmap = bitmap_zalloc(INTR_REMAP_TABLE_ENTRIES, GFP_ATOMIC);
+	bitmap = bitmap_zalloc(INTR_REMAP_TABLE_ENTRIES, GFP_KERNEL);
 	if (bitmap == NULL) {
 		pr_err("IR%d: failed to allocate bitmap\n", iommu->seq_id);
 		goto out_free_pages;
-- 
2.34.1

