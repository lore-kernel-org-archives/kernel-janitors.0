Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980E4C433F5
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 06:36:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77E0860ED5
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 06:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238534AbhIRGiP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 18 Sep 2021 02:38:15 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:34361 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S240155AbhIRGht (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 18 Sep 2021 02:37:49 -0400
Received: from pop-os.home ([90.126.248.220])
        by mwinf5d65 with ME
        id vJcQ250024m3Hzu03JcQle; Sat, 18 Sep 2021 08:36:24 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 Sep 2021 08:36:24 +0200
X-ME-IP: 90.126.248.220
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     alexander.shishkin@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] intel_th: Simplify 'intel_th_pci_remove()'
Date:   Sat, 18 Sep 2021 08:36:22 +0200
Message-Id: <5a22ea4178d5142e4274da5eff3cedc1252a1797.1631946926.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'pci_free_irq_vectors()' is called in the remove function, but not in the
error handling path of the probe function.

In fact, it can be removed from the remove function because
'pcim_enable_device()' registers the 'pcim_release()' release function.
This function already does the needed clean-up.

While at it, document how resources allocated by 'pci_alloc_irq_vectors()'
are freed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This is only a clean-up patch.
Calling 'pci_alloc_irq_vectors()' and doing the same via 'pcim_release()'
is harmless.
---
 drivers/hwtracing/intel_th/pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwtracing/intel_th/pci.c b/drivers/hwtracing/intel_th/pci.c
index 7da4f298ed01..fd7adeea8ebe 100644
--- a/drivers/hwtracing/intel_th/pci.c
+++ b/drivers/hwtracing/intel_th/pci.c
@@ -92,6 +92,7 @@ static int intel_th_pci_probe(struct pci_dev *pdev,
 		r++;
 	}
 
+	/* Freed by the release function registered by pcim_enable_device() */
 	err = pci_alloc_irq_vectors(pdev, 1, 8, PCI_IRQ_ALL_TYPES);
 	if (err > 0)
 		for (i = 0; i < err; i++, r++) {
@@ -116,8 +117,6 @@ static void intel_th_pci_remove(struct pci_dev *pdev)
 	struct intel_th *th = pci_get_drvdata(pdev);
 
 	intel_th_free(th);
-
-	pci_free_irq_vectors(pdev);
 }
 
 static const struct intel_th_drvdata intel_th_1x_multi_is_broken = {
-- 
2.30.2

