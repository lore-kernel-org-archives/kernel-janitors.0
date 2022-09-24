Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D66BC32771
	for <kernel-janitors@archiver.kernel.org>; Sat, 24 Sep 2022 03:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbiIXDKv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Sep 2022 23:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232968AbiIXDKt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Sep 2022 23:10:49 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A1047B8A;
        Fri, 23 Sep 2022 20:10:48 -0700 (PDT)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MZDVp0HlczHnt6;
        Sat, 24 Sep 2022 11:08:34 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 24 Sep 2022 11:10:46 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 11:10:45 +0800
From:   Sun Ke <sunke32@huawei.com>
To:     <will@kernel.org>, <mark.rutland@arm.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <xueshuai@linux.alibaba.com>, <sunke32@huawei.com>
Subject: [PATCH] drivers/perf: fix return value check in ali_drw_pmu_probe()
Date:   Sat, 24 Sep 2022 11:21:27 +0800
Message-ID: <20220924032127.313156-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In case of error, devm_ioremap_resource() returns ERR_PTR(),
and never returns NULL. The NULL test in the return value
check should be replaced with IS_ERR().

Fixes: cf7b61073e45 ("drivers/perf: add DDR Sub-System Driveway PMU driver for Yitian 710 SoC")
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 drivers/perf/alibaba_uncore_drw_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/alibaba_uncore_drw_pmu.c b/drivers/perf/alibaba_uncore_drw_pmu.c
index 82729b874f09..a7689fecb49d 100644
--- a/drivers/perf/alibaba_uncore_drw_pmu.c
+++ b/drivers/perf/alibaba_uncore_drw_pmu.c
@@ -658,8 +658,8 @@ static int ali_drw_pmu_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	drw_pmu->cfg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (!drw_pmu->cfg_base)
-		return -ENOMEM;
+	if (IS_ERR(drw_pmu->cfg_base))
+		return PTR_ERR(drw_pmu->cfg_base);
 
 	name = devm_kasprintf(drw_pmu->dev, GFP_KERNEL, "ali_drw_%llx",
 			      (u64) (res->start >> ALI_DRW_PMU_PA_SHIFT));
-- 
2.31.1

