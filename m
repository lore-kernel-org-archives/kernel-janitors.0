Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82C3C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  2 Sep 2021 22:17:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85C1D610D2
	for <kernel-janitors@archiver.kernel.org>; Thu,  2 Sep 2021 22:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344075AbhIBWSq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 2 Sep 2021 18:18:46 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:60880
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236148AbhIBWSq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 2 Sep 2021 18:18:46 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E69C43F231;
        Thu,  2 Sep 2021 22:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630621065;
        bh=rkLqk2H3cfzfe0pZb/HQsYkLLWbNkb74kYaENpGnHRs=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=QxLVZAJ7jNAVxsh60jcOMAf1wJ28usLdkpHLTN2vJSNmfbkoz3bYfscZEWRXdCBjl
         yPTawrC59vBZtsPCJSYjNXRmPmjAwNmrhtv1sQ/67J3ioW5QvgoZ7qS8VPQHX/Szdr
         JX0eHQaGXmSoq97rdJmwbwpr4o5sHCRQF2K4u9dDaq0HbLwMpHywfjvKDCUwkk1DE0
         aXh5B7XZdDJH+cCqAd7mcHgr926MhbmlK87LpaiFooRfCy54VbZmBEN7R0qgaWaaaB
         i1GoBpMTbHAeRsUnoD5DhO7+wZbRLOk4QwESbo5BodLA7NR2fjYB+wmWSCyLDN/MGx
         PEfOPxsH4jcBw==
From:   Colin King <colin.king@canonical.com>
To:     Steffen Klassert <klassert@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] net: 3com: 3c59x: clean up inconsistent indenting
Date:   Thu,  2 Sep 2021 23:17:45 +0100
Message-Id: <20210902221745.56194-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is not indented correctly, add in the
missing tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/3com/3c59x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/3com/3c59x.c b/drivers/net/ethernet/3com/3c59x.c
index 17c16333a412..7b0ae9efc004 100644
--- a/drivers/net/ethernet/3com/3c59x.c
+++ b/drivers/net/ethernet/3com/3c59x.c
@@ -2786,7 +2786,7 @@ static void
 dump_tx_ring(struct net_device *dev)
 {
 	if (vortex_debug > 0) {
-	struct vortex_private *vp = netdev_priv(dev);
+		struct vortex_private *vp = netdev_priv(dev);
 		void __iomem *ioaddr = vp->ioaddr;
 
 		if (vp->full_bus_master_tx) {
-- 
2.32.0

