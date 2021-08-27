Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB12C432BE
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 17:17:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 678D660F6C
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 17:17:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240454AbhH0RSo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Aug 2021 13:18:44 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:24867 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S240433AbhH0RSo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Aug 2021 13:18:44 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d74 with ME
        id mhHu250093riaq203hHuaw; Fri, 27 Aug 2021 19:17:54 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 27 Aug 2021 19:17:54 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     eli.billauer@gmail.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v1 4/4] char: xillybus: Simplify 'xillybus_init_endpoint()'
Date:   Fri, 27 Aug 2021 19:17:53 +0200
Message-Id: <ba687c1eff5dc8f21422323f57164d06f25d4169.1630083668.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1630083668.git.christophe.jaillet@wanadoo.fr>
References: <cover.1630083668.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Ths first argument of 'xillybus_init_endpoint()' is now useless.
Remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/char/xillybus/xillybus.h      | 3 +--
 drivers/char/xillybus/xillybus_core.c | 4 +---
 drivers/char/xillybus/xillybus_of.c   | 2 +-
 drivers/char/xillybus/xillybus_pcie.c | 2 +-
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/char/xillybus/xillybus.h b/drivers/char/xillybus/xillybus.h
index 55d47cb13a7b..afce5bb4d127 100644
--- a/drivers/char/xillybus/xillybus.h
+++ b/drivers/char/xillybus/xillybus.h
@@ -134,8 +134,7 @@ struct xilly_mapping {
 
 irqreturn_t xillybus_isr(int irq, void *data);
 
-struct xilly_endpoint *xillybus_init_endpoint(struct pci_dev *pdev,
-					      struct device *dev,
+struct xilly_endpoint *xillybus_init_endpoint(struct device *dev,
 					      struct xilly_endpoint_hardware
 					      *ephw);
 
diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index 0ced9ec6977f..02f30140c2d5 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -1772,8 +1772,7 @@ static const struct file_operations xillybus_fops = {
 	.poll       = xillybus_poll,
 };
 
-struct xilly_endpoint *xillybus_init_endpoint(struct pci_dev *pdev,
-					      struct device *dev,
+struct xilly_endpoint *xillybus_init_endpoint(struct device *dev,
 					      struct xilly_endpoint_hardware
 					      *ephw)
 {
@@ -1783,7 +1782,6 @@ struct xilly_endpoint *xillybus_init_endpoint(struct pci_dev *pdev,
 	if (!endpoint)
 		return NULL;
 
-	(void)pdev;	// silence a compiler warning, will be removed
 	endpoint->dev = dev;
 	endpoint->ephw = ephw;
 	endpoint->msg_counter = 0x0b;
diff --git a/drivers/char/xillybus/xillybus_of.c b/drivers/char/xillybus/xillybus_of.c
index 1a20b286fd1d..4e6e0c19d8c8 100644
--- a/drivers/char/xillybus/xillybus_of.c
+++ b/drivers/char/xillybus/xillybus_of.c
@@ -120,7 +120,7 @@ static int xilly_drv_probe(struct platform_device *op)
 	if (of_property_read_bool(dev->of_node, "dma-coherent"))
 		ephw = &of_hw_coherent;
 
-	endpoint = xillybus_init_endpoint(NULL, dev, ephw);
+	endpoint = xillybus_init_endpoint(dev, ephw);
 
 	if (!endpoint)
 		return -ENOMEM;
diff --git a/drivers/char/xillybus/xillybus_pcie.c b/drivers/char/xillybus/xillybus_pcie.c
index f4be61349ca6..a6ef4ce90649 100644
--- a/drivers/char/xillybus/xillybus_pcie.c
+++ b/drivers/char/xillybus/xillybus_pcie.c
@@ -124,7 +124,7 @@ static int xilly_probe(struct pci_dev *pdev,
 	struct xilly_endpoint *endpoint;
 	int rc;
 
-	endpoint = xillybus_init_endpoint(pdev, &pdev->dev, &pci_hw);
+	endpoint = xillybus_init_endpoint(&pdev->dev, &pci_hw);
 
 	if (!endpoint)
 		return -ENOMEM;
-- 
2.30.2

