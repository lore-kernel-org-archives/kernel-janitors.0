Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D137C4707D
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 18:22:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3289F610A8
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 18:22:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238832AbhEUSXo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 May 2021 14:23:44 -0400
Received: from smtp12.smtpout.orange.fr ([80.12.242.134]:22141 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbhEUSXm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 May 2021 14:23:42 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d35 with ME
        id 7WNG2500221Fzsu03WNGpn; Fri, 21 May 2021 20:22:17 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 21 May 2021 20:22:17 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     richard.gong@linux.intel.com, gregkh@linuxfoundation.org,
        atull@kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] firmware: stratix10-svc: Fix a resource leak in an error handling path
Date:   Fri, 21 May 2021 20:22:15 +0200
Message-Id: <0ca3f3ab139c53e846804455a1e7599ee8ae896a.1621621271.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If an error occurs after a successful 'kfifo_alloc()' call, it must be
undone by a corresponding 'kfifo_free()' call, as already done in the
remove function.

While at it, move the 'platform_device_put()' call to this new error
handling path and explicitly return 0 in the success path.

Fixes: b5dc75c915cd ("firmware: stratix10-svc: extend svc to support new RSU features")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/firmware/stratix10-svc.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 3aa489dba30a..2a7687911c09 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -1034,24 +1034,32 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 
 	/* add svc client device(s) */
 	svc = devm_kzalloc(dev, sizeof(*svc), GFP_KERNEL);
-	if (!svc)
-		return -ENOMEM;
+	if (!svc) {
+		ret = -ENOMEM;
+		goto err_free_kfifo;
+	}
 
 	svc->stratix10_svc_rsu = platform_device_alloc(STRATIX10_RSU, 0);
 	if (!svc->stratix10_svc_rsu) {
 		dev_err(dev, "failed to allocate %s device\n", STRATIX10_RSU);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_free_kfifo;
 	}
 
 	ret = platform_device_add(svc->stratix10_svc_rsu);
-	if (ret) {
-		platform_device_put(svc->stratix10_svc_rsu);
-		return ret;
-	}
+	if (ret)
+		goto err_put_device;
+
 	dev_set_drvdata(dev, svc);
 
 	pr_info("Intel Service Layer Driver Initialized\n");
 
+	return 0;
+
+err_put_device:
+	platform_device_put(svc->stratix10_svc_rsu);
+err_free_kfifo:
+	kfifo_free(&controller->svc_fifo);
 	return ret;
 }
 
-- 
2.30.2

