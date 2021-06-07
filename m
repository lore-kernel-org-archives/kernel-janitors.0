Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D000C47082
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75CE761003
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhFGSTx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Jun 2021 14:19:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33952 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230212AbhFGSTw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 14:19:52 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157IC11Z022654;
        Mon, 7 Jun 2021 18:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=8gavyXVn8ZN3eYSKoYj9s6z0nX8kX834/ZSgK8awUYU=;
 b=hltuRuG7NUTEk9IPlgVZA8lrqUs5loqax8KS5iwslBIGC+CZRRQl0bS/IWnKMcT3IW2Z
 87qDkCG8mUrpKPjQ+vMCm9Y3TX7TAjlQ0BqJ52CczJaO77x+s4FDRA33A+GUs16OTUGR
 AVqAwaTgUhsvfO5udmm9bIhnYpGjL1zN6DQICkRxnh6VXRtADB2PF+LLAGWJhhALSQBp
 m6xMYLbnr0PRj2mJ2GAwvs2z+0mZ+PiNrI0s3bR9Gkx5a3NOUWrz7QzUk9vkPHNR2VG2
 3oPLHpLv35JYdRlUUn19wLniU6VxoZaBhNxDC23vERCcE3x4R9wj7jGacPbfCtTv/kTd 2g== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 391g4g866c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:17:42 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157IHflL084502;
        Mon, 7 Jun 2021 18:17:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38yxcu2ujm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:17:41 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157IGANZ082111;
        Mon, 7 Jun 2021 18:17:40 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 38yxcu2uj6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:17:40 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 157IHdb7022002;
        Mon, 7 Jun 2021 18:17:39 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Jun 2021 11:17:38 -0700
Date:   Mon, 7 Jun 2021 21:17:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ivan Safonov <insafonov@gmail.com>,
        Michael Straube <straube.linux@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Peilin Ye <yepeilin.cs@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/7] staging: rtl8188eu: use safe iterator in tx_beacon_hdl()
Message-ID: <YL5iunD5ilf+mKPR@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5iX3Exc0HVYrsi@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: VSvwddVPYtjzg5b7Vim5DUCQ86Hr_Yu-
X-Proofpoint-ORIG-GUID: VSvwddVPYtjzg5b7Vim5DUCQ86Hr_Yu-
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This loop calls list_del_init() on the list iterator so it has to use
the _safe() iterator or it leads to an endless loop.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
index b4d81d3a856c..42cfa1e95e2c 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
@@ -5378,8 +5378,8 @@ u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf)
 #ifdef CONFIG_88EU_AP_MODE
 	else { /* tx bc/mc frames after update TIM */
 		struct sta_info *psta_bmc;
-		struct list_head *xmitframe_plist, *xmitframe_phead;
-		struct xmit_frame *pxmitframe = NULL;
+		struct list_head *xmitframe_phead;
+		struct xmit_frame *pxmitframe, *n;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
 		/* for BC/MC Frames */
@@ -5392,11 +5392,8 @@ u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf)
 			spin_lock_bh(&psta_bmc->sleep_q.lock);
 
 			xmitframe_phead = get_list_head(&psta_bmc->sleep_q);
-			list_for_each(xmitframe_plist, xmitframe_phead) {
-				pxmitframe = list_entry(xmitframe_plist,
-							struct xmit_frame,
-							list);
-
+			list_for_each_entry_safe(pxmitframe, n, xmitframe_phead,
+						 list) {
 				list_del_init(&pxmitframe->list);
 
 				psta_bmc->sleepq_len--;
-- 
2.30.2

