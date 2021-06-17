Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C83C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Jun 2021 12:14:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F4E661159
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Jun 2021 12:14:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhFQMRC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 17 Jun 2021 08:17:02 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45186 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232736AbhFQMRB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Jun 2021 08:17:01 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1ltqv4-0005tS-6S; Thu, 17 Jun 2021 12:14:50 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jon Mason <jdmason@kudzu.us>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] net: neterion: vxge: remove redundant continue statement
Date:   Thu, 17 Jun 2021 13:14:49 +0100
Message-Id: <20210617121449.12496-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The continue statement at the end of a for-loop has no effect,
invert the if expression and remove the continue.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/neterion/vxge/vxge-main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/neterion/vxge/vxge-main.c b/drivers/net/ethernet/neterion/vxge/vxge-main.c
index 0528b8f49061..82eef4c72f01 100644
--- a/drivers/net/ethernet/neterion/vxge/vxge-main.c
+++ b/drivers/net/ethernet/neterion/vxge/vxge-main.c
@@ -3678,10 +3678,9 @@ static int vxge_config_vpaths(struct vxge_hw_device_config *device_config,
 			driver_config->vpath_per_dev = 1;
 
 		for (i = 0; i < VXGE_HW_MAX_VIRTUAL_PATHS; i++)
-			if (!vxge_bVALn(vpath_mask, i, 1))
-				continue;
-			else
+			if (vxge_bVALn(vpath_mask, i, 1))
 				default_no_vpath++;
+
 		if (default_no_vpath < driver_config->vpath_per_dev)
 			driver_config->vpath_per_dev = default_no_vpath;
 
-- 
2.31.1

