Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14532C433E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 13:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB1F864FC3
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 13:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbhCKNGw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Mar 2021 08:06:52 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:13522 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbhCKNGj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Mar 2021 08:06:39 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dx8KT6hwCzNlHg;
        Thu, 11 Mar 2021 21:04:13 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 11 Mar 2021 21:06:21 +0800
From:   'Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     <linux-actions@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] mfd: Make symbol 'atc260x_i2c_of_match' static
Date:   Thu, 11 Mar 2021 13:15:07 +0000
Message-ID: <20210311131507.1902008-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

The sparse tool complains as follows:

drivers/mfd/atc260x-i2c.c:45:27: warning:
 symbol 'atc260x_i2c_of_match' was not declared. Should it be static?

This symbol is not used outside of atc260x-i2c.c, so this
commit marks it static.

Fixes: f7cb7fe34db9 ("mfd: Add MFD driver for ATC260x PMICs")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mfd/atc260x-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/atc260x-i2c.c b/drivers/mfd/atc260x-i2c.c
index 362005703367..5855efd09efc 100644
--- a/drivers/mfd/atc260x-i2c.c
+++ b/drivers/mfd/atc260x-i2c.c
@@ -42,7 +42,7 @@ static int atc260x_i2c_probe(struct i2c_client *client,
 	return atc260x_device_probe(atc260x);
 }
 
-const struct of_device_id atc260x_i2c_of_match[] = {
+static const struct of_device_id atc260x_i2c_of_match[] = {
 	{ .compatible = "actions,atc2603c", .data = (void *)ATC2603C },
 	{ .compatible = "actions,atc2609a", .data = (void *)ATC2609A },
 	{ }

