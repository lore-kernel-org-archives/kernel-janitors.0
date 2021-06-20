Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88FFC48BDF
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Jun 2021 17:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA30461007
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Jun 2021 17:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbhFTRzu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 20 Jun 2021 13:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbhFTRzm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Jun 2021 13:55:42 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDC9C061756;
        Sun, 20 Jun 2021 10:53:29 -0700 (PDT)
Received: from dslb-084-059-235-131.084.059.pools.vodafone-ip.de ([84.59.235.131] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lv1dO-00012S-JK; Sun, 20 Jun 2021 19:53:26 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/13] staging: rtl8188eu: remove a couple of unused defines
Date:   Sun, 20 Jun 2021 19:52:52 +0200
Message-Id: <20210620175301.14988-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210620175301.14988-1-martin@kaiser.cx>
References: <20210620175301.14988-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Remove some defines which are not used by this driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/rtl8188e_hal.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
index 0bfab5990d27..2c16d3f33e1c 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
@@ -20,19 +20,6 @@
 #include "rtw_sreset.h"
 #include "odm_precomp.h"
 
-/*  Fw Array */
-#define Rtl8188E_FwImageArray		Rtl8188EFwImgArray
-#define Rtl8188E_FWImgArrayLength	Rtl8188EFWImgArrayLength
-
-#define RTL8188E_FW_UMC_IMG			"rtl8188E\\rtl8188efw.bin"
-#define RTL8188E_PHY_REG			"rtl8188E\\PHY_REG_1T.txt"
-#define RTL8188E_PHY_RADIO_A			"rtl8188E\\radio_a_1T.txt"
-#define RTL8188E_PHY_RADIO_B			"rtl8188E\\radio_b_1T.txt"
-#define RTL8188E_AGC_TAB			"rtl8188E\\AGC_TAB_1T.txt"
-#define RTL8188E_PHY_MACREG			"rtl8188E\\MAC_REG.txt"
-#define RTL8188E_PHY_REG_PG			"rtl8188E\\PHY_REG_PG.txt"
-#define RTL8188E_PHY_REG_MP			"rtl8188E\\PHY_REG_MP.txt"
-
 /* RTL8188E Power Configuration CMDs for USB/SDIO interfaces */
 #define Rtl8188E_NIC_PWR_ON_FLOW		rtl8188E_power_on_flow
 #define Rtl8188E_NIC_RF_OFF_FLOW		rtl8188E_radio_off_flow
-- 
2.20.1

