Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF80C43381
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 09:33:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3DCF64F75
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 09:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhCSJdE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Mar 2021 05:33:04 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13643 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhCSJcn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Mar 2021 05:32:43 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F1zBv2q5yzmYcb;
        Fri, 19 Mar 2021 17:30:15 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Mar 2021 17:32:31 +0800
From:   'w00385741 <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Sunil Goutham <sgoutham@marvell.com>,
        "Geetha sowjanya" <gakula@marvell.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        hariprasad <hkelam@marvell.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "Naveen Mamindlapalli" <naveenm@marvell.com>
CC:     <netdev@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH net-next] octeontx2-pf: Fix missing spin_lock_init() in otx2_tc_add_flow()
Date:   Fri, 19 Mar 2021 09:41:03 +0000
Message-ID: <20210319094103.4185148-1-weiyongjun1@huawei.com>
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

The driver allocates the spinlock but not initialize it.
Use spin_lock_init() on it to initialize it correctly.

Fixes: d8ce30e0cf76 ("octeontx2-pf: add tc flower stats handler for hw offloads")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
index 2f75cfc5a23a..e919140d8965 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
@@ -536,6 +536,7 @@ static int otx2_tc_add_flow(struct otx2_nic *nic,
 	new_node = kzalloc(sizeof(*new_node), GFP_KERNEL);
 	if (!new_node)
 		return -ENOMEM;
+	spin_lock_init(&new_node->lock);
 	new_node->cookie = tc_flow_cmd->cookie;
 
 	mutex_lock(&nic->mbox.lock);

