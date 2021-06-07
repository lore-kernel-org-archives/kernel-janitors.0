Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAED8C47094
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93D2061105
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbhFGSUX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Jun 2021 14:20:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5894 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230261AbhFGSUU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 14:20:20 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157ICoWO024061;
        Mon, 7 Jun 2021 18:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=geobAZrbs5gGv1Y+0V+KYOoJ30pBYWIq1EmoA4jSfFk=;
 b=vFv5mDZgxhFOOmWSJQLLyQIsGQo9N/GkkFMsKVVu7WIbUvBPXu1uUIYFL7mX2O4Yvrhq
 DQZ6NDvpr1Ozf3FpsqDfNaGk7rz99GwnNvbeHlhS9zdd/hNinkEAFwCVM8fFhNeH3qf3
 RUQgQCoLaA1VHkOhGSLeCQVYWn7T6KSVurMwjgGGgyV+5rchuOCdXpNgNNPxKEmR7wlh
 Peh3JYEtZUzEYHNwEPyd8OOV8GotP0dpjUDWRuylcvNU8Th8wD3UqBdGAr9KkawdQPVR
 mxsHoaAFOXcGyMLW6ZPZ4829RhRLTV8kejXTz3RWrOjA8Ecj+7e1w2CfiGS3WcF0dwAf kA== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 391fyr0697-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:18:07 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157II6YS124379;
        Mon, 7 Jun 2021 18:18:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38yyaa9up6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:18:06 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157IGRhU120004;
        Mon, 7 Jun 2021 18:18:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 38yyaa9up3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:18:05 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 157II5Vl022401;
        Mon, 7 Jun 2021 18:18:05 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Jun 2021 11:18:04 -0700
Date:   Mon, 7 Jun 2021 21:17:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ivan Safonov <insafonov@gmail.com>,
        Martin Kaiser <martin@kaiser.cx>,
        Michael Straube <straube.linux@gmail.com>,
        Simon Fong <simon.fodin@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH 4/7] staging: rtl8188eu: use safe iterator in
 wakeup_sta_to_xmit()
Message-ID: <YL5i1ZAAAB4vSWef@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5iX3Exc0HVYrsi@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: PLI8IsntqXzmq0hultcEEYhDHpec0EeH
X-Proofpoint-GUID: PLI8IsntqXzmq0hultcEEYhDHpec0EeH
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These two loops call list_del_init() on the list iterator so they need to
use the _safe() iterator to prevent a forever loop.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8188eu/core/rtw_xmit.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
index f57e41f817ca..d5489811c5bc 100644
--- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
+++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
@@ -1796,17 +1796,14 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 {
 	u8 update_mask = 0, wmmps_ac = 0;
 	struct sta_info *psta_bmc;
-	struct list_head *xmitframe_plist, *xmitframe_phead;
-	struct xmit_frame *pxmitframe = NULL;
+	struct list_head *xmitframe_phead;
+	struct xmit_frame *pxmitframe, *n;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
 	spin_lock_bh(&psta->sleep_q.lock);
 
 	xmitframe_phead = get_list_head(&psta->sleep_q);
-	list_for_each(xmitframe_plist, xmitframe_phead) {
-		pxmitframe = list_entry(xmitframe_plist, struct xmit_frame,
-					list);
-
+	list_for_each_entry_safe(pxmitframe, n, xmitframe_phead, list) {
 		list_del_init(&pxmitframe->list);
 
 		switch (pxmitframe->attrib.priority) {
@@ -1881,10 +1878,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 		spin_lock_bh(&psta_bmc->sleep_q.lock);
 
 		xmitframe_phead = get_list_head(&psta_bmc->sleep_q);
-		list_for_each(xmitframe_plist, xmitframe_phead) {
-			pxmitframe = list_entry(xmitframe_plist,
-						struct xmit_frame, list);
-
+		list_for_each_entry_safe(pxmitframe, n, xmitframe_phead, list) {
 			list_del_init(&pxmitframe->list);
 
 			psta_bmc->sleepq_len--;
-- 
2.30.2

