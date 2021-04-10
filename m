Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C447C433ED
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 03:51:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0FA761181
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 03:51:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbhDJDvj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 23:51:39 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15659 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbhDJDvi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 23:51:38 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FHLZV4ySRzpWhp;
        Sat, 10 Apr 2021 11:48:34 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Sat, 10 Apr 2021
 11:51:14 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <cuibixuan@huawei.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        "Baolin Wang" <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] nvmem: sprd: Add missing MODULE_DEVICE_TABLE
Date:   Sat, 10 Apr 2021 11:50:33 +0800
Message-ID: <20210410035033.11274-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/nvmem/sprd-efuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
index 59523245db8a..5d394559edf2 100644
--- a/drivers/nvmem/sprd-efuse.c
+++ b/drivers/nvmem/sprd-efuse.c
@@ -425,6 +425,7 @@ static const struct of_device_id sprd_efuse_of_match[] = {
 	{ .compatible = "sprd,ums312-efuse", .data = &ums312_data },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, sprd_efuse_of_match);
 
 static struct platform_driver sprd_efuse_driver = {
 	.probe = sprd_efuse_probe,

