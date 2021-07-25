Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AECC4338F
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Jul 2021 15:59:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A99F360F38
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Jul 2021 15:59:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbhGYPTZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 25 Jul 2021 11:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbhGYPTB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 25 Jul 2021 11:19:01 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65323C061757;
        Sun, 25 Jul 2021 08:59:31 -0700 (PDT)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1m7gXE-0000SM-G9; Sun, 25 Jul 2021 17:59:24 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/18] staging: rtl8188eu: remove HW_VAR_MEDIA_STATUS1
Date:   Sun, 25 Jul 2021 17:58:46 +0200
Message-Id: <20210725155902.32433-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725155902.32433-1-martin@kaiser.cx>
References: <20210725155902.32433-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "HAL layer variable" HW_VAR_MEDIA_STATUS1 is not used in this driver.
Remove its define and the code for setting a value.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c  | 9 ---------
 drivers/staging/rtl8188eu/include/hal_intf.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index 1d7d5037ce89..633feae0fca5 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -1135,15 +1135,6 @@ void rtw_hal_set_hwreg(struct adapter *Adapter, u8 variable, u8 *val)
 			usb_write8(Adapter, MSR, val8);
 		}
 		break;
-	case HW_VAR_MEDIA_STATUS1:
-		{
-			u8 val8;
-
-			val8 = usb_read8(Adapter, MSR) & 0x03;
-			val8 |= *((u8 *)val) << 2;
-			usb_write8(Adapter, MSR, val8);
-		}
-		break;
 	case HW_VAR_SET_OPMODE:
 		hw_var_set_opmode(Adapter, variable, val);
 		break;
diff --git a/drivers/staging/rtl8188eu/include/hal_intf.h b/drivers/staging/rtl8188eu/include/hal_intf.h
index 4d4e0a259050..e2ce71db3fa1 100644
--- a/drivers/staging/rtl8188eu/include/hal_intf.h
+++ b/drivers/staging/rtl8188eu/include/hal_intf.h
@@ -13,7 +13,6 @@
 
 enum hw_variables {
 	HW_VAR_MEDIA_STATUS,
-	HW_VAR_MEDIA_STATUS1,
 	HW_VAR_SET_OPMODE,
 	HW_VAR_MAC_ADDR,
 	HW_VAR_BSSID,
-- 
2.20.1

