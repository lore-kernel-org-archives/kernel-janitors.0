Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23029C4338F
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Aug 2021 13:09:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0A4F61058
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Aug 2021 13:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236084AbhHRNKE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 18 Aug 2021 09:10:04 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:45552
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233634AbhHRNKD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Aug 2021 09:10:03 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 90FE93F365;
        Wed, 18 Aug 2021 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629292167;
        bh=QMhCbedXXvfVQwxEGtSlSAh2lNaKHZKflzfnmOrUTkQ=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=AtOBMCfNpcjamwO08GaAI2nojeY8t/OJFmBe62bTltjc1FkRysUYWru+2I+p8oMlB
         qqQOJ7Vd9ZC61vPL4Vj6BRldg8eaR1TBzdLncA7212RK7gm8KIj7wRE8PUWkyRex8X
         qam7rQT4YmpjBfm0bW4NOUjiyfaKWSKpH6agwQRlk5lATZ9Jm/1j3FPsyvTUWEM52C
         a09Jqoey7XUjXilqWZTaC19GBeGsjj3J+Cepqvu03S5JofsyGejxvLoRDvoxsNHL9m
         xNw2FW5vtDMdCUjYQLO8+yoJxD1JmXF/azzLC8uBZJLg4cTDFv1M/fNm/fBGWrgsXI
         o/Wm/VsEEB00g==
From:   Colin King <colin.king@canonical.com>
To:     Sunil Goutham <sgoutham@marvell.com>,
        Linu Cherian <lcherian@marvell.com>,
        Geetha sowjanya <gakula@marvell.com>,
        Jerin Jacob <jerinj@marvell.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] octeontx2-af: remove redudant second error check on variable err
Date:   Wed, 18 Aug 2021 14:09:27 +0100
Message-Id: <20210818130927.33895-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A recent change added error checking messages and failed to remove one
of the previous error checks. There are now two checks on variable err
so the second one is redundant dead code and can be removed.

Addresses-Coverity: ("Logically dead code")
Fixes: a83bdada06bf ("octeontx2-af: Add debug messages for failures")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
index fb50df93b54e..c2438ba5e2ec 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
@@ -1031,8 +1031,6 @@ static int rvu_setup_hw_resources(struct rvu *rvu)
 			"%s: Failed to allocate CPT1 LF bitmap\n", __func__);
 		return err;
 	}
-	if (err)
-		return err;
 
 	/* Allocate memory for PFVF data */
 	rvu->pf = devm_kcalloc(rvu->dev, hw->total_pfs,
-- 
2.32.0

