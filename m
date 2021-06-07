Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B75C47082
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08F2B61105
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhFGSTk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Jun 2021 14:19:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18244 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230212AbhFGSTk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 14:19:40 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157IEA7c024391;
        Mon, 7 Jun 2021 18:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=jPMwfFssVN4mA7NACrxla8ZH6yc9eP5QqfQ8lLfdPKU=;
 b=FT3OhtQgUIAqpdqEdgthciKZKENky9NbCxUOc/eH57Dm3dHqog0wcXMGVlVTW/nHi8+J
 JHx0Z53uq7MGpFSaR9QmAq01lqHnn+dkfHtgyvxSKHpLpeg1YDpyWOMqAWdpUh1LTRcC
 GOdAXZ8zH07QUChD7N+/BwyImGcx6vllb2jlKfvmsnyPyavEvf3RBGeMJriAOr3vJ7FU
 5ZPD7BNYO6z+dsqH6zcJmEsQU40f3gE7yH0DfKY11PHLL52VdZvK/eLAlCvcKmuF+Jo3
 yKXu6uYE6+shoDI8Vb2RFv7hBdR8l94uvwDei3RtfZEi3xVvSvEh5Ta/JLV6a9ydFmBw nQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 391g4g866a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:17:27 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157IHQdx084193;
        Mon, 7 Jun 2021 18:17:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38yxcu2udv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:17:26 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157ICHQ9068160;
        Mon, 7 Jun 2021 18:17:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 38yxcu2udh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:17:25 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 157IHNqN021871;
        Mon, 7 Jun 2021 18:17:23 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Jun 2021 11:17:23 -0700
Date:   Mon, 7 Jun 2021 21:17:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Kaiser <martin@kaiser.cx>,
        Ivan Safonov <insafonov@gmail.com>,
        Paul McQuade <paulmcquad@gmail.com>,
        Michael Straube <straube.linux@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/7] staging: rtl8188eu: use safe iterator in stop_ap_mode()
Message-ID: <YL5ip4yz9NEB9RZO@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5iX3Exc0HVYrsi@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: o0FDd9VCLVVtR8rDHqbT16B9CL6wNnkt
X-Proofpoint-ORIG-GUID: o0FDd9VCLVVtR8rDHqbT16B9CL6wNnkt
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This loop calls list_del_init() on the list iterator so it can result
in a forever loop.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8188eu/core/rtw_ap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
index bbecb07274f6..9399c17bfdbf 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ap.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
@@ -1688,8 +1688,7 @@ void start_ap_mode(struct adapter *padapter)
 
 void stop_ap_mode(struct adapter *padapter)
 {
-	struct list_head *phead, *plist;
-	struct rtw_wlan_acl_node *paclnode;
+	struct rtw_wlan_acl_node *paclnode, *n;
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -1709,10 +1708,7 @@ void stop_ap_mode(struct adapter *padapter)
 
 	/* for ACL */
 	spin_lock_bh(&pacl_node_q->lock);
-	phead = get_list_head(pacl_node_q);
-	list_for_each(plist, phead) {
-		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
-
+	list_for_each_entry_safe(paclnode, n, &pacl_node_q->queue, list) {
 		if (paclnode->valid) {
 			paclnode->valid = false;
 
-- 
2.30.2

