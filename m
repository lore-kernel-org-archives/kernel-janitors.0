Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19123EB64DA
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Jul 2023 06:41:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbjGJGlP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Jul 2023 02:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjGJGlN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jul 2023 02:41:13 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B7FBA187;
        Sun,  9 Jul 2023 23:41:10 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 495CF602A8713;
        Mon, 10 Jul 2023 14:41:07 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        wuych <yunchuan@nfschina.com>
Subject: [PATCH net-next v2 06/10] ice: remove unnecessary (void*) conversions
Date:   Mon, 10 Jul 2023 14:41:05 +0800
Message-Id: <20230710064105.173647-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: wuych <yunchuan@nfschina.com>

Pointer variables of void * type do not require type cast.

Signed-off-by: wuych <yunchuan@nfschina.com>
---
 drivers/net/ethernet/intel/ice/ice_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 93979ab18bc1..52af3bd80868 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -6242,7 +6242,7 @@ static void ice_tx_dim_work(struct work_struct *work)
 	u16 itr;
 
 	dim = container_of(work, struct dim, work);
-	rc = (struct ice_ring_container *)dim->priv;
+	rc = dim->priv;
 
 	WARN_ON(dim->profile_ix >= ARRAY_SIZE(tx_profile));
 
@@ -6262,7 +6262,7 @@ static void ice_rx_dim_work(struct work_struct *work)
 	u16 itr;
 
 	dim = container_of(work, struct dim, work);
-	rc = (struct ice_ring_container *)dim->priv;
+	rc = dim->priv;
 
 	WARN_ON(dim->profile_ix >= ARRAY_SIZE(rx_profile));
 
-- 
2.30.2

