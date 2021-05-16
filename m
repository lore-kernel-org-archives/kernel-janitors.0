Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4693C433ED
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 May 2021 15:00:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B56A561164
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 May 2021 15:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbhEPPB7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 16 May 2021 11:01:59 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:29713 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbhEPPB6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 16 May 2021 11:01:58 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d20 with ME
        id 5T0i2500C21Fzsu03T0iCN; Sun, 16 May 2021 17:00:43 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 May 2021 17:00:43 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     arnd@arndb.de, gregkh@linuxfoundation.org,
        mihai.carabas@oracle.com, andriy.shevchenko@linux.intel.com,
        pizhenwei@bytedance.com, pbonzini@redhat.com,
        bobo.shaobowang@huawei.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] misc/pvpanic: Use GFP_KERNEL instead of GFP_ATOMIC
Date:   Sun, 16 May 2021 17:00:40 +0200
Message-Id: <81f694999fae5331e9104f3de1424264e4fd4f08.1621177126.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <d6e7bf6eb6e482c387124e815edc0e0edaebafe8.1621177126.git.christophe.jaillet@wanadoo.fr>
References: <d6e7bf6eb6e482c387124e815edc0e0edaebafe8.1621177126.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is no need to use GFP_ATOMIC in a probe function. Use GFP_KERNEL
instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
A similar patch have been sent for pvpanic-pci.c
---
 drivers/misc/pvpanic/pvpanic-mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/pvpanic/pvpanic-mmio.c b/drivers/misc/pvpanic/pvpanic-mmio.c
index 69b31f7adf4f..d4a407956c07 100644
--- a/drivers/misc/pvpanic/pvpanic-mmio.c
+++ b/drivers/misc/pvpanic/pvpanic-mmio.c
@@ -93,7 +93,7 @@ static int pvpanic_mmio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	pi = devm_kmalloc(dev, sizeof(*pi), GFP_ATOMIC);
+	pi = devm_kmalloc(dev, sizeof(*pi), GFP_KERNEL);
 	if (!pi)
 		return -ENOMEM;
 
-- 
2.30.2

