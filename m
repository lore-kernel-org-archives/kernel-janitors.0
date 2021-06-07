Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9604EC47082
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:19:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 705EE6100B
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhFGSVX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Jun 2021 14:21:23 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:47494 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230333AbhFGSVX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 14:21:23 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157IDMJr026305;
        Mon, 7 Jun 2021 18:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=xiR52V3Mq/2WCGtcmtaBE3Sj1NMK9JU3jZeVZwj00X0=;
 b=xhQDzCxRKC2ZPToHAcQNufbKJeq/gkylSdysbYPKU7zLzNqp+k8Tu+RLqqZ0yTMfIQbA
 QlqFQY7D13kuknoUtHBo7Bfgog8x1SlYQZAY6hF05HzBN+Uaq0dE8aAWrskyF3xHB5XV
 OaZvmNu60JSFd9fUjkuW84hFUqffLJPAFeCBPuTIpccoLJDrJxoQSxlgyR6ix89Buwbt
 cte4E6cCdyEVpiD8GyDZzgt73BU3tjffrK8fyWobpw16DgaSJf0oX8gcsWGR/6i8U2qk
 rMHJoj2UZRWWS8brXG30cRGJpRbi+uQwBNp4CnusdrO8yvCk6YEP09CPSHT7h/tAoNvX /g== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3917d4gb5x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:19:13 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157IJCWg087419;
        Mon, 7 Jun 2021 18:19:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38yxcu2vjm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:19:12 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157IH0Ts083154;
        Mon, 7 Jun 2021 18:19:11 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 38yxcu2vje-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:19:11 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 157IJAvU013594;
        Mon, 7 Jun 2021 18:19:10 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Jun 2021 11:19:09 -0700
Date:   Mon, 7 Jun 2021 21:19:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Straube <straube.linux@gmail.com>,
        Romain Perier <romain.perier@gmail.com>,
        Allen Pais <apais@linux.microsoft.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH 7/7] staging: rtl8188eu: delete some dead code
Message-ID: <YL5jFF9ldj0W9P1f@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5iX3Exc0HVYrsi@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: uWluOgmtUiXm3ftcNuXl63c3Q5moiJkP
X-Proofpoint-GUID: uWluOgmtUiXm3ftcNuXl63c3Q5moiJkP
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Calling rtw_free_xmitframe() with a NULL "pxmitframe" parameter is a
no-op.  It appears that originally this code was part of a loop but it
was already dead code by the time that the driver was merged into the
kernel.

Fixes: 7bc88639ad36 ("staging: r8188eu: Add files for new driver - part 17")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
index 19055a1a92c1..d82dd22f2903 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
@@ -413,8 +413,7 @@ static u32 xmitframe_need_length(struct xmit_frame *pxmitframe)
 bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
 				  struct xmit_priv *pxmitpriv)
 {
-	struct xmit_frame *pxmitframe = NULL;
-	struct xmit_frame *n;
+	struct xmit_frame *pxmitframe, *n;
 	struct xmit_frame *pfirstframe = NULL;
 	struct xmit_buf *pxmitbuf;
 
@@ -443,8 +442,6 @@ bool rtl8188eu_xmitframe_complete(struct adapter *adapt,
 		return false;
 
 	/* 3 1. pick up first frame */
-	rtw_free_xmitframe(pxmitpriv, pxmitframe);
-
 	pxmitframe = rtw_dequeue_xframe(pxmitpriv, pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
 	if (!pxmitframe) {
 		/*  no more xmit frame, release xmit buffer */
-- 
2.30.2

