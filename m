Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51A7C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  2 Sep 2021 22:26:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F74B61041
	for <kernel-janitors@archiver.kernel.org>; Thu,  2 Sep 2021 22:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347634AbhIBW06 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 2 Sep 2021 18:26:58 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:32908
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231642AbhIBW05 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 2 Sep 2021 18:26:57 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 7E5923F33E;
        Thu,  2 Sep 2021 22:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630621557;
        bh=kfwb3fgdKLU7ink68zjUIyiYNzChTEoc7/7Uc+lGVGw=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=BI4vakcFz6PXBTMh+9ZxQJHpD6sKVryZWSbZnLeEsWzJH39qFYApomjZNFZ0QTj2c
         dR+7hrwX7Y8zkx2C5wjmUf3WzqUKDG4Pvx2+8LcDOscUESfTCpaaOEfqHNsDPyR7Z6
         aeu6zaNEBiRwdYN/JS6LxhqlqfRKjSCLYz8V9/dcLbFcnGE9p+T6FRQc8YuLsyWvRD
         8dPdjvHjOUCPAEQeUDkAj2uSDMNy9LzXO6juMeAI4YNJfm00ZpQiXmI/OzCXP0cr5d
         PYFinAyY1HHk98NAlzkHG9E8Qv29EQbYx6a+B6jf2w/iFTZvyGhT+LRQFutcQgqNca
         b7H8mxwDISySw==
From:   Colin King <colin.king@canonical.com>
To:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: net: smc911x: clean up inconsistent indenting
Date:   Thu,  2 Sep 2021 23:25:57 +0100
Message-Id: <20210902222557.56483-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are various function arguments that are not indented correctly,
clean these up with correct indentation.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/smsc/smc911x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smc911x.c b/drivers/net/ethernet/smsc/smc911x.c
index 22cdbf12c823..b38056ed8371 100644
--- a/drivers/net/ethernet/smsc/smc911x.c
+++ b/drivers/net/ethernet/smsc/smc911x.c
@@ -1550,7 +1550,7 @@ static int smc911x_ethtool_getregslen(struct net_device *dev)
 }
 
 static void smc911x_ethtool_getregs(struct net_device *dev,
-										 struct ethtool_regs* regs, void *buf)
+				    struct ethtool_regs *regs, void *buf)
 {
 	struct smc911x_local *lp = netdev_priv(dev);
 	unsigned long flags;
@@ -1600,7 +1600,7 @@ static int smc911x_ethtool_wait_eeprom_ready(struct net_device *dev)
 }
 
 static inline int smc911x_ethtool_write_eeprom_cmd(struct net_device *dev,
-													int cmd, int addr)
+						   int cmd, int addr)
 {
 	struct smc911x_local *lp = netdev_priv(dev);
 	int ret;
@@ -1614,7 +1614,7 @@ static inline int smc911x_ethtool_write_eeprom_cmd(struct net_device *dev,
 }
 
 static inline int smc911x_ethtool_read_eeprom_byte(struct net_device *dev,
-													u8 *data)
+						   u8 *data)
 {
 	struct smc911x_local *lp = netdev_priv(dev);
 	int ret;
@@ -1626,7 +1626,7 @@ static inline int smc911x_ethtool_read_eeprom_byte(struct net_device *dev,
 }
 
 static inline int smc911x_ethtool_write_eeprom_byte(struct net_device *dev,
-													 u8 data)
+						    u8 data)
 {
 	struct smc911x_local *lp = netdev_priv(dev);
 	int ret;
@@ -1638,7 +1638,7 @@ static inline int smc911x_ethtool_write_eeprom_byte(struct net_device *dev,
 }
 
 static int smc911x_ethtool_geteeprom(struct net_device *dev,
-									  struct ethtool_eeprom *eeprom, u8 *data)
+				     struct ethtool_eeprom *eeprom, u8 *data)
 {
 	u8 eebuf[SMC911X_EEPROM_LEN];
 	int i, ret;
@@ -1654,7 +1654,7 @@ static int smc911x_ethtool_geteeprom(struct net_device *dev,
 }
 
 static int smc911x_ethtool_seteeprom(struct net_device *dev,
-									   struct ethtool_eeprom *eeprom, u8 *data)
+				     struct ethtool_eeprom *eeprom, u8 *data)
 {
 	int i, ret;
 
-- 
2.32.0

