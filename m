Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F736EB64DC
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Jun 2023 02:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbjF1Cpo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Jun 2023 22:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbjF1CpZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Jun 2023 22:45:25 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id CF20D3A81;
        Tue, 27 Jun 2023 19:45:14 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 3A90A604D9369;
        Wed, 28 Jun 2023 10:45:12 +0800 (CST)
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   wuych <yunchuan@nfschina.com>
To:     yisen.zhuang@huawei.com, salil.mehta@huawei.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, wuych <yunchuan@nfschina.com>
Subject: [PATCH net-next 07/10] net: hns3: remove unnecessary (void*) conversions
Date:   Wed, 28 Jun 2023 10:45:10 +0800
Message-Id: <20230628024510.1440567-1-yunchuan@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Pointer variables of void * type do not require type cast.

Signed-off-by: wuych <yunchuan@nfschina.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
index 51d1278b18f6..1df941ef86e3 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
@@ -570,7 +570,7 @@ static void hns3_get_strings(struct net_device *netdev, u32 stringset, u8 *data)
 
 static u64 *hns3_get_stats_tqps(struct hnae3_handle *handle, u64 *data)
 {
-	struct hns3_nic_priv *nic_priv = (struct hns3_nic_priv *)handle->priv;
+	struct hns3_nic_priv *nic_priv = handle->priv;
 	struct hnae3_knic_private_info *kinfo = &handle->kinfo;
 	struct hns3_enet_ring *ring;
 	u8 *stat;
-- 
2.30.2

