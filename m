Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDF6C4332F
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Oct 2022 19:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiJTTVU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Oct 2022 15:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJTTVT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Oct 2022 15:21:19 -0400
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72A11E8B89
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Oct 2022 12:21:14 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id lb6No437EXaJmlb6Nox20h; Thu, 20 Oct 2022 21:21:12 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 20 Oct 2022 21:21:12 +0200
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Wu Zongyong <wuzongyong@linux.alibaba.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        virtualization@lists.linux-foundation.org
Subject: [PATCH] vdpa: Fix an error handling path in eni_vdpa_probe()
Date:   Thu, 20 Oct 2022 21:21:09 +0200
Message-Id: <a7b0ef1eabd081f1c7c894e9b11de01678e85dee.1666293559.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

After a successful vp_legacy_probe() call, vp_legacy_remove() should be
called in the error handling path, as already done in the remove function.

Add the missing call.

Fixes: e85087beedca ("eni_vdpa: add vDPA driver for Alibaba ENI")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/vdpa/alibaba/eni_vdpa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
index 5a09a09cca70..cce3d1837104 100644
--- a/drivers/vdpa/alibaba/eni_vdpa.c
+++ b/drivers/vdpa/alibaba/eni_vdpa.c
@@ -497,7 +497,7 @@ static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!eni_vdpa->vring) {
 		ret = -ENOMEM;
 		ENI_ERR(pdev, "failed to allocate virtqueues\n");
-		goto err;
+		goto err_remove_vp_legacy;
 	}
 
 	for (i = 0; i < eni_vdpa->queues; i++) {
@@ -509,11 +509,13 @@ static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	ret = vdpa_register_device(&eni_vdpa->vdpa, eni_vdpa->queues);
 	if (ret) {
 		ENI_ERR(pdev, "failed to register to vdpa bus\n");
-		goto err;
+		goto err_remove_vp_legacy;
 	}
 
 	return 0;
 
+err_remove_vp_legacy:
+	vp_legacy_remove(&eni_vdpa->ldev);
 err:
 	put_device(&eni_vdpa->vdpa.dev);
 	return ret;
-- 
2.34.1

