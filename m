Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4743C432BE
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Jul 2021 15:59:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0CA560F42
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Jul 2021 15:59:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbhGYPT0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 25 Jul 2021 11:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbhGYPTC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 25 Jul 2021 11:19:02 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5907DC061757;
        Sun, 25 Jul 2021 08:59:32 -0700 (PDT)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1m7gXK-0000SM-Fu; Sun, 25 Jul 2021 17:59:30 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/18] staging: rtl8188eu: remove yet another unused enum
Date:   Sun, 25 Jul 2021 17:58:52 +0200
Message-Id: <20210725155902.32433-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725155902.32433-1-martin@kaiser.cx>
References: <20210725155902.32433-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The hardware_type enum is not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/hal_intf.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/hal_intf.h b/drivers/staging/rtl8188eu/include/hal_intf.h
index 8396659f6acb..12a585c0d0f2 100644
--- a/drivers/staging/rtl8188eu/include/hal_intf.h
+++ b/drivers/staging/rtl8188eu/include/hal_intf.h
@@ -107,11 +107,6 @@ enum hal_odm_variable {
 
 #define RF_CHANGE_BY_PS		BIT(29)
 
-enum hardware_type {
-	HARDWARE_TYPE_RTL8188EU,
-	HARDWARE_TYPE_MAX,
-};
-
 #define GET_EEPROM_EFUSE_PRIV(adapter) (&adapter->eeprompriv)
 
 void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_level);
-- 
2.20.1

