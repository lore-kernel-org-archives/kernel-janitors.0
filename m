Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03013C47082
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 16:59:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEC1561415
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 16:59:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhFERBJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 5 Jun 2021 13:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhFERBJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 5 Jun 2021 13:01:09 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62E6C061766;
        Sat,  5 Jun 2021 09:59:20 -0700 (PDT)
Received: from dslb-188-096-145-192.188.096.pools.vodafone-ip.de ([188.96.145.192] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lpZdh-0002hw-S2; Sat, 05 Jun 2021 18:59:13 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/9] staging: rtl8188eu: remove unused RT_PRINT_DATA macro
Date:   Sat,  5 Jun 2021 18:58:50 +0200
Message-Id: <20210605165858.3175-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The RT_PRINT_DATA macro is not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/rtw_debug.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/rtw_debug.h b/drivers/staging/rtl8188eu/include/rtw_debug.h
index 1fdf16124a0d..7e2be1ba80fb 100644
--- a/drivers/staging/rtl8188eu/include/rtw_debug.h
+++ b/drivers/staging/rtl8188eu/include/rtw_debug.h
@@ -85,24 +85,6 @@ extern u32 GlobalDebugLevel;
 		}							\
 	} while (0)
 
-#define RT_PRINT_DATA(_comp, _level, _titlestring, _hexdata, _hexdatalen)\
-	do {								\
-		if (_level <= GlobalDebugLevel) {			\
-			int __i;					\
-			u8	*ptr = (u8 *)_hexdata;			\
-			pr_info("%s", DRIVER_PREFIX);			\
-			pr_info(_titlestring);				\
-			for (__i = 0; __i < (int)_hexdatalen; __i++) {	\
-				pr_info("%02X%s", ptr[__i],		\
-					 (((__i + 1) % 4) == 0) ?	\
-					 "  " : " ");	\
-				if (((__i + 1) % 16) == 0)		\
-					pr_cont("\n");			\
-			}						\
-			pr_cont("\n");					\
-		}							\
-	} while (0)
-
 int proc_get_drv_version(char *page, char **start,
 			 off_t offset, int count,
 			 int *eof, void *data);
-- 
2.20.1

