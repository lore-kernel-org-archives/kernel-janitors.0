Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37374C4338F
	for <kernel-janitors@archiver.kernel.org>; Sun, 22 Aug 2021 21:27:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E2BF61247
	for <kernel-janitors@archiver.kernel.org>; Sun, 22 Aug 2021 21:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbhHVV1z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 22 Aug 2021 17:27:55 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:25386 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232619AbhHVV1z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 Aug 2021 17:27:55 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d51 with ME
        id klTC250053riaq203lTCv3; Sun, 22 Aug 2021 23:27:12 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 22 Aug 2021 23:27:12 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/r128: switch from 'pci_' to 'dma_' API
Date:   Sun, 22 Aug 2021 23:27:10 +0200
Message-Id: <46ccdd7bffdba1273a1ebb3d6cd2fbe186e0795a.1629667572.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below.

It has been compile tested.

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
---
 drivers/gpu/drm/r128/ati_pcigart.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/r128/ati_pcigart.c b/drivers/gpu/drm/r128/ati_pcigart.c
index 0ecccf25a3c7..26001c2de9e9 100644
--- a/drivers/gpu/drm/r128/ati_pcigart.c
+++ b/drivers/gpu/drm/r128/ati_pcigart.c
@@ -99,7 +99,8 @@ int drm_ati_pcigart_cleanup(struct drm_device *dev, struct drm_ati_pcigart_info
 		for (i = 0; i < pages; i++) {
 			if (!entry->busaddr[i])
 				break;
-			pci_unmap_page(pdev, entry->busaddr[i], PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
+			dma_unmap_page(&pdev->dev, entry->busaddr[i],
+				       PAGE_SIZE, DMA_BIDIRECTIONAL);
 		}
 
 		if (gart_info->gart_table_location == DRM_ATI_GART_MAIN)
@@ -134,7 +135,7 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
 	if (gart_info->gart_table_location == DRM_ATI_GART_MAIN) {
 		DRM_DEBUG("PCI: no table in VRAM: using normal RAM\n");
 
-		if (pci_set_dma_mask(pdev, gart_info->table_mask)) {
+		if (dma_set_mask(&pdev->dev, gart_info->table_mask)) {
 			DRM_ERROR("fail to set dma mask to 0x%Lx\n",
 				  (unsigned long long)gart_info->table_mask);
 			ret = -EFAULT;
@@ -173,9 +174,9 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
 	gart_idx = 0;
 	for (i = 0; i < pages; i++) {
 		/* we need to support large memory configurations */
-		entry->busaddr[i] = pci_map_page(pdev, entry->pagelist[i],
-						 0, PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
-		if (pci_dma_mapping_error(pdev, entry->busaddr[i])) {
+		entry->busaddr[i] = dma_map_page(&pdev->dev, entry->pagelist[i],
+						 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(&pdev->dev, entry->busaddr[i])) {
 			DRM_ERROR("unable to map PCIGART pages!\n");
 			drm_ati_pcigart_cleanup(dev, gart_info);
 			address = NULL;
-- 
2.30.2

