Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF64C4332F
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 05:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CDC6610D1
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 05:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235072AbhIRFV6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 18 Sep 2021 01:21:58 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:17104 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S234631AbhIRFV6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 18 Sep 2021 01:21:58 -0400
Received: from pop-os.home ([90.126.248.220])
        by mwinf5d65 with ME
        id vHLW2500H4m3Hzu03HLWDZ; Sat, 18 Sep 2021 07:20:32 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 Sep 2021 07:20:32 +0200
X-ME-IP: 90.126.248.220
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     haver@linux.ibm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] misc: genwqe: Remove usage of the deprecated "pci-dma-compat.h" API
Date:   Sat, 18 Sep 2021 07:20:28 +0200
Message-Id: <590154f2ab113088346ae76c3f13f8b1cbebccbb.1631942274.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In [1], Christoph Hellwig has proposed to remove the wrappers in
include/linux/pci-dma-compat.h.

Some reasons why this API should be removed have been given by Julia
Lawall in [2].

Finally, Arnd Bergmann reminded that the documentation was updated 11 years
ago to only describe the modern linux/dma-mapping.h interfaces and mark the
old bus-specific ones as no longer recommended, see commit 216bf58f4092
("Documentation: convert PCI-DMA-mapping.txt to use the generic DMA API").

A coccinelle script has been used to perform the needed transformation
Only relevant parts are given below.

@@ @@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL@@

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
expression e1, e2;
@@
-    pci_dma_mapping_error(e1, e2)
+    dma_mapping_error(&e1->dev, e2)

[1]: https://lore.kernel.org/kernel-janitors/20200421081257.GA131897@infradead.org/
[2]: https://lore.kernel.org/kernel-janitors/alpine.DEB.2.22.394.2007120902170.2424@hadrien/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: Change Subject to be more explicit
    Keep only relevant part of the coccinelle script
    Try to improve the commit message to give some reason of why this change is done
---
 drivers/misc/genwqe/card_utils.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/genwqe/card_utils.c b/drivers/misc/genwqe/card_utils.c
index 039b923d1d60..1167463f26fb 100644
--- a/drivers/misc/genwqe/card_utils.c
+++ b/drivers/misc/genwqe/card_utils.c
@@ -233,8 +233,8 @@ static void genwqe_unmap_pages(struct genwqe_dev *cd, dma_addr_t *dma_list,
 	struct pci_dev *pci_dev = cd->pci_dev;
 
 	for (i = 0; (i < num_pages) && (dma_list[i] != 0x0); i++) {
-		pci_unmap_page(pci_dev, dma_list[i],
-			       PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
+		dma_unmap_page(&pci_dev->dev, dma_list[i], PAGE_SIZE,
+			       DMA_BIDIRECTIONAL);
 		dma_list[i] = 0x0;
 	}
 }
@@ -251,12 +251,12 @@ static int genwqe_map_pages(struct genwqe_dev *cd,
 		dma_addr_t daddr;
 
 		dma_list[i] = 0x0;
-		daddr = pci_map_page(pci_dev, page_list[i],
+		daddr = dma_map_page(&pci_dev->dev, page_list[i],
 				     0,	 /* map_offs */
 				     PAGE_SIZE,
-				     PCI_DMA_BIDIRECTIONAL);  /* FIXME rd/rw */
+				     DMA_BIDIRECTIONAL);  /* FIXME rd/rw */
 
-		if (pci_dma_mapping_error(pci_dev, daddr)) {
+		if (dma_mapping_error(&pci_dev->dev, daddr)) {
 			dev_err(&pci_dev->dev,
 				"[%s] err: no dma addr daddr=%016llx!\n",
 				__func__, (long long)daddr);
-- 
2.30.2

