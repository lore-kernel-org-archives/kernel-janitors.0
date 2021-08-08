Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5052FC4320A
	for <kernel-janitors@archiver.kernel.org>; Sun,  8 Aug 2021 06:21:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E94C61002
	for <kernel-janitors@archiver.kernel.org>; Sun,  8 Aug 2021 06:21:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhHHGWM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 8 Aug 2021 02:22:12 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:7809 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhHHGWL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 8 Aug 2021 02:22:11 -0400
Received: from dggeml759-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gj8Hl0RxHzYmHp;
        Sun,  8 Aug 2021 14:21:39 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sun, 8 Aug 2021 14:21:49 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Loic Poulain <loic.poulain@linaro.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
CC:     <netdev@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH net-next] wwan: mhi: Fix missing spin_lock_init() in mhi_mbim_probe()
Date:   Sun, 8 Aug 2021 06:33:44 +0000
Message-ID: <20210808063344.255867-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The driver allocates the spinlock but not initialize it.
Use spin_lock_init() on it to initialize it correctly.

Fixes: aa730a9905b7 ("net: wwan: Add MHI MBIM network driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wwan/mhi_wwan_mbim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index f37232fb29c0..377529bbf124 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -601,6 +601,7 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 	if (!mbim)
 		return -ENOMEM;
 
+	spin_lock_init(&mbim->tx_lock);
 	dev_set_drvdata(&mhi_dev->dev, mbim);
 	mbim->mdev = mhi_dev;
 	mbim->mru = mhi_dev->mhi_cntrl->mru ? mhi_dev->mhi_cntrl->mru : MHI_DEFAULT_MRU;

