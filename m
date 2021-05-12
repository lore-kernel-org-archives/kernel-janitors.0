Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B31FC433B4
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 11:15:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C28AC61263
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 11:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhELLQm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 May 2021 07:16:42 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:20995 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbhELLQl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 May 2021 07:16:41 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d58 with ME
        id 3nFX2500W21Fzsu03nFX49; Wed, 12 May 2021 13:15:32 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 12 May 2021 13:15:32 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     richardcochran@gmail.com, kuba@kernel.org, jonathan.lemon@gmail.com
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ptp: ocp: Fix a resource leak in an error handling path
Date:   Wed, 12 May 2021 13:15:29 +0200
Message-Id: <141cd7dc7b44385ead176b1d0eb139573b47f110.1620818043.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If an error occurs after a successful 'pci_ioremap_bar()' call, it must be
undone by a corresponding 'pci_iounmap()' call, as already done in the
remove function.

Fixes: a7e1abad13f3 ("ptp: Add clock driver for the OpenCompute TimeCard.")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/ptp/ptp_ocp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 530e5f90095e..0d1034e3ed0f 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -324,7 +324,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!bp->base) {
 		dev_err(&pdev->dev, "io_remap bar0\n");
 		err = -ENOMEM;
-		goto out;
+		goto out_release_regions;
 	}
 	bp->reg = bp->base + OCP_REGISTER_OFFSET;
 	bp->tod = bp->base + TOD_REGISTER_OFFSET;
@@ -347,6 +347,8 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return 0;
 
 out:
+	pci_iounmap(pdev, bp->base);
+out_release_regions:
 	pci_release_regions(pdev);
 out_disable:
 	pci_disable_device(pdev);
-- 
2.30.2

