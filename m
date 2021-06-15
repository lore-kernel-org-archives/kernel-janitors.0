Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24EBC48BDF
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 14:28:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A7256109D
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 14:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhFOOa6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Jun 2021 10:30:58 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34093 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbhFOOa5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Jun 2021 10:30:57 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1ltA3b-00045E-Fl; Tue, 15 Jun 2021 14:28:47 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] ice: remove redundant continue statement in a for-loop
Date:   Tue, 15 Jun 2021 15:28:47 +0100
Message-Id: <20210615142847.60161-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The continue statement in the for-loop is redundant. Re-work the hw_lock
check to remove it.

Addresses-Coverity: ("Continue has no effect")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/intel/ice/ice_ptp_hw.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
index 267312fad59a..3eca0e4eab0b 100644
--- a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
+++ b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
@@ -410,13 +410,11 @@ bool ice_ptp_lock(struct ice_hw *hw)
 	for (i = 0; i < MAX_TRIES; i++) {
 		hw_lock = rd32(hw, PFTSYN_SEM + (PFTSYN_SEM_BYTES * hw->pf_id));
 		hw_lock = hw_lock & PFTSYN_SEM_BUSY_M;
-		if (hw_lock) {
-			/* Somebody is holding the lock */
-			usleep_range(10000, 20000);
-			continue;
-		} else {
+		if (!hw_lock)
 			break;
-		}
+
+		/* Somebody is holding the lock */
+		usleep_range(10000, 20000);
 	}
 
 	return !hw_lock;
-- 
2.31.1

