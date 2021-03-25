Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D97C433E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 09:32:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5981E61A2E
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 09:32:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhCYJcQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 Mar 2021 05:32:16 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14533 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhCYJcK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Mar 2021 05:32:10 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5fvM0CJMzPlJ7;
        Thu, 25 Mar 2021 17:29:35 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.177.129) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 17:32:00 +0800
From:   Qiheng Lin <linqiheng@huawei.com>
To:     Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Qiheng Lin <linqiheng@huawei.com>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: remove unused variable 'count'
Date:   Thu, 25 Mar 2021 17:31:51 +0800
Message-ID: <20210325093151.5913-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.174.177.129]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

GCC reports the following warning with W=1:

drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:80:9: warning:
 variable 'count' set but not used [-Wunused-but-set-variable]
   80 |  int i, count;
      |         ^~~~~

This variable is not used in function , this commit
remove it to fix the warning.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
index 8ae9efab6d02..98b1d3577bcd 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
@@ -77,9 +77,9 @@ static int
 mtk_ppe_debugfs_foe_show(struct seq_file *m, void *private, bool bind)
 {
 	struct mtk_ppe *ppe = m->private;
-	int i, count;
+	int i;
 
-	for (i = 0, count = 0; i < MTK_PPE_ENTRIES; i++) {
+	for (i = 0; i < MTK_PPE_ENTRIES; i++) {
 		struct mtk_foe_entry *entry = &ppe->foe_table[i];
 		struct mtk_foe_mac_info *l2;
 		struct mtk_flow_addr_info ai = {};
