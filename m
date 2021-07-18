Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D79C636CB
	for <kernel-janitors@archiver.kernel.org>; Sun, 18 Jul 2021 17:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09ED261181
	for <kernel-janitors@archiver.kernel.org>; Sun, 18 Jul 2021 17:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhGRRkq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 18 Jul 2021 13:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbhGRRka (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 18 Jul 2021 13:40:30 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE60C061762;
        Sun, 18 Jul 2021 10:37:32 -0700 (PDT)
Received: from dslb-178-004-206-019.178.004.pools.vodafone-ip.de ([178.4.206.19] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1m5AjI-0006oR-NS; Sun, 18 Jul 2021 19:37:28 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/10] staging: rtl8188eu: remove _CHIP_TYPE enum
Date:   Sun, 18 Jul 2021 19:36:04 +0200
Message-Id: <20210718173610.894-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718173610.894-1-martin@kaiser.cx>
References: <20210718173610.894-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This enum is not used and can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/hal_intf.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/hal_intf.h b/drivers/staging/rtl8188eu/include/hal_intf.h
index 2a00d2df95d4..c74249fc200f 100644
--- a/drivers/staging/rtl8188eu/include/hal_intf.h
+++ b/drivers/staging/rtl8188eu/include/hal_intf.h
@@ -11,16 +11,6 @@
 #include <drv_types.h>
 #include <hal8188e_phy_cfg.h>
 
-enum _CHIP_TYPE {
-	NULL_CHIP_TYPE,
-	RTL8712_8188S_8191S_8192S,
-	RTL8188C_8192C,
-	RTL8192D,
-	RTL8723A,
-	RTL8188E,
-	MAX_CHIP_TYPE
-};
-
 enum hw_variables {
 	HW_VAR_MEDIA_STATUS,
 	HW_VAR_MEDIA_STATUS1,
-- 
2.20.1

