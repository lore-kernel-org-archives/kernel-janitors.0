Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F5BC433E0
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6642861A1E
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhC0ASX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 20:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbhC0ASM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 20:18:12 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34320C0613AA
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:11 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id dc12so3854558qvb.4
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xqBa11K+t3yJo64JHPBL4xG7apvJbEXnUnLncnKDQMA=;
        b=NIt0T9RXfaESkCQkTRUHfIEMw/MB5myfMUFUQ/Y2gNALTg7EinJnNXNyK16+tSo7l0
         q1565/xhUhqsf0cajIPToAx6MHgRngWeI0aZdHURR4/sf4GPr/7D1//Rgrg+7JAlNQL2
         GY4oArBZEMNBLTjuSAaahPBvu18TUMOksSZ+iZYPWEPaPaNKQQkoNCxHGwfCZ/VT4W3t
         nIvM/kNubA0RyaWdxVtjaZLu/UxJrhCDKSBOMiAx9I/wUoNW+qZiPtKgBMMx5Ea/U+g/
         XB2WbVvTGzY92I4Lj3E2VsLIdiCQaLWoEmbEHhqZiI3vRDAv57qh9jH+L1m8u09kterk
         3ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xqBa11K+t3yJo64JHPBL4xG7apvJbEXnUnLncnKDQMA=;
        b=Q13BJU27BF/Kuv6nLqye4GmZ3/ReDtOGwJYo8/U0aidZ02Ix4+IdbbEKTZIPvYAEJy
         xh8LVBs15slbC5ARar5B2nY4hVodzc/60CVfDMNfwGylE3aY69slreiIgWYzEaZYfKLQ
         i7CozgfsAk7cIa7fHUr71MYhWJH3rVmvUm/CnxD8X0ZYRdWi6mrh8Kjw3UpdfFiQwuSF
         aqoUTFUB5mbD2hNseh4rA+IfbuLQcXVNJbN41t/Zd4qSQD5gGA3ct8QQHEiPgyz/oA47
         H7rLbyNNLCx+h9lpXh0QnUKcI0eQzicHyc4D2foarzOkNrxBQaanYIevN+f0jMGl7Q44
         ybmQ==
X-Gm-Message-State: AOAM5330dULR79658ctyjBDgO6pfS/MQd2sm6kNJUEHbyo6InbJvrQJc
        nIcRX+iBXnENA4K8fn86yKs=
X-Google-Smtp-Source: ABdhPJwNFRvBFgM9rN9qoxreJmFNMEl10dp5kOUd7xtpm2y6ZU4sHjL6q6qAwjXPZgOuzj0e8dK2lw==
X-Received: by 2002:a0c:e148:: with SMTP id c8mr7780071qvl.18.1616804290258;
        Fri, 26 Mar 2021 17:18:10 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z2sm8213531qkg.22.2021.03.26.17.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 17:18:09 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     gregkh@linuxfoundation.org, marcocesati@gmail.com,
        dan.carpenter@oracle.com, ross.schm.dev@gmail.com,
        fabioaiuto83@gmail.com, linux-staging@lists.linux.dev
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 1/6] staging: rtl8723bs: ieee80211: remove unused variable
Date:   Fri, 26 Mar 2021 18:17:31 -0600
Message-Id: <20210327001736.180881-1-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

sec_idx in rtw_get_sec_ie() is set to 0 and never changes value. Also,
it is only used for debugging messages. Therefore the variable is
removed and the debug messages are adjusted. Adjusting debug messages
forced style changes. Taking the opportunity to adjust indentation
of those sections of the code.

Removing this warning:

drivers/staging/rtl8723bs/core/rtw_ieee80211.c:657:15: warning: variable ‘sec_idx’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 43 +++++++++++--------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index cccbea555a32..ec065d924fbb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -654,7 +654,7 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
 {
-	u8 authmode, sec_idx, i;
+	u8 authmode, i;
 	u8 wpa_oui[4] = {0x0, 0x50, 0xf2, 0x01};
 	uint	cnt;
 
@@ -662,37 +662,44 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
-	sec_idx = 0;
-
 	while (cnt < in_len) {
 		authmode = in_ie[cnt];
 
 		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], &wpa_oui[0], 4))) {
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n rtw_get_wpa_ie: sec_idx =%d in_ie[cnt+1]+2 =%d\n", sec_idx, in_ie[cnt+1]+2));
+			RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
+				 ("\n rtw_get_wpa_ie: in_ie[cnt+1]+2 =%d\n", in_ie[cnt + 1] + 2));
 
-				if (wpa_ie) {
+			if (wpa_ie) {
 				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt+1]+2);
 
 				for (i = 0; i < (in_ie[cnt+1]+2); i = i+8) {
-						RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
-									wpa_ie[i], wpa_ie[i+1], wpa_ie[i+2], wpa_ie[i+3], wpa_ie[i+4],
-									wpa_ie[i+5], wpa_ie[i+6], wpa_ie[i+7]));
-					}
+					RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
+						 ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
+						  wpa_ie[i], wpa_ie[i + 1], wpa_ie[i + 2],
+						  wpa_ie[i + 3], wpa_ie[i + 4],
+						  wpa_ie[i + 5], wpa_ie[i + 6],
+						  wpa_ie[i + 7]));
 				}
+			}
 
-				*wpa_len = in_ie[cnt+1]+2;
-				cnt += in_ie[cnt+1]+2;  /* get next */
+			*wpa_len = in_ie[cnt + 1] + 2;
+			cnt += in_ie[cnt + 1] + 2;  /* get next */
 		} else {
 			if (authmode == WLAN_EID_RSN) {
-				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n get_rsn_ie: sec_idx =%d in_ie[cnt+1]+2 =%d\n", sec_idx, in_ie[cnt+1]+2));
+				RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
+					 ("\n get_rsn_ie: in_ie[cnt+1]+2 =%d\n",
+					  in_ie[cnt + 1] + 2));
 
 				if (rsn_ie) {
-				memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt+1]+2);
-
-				for (i = 0; i < (in_ie[cnt+1]+2); i = i+8) {
-						RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_, ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
-									rsn_ie[i], rsn_ie[i+1], rsn_ie[i+2], rsn_ie[i+3], rsn_ie[i+4],
-									rsn_ie[i+5], rsn_ie[i+6], rsn_ie[i+7]));
+					memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
+
+					for (i = 0; i < (in_ie[cnt + 1] + 2); i = i + 8) {
+						RT_TRACE(_module_rtl871x_mlme_c_, _drv_info_,
+							 ("\n %2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x\n",
+							  rsn_ie[i], rsn_ie[i + 1], rsn_ie[i + 2],
+							  rsn_ie[i + 3], rsn_ie[i + 4],
+							  rsn_ie[i + 5], rsn_ie[i + 6],
+							  rsn_ie[i + 7]));
 					}
 				}
 
-- 
2.30.2

