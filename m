Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C229C11F68
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Jul 2021 11:27:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 508BD613F7
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Jul 2021 11:27:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhGBL37 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Jul 2021 07:29:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58721 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhGBL36 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Jul 2021 07:29:58 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lzHKK-0003x3-Lf; Fri, 02 Jul 2021 11:27:20 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] iavf: remove redundant null check on key
Date:   Fri,  2 Jul 2021 12:27:20 +0100
Message-Id: <20210702112720.16006-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The null check on pointer key has already been performed at the
start of the function and this leads to a return of -EOPNOTSUPP.
The second null check on key is therefore always false, it is
redundant and can be removed.

Addresses-Coverity: ("Logically dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/intel/iavf/iavf_ethtool.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
index af43fbd8cb75..70193d8d54ed 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
@@ -1873,8 +1873,7 @@ static int iavf_set_rxfh(struct net_device *netdev, const u32 *indir,
 	if (!indir)
 		return 0;
 
-	if (key)
-		memcpy(adapter->rss_key, key, adapter->rss_key_size);
+	memcpy(adapter->rss_key, key, adapter->rss_key_size);
 
 	/* Each 32 bits pointed by 'indir' is stored with a lut entry */
 	for (i = 0; i < adapter->rss_lut_size; i++)
-- 
2.31.1

