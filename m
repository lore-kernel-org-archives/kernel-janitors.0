Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4785C4338F
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Jul 2021 19:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C92BF60E74
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Jul 2021 19:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhGVSe7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Jul 2021 14:34:59 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:35132
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229545AbhGVSe6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Jul 2021 14:34:58 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 71D863F22F;
        Thu, 22 Jul 2021 19:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626981332;
        bh=bxMMbXX93B1Hfa8C300wVht3IrDjfwUTd6RgHVXgqNU=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=iTWIB/CbkA9YteyjaTLS+/Z3eSTjcqX6eOGjprgFnR5uBhTp8xG08zn2nuZQXNB1C
         NCdibv2Gk5mUhNlfyz64vXrFl/9z1AdbqI8J85zmygKN1YksONyKX4D4qoALBZjLUp
         xHQt49xhflDa71Atu/b7LZ+7WLY9ZMdLqbsfDhLaUSzOEgDUXAYTVsZ0TYDkV11Qyx
         v9WI0BZSU0GWKJD02W/1+lq6XQ9IVpfPmzFYm6VUL0dZWUZHvomLLK7QZN8NRGD0rw
         BzPwW3NeirCIahl0obJyBI/7/IfeulnWwXhAGr+/T6LY7OibT0QfWzh3k0eiG3+48H
         81M46oObXIrWA==
From:   Colin King <colin.king@canonical.com>
To:     Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] net: dsa: sja1105: remove redundant re-assignment of pointer table
Date:   Thu, 22 Jul 2021 20:15:29 +0100
Message-Id: <20210722191529.11013-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer table is being re-assigned with a value that is never
read. The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/sja1105/sja1105_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_main.c b/drivers/net/dsa/sja1105/sja1105_main.c
index 6618abba23b3..c65dba3111d7 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -2157,8 +2157,6 @@ static int sja1105_build_vlan_table(struct sja1105_private *priv)
 	if (!new_vlan)
 		return -ENOMEM;
 
-	table = &priv->static_config.tables[BLK_IDX_VLAN_LOOKUP];
-
 	for (i = 0; i < VLAN_N_VID; i++)
 		new_vlan[i].vlanid = VLAN_N_VID;
 
-- 
2.31.1

