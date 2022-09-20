Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C555EC6FA82
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Sep 2022 01:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiITBuC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Sep 2022 21:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbiITBt6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Sep 2022 21:49:58 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0522FFD6;
        Mon, 19 Sep 2022 18:49:56 -0700 (PDT)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MWktg4VPDzpSwQ;
        Tue, 20 Sep 2022 09:47:07 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 09:49:54 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 20 Sep
 2022 09:49:53 +0800
From:   Sun Ke <sunke32@huawei.com>
To:     <joyce.ooi@intel.com>, <davem@davemloft.net>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <linux@armlinux.org.uk>
CC:     <netdev@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <maxime.chevallier@bootlin.com>, <sunke32@huawei.com>
Subject: [PATCH v3] net: ethernet: altera: TSE: fix error return code in altera_tse_probe()
Date:   Tue, 20 Sep 2022 10:00:41 +0800
Message-ID: <20220920020041.2685948-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: fef2998203e1 ("net: altera: tse: convert to phylink")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 drivers/net/ethernet/altera/altera_tse_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 89ae6d1623aa..3cf409bdb283 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1411,6 +1411,7 @@ static int altera_tse_probe(struct platform_device *pdev)
 				       priv->phy_iface, &alt_tse_phylink_ops);
 	if (IS_ERR(priv->phylink)) {
 		dev_err(&pdev->dev, "failed to create phylink\n");
+		ret = PTR_ERR(priv->phylink);
 		goto err_init_phy;
 	}
 
-- 
2.31.1

