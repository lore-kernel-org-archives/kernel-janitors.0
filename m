Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010E2C48BDF
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 09:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF5BD61433
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 09:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhFOJHZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Jun 2021 05:07:25 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51627 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbhFOJHY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Jun 2021 05:07:24 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lt50W-0003X9-Qg; Tue, 15 Jun 2021 09:05:16 +0000
From:   Colin King <colin.king@canonical.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] net: dsa: b53: remove redundant null check on dev
Date:   Tue, 15 Jun 2021 10:05:16 +0100
Message-Id: <20210615090516.5906-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer dev can never be null, the null check is redundant
and can be removed. Cleans up a static analysis warning that
pointer priv is dereferencing dev before dev is being null
checked.

Addresses-Coverity: ("Dereference before null check")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Remove null check rather than add b53_srab_intr_set call into a null
    check statement block.
    Rephrase commit Subject to reflect the change in the fix.

---
 drivers/net/dsa/b53/b53_srab.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index aaa12d73784e..3f4249de70c5 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -632,8 +632,7 @@ static int b53_srab_remove(struct platform_device *pdev)
 	struct b53_srab_priv *priv = dev->priv;
 
 	b53_srab_intr_set(priv, false);
-	if (dev)
-		b53_switch_remove(dev);
+	b53_switch_remove(dev);
 
 	return 0;
 }
-- 
2.31.1

