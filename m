Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57C4C6FA8B
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Sep 2022 01:24:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiIIBYt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Sep 2022 21:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiIIBYr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Sep 2022 21:24:47 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC1220F75;
        Thu,  8 Sep 2022 18:24:47 -0700 (PDT)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MNypk2wnxzZcPT;
        Fri,  9 Sep 2022 09:20:14 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 09:24:45 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 9 Sep
 2022 09:24:44 +0800
From:   Sun Ke <sunke32@huawei.com>
To:     <vincent.sunplus@gmail.com>, <kishon@ti.com>, <vkoul@kernel.org>,
        <p.zabel@pengutronix.de>
CC:     <linux-usb@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, <sunke32@huawei.com>
Subject: [PATCH 2/2] phy: usb: Fix return value check in sp_usb_phy_probe()
Date:   Fri, 9 Sep 2022 09:35:46 +0800
Message-ID: <20220909013546.2259545-3-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220909013546.2259545-1-sunke32@huawei.com>
References: <20220909013546.2259545-1-sunke32@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In case of error, the function devm_ioremap() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check
should be replaced with NULL test.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index d73a8a421d9c..50ad428cc55d 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -260,8 +260,8 @@ static int sp_usb_phy_probe(struct platform_device *pdev)
 		return -EINVAL;
 	usbphy->moon4_regs = devm_ioremap(&pdev->dev, usbphy->moon4_res_mem->start,
 					  resource_size(usbphy->moon4_res_mem));
-	if (IS_ERR(usbphy->moon4_regs))
-		return PTR_ERR(usbphy->moon4_regs);
+	if (!usbphy->moon4_regs)
+		return -EINVAL;
 
 	usbphy->phy_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(usbphy->phy_clk))
-- 
2.31.1

