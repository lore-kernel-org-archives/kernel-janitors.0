Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF816C48BE5
	for <kernel-janitors@archiver.kernel.org>; Wed, 16 Jun 2021 13:03:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A31A861209
	for <kernel-janitors@archiver.kernel.org>; Wed, 16 Jun 2021 13:03:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbhFPNFJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 16 Jun 2021 09:05:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38871 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbhFPNFI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Jun 2021 09:05:08 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1ltVC6-0002IQ-K6; Wed, 16 Jun 2021 13:02:58 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jiri Pirko <jiri@nvidia.com>, Ido Schimmel <idosch@nvidia.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mlxsw: spectrum_router: remove redundant continue statement
Date:   Wed, 16 Jun 2021 14:02:58 +0100
Message-Id: <20210616130258.9779-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The continue statement at the end of a for-loop has no effect,
remove it.

Addresses-Coverity: ("Continue has no effect")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
index bc47ed766878..7e221ef01437 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
@@ -5407,7 +5407,6 @@ mlxsw_sp_rt6_nexthop(struct mlxsw_sp_nexthop_group *nh_grp,
 		    ipv6_addr_equal((const struct in6_addr *) &nh->gw_addr,
 				    &rt->fib6_nh->fib_nh_gw6))
 			return nh;
-		continue;
 	}
 
 	return NULL;
-- 
2.31.1

