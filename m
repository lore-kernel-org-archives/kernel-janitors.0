Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42275C432BE
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 17:17:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B2DE60F44
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 17:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240244AbhH0RSZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Aug 2021 13:18:25 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:35604 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230021AbhH0RSY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Aug 2021 13:18:24 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d74 with ME
        id mhHa250073riaq203hHaYv; Fri, 27 Aug 2021 19:17:34 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 27 Aug 2021 19:17:34 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     eli.billauer@gmail.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v1 1/4] char: xillybus: Remove usage of the deprecated 'pci-dma-compat.h' API
Date:   Fri, 27 Aug 2021 19:17:33 +0200
Message-Id: <e25aa2a804972c5d4f06c4c4e0511e11ff97a425.1630083668.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1630083668.git.christophe.jaillet@wanadoo.fr>
References: <cover.1630083668.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In [1], Christoph Hellwig has proposed to remove the wrappers in
include/linux/pci-dma-compat.h.

Some reasons why this API should be removed have been given by Julia
Lawall in [2].

A coccinelle script has been used to perform the needed transformation
Only relevant part are given below.

'xilly_pci_direction()' has been hand modified to simplify it slightly.

It has been compile tested.


@@ @@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@ @@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@ @@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

[1]: https://lore.kernel.org/kernel-janitors/20200421081257.GA131897@infradead.org/
[2]: https://lore.kernel.org/kernel-janitors/alpine.DEB.2.22.394.2007120902170.2424@hadrien/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/char/xillybus/xillybus_pcie.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/char/xillybus/xillybus_pcie.c b/drivers/char/xillybus/xillybus_pcie.c
index bdf1c366b4fc..be25bfdb0d9a 100644
--- a/drivers/char/xillybus/xillybus_pcie.c
+++ b/drivers/char/xillybus/xillybus_pcie.c
@@ -36,11 +36,10 @@ static int xilly_pci_direction(int direction)
 {
 	switch (direction) {
 	case DMA_TO_DEVICE:
-		return PCI_DMA_TODEVICE;
 	case DMA_FROM_DEVICE:
-		return PCI_DMA_FROMDEVICE;
+		return direction;
 	default:
-		return PCI_DMA_BIDIRECTIONAL;
+		return DMA_BIDIRECTIONAL;
 	}
 }
 
@@ -185,9 +184,9 @@ static int xilly_probe(struct pci_dev *pdev,
 	 * So go for the 64-bit mask only when failing is the other option.
 	 */
 
-	if (!pci_set_dma_mask(pdev, DMA_BIT_MASK(32))) {
+	if (!dma_set_mask(&pdev->dev, DMA_BIT_MASK(32))) {
 		endpoint->dma_using_dac = 0;
-	} else if (!pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
+	} else if (!dma_set_mask(&pdev->dev, DMA_BIT_MASK(64))) {
 		endpoint->dma_using_dac = 1;
 	} else {
 		dev_err(endpoint->dev, "Failed to set DMA mask. Aborting.\n");
-- 
2.30.2

