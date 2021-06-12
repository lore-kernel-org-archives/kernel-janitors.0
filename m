Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD286C48BCF
	for <kernel-janitors@archiver.kernel.org>; Sat, 12 Jun 2021 18:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4EAF61374
	for <kernel-janitors@archiver.kernel.org>; Sat, 12 Jun 2021 18:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbhFLSDQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 12 Jun 2021 14:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhFLSDP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 12 Jun 2021 14:03:15 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323C1C061574;
        Sat, 12 Jun 2021 11:01:16 -0700 (PDT)
Received: from dslb-188-097-213-151.188.097.pools.vodafone-ip.de ([188.97.213.151] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1ls7wW-0003B8-HB; Sat, 12 Jun 2021 20:01:12 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/6] staging: rtl8188eu: remove a write-only power-index members
Date:   Sat, 12 Jun 2021 20:00:17 +0200
Message-Id: <20210612180019.20387-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210612180019.20387-1-martin@kaiser.cx>
References: <20210612180019.20387-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Remove power index members of struct hal_data_8188e that are written to
but never read.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/phy.c              | 15 ---------------
 drivers/staging/rtl8188eu/include/rtl8188e_hal.h |  6 ------
 2 files changed, 21 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/phy.c b/drivers/staging/rtl8188eu/hal/phy.c
index 5d9ad09ced70..256f87b9d630 100644
--- a/drivers/staging/rtl8188eu/hal/phy.c
+++ b/drivers/staging/rtl8188eu/hal/phy.c
@@ -162,18 +162,6 @@ static void get_tx_power_index(struct adapter *adapt, u8 channel, u8 *cck_pwr,
 	}
 }
 
-static void phy_power_index_check(struct adapter *adapt, u8 channel,
-				  u8 *cck_pwr, u8 *ofdm_pwr, u8 *bw20_pwr,
-				  u8 *bw40_pwr)
-{
-	struct hal_data_8188e *hal_data = adapt->HalData;
-
-	hal_data->CurrentCckTxPwrIdx = cck_pwr[0];
-	hal_data->CurrentOfdm24GTxPwrIdx = ofdm_pwr[0];
-	hal_data->CurrentBW2024GTxPwrIdx = bw20_pwr[0];
-	hal_data->CurrentBW4024GTxPwrIdx = bw40_pwr[0];
-}
-
 void phy_set_tx_power_level(struct adapter *adapt, u8 channel)
 {
 	u8 cck_pwr[MAX_TX_COUNT] = {0};
@@ -184,9 +172,6 @@ void phy_set_tx_power_level(struct adapter *adapt, u8 channel)
 	get_tx_power_index(adapt, channel, &cck_pwr[0], &ofdm_pwr[0],
 			   &bw20_pwr[0], &bw40_pwr[0]);
 
-	phy_power_index_check(adapt, channel, &cck_pwr[0], &ofdm_pwr[0],
-			      &bw20_pwr[0], &bw40_pwr[0]);
-
 	rtl88eu_phy_rf6052_set_cck_txpower(adapt, &cck_pwr[0]);
 	rtl88eu_phy_rf6052_set_ofdm_txpower(adapt, &ofdm_pwr[0], &bw20_pwr[0],
 					    &bw40_pwr[0], channel);
diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
index 7b8ca0ea3008..20049bdf39f5 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
@@ -233,12 +233,6 @@ struct hal_data_8188e {
 	u8	PwrGroupHT20[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
 	u8	PwrGroupHT40[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
 
-	/*  The current Tx Power Level */
-	u8	CurrentCckTxPwrIdx;
-	u8	CurrentOfdm24GTxPwrIdx;
-	u8	CurrentBW2024GTxPwrIdx;
-	u8	CurrentBW4024GTxPwrIdx;
-
 	/*  Read/write are allow for following hardware information variables */
 	u8	framesync;
 	u8	pwrGroupCnt;
-- 
2.20.1

