Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39526C11F65
	for <kernel-janitors@archiver.kernel.org>; Wed, 30 Jun 2021 06:56:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BDB361C72
	for <kernel-janitors@archiver.kernel.org>; Wed, 30 Jun 2021 06:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbhF3G7T (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 30 Jun 2021 02:59:19 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56317 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbhF3G7S (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Jun 2021 02:59:18 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lyU9P-0000bI-7v; Wed, 30 Jun 2021 06:56:47 +0000
From:   Colin King <colin.king@canonical.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        David Laight <David.Laight@ACULAB.COM>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] staging: r8188eu: Fix while-loop that iterates only once
Date:   Wed, 30 Jun 2021 07:56:47 +0100
Message-Id: <20210630065647.5641-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The while-loop only iterates once becase the post increment test of count
being non-zero is false on the first iteration because count is zero. Fix
this by using a for-loop instead. Static analysis found the issue on the
count > POLLING_LLT_THRESHOLD check always being false since the loop
currently just iterates once.

Thanks to David Laight for suggesting using for-loop instead to improve
the readability of the fix.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: use for-loop instead of change count increment to pre-increment.
---
 drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
index d1086699f952..1c6365832247 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
@@ -168,14 +168,14 @@ void rtw_hal_notch_filter(struct adapter *adapter, bool enable)
 static s32 _LLTWrite(struct adapter *padapter, u32 address, u32 data)
 {
 	s32	status = _SUCCESS;
-	s32	count = 0;
+	s32	count;
 	u32	value = _LLT_INIT_ADDR(address) | _LLT_INIT_DATA(data) | _LLT_OP(_LLT_WRITE_ACCESS);
 	u16	LLTReg = REG_LLT_INIT;
 
 	usb_write32(padapter, LLTReg, value);
 
 	/* polling */
-	do {
+	for (count = 0; ; count++) {
 		value = usb_read32(padapter, LLTReg);
 		if (_LLT_OP_VALUE(value) == _LLT_NO_ACTIVE)
 			break;
@@ -185,7 +185,7 @@ static s32 _LLTWrite(struct adapter *padapter, u32 address, u32 data)
 			break;
 		}
 		udelay(5);
-	} while (count++);
+	}
 
 	return status;
 }
-- 
2.31.1

