Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9133C433DB
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 07:35:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 906AA64FC3
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 07:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhCPHee (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Mar 2021 03:34:34 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13543 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbhCPHeN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Mar 2021 03:34:13 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F04jc0hjbzNmvV;
        Tue, 16 Mar 2021 15:31:48 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Tue, 16 Mar 2021 15:34:01 +0800
From:   'w00385741 <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Russell King" <linux@armlinux.org.uk>,
        Joakim Zhang <qiangqing.zhang@nxp.com>
CC:     <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH net-next] net: stmmac: fix missing unlock on error in stmmac_suspend()
Date:   Tue, 16 Mar 2021 07:42:39 +0000
Message-ID: <20210316074239.2010897-1-weiyongjun1@huawei.com>
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

Add the missing unlock before return from function
stmmac_suspend() in the error handling case.

Fixes: 5ec55823438e ("net: stmmac: add clocks management for gmac driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a10704d8e3c6..d50df998d3aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5400,8 +5400,10 @@ int stmmac_suspend(struct device *dev)
 		/* Disable clock in case of PWM is off */
 		clk_disable_unprepare(priv->plat->clk_ptp_ref);
 		ret = pm_runtime_force_suspend(dev);
-		if (ret)
+		if (ret) {
+			mutex_unlock(&priv->lock);
 			return ret;
+		}
 	}
 	mutex_unlock(&priv->lock);
 

