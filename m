Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA44C43460
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 11:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80BFE61108
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 11:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233777AbhDILIQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 07:08:16 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15654 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbhDILIP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 07:08:15 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGwJn1zNXzpWyb;
        Fri,  9 Apr 2021 19:05:13 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.176.196) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 19:07:55 +0800
From:   Qiheng Lin <linqiheng@huawei.com>
To:     <linqiheng@huawei.com>, Jassi Brar <jassisinghbrar@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] mailbox: arm_mhu_db: Remove redundant dev_err call in mhu_db_probe()
Date:   Fri, 9 Apr 2021 19:07:54 +0800
Message-ID: <20210409110754.155-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/mailbox/arm_mhu_db.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/arm_mhu_db.c b/drivers/mailbox/arm_mhu_db.c
index 8eb66c4ecf5b..9e9c1261da2a 100644
--- a/drivers/mailbox/arm_mhu_db.c
+++ b/drivers/mailbox/arm_mhu_db.c
@@ -278,10 +278,8 @@ static int mhu_db_probe(struct amba_device *adev, const struct amba_id *id)
 		return -ENOMEM;
 
 	mhu->base = devm_ioremap_resource(dev, &adev->res);
-	if (IS_ERR(mhu->base)) {
-		dev_err(dev, "ioremap failed\n");
+	if (IS_ERR(mhu->base))
 		return PTR_ERR(mhu->base);
-	}
 
 	chans = devm_kcalloc(dev, max_chans, sizeof(*chans), GFP_KERNEL);
 	if (!chans)

