Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11A8C4338F
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Aug 2021 06:46:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8769A611C6
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Aug 2021 06:46:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243338AbhHFGqd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Aug 2021 02:46:33 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:27775 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhHFGqc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Aug 2021 02:46:32 -0400
Received: from localhost.localdomain ([217.128.214.245])
        by mwinf5d69 with ME
        id e6mC2500F5JEng9036mDmZ; Fri, 06 Aug 2021 08:46:16 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Aug 2021 08:46:16 +0200
X-ME-IP: 217.128.214.245
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     nsaenz@kernel.org, f.fainelli@gmail.com,
        gregkh@linuxfoundation.org, bgolaszewski@baylibre.com,
        sboyd@kernel.org, wangqing@vivo.com, eric@anholt.net,
        swarren@wwwdotorg.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] firmware: raspberrypi: Fix a leak in 'rpi_firmware_get()'
Date:   Fri,  6 Aug 2021 08:46:11 +0200
Message-Id: <5e17e5409b934cd08bf6f9279c73be5c1cb11cce.1628232242.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The reference taken by 'of_find_device_by_node()' must be released when
not needed anymore.

Add the corresponding 'put_device()' in the normal and error handling
paths.

Fixes: 4e3d60656a72 ("ARM: bcm2835: Add the Raspberry Pi firmware driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Review carefully, management of reference counted resources is sometimes
tricky.

I also think that a 'put_device()' just after the 'platform_get_drvdata()'
call, and before the 'if (!fw)', could be enough, but I find the
proposed version more easy to follow.
---
 drivers/firmware/raspberrypi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 250e01680742..4b8978b254f9 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -329,12 +329,18 @@ struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node)
 
 	fw = platform_get_drvdata(pdev);
 	if (!fw)
-		return NULL;
+		goto err_put_device;
 
 	if (!kref_get_unless_zero(&fw->consumers))
-		return NULL;
+		goto err_put_device;
+
+	put_device(&pdev->dev);
 
 	return fw;
+
+err_put_device:
+	put_device(&pdev->dev);
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(rpi_firmware_get);
 
-- 
2.30.2

