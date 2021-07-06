Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF1FC07E9C
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jul 2021 11:19:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C48261D5D
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jul 2021 11:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbhGFLWX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jul 2021 07:22:23 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55724 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbhGFLUq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jul 2021 07:20:46 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1m0j5W-0004Ns-Us; Tue, 06 Jul 2021 11:18:03 +0000
From:   Colin King <colin.king@canonical.com>
To:     Sunil Goutham <sgoutham@marvell.com>,
        Geetha sowjanya <gakula@marvell.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        hariprasad <hkelam@marvell.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] octeontx2-pf: Fix assigned error return value that is never used
Date:   Tue,  6 Jul 2021 12:18:02 +0100
Message-Id: <20210706111802.27114-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to otx2_mbox_alloc_msg_cgx_mac_addr_update fails
the error return variable rc is being assigned -ENOMEM and does not
return early. rc is then re-assigned and the error case is not handled
correctly. Fix this by returning -ENOMEM rather than assigning rc.

Addresses-Coverity: ("Unused value")
Fixes: 79d2be385e9e ("octeontx2-pf: offload DMAC filters to CGX/RPM block")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_dmac_flt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dmac_flt.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dmac_flt.c
index ffe3e94562d0..383a6b5cb698 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dmac_flt.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dmac_flt.c
@@ -161,7 +161,7 @@ int otx2_dmacflt_update(struct otx2_nic *pf, u8 *mac, u8 bit_pos)
 
 	if (!req) {
 		mutex_unlock(&pf->mbox.lock);
-		rc = -ENOMEM;
+		return -ENOMEM;
 	}
 
 	ether_addr_copy(req->mac_addr, mac);
-- 
2.31.1

