Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCE3C48BDF
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Jun 2021 17:54:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88FC961007
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Jun 2021 17:54:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhFTR4F (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 20 Jun 2021 13:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbhFTRzu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Jun 2021 13:55:50 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A80C061574;
        Sun, 20 Jun 2021 10:53:36 -0700 (PDT)
Received: from dslb-084-059-235-131.084.059.pools.vodafone-ip.de ([84.59.235.131] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lv1dX-00012S-0T; Sun, 20 Jun 2021 19:53:35 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/13] staging: rtl8188eu: make efuse_ReadEFuse static
Date:   Sun, 20 Jun 2021 19:52:59 +0200
Message-Id: <20210620175301.14988-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210620175301.14988-1-martin@kaiser.cx>
References: <20210620175301.14988-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The function is used only inside rtw_efuse.c.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/core/rtw_efuse.c    | 2 +-
 drivers/staging/rtl8188eu/include/rtw_efuse.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_efuse.c b/drivers/staging/rtl8188eu/core/rtw_efuse.c
index 7d5d0fdc1aaa..80673a73c119 100644
--- a/drivers/staging/rtl8188eu/core/rtw_efuse.c
+++ b/drivers/staging/rtl8188eu/core/rtw_efuse.c
@@ -281,7 +281,7 @@ static s32 iol_read_efuse(struct adapter *padapter, u8 txpktbuf_bndy, u16 offset
 	return status;
 }
 
-void efuse_ReadEFuse(struct adapter *Adapter, u16 _offset, u16 _size_byte, u8 *pbuf)
+static void efuse_ReadEFuse(struct adapter *Adapter, u16 _offset, u16 _size_byte, u8 *pbuf)
 {
 	if (rtw_iol_applied(Adapter)) {
 		rtw_hal_power_on(Adapter);
diff --git a/drivers/staging/rtl8188eu/include/rtw_efuse.h b/drivers/staging/rtl8188eu/include/rtw_efuse.h
index 5f7d20baec6b..bb5e2b5d4bf1 100644
--- a/drivers/staging/rtl8188eu/include/rtw_efuse.h
+++ b/drivers/staging/rtl8188eu/include/rtw_efuse.h
@@ -57,7 +57,6 @@ u8 Efuse_CalculateWordCnts(u8 word_en);
 u8 efuse_OneByteRead(struct adapter *adapter, u16 addr, u8 *data);
 u8 efuse_OneByteWrite(struct adapter *adapter, u16 addr, u8 data);
 
-void efuse_ReadEFuse(struct adapter *Adapter, u16 _offset, u16 _size_byte, u8 *pbuf);
 int Efuse_PgPacketRead(struct adapter *adapt, u8 offset, u8 *data);
 bool Efuse_PgPacketWrite(struct adapter *adapter, u8 offset, u8 word, u8 *data);
 void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata);
-- 
2.20.1

