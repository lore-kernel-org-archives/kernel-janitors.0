Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929F5C433EF
	for <kernel-janitors@archiver.kernel.org>; Sun,  7 Nov 2021 16:15:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DAEE603E7
	for <kernel-janitors@archiver.kernel.org>; Sun,  7 Nov 2021 16:15:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235723AbhKGQRo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 7 Nov 2021 11:17:44 -0500
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:55650 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235708AbhKGQRo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 7 Nov 2021 11:17:44 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id jkotmT6xIf6fnjkoumDSoH; Sun, 07 Nov 2021 17:15:00 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 07 Nov 2021 17:15:00 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mst@redhat.com, jasowang@redhat.com, wuzongyong@linux.alibaba.com,
        arnd@arndb.de
Cc:     virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] eni_vdpa: Simplify 'eni_vdpa_probe()'
Date:   Sun,  7 Nov 2021 17:14:56 +0100
Message-Id: <02045bdcbbb25f79bae4827f66029cfcddc90381.1636301587.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <f6b2d087ca3840604b4e711a208d35b5d6285cb4.1636301587.git.christophe.jaillet@wanadoo.fr>
References: <f6b2d087ca3840604b4e711a208d35b5d6285cb4.1636301587.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

When 'pcim_enable_device()' is used, some resources become automagically
managed.
There is no need to call 'pci_free_irq_vectors()' when the driver is
removed. The same will already be done by 'pcim_release()'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Leaving the 'pci_free_irq_vectors()' call is harmless.
---
 drivers/vdpa/alibaba/eni_vdpa.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
index 12b3db6b4517..3db686436628 100644
--- a/drivers/vdpa/alibaba/eni_vdpa.c
+++ b/drivers/vdpa/alibaba/eni_vdpa.c
@@ -450,11 +450,6 @@ static u16 eni_vdpa_get_num_queues(struct eni_vdpa *eni_vdpa)
 	return num;
 }
 
-static void eni_vdpa_free_irq_vectors(void *data)
-{
-	pci_free_irq_vectors(data);
-}
-
 static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct device *dev = &pdev->dev;
@@ -488,13 +483,6 @@ static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	eni_vdpa->vdpa.dma_dev = &pdev->dev;
 	eni_vdpa->queues = eni_vdpa_get_num_queues(eni_vdpa);
 
-	ret = devm_add_action_or_reset(dev, eni_vdpa_free_irq_vectors, pdev);
-	if (ret) {
-		ENI_ERR(pdev,
-			"failed for adding devres for freeing irq vectors\n");
-		goto err;
-	}
-
 	eni_vdpa->vring = devm_kcalloc(&pdev->dev, eni_vdpa->queues,
 				      sizeof(*eni_vdpa->vring),
 				      GFP_KERNEL);
-- 
2.30.2

