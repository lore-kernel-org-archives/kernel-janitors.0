Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18A3C433ED
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 May 2021 15:00:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCB8E61182
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 May 2021 15:00:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234110AbhEPPBq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 16 May 2021 11:01:46 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:44883 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhEPPBp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 16 May 2021 11:01:45 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d20 with ME
        id 5T0U2500D21Fzsu03T0VBA; Sun, 16 May 2021 17:00:29 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 May 2021 17:00:29 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     arnd@arndb.de, gregkh@linuxfoundation.org,
        mihai.carabas@oracle.com, andriy.shevchenko@linux.intel.com,
        pizhenwei@bytedance.com, pbonzini@redhat.com,
        bobo.shaobowang@huawei.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] misc/pvpanic: Fix error handling in 'pvpanic_mmio_probe()'
Date:   Sun, 16 May 2021 17:00:27 +0200
Message-Id: <d6e7bf6eb6e482c387124e815edc0e0edaebafe8.1621177126.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is no error handling path in the probe function.
Switch to managed resource so that errors in the probe are handled easily
and simplify the remove function accordingly.

Fixes: b3c0f8774668 ("misc/pvpanic: probe multiple instances")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/misc/pvpanic/pvpanic-mmio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/pvpanic/pvpanic-mmio.c b/drivers/misc/pvpanic/pvpanic-mmio.c
index 4c0841776087..69b31f7adf4f 100644
--- a/drivers/misc/pvpanic/pvpanic-mmio.c
+++ b/drivers/misc/pvpanic/pvpanic-mmio.c
@@ -93,7 +93,7 @@ static int pvpanic_mmio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	pi = kmalloc(sizeof(*pi), GFP_ATOMIC);
+	pi = devm_kmalloc(dev, sizeof(*pi), GFP_ATOMIC);
 	if (!pi)
 		return -ENOMEM;
 
@@ -114,7 +114,6 @@ static int pvpanic_mmio_remove(struct platform_device *pdev)
 	struct pvpanic_instance *pi = dev_get_drvdata(&pdev->dev);
 
 	pvpanic_remove(pi);
-	kfree(pi);
 
 	return 0;
 }
-- 
2.30.2

