Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDAFC47082
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:18:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5FD161105
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 18:18:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbhFGSUn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Jun 2021 14:20:43 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37886 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230255AbhFGSUm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 14:20:42 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157IDVjP025366;
        Mon, 7 Jun 2021 18:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=oLGoP8ziTVt1WPlw8lhgLupUbBvskyV5UgRR1x/0aL8=;
 b=IbYyMjqlgwfDjy+UpnEVszz8qX3gCIH5ZxMkaQ6VljVYbLyG2GAauZc8Bw7lF/BLxm68
 vf62YTFmKoF98/cRvWGixmmZZFCkC0jJV5leggVkfPu4GvirhYqv7JWruoOmQwRy5037
 oI3TR5EqpnpZBNx/NGiHDvgfs8V2Pip6PWA9q/sLlHdri8nbYzllQ00aA5fngiB6/Coi
 Ih6JpkXsgFAQZfX+ifva/HRwjtLqKPiFHKw2JLvlsyKtVfolzgWF+/cVPKoExdmUoNk/
 1O+UarCy5T2SgYqCS9pwR2U4ip+kpH06lXT0vJJBDw8vV30DIPN2Dhph+JEKTIn5fWTW uw== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 391fyr0698-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:18:27 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157IBEX5101883;
        Mon, 7 Jun 2021 18:18:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 390k1qahfn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:18:25 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157IF7IK115846;
        Mon, 7 Jun 2021 18:18:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 390k1qaher-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:18:25 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 157IIO6P022679;
        Mon, 7 Jun 2021 18:18:24 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Jun 2021 11:18:23 -0700
Date:   Mon, 7 Jun 2021 21:18:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Kaiser <martin@kaiser.cx>,
        Ivan Safonov <insafonov@gmail.com>,
        Simon Fong <simon.fodin@gmail.com>,
        Michael Straube <straube.linux@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH 5/7] staging: rtl8188eu: use safe iterator in
 xmit_delivery_enabled_frames()
Message-ID: <YL5i5aVMQ3CZ5wuQ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5iX3Exc0HVYrsi@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: bCxgMs9W9oKWEZBl0hLQR5oMfppLvifZ
X-Proofpoint-GUID: bCxgMs9W9oKWEZBl0hLQR5oMfppLvifZ
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This loop calls list_del_init(&pxmitframe->list) and "pxmitframe" is the
list iterator so it leads to a forever loop.  We need to use a _safe()
iterator to fix this.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8188eu/core/rtw_xmit.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
index d5489811c5bc..718dd20ff36c 100644
--- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
+++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
@@ -1912,17 +1912,14 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 void xmit_delivery_enabled_frames(struct adapter *padapter, struct sta_info *psta)
 {
 	u8 wmmps_ac = 0;
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
 		switch (pxmitframe->attrib.priority) {
 		case 1:
 		case 2:
-- 
2.30.2

