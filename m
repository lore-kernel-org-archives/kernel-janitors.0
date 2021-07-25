Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C513C4320A
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Jul 2021 16:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06B7A60F46
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Jul 2021 16:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhGYPTa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 25 Jul 2021 11:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbhGYPTG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 25 Jul 2021 11:19:06 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6882C061757;
        Sun, 25 Jul 2021 08:59:36 -0700 (PDT)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1m7gXO-0000SM-Vf; Sun, 25 Jul 2021 17:59:35 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 13/18] staging: rtl8188eu: remove write-only HwRxPageSize
Date:   Sun, 25 Jul 2021 17:58:57 +0200
Message-Id: <20210725155902.32433-13-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725155902.32433-1-martin@kaiser.cx>
References: <20210725155902.32433-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

HwRxPageSize from struct hal_data_8188e is set but never read. Remove the
component and the code to initialise it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c   | 20 -------------------
 .../staging/rtl8188eu/include/rtl8188e_hal.h  |  1 -
 .../staging/rtl8188eu/include/rtl8188e_spec.h |  4 ----
 3 files changed, 25 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index aaa68356d211..b2dd648aecd7 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -515,26 +515,6 @@ static void usb_AggSettingRxUpdate(struct adapter *Adapter)
 		/*  TODO: */
 		break;
 	}
-
-	switch (PBP_128) {
-	case PBP_128:
-		haldata->HwRxPageSize = 128;
-		break;
-	case PBP_64:
-		haldata->HwRxPageSize = 64;
-		break;
-	case PBP_256:
-		haldata->HwRxPageSize = 256;
-		break;
-	case PBP_512:
-		haldata->HwRxPageSize = 512;
-		break;
-	case PBP_1024:
-		haldata->HwRxPageSize = 1024;
-		break;
-	default:
-		break;
-	}
 }	/*  usb_AggSettingRxUpdate */
 
 static void InitUsbAggregationSetting(struct adapter *Adapter)
diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
index 7d95943fc05e..3e697a3321e1 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
@@ -265,7 +265,6 @@ struct hal_data_8188e {
 	u8	C2hArray[16];
 	u8	UsbTxAggMode;
 	u8	UsbTxAggDescNum;
-	u16	HwRxPageSize;		/*  Hardware setting */
 
 	enum usb_rx_agg_mode UsbRxAggMode;
 	u8	UsbRxAggBlockCount;	/*  USB Block count. Block size is
diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_spec.h b/drivers/staging/rtl8188eu/include/rtl8188e_spec.h
index fe0871bbb95f..c7be0a1d70b9 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_spec.h
@@ -803,11 +803,7 @@ So the following defines for 92C is not entire!!!!!!
 #define _PSRX(x)			(x)
 #define _PSTX(x)			((x) << 4)
 
-#define PBP_64				0x0
 #define PBP_128				0x1
-#define PBP_256				0x2
-#define PBP_512				0x3
-#define PBP_1024			0x4
 
 /* 2 TX/RXDMA */
 #define RXDMA_ARBBW_EN			BIT(0)
-- 
2.20.1

