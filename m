Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EA0C432BE
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Jul 2021 15:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46B9D60F46
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Jul 2021 15:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhGYPTQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 25 Jul 2021 11:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbhGYPS5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 25 Jul 2021 11:18:57 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40261C061757;
        Sun, 25 Jul 2021 08:59:27 -0700 (PDT)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1m7gXA-0000SM-Sl; Sun, 25 Jul 2021 17:59:20 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/18] staging: rtl8188eu: remove unused defines
Date:   Sun, 25 Jul 2021 17:58:45 +0200
Message-Id: <20210725155902.32433-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Now that power cut mask is not used any more, we can also remove the
defines for power cut masks.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/pwrseqcmd.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/pwrseqcmd.h b/drivers/staging/rtl8188eu/include/pwrseqcmd.h
index bfa0405cccde..bbf4f302c9f4 100644
--- a/drivers/staging/rtl8188eu/include/pwrseqcmd.h
+++ b/drivers/staging/rtl8188eu/include/pwrseqcmd.h
@@ -15,17 +15,6 @@
 #define PWR_CMD_DELAY		0x03
 #define PWR_CMD_END		0x04
 
-/* The value of cut_msk: 8 bits */
-#define PWR_CUT_TESTCHIP_MSK	BIT(0)
-#define PWR_CUT_A_MSK		BIT(1)
-#define PWR_CUT_B_MSK		BIT(2)
-#define PWR_CUT_C_MSK		BIT(3)
-#define PWR_CUT_D_MSK		BIT(4)
-#define PWR_CUT_E_MSK		BIT(5)
-#define PWR_CUT_F_MSK		BIT(6)
-#define PWR_CUT_G_MSK		BIT(7)
-#define PWR_CUT_ALL_MSK		0xFF
-
 enum pwrseq_cmd_delat_unit {
 	PWRSEQ_DELAY_US,
 	PWRSEQ_DELAY_MS,
-- 
2.20.1

