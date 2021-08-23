Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA005C4338F
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Aug 2021 05:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C1636126A
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Aug 2021 05:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234005AbhHWFzI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Aug 2021 01:55:08 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:54299 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbhHWFzH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Aug 2021 01:55:07 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d55 with ME
        id ktuM2500B3riaq203tuMJl; Mon, 23 Aug 2021 07:54:22 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 23 Aug 2021 07:54:22 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] misc: rtsx: switch from 'pci_' to 'dma_' API
Date:   Mon, 23 Aug 2021 07:54:20 +0200
Message-Id: <50eeb23378e04ef99859eb37c88ca2bf9a702b4c.1629698008.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below.

@@
@@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@
@@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@
@@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
@@
-    PCI_DMA_NONE
+    DMA_NONE

@@
expression e1, e2, e3;
@@
-    pci_alloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3;
@@
-    pci_zalloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_single(e1, e2, e3, e4)
+    dma_map_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4, e5;
@@
-    pci_map_page(e1, e2, e3, e4, e5)
+    dma_map_page(&e1->dev, e2, e3, e4, e5)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_page(e1, e2, e3, e4)
+    dma_unmap_page(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_sg(e1, e2, e3, e4)
+    dma_map_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_sg(e1, e2, e3, e4)
+    dma_unmap_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
+    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_device(e1, e2, e3, e4)
+    dma_sync_single_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
+    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
+    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2;
@@
-    pci_dma_mapping_error(e1, e2)
+    dma_mapping_error(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_consistent_dma_mask(e1, e2)
+    dma_set_coherent_mask(&e1->dev, e2)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If needed, see post from Christoph Hellwig on the kernel-janitors ML:
   https://marc.info/?l=kernel-janitors&m=158745678307186&w=4

It is *NOT* been compile tested, but it looks safe enough!
---
 drivers/misc/cardreader/rtsx_pcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
index baf83594a01d..8c72eb590f79 100644
--- a/drivers/misc/cardreader/rtsx_pcr.c
+++ b/drivers/misc/cardreader/rtsx_pcr.c
@@ -1536,7 +1536,7 @@ static int rtsx_pci_probe(struct pci_dev *pcidev,
 		pci_name(pcidev), (int)pcidev->vendor, (int)pcidev->device,
 		(int)pcidev->revision);
 
-	ret = pci_set_dma_mask(pcidev, DMA_BIT_MASK(32));
+	ret = dma_set_mask(&pcidev->dev, DMA_BIT_MASK(32));
 	if (ret < 0)
 		return ret;
 
-- 
2.30.2

