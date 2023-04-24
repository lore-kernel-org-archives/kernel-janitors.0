Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ACEC77B7F
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Apr 2023 10:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjDXKQE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Apr 2023 06:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbjDXKP7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Apr 2023 06:15:59 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id CF9B21FEE;
        Mon, 24 Apr 2023 03:15:57 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 65FB6180156034;
        Mon, 24 Apr 2023 18:15:53 +0800 (CST)
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   wuych <yunchuan@nfschina.com>
To:     andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc:     linux@armlinux.org.uk, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        wuych <yunchuan@nfschina.com>
Subject: [PATCH] net: phy: dp83867: Remove unnecessary (void*) conversions
Date:   Mon, 24 Apr 2023 18:15:50 +0800
Message-Id: <20230424101550.664319-1-yunchuan@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Pointer variables of void * type do not require type cast.

Signed-off-by: wuych <yunchuan@nfschina.com>
---
 drivers/net/phy/dp83867.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index 89cd821f1f46..03b2ef1bf3dc 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -468,8 +468,7 @@ static int dp83867_set_tunable(struct phy_device *phydev,
 
 static int dp83867_config_port_mirroring(struct phy_device *phydev)
 {
-	struct dp83867_private *dp83867 =
-		(struct dp83867_private *)phydev->priv;
+	struct dp83867_private *dp83867 = phydev->priv;
 
 	if (dp83867->port_mirroring == DP83867_PORT_MIRROING_EN)
 		phy_set_bits_mmd(phydev, DP83867_DEVADDR, DP83867_CFG4,
-- 
2.30.2

