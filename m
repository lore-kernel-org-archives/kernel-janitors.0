Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1EAC6FD18
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 Apr 2023 05:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbjDYFP5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 Apr 2023 01:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbjDYFPv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Apr 2023 01:15:51 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 6104C8682;
        Mon, 24 Apr 2023 22:15:49 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 7DB9B180509A0C;
        Tue, 25 Apr 2023 13:15:46 +0800 (CST)
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   wuych <yunchuan@nfschina.com>
To:     andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc:     linux@armlinux.org.uk, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        wuych <yunchuan@nfschina.com>
Subject: [PATCH] net: phy: marvell-88x2222: remove unnecessary (void*) conversions
Date:   Tue, 25 Apr 2023 13:15:32 +0800
Message-Id: <20230425051532.44830-1-yunchuan@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Pointer variables of void * type do not require type cast.

Signed-off-by: wuych <yunchuan@nfschina.com>
---
 drivers/net/phy/marvell-88x2222.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/marvell-88x2222.c b/drivers/net/phy/marvell-88x2222.c
index fd9ad4820192..f83cae64585d 100644
--- a/drivers/net/phy/marvell-88x2222.c
+++ b/drivers/net/phy/marvell-88x2222.c
@@ -487,7 +487,7 @@ static int mv2222_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_supported) = { 0, };
 
-	priv = (struct mv2222_data *)phydev->priv;
+	priv = phydev->priv;
 	dev = &phydev->mdio.dev;
 
 	sfp_parse_support(phydev->sfp_bus, id, sfp_supported, interfaces);
@@ -524,7 +524,7 @@ static void mv2222_sfp_remove(void *upstream)
 	struct phy_device *phydev = upstream;
 	struct mv2222_data *priv;
 
-	priv = (struct mv2222_data *)phydev->priv;
+	priv = phydev->priv;
 
 	priv->line_interface = PHY_INTERFACE_MODE_NA;
 	linkmode_zero(priv->supported);
-- 
2.30.2

