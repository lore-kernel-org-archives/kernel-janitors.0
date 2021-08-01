Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59D5C4338F
	for <kernel-janitors@archiver.kernel.org>; Sun,  1 Aug 2021 15:26:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA15A610A6
	for <kernel-janitors@archiver.kernel.org>; Sun,  1 Aug 2021 15:26:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbhHAP07 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 1 Aug 2021 11:26:59 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:57212
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231940AbhHAP07 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 1 Aug 2021 11:26:59 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 6AAAF3F070;
        Sun,  1 Aug 2021 15:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627831610;
        bh=3fHwVDYbcEN1xDbpP3WcGfjf0I3mrI1BBvhjD6XEtIs=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=DzEDqay3tXRLJfIjOfh9mMH7zxH3hPMyXUwXrppz2k7LKkvt7Tc1vbE+0NzsaJsvw
         CABTjzaOkRYC95S+oL/k3YtDf5NWUzFD48lX4V6HmV/oJB7gNoCjAIzAf7ICLfmJVo
         3dIwVaa9EGmcQH4jLpl4faGiSEfrQ1MQ8cf1twLJ+cNbookoVo1dmDBVtGx9oMTx9K
         vMe52TYTRVtOWKsjvsUTABEwToY0RG+cUkwKyMrO+IDl2At3ZHi1hbG9o2OSsCxez1
         rVXXZqKHNtoOBP/foCVbJro8o9Lgbl/4sMWnkrpQnRkSOn51XnZ3Fxaj4OSsnHwxTt
         dv3Vy8ePmQ/vw==
From:   Colin King <colin.king@canonical.com>
To:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] net: 3c509: make the array if_names static const, makes object smaller
Date:   Sun,  1 Aug 2021 16:26:50 +0100
Message-Id: <20210801152650.146572-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array if_names on the stack but instead it
static const. Makes the object code smaller by 99 bytes.

Before:
   text    data     bss     dec     hex filename
  27886   10752     672   39310    998e ./drivers/net/ethernet/3com/3c509.o

After:
   text    data     bss     dec     hex filename
  27723   10816     672   39211    992b ./drivers/net/ethernet/3com/3c509.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/3com/3c509.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/3com/3c509.c b/drivers/net/ethernet/3com/3c509.c
index 96cc5fc36eb5..00c4b038be49 100644
--- a/drivers/net/ethernet/3com/3c509.c
+++ b/drivers/net/ethernet/3com/3c509.c
@@ -514,7 +514,9 @@ static int el3_common_init(struct net_device *dev)
 {
 	struct el3_private *lp = netdev_priv(dev);
 	int err;
-	const char *if_names[] = {"10baseT", "AUI", "undefined", "BNC"};
+	static const char * const if_names[] = {
+		"10baseT", "AUI", "undefined", "BNC"
+	};
 
 	spin_lock_init(&lp->lock);
 
-- 
2.31.1

