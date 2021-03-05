Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B88C433E0
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 08:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 448C764FFD
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 08:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhCEI5A (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 Mar 2021 03:57:00 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:36606 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhCEI4t (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Mar 2021 03:56:49 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1258u5kP141273;
        Fri, 5 Mar 2021 08:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=7XiaahJ3RtGt4i/nE+AUYMoGT8mHUC8BTFrb5jgsQ8A=;
 b=ExQEiIjLFa0UnMZlCL2BEzAq4svoZ6mlaQohtcQhOEqhgdo1sRaTEzjOZYE4xUkQDDYZ
 IrqiL+HYEgyF3/uBlayETjVaEvn6uh4t1VIov76MX6cOWiqhB3WbySMGO4k7VXKQh6kZ
 pk/xYdzAMZbOIYpPsUfw9yUd83KjS48vTIqxsfj8iknT3cK1+ArFhm9WNwwLq7+8EAzP
 dR2pOHX0Rq8k/4HdpREa5DaO72PXl9q6xZdi5DqX3YvNlaGR55jtHG/pRahdGLtHKAcH
 cxZjhpQvvSJZTC+JEG8ZnbvvRMde9TgMM0IWAyCcaFInHny+QZsWj1k0D0esbpuQGyY/ qw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 36yeqn9p6w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Mar 2021 08:56:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1258pBBK183509;
        Fri, 5 Mar 2021 08:56:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 36yynt07j9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Mar 2021 08:56:41 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1258uefc027025;
        Fri, 5 Mar 2021 08:56:40 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 05 Mar 2021 00:56:39 -0800
Date:   Fri, 5 Mar 2021 11:56:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Soumyajit Deb <debsoumyajit100@gmail.com>,
        Ivan Safonov <insafonov@gmail.com>,
        Michael Straube <straube.linux@gmail.com>,
        devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: fix potential memory corruption in
 rtw_check_beacon_data()
Message-ID: <YEHyQCrFZKTXyT7J@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103050043
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050043
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "ie_len" is a value in the 1-255 range that comes from the user.  We
have to cap it to ensure that it's not too large or it could lead to
memory corruption.

Fixes: 9a7fe54ddc3a ("staging: r8188eu: Add source files for new driver - part 1")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8188eu/core/rtw_ap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
index fa1e34a0d456..182bb944c9b3 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ap.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
@@ -791,6 +791,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_SSID, &ie_len,
 		       pbss_network->ie_length - _BEACON_IE_OFFSET_);
 	if (p && ie_len > 0) {
+		ie_len = min_t(int, ie_len, sizeof(pbss_network->ssid.ssid));
 		memset(&pbss_network->ssid, 0, sizeof(struct ndis_802_11_ssid));
 		memcpy(pbss_network->ssid.ssid, p + 2, ie_len);
 		pbss_network->ssid.ssid_length = ie_len;
@@ -811,6 +812,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_SUPP_RATES, &ie_len,
 		       pbss_network->ie_length - _BEACON_IE_OFFSET_);
 	if (p) {
+		ie_len = min_t(int, ie_len, NDIS_802_11_LENGTH_RATES_EX);
 		memcpy(supportRate, p + 2, ie_len);
 		supportRateNum = ie_len;
 	}
@@ -819,6 +821,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_EXT_SUPP_RATES,
 		       &ie_len, pbss_network->ie_length - _BEACON_IE_OFFSET_);
 	if (p) {
+		ie_len = min_t(int, ie_len,
+			       NDIS_802_11_LENGTH_RATES_EX - supportRateNum);
 		memcpy(supportRate + supportRateNum, p + 2, ie_len);
 		supportRateNum += ie_len;
 	}
@@ -934,6 +938,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		pht_cap->mcs.rx_mask[0] = 0xff;
 		pht_cap->mcs.rx_mask[1] = 0x0;
+		ie_len = min_t(int, ie_len, sizeof(pmlmepriv->htpriv.ht_cap));
 		memcpy(&pmlmepriv->htpriv.ht_cap, p + 2, ie_len);
 	}
 
-- 
2.30.1

