Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2675C48BCF
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 17:43:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0DF0613D2
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 17:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhFIRpw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 13:45:52 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50323 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbhFIRpw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 13:45:52 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lr2F8-0001xW-2a; Wed, 09 Jun 2021 17:43:54 +0000
From:   Colin King <colin.king@canonical.com>
To:     Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] net: dsa: sja1105: Fix assigned yet unused return code rc
Date:   Wed,  9 Jun 2021 18:43:53 +0100
Message-Id: <20210609174353.298731-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The return code variable rc is being set to return error values in two
places in sja1105_mdiobus_base_tx_register and yet it is not being
returned, the function always returns 0 instead. Fix this by replacing
the return 0 with the return code rc.

Addresses-Coverity: ("Unused value")
Fixes: 5a8f09748ee7 ("net: dsa: sja1105: register the MDIO buses for 100base-T1 and 100base-TX")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/sja1105/sja1105_mdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_mdio.c b/drivers/net/dsa/sja1105/sja1105_mdio.c
index 8dfd06318b23..08517c70cb48 100644
--- a/drivers/net/dsa/sja1105/sja1105_mdio.c
+++ b/drivers/net/dsa/sja1105/sja1105_mdio.c
@@ -171,7 +171,7 @@ static int sja1105_mdiobus_base_tx_register(struct sja1105_private *priv,
 out_put_np:
 	of_node_put(np);
 
-	return 0;
+	return rc;
 }
 
 static void sja1105_mdiobus_base_tx_unregister(struct sja1105_private *priv)
-- 
2.31.1

