Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E926C47094
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:18:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 696EA61003
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhFGSUt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Jun 2021 14:20:49 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6492 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230291AbhFGSUs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 14:20:48 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157ICtYI025925;
        Mon, 7 Jun 2021 18:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=J6c/UpeBBUvx1KHKZ5MgtQjBE3sGsdX7w3eG7ihd214=;
 b=rBIOIy9LAUItOIQsKUmlvg9VvnNfrYMvsDZ+4ejz01ghwwa67LSBFNiyIaAaRWRG3cha
 22qCdXdE0OiQfQe+Kd2fKX7q/OcckBJYoPKVTU1D7IP2MtesfaCye0wkQIRyF1zRb9e0
 hZ5sTIO64St3aw/QQRa67ny8Ee4u6/lwg1nfcn/lKW4Z48fgY3e787oEZNkU57mEcavs
 B+a3EEp0lQcGzd//WIievdisdSa5ovG79Lt4TQIDsUE0yAwSqd9IakyMYmxrS0qtuYQe
 KQj6I3/pSM3cKQ1OkerKAQ2xv0hJBFMx7lVlken/fCecFXZ0QpLGgjhItGz+Rq6uIJFi 8g== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3917d4gb5s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:18:38 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157IHQe0084193;
        Mon, 7 Jun 2021 18:18:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38yxcu2v7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:18:37 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157IH0Ks083155;
        Mon, 7 Jun 2021 18:18:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 38yxcu2v7q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:18:36 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 157IIZAU011348;
        Mon, 7 Jun 2021 18:18:35 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Jun 2021 11:18:34 -0700
Date:   Mon, 7 Jun 2021 21:18:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        Romain Perier <romain.perier@gmail.com>,
        Allen Pais <apais@linux.microsoft.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH 6/7] staging: rtl8188eu: use safe iterator in
 rtl8188eu_xmitframe_complete()
Message-ID: <YL5i8W7BNla2DlrW@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5iX3Exc0HVYrsi@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: gan46adm_aMuI9zkeakQmjsH1ahojxCV
X-Proofpoint-GUID: gan46adm_aMuI9zkeakQmjsH1ahojxCV
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This loop calls rtw_free_xmitframe(pxmitpriv, pxmitframe) which removes
"pxmitframe" (our list iterator) from the list.  So to prevent a forever
loop we need to use a safe list iterator.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
index 10a8dcc6ca95..19055a1a92c1 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
@@ -414,6 +414,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
 				  struct xmit_priv *pxmitpriv)
 {
 	struct xmit_frame *pxmitframe = NULL;
+	struct xmit_frame *n;
 	struct xmit_frame *pfirstframe = NULL;
 	struct xmit_buf *pxmitbuf;
 
@@ -422,7 +423,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
 	struct sta_info *psta = NULL;
 	struct tx_servq *ptxservq = NULL;
 
-	struct list_head *xmitframe_plist = NULL, *xmitframe_phead = NULL;
+	struct list_head *xmitframe_phead = NULL;
 
 	u32 pbuf;	/*  next pkt address */
 	u32 pbuf_tail;	/*  last pkt tail */
@@ -507,10 +508,7 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
 	spin_lock_bh(&pxmitpriv->lock);
 
 	xmitframe_phead = get_list_head(&ptxservq->sta_pending);
-	list_for_each(xmitframe_plist, xmitframe_phead) {
-		pxmitframe = list_entry(xmitframe_plist, struct xmit_frame,
-					list);
-
+	list_for_each_entry_safe(pxmitframe, n, xmitframe_phead, list) {
 		pxmitframe->agg_num = 0; /*  not first frame of aggregation */
 		pxmitframe->pkt_offset = 0; /*  not first frame of aggregation, no need to reserve offset */
 
-- 
2.30.2

