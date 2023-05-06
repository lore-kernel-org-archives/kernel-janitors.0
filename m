Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624BDC77B75
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 May 2023 09:45:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbjEFJpI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 6 May 2023 05:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjEFJpC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 6 May 2023 05:45:02 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1A7F42719;
        Sat,  6 May 2023 02:44:51 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 59AB61801064F9;
        Sat,  6 May 2023 17:44:30 +0800 (CST)
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   wuych <yunchuan@nfschina.com>
To:     ioana.ciornei@nxp.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com
Cc:     netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        wuych <yunchuan@nfschina.com>
Subject: [PATCH] net:ethernet:freescale:dpaa2:Remove unnecessary (void*) conversions
Date:   Sat,  6 May 2023 17:44:28 +0800
Message-Id: <20230506094428.772239-1-yunchuan@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Pointer variables of void * type do not require type cast.

Signed-off-by: wuych <yunchuan@nfschina.com>
---
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-debugfs.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-debugfs.c
index 1af254caeb0d..7b2a3acd3211 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-debugfs.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-debugfs.c
@@ -13,7 +13,7 @@ static struct dentry *dpaa2_dbg_root;
 
 static int dpaa2_dbg_cpu_show(struct seq_file *file, void *offset)
 {
-	struct dpaa2_eth_priv *priv = (struct dpaa2_eth_priv *)file->private;
+	struct dpaa2_eth_priv *priv = file->private;
 	struct rtnl_link_stats64 *stats;
 	struct dpaa2_eth_drv_stats *extras;
 	int i;
@@ -58,7 +58,7 @@ static char *fq_type_to_str(struct dpaa2_eth_fq *fq)
 
 static int dpaa2_dbg_fqs_show(struct seq_file *file, void *offset)
 {
-	struct dpaa2_eth_priv *priv = (struct dpaa2_eth_priv *)file->private;
+	struct dpaa2_eth_priv *priv = file->private;
 	struct dpaa2_eth_fq *fq;
 	u32 fcnt, bcnt;
 	int i, err;
@@ -93,7 +93,7 @@ DEFINE_SHOW_ATTRIBUTE(dpaa2_dbg_fqs);
 
 static int dpaa2_dbg_ch_show(struct seq_file *file, void *offset)
 {
-	struct dpaa2_eth_priv *priv = (struct dpaa2_eth_priv *)file->private;
+	struct dpaa2_eth_priv *priv = file->private;
 	struct dpaa2_eth_channel *ch;
 	int i;
 
-- 
2.30.2

