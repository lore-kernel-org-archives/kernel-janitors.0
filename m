Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2864EC433E3
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 12:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8DBB61971
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 12:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhCZMaj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 08:30:39 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:15321 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhCZMaZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 08:30:25 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F6Lq80fCBz9vHR;
        Fri, 26 Mar 2021 20:28:20 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Fri, 26 Mar 2021
 20:30:14 +0800
From:   'Liu Jian <liujian56@huawei.com>
To:     <liujian56@huawei.com>, Kevin Curtis <kevin.curtis@farsite.co.uk>,
        "Jakub Kicinski" <kuba@kernel.org>
CC:     <netdev@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH net-next] farsync: use DEFINE_SPINLOCK() for spinlock
Date:   Fri, 26 Mar 2021 20:31:38 +0800
Message-ID: <20210326123138.159616-1-liujian56@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Liu Jian <liujian56@huawei.com>

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Liu Jian <liujian56@huawei.com>
---
 drivers/net/wan/farsync.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wan/farsync.c b/drivers/net/wan/farsync.c
index 686a25d3b512..5de71e44fc5a 100644
--- a/drivers/net/wan/farsync.c
+++ b/drivers/net/wan/farsync.c
@@ -573,7 +573,7 @@ static DECLARE_TASKLET(fst_tx_task, fst_process_tx_work_q);
 static DECLARE_TASKLET(fst_int_task, fst_process_int_work_q);
 
 static struct fst_card_info *fst_card_array[FST_MAX_CARDS];
-static spinlock_t fst_work_q_lock;
+static DEFINE_SPINLOCK(fst_work_q_lock);
 static u64 fst_work_txq;
 static u64 fst_work_intq;
 
@@ -2648,7 +2648,6 @@ fst_init(void)
 
 	for (i = 0; i < FST_MAX_CARDS; i++)
 		fst_card_array[i] = NULL;
-	spin_lock_init(&fst_work_q_lock);
 	return pci_register_driver(&fst_driver);
 }
 

