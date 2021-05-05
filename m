Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B79EC433ED
	for <kernel-janitors@archiver.kernel.org>; Wed,  5 May 2021 19:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 272AA613B4
	for <kernel-janitors@archiver.kernel.org>; Wed,  5 May 2021 19:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbhEETjz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 5 May 2021 15:39:55 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:39289 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbhEETjy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 May 2021 15:39:54 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d16 with ME
        id 17es2500B21Fzsu037eswd; Wed, 05 May 2021 21:38:55 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 05 May 2021 21:38:55 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     fbarrat@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, mpe@ellerman.id.au,
        imunsie@au1.ibm.com, mikey@neuling.org
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] cxl: Fix an error message
Date:   Wed,  5 May 2021 21:38:49 +0200
Message-Id: <fa2b2c9c72335ab4c3d5e6a33415e7f020b1d51b.1620243401.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'rc' is known to be 0 here.
Initialize 'rc' with the expected error code before using it.

While at it, avoid the affectation of 'rc' in a 'if' to make things more
obvious and linux style.

Fixes: f204e0b8ce ("cxl: Driver code for powernv PCIe based cards for userspace access")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/misc/cxl/file.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/cxl/file.c b/drivers/misc/cxl/file.c
index bd3bd32333c5..3dbdce96fae0 100644
--- a/drivers/misc/cxl/file.c
+++ b/drivers/misc/cxl/file.c
@@ -569,7 +569,8 @@ static int cxl_add_chardev(struct cxl_afu *afu, dev_t devt, struct cdev *cdev,
 	int rc;
 
 	cdev_init(cdev, fops);
-	if ((rc = cdev_add(cdev, devt, 1))) {
+	rc = cdev_add(cdev, devt, 1);
+	if (rc) {
 		dev_err(&afu->dev, "Unable to add %s chardev: %i\n", desc, rc);
 		return rc;
 	}
@@ -577,8 +578,8 @@ static int cxl_add_chardev(struct cxl_afu *afu, dev_t devt, struct cdev *cdev,
 	dev = device_create(cxl_class, &afu->dev, devt, afu,
 			"afu%i.%i%s", afu->adapter->adapter_num, afu->slice, postfix);
 	if (IS_ERR(dev)) {
-		dev_err(&afu->dev, "Unable to create %s chardev in sysfs: %i\n", desc, rc);
 		rc = PTR_ERR(dev);
+		dev_err(&afu->dev, "Unable to create %s chardev in sysfs: %i\n", desc, rc);
 		goto err;
 	}
 
-- 
2.30.2

