Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55762C433B4
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 May 2021 16:07:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 365EC6117A
	for <kernel-janitors@archiver.kernel.org>; Sun, 16 May 2021 16:07:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhEPQIz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 16 May 2021 12:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbhEPQIy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 16 May 2021 12:08:54 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBD6C06174A;
        Sun, 16 May 2021 09:07:39 -0700 (PDT)
Received: from dslb-094-219-038-078.094.219.pools.vodafone-ip.de ([94.219.38.78] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1liJIi-0003Vl-Dd; Sun, 16 May 2021 18:07:32 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/6] staging: rtl8188eu: use safe iterator in rtw_sta_flush
Date:   Sun, 16 May 2021 18:06:12 +0200
Message-Id: <20210516160613.30489-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210516160613.30489-1-martin@kaiser.cx>
References: <20210516160613.30489-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use list_for_each_safe, we may delete list items while iterating over
the list.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
compile-tested only

 drivers/staging/rtl8188eu/core/rtw_ap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
index 601974df4114..8ffafc7eb316 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ap.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
@@ -1579,7 +1579,7 @@ u8 ap_free_sta(struct adapter *padapter, struct sta_info *psta,
 
 int rtw_sta_flush(struct adapter *padapter)
 {
-	struct list_head *phead, *plist;
+	struct list_head *phead, *plist, *temp;
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -1594,7 +1594,7 @@ int rtw_sta_flush(struct adapter *padapter)
 	spin_lock_bh(&pstapriv->asoc_list_lock);
 	phead = &pstapriv->asoc_list;
 	/* free sta asoc_queue */
-	list_for_each(plist, phead) {
+	list_for_each_safe(plist, temp, phead) {
 		psta = list_entry(plist, struct sta_info, asoc_list);
 
 		list_del_init(&psta->asoc_list);
-- 
2.20.1

