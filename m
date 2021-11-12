Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80848C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Nov 2021 17:09:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6712660F42
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Nov 2021 17:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235465AbhKLRMs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Nov 2021 12:12:48 -0500
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:56494 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhKLRMr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Nov 2021 12:12:47 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id la3nmTxux1UGBla3nmGMMW; Fri, 12 Nov 2021 18:09:55 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 12 Nov 2021 18:09:55 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     andraprs@amazon.com, lexnv@amazon.com, alcioa@amazon.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] nitro_enclaves: Remove redundant 'flush_workqueue()' calls
Date:   Fri, 12 Nov 2021 18:09:54 +0100
Message-Id: <d57f5c7e362837a8dfcde0d726a76b56f114e619.1636736947.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

This was generated with coccinelle:

@@
expression E;
@@
- 	flush_workqueue(E);
	destroy_workqueue(E);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/virt/nitro_enclaves/ne_pci_dev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/virt/nitro_enclaves/ne_pci_dev.c b/drivers/virt/nitro_enclaves/ne_pci_dev.c
index 40b49ec8e30b..6b81e8f3a5dc 100644
--- a/drivers/virt/nitro_enclaves/ne_pci_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_pci_dev.c
@@ -376,7 +376,6 @@ static void ne_teardown_msix(struct pci_dev *pdev)
 	free_irq(pci_irq_vector(pdev, NE_VEC_EVENT), ne_pci_dev);
 
 	flush_work(&ne_pci_dev->notify_work);
-	flush_workqueue(ne_pci_dev->event_wq);
 	destroy_workqueue(ne_pci_dev->event_wq);
 
 	free_irq(pci_irq_vector(pdev, NE_VEC_REPLY), ne_pci_dev);
-- 
2.30.2

