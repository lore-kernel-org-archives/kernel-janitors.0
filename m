Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45576C2B9F8
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 May 2021 18:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 230A861249
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 May 2021 18:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbhEYSxf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 May 2021 14:53:35 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:44938 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbhEYSxe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 May 2021 14:53:34 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d64 with ME
        id 96rz2500221Fzsu036rzjK; Tue, 25 May 2021 20:52:01 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 25 May 2021 20:52:01 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     gregkh@linuxfoundation.org, jirislaby@kernel.org,
        akpm@linux-foundation.org, stefani@seibold.net
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] tty: nozomi: Fix the error handling path of 'nozomi_card_init()'
Date:   Tue, 25 May 2021 20:51:57 +0200
Message-Id: <e28c2e92c7475da25b03d022ea2d6dcf1ba807a2.1621968629.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The error handling path is broken and we may un-register things that have
never been registered.

Update the loops index accordingly.

Fixes: 9842c38e9176 ("kfifo: fix warn_unused_result")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
PORT_MDM is 0, so it does not really matter, but I wonder why one of the
for loop starts at PORT_MDM, while the other one explicitly starts at 0.

We have the same in the remove function, where 0 is used in both cases.
---
 drivers/tty/nozomi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/nozomi.c b/drivers/tty/nozomi.c
index b85d4beabc1f..0c80f25c8c3d 100644
--- a/drivers/tty/nozomi.c
+++ b/drivers/tty/nozomi.c
@@ -1378,7 +1378,7 @@ static int nozomi_card_init(struct pci_dev *pdev,
 			NOZOMI_NAME, dc);
 	if (unlikely(ret)) {
 		dev_err(&pdev->dev, "can't request irq %d\n", pdev->irq);
-		goto err_free_kfifo;
+		goto err_free_all_kfifo;
 	}
 
 	DBG1("base_addr: %p", dc->base_addr);
@@ -1416,13 +1416,15 @@ static int nozomi_card_init(struct pci_dev *pdev,
 	return 0;
 
 err_free_tty:
-	for (i = 0; i < MAX_PORT; ++i) {
+	for (i--; i >= 0; i--) {
 		tty_unregister_device(ntty_driver, dc->index_start + i);
 		tty_port_destroy(&dc->port[i].port);
 	}
 	free_irq(pdev->irq, dc);
+err_free_all_kfifo:
+	i = MAX_PORT;
 err_free_kfifo:
-	for (i = 0; i < MAX_PORT; i++)
+	for (i--; i >= PORT_MDM; i--)
 		kfifo_free(&dc->port[i].fifo_ul);
 err_free_sbuf:
 	kfree(dc->send_buf);
-- 
2.30.2

