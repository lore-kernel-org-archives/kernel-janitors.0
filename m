Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62D3C48BE5
	for <kernel-janitors@archiver.kernel.org>; Sat, 12 Jun 2021 14:44:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAE5B613B8
	for <kernel-janitors@archiver.kernel.org>; Sat, 12 Jun 2021 14:44:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhFLOqN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 12 Jun 2021 10:46:13 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:32788 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbhFLOqM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 12 Jun 2021 10:46:12 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1ls4ro-0001ut-0z; Sat, 12 Jun 2021 14:44:08 +0000
From:   Colin King <colin.king@canonical.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] net: dsa: b53: Fix dereference of null dev
Date:   Sat, 12 Jun 2021 15:44:07 +0100
Message-Id: <20210612144407.60259-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently pointer priv is dereferencing dev before dev is being null
checked so a potential null pointer dereference can occur. Fix this
by only assigning and using priv if dev is not-null.

Addresses-Coverity: ("Dereference before null check")
Fixes: 16994374a6fc ("net: dsa: b53: Make SRAB driver manage port interrupts")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/b53/b53_srab.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index aaa12d73784e..e77ac598f859 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -629,11 +629,13 @@ static int b53_srab_probe(struct platform_device *pdev)
 static int b53_srab_remove(struct platform_device *pdev)
 {
 	struct b53_device *dev = platform_get_drvdata(pdev);
-	struct b53_srab_priv *priv = dev->priv;
 
-	b53_srab_intr_set(priv, false);
-	if (dev)
+	if (dev) {
+		struct b53_srab_priv *priv = dev->priv;
+
+		b53_srab_intr_set(priv, false);
 		b53_switch_remove(dev);
+	}
 
 	return 0;
 }
-- 
2.31.1

