Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0917EC433EF
	for <kernel-janitors@archiver.kernel.org>; Sun, 26 Dec 2021 14:39:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbhLZOjC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 26 Dec 2021 09:39:02 -0500
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:55288 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhLZOjB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 26 Dec 2021 09:39:01 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id 1UfqniVI81UGB1UfrnOPiK; Sun, 26 Dec 2021 15:39:00 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 26 Dec 2021 15:39:00 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        davem@davemloft.net, kuba@kernel.org
Cc:     intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ice: Use bitmap_free() to free bitmap
Date:   Sun, 26 Dec 2021 15:38:57 +0100
Message-Id: <d139eb69eb12c9793a2a3b65e94f74d4cee2a39c.1640529439.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

kfree() and bitmap_free() are the same. But using the latter is more
consistent when freeing memory allocated with bitmap_zalloc().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/intel/ice/ice_ptp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_ptp.c b/drivers/net/ethernet/intel/ice/ice_ptp.c
index d3f65e061a62..ae291d442539 100644
--- a/drivers/net/ethernet/intel/ice/ice_ptp.c
+++ b/drivers/net/ethernet/intel/ice/ice_ptp.c
@@ -2229,7 +2229,7 @@ ice_ptp_release_tx_tracker(struct ice_pf *pf, struct ice_ptp_tx *tx)
 	kfree(tx->tstamps);
 	tx->tstamps = NULL;
 
-	kfree(tx->in_use);
+	bitmap_free(tx->in_use);
 	tx->in_use = NULL;
 
 	tx->len = 0;
-- 
2.32.0

