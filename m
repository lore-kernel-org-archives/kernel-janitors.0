Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C7FC433EF
	for <kernel-janitors@archiver.kernel.org>; Sun,  7 Nov 2021 16:14:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11DC6603E7
	for <kernel-janitors@archiver.kernel.org>; Sun,  7 Nov 2021 16:14:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235712AbhKGQRe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 7 Nov 2021 11:17:34 -0500
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:62121 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235709AbhKGQRd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 7 Nov 2021 11:17:33 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id jkohmT6oqf6fnjkoimDSlI; Sun, 07 Nov 2021 17:14:49 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 07 Nov 2021 17:14:49 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mst@redhat.com, jasowang@redhat.com, wuzongyong@linux.alibaba.com,
        arnd@arndb.de
Cc:     virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] eni_vdpa: Fix an error handling path in 'eni_vdpa_probe()'
Date:   Sun,  7 Nov 2021 17:14:46 +0100
Message-Id: <f6b2d087ca3840604b4e711a208d35b5d6285cb4.1636301587.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In the error handling path, a successful 'vp_legacy_probe()' should be
balanced by a corresponding 'vp_legacy_remove()' call, as already done in
the remove function.

Add the missing call and update gotos accordingly.

Fixes: e85087beedca ("eni_vdpa: add vDPA driver for Alibaba ENI")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/vdpa/alibaba/eni_vdpa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
index 3f788794571a..12b3db6b4517 100644
--- a/drivers/vdpa/alibaba/eni_vdpa.c
+++ b/drivers/vdpa/alibaba/eni_vdpa.c
@@ -501,7 +501,7 @@ static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!eni_vdpa->vring) {
 		ret = -ENOMEM;
 		ENI_ERR(pdev, "failed to allocate virtqueues\n");
-		goto err;
+		goto err_remove_vp_legacy;
 	}
 
 	for (i = 0; i < eni_vdpa->queues; i++) {
@@ -513,11 +513,13 @@ static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
2.30.2

