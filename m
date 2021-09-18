Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6031DC433EF
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 05:36:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3867361052
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 05:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236050AbhIRFiJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 18 Sep 2021 01:38:09 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:47537 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231336AbhIRFiJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 18 Sep 2021 01:38:09 -0400
Received: from pop-os.home ([90.126.248.220])
        by mwinf5d65 with ME
        id vHck2500E4m3Hzu03Hckx2; Sat, 18 Sep 2021 07:36:45 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 Sep 2021 07:36:45 +0200
X-ME-IP: 90.126.248.220
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     tomas.winkler@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] mei: Remove usage of the deprecated "pci-dma-compat.h" API
Date:   Sat, 18 Sep 2021 07:36:42 +0200
Message-Id: <c6f280927835c5677cc0367fccdc0ef54b307bd8.1631943364.git.christophe.jaillet@wanadoo.fr>
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

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

[1]: https://lore.kernel.org/kernel-janitors/20200421081257.GA131897@infradead.org/
[2]: https://lore.kernel.org/kernel-janitors/alpine.DEB.2.22.394.2007120902170.2424@hadrien/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: Change Subject to be more explicit
    Keep only relevant part of the coccinelle script
    Try to improve the commit message to give some reason of why this change is done
---
 drivers/misc/mei/pci-txe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mei/pci-txe.c b/drivers/misc/mei/pci-txe.c
index aec0483b8e72..fa20d9a27813 100644
--- a/drivers/misc/mei/pci-txe.c
+++ b/drivers/misc/mei/pci-txe.c
@@ -69,9 +69,9 @@ static int mei_txe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto end;
 	}
 
-	err = pci_set_dma_mask(pdev, DMA_BIT_MASK(36));
+	err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(36));
 	if (err) {
-		err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+		err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
 		if (err) {
 			dev_err(&pdev->dev, "No suitable DMA available.\n");
 			goto end;
-- 
2.30.2

