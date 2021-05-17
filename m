Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86156C433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 20:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B7A161354
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 20:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240122AbhEQUVy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 May 2021 16:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239635AbhEQUVu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 May 2021 16:21:50 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9D4C061756;
        Mon, 17 May 2021 13:20:33 -0700 (PDT)
Received: from dslb-084-059-234-229.084.059.pools.vodafone-ip.de ([84.59.234.229] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lijiw-0001o4-HK; Mon, 17 May 2021 22:20:22 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 2/6] staging: rtl8188eu: use safe iterator in rtw_free_all_stainfo
Date:   Mon, 17 May 2021 22:18:22 +0200
Message-Id: <20210517201826.25150-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517201826.25150-1-martin@kaiser.cx>
References: <20210516160613.30489-1-martin@kaiser.cx>
 <20210517201826.25150-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is another case where we may remove list entries while we iterate over
the list. Use list_for_each_entry_safe to avoid an endless loop.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
 - use list_for_each_entry_safe

Without this patch, unloading the module goes into an endless loop
sometimes.

 drivers/staging/rtl8188eu/core/rtw_sta_mgt.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
index 7941ca0397ed..5af7af5f5a5a 100644
--- a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
@@ -379,9 +379,9 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 /*  free all stainfo which in sta_hash[all] */
 void rtw_free_all_stainfo(struct adapter *padapter)
 {
-	struct list_head *plist, *phead;
+	struct list_head *phead;
 	s32 index;
-	struct sta_info *psta = NULL;
+	struct sta_info *psta, *temp;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct sta_info *pbcmc_stainfo = rtw_get_bcmc_stainfo(padapter);
 
@@ -392,9 +392,7 @@ void rtw_free_all_stainfo(struct adapter *padapter)
 
 	for (index = 0; index < NUM_STA; index++) {
 		phead = &pstapriv->sta_hash[index];
-		list_for_each(plist, phead) {
-			psta = list_entry(plist, struct sta_info, hash_list);
-
+		list_for_each_entry_safe(psta, temp, phead, hash_list) {
 			if (pbcmc_stainfo != psta)
 				rtw_free_stainfo(padapter, psta);
 		}
-- 
2.20.1

