Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D894C432BE
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 20:06:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 046F960F92
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 20:06:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbhH0UHa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Aug 2021 16:07:30 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:29120 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231167AbhH0UHa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Aug 2021 16:07:30 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d77 with ME
        id mk6e2500A3riaq203k6fzR; Fri, 27 Aug 2021 22:06:39 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 27 Aug 2021 22:06:39 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     davem@davemloft.net, kuba@kernel.org, gregkh@linuxfoundation.org
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] niu: switch from 'pci_' to 'dma_' API
Date:   Fri, 27 Aug 2021 22:06:37 +0200
Message-Id: <24bff575e35f3f5990d7c53741000a3ed29fb60a.1630094750.git.christophe.jaillet@wanadoo.fr>
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

A coccinelle script has been used to perform the needed transformation
Only relevant parts are given below.

It has been hand modified to use 'dma_set_mask_and_coherent()' instead of
'pci_set_dma_mask()/pci_set_consistent_dma_mask()' when applicable.
This is less verbose.

Finally, the now useless 'dma_mask' variable has been removed.

It has been compile tested.

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


[1]: https://lore.kernel.org/kernel-janitors/20200421081257.GA131897@infradead.org/
[2]: https://lore.kernel.org/kernel-janitors/alpine.DEB.2.22.394.2007120902170.2424@hadrien/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/sun/niu.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index 1501e8906be4..a68a01d1b2b1 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -9722,7 +9722,6 @@ static int niu_pci_init_one(struct pci_dev *pdev,
 	struct net_device *dev;
 	struct niu *np;
 	int err;
-	u64 dma_mask;
 
 	niu_driver_version();
 
@@ -9777,18 +9776,11 @@ static int niu_pci_init_one(struct pci_dev *pdev,
 		PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE |
 		PCI_EXP_DEVCTL_RELAX_EN);
 
-	dma_mask = DMA_BIT_MASK(44);
-	err = pci_set_dma_mask(pdev, dma_mask);
-	if (!err) {
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(44));
+	if (!err)
 		dev->features |= NETIF_F_HIGHDMA;
-		err = pci_set_consistent_dma_mask(pdev, dma_mask);
-		if (err) {
-			dev_err(&pdev->dev, "Unable to obtain 44 bit DMA for consistent allocations, aborting\n");
-			goto err_out_release_parent;
-		}
-	}
 	if (err) {
-		err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+		err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
 		if (err) {
 			dev_err(&pdev->dev, "No usable DMA configuration, aborting\n");
 			goto err_out_release_parent;
-- 
2.30.2

