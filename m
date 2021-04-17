Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7208C433B4
	for <kernel-janitors@archiver.kernel.org>; Sat, 17 Apr 2021 18:01:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A328F613B0
	for <kernel-janitors@archiver.kernel.org>; Sat, 17 Apr 2021 18:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236933AbhDQSBl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 17 Apr 2021 14:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236718AbhDQSBl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 17 Apr 2021 14:01:41 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9798FC061574;
        Sat, 17 Apr 2021 11:01:14 -0700 (PDT)
Received: from ipservice-092-217-095-235.092.217.pools.vodafone-ip.de ([92.217.95.235] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lXpFm-0002pi-FE; Sat, 17 Apr 2021 20:01:10 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/4] staging: rtl8188eu: remove unused function parameters
Date:   Sat, 17 Apr 2021 20:00:37 +0200
Message-Id: <20210417180037.17806-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417180037.17806-1-martin@kaiser.cx>
References: <20210417180037.17806-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The Enable and Linked parameters of _BeaconFunctionEnable are not used.
Remove them.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index abe58cf2de16..80cdcf6f7879 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -574,8 +574,7 @@ static void _InitBeaconParameters(struct adapter *Adapter)
 	haldata->RegCR_1 = usb_read8(Adapter, REG_CR + 1);
 }
 
-static void _BeaconFunctionEnable(struct adapter *Adapter,
-				  bool Enable, bool Linked)
+static void _BeaconFunctionEnable(struct adapter *Adapter)
 {
 	usb_write8(Adapter, REG_BCN_CTRL, (BIT(4) | BIT(3) | BIT(1)));
 
@@ -1961,7 +1960,7 @@ void beacon_timing_control(struct adapter *adapt)
 	usb_write8(adapt,  REG_RXTSF_OFFSET_CCK, 0x50);
 	usb_write8(adapt, REG_RXTSF_OFFSET_OFDM, 0x50);
 
-	_BeaconFunctionEnable(adapt, true, true);
+	_BeaconFunctionEnable(adapt);
 
 	ResumeTxBeacon(adapt);
 
-- 
2.20.1

