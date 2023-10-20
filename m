Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6819ACDB474
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 09:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376806AbjJTJZt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 05:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376811AbjJTJZe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 05:25:34 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 83D7219B1;
        Fri, 20 Oct 2023 02:25:06 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 2B9B0604FCB31;
        Fri, 20 Oct 2023 17:25:01 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     Su Hui <suhui@nfschina.com>, intel-wired-lan@lists.osuosl.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] igb: e1000_82575: add an error code check in igb_set_d0_lplu_state_82575
Date:   Fri, 20 Oct 2023 17:24:31 +0800
Message-Id: <20231020092430.209765-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

igb_set_d0_lplu_state_82575() check all phy->ops.read_reg()'s return value
except this one, just fix this.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/ethernet/intel/igb/e1000_82575.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/intel/igb/e1000_82575.c b/drivers/net/ethernet/intel/igb/e1000_82575.c
index 8d6e44ee1895..e765d5ee3661 100644
--- a/drivers/net/ethernet/intel/igb/e1000_82575.c
+++ b/drivers/net/ethernet/intel/igb/e1000_82575.c
@@ -978,6 +978,9 @@ static s32 igb_set_d0_lplu_state_82575(struct e1000_hw *hw, bool active)
 		/* When LPLU is enabled, we should disable SmartSpeed */
 		ret_val = phy->ops.read_reg(hw, IGP01E1000_PHY_PORT_CONFIG,
 						&data);
+		if (ret_val)
+			goto out;
+
 		data &= ~IGP01E1000_PSCFR_SMART_SPEED;
 		ret_val = phy->ops.write_reg(hw, IGP01E1000_PHY_PORT_CONFIG,
 						 data);
-- 
2.30.2

