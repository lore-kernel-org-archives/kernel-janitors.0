Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2619C4332B
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 08:13:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE9E964F0B
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 08:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhCEINJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 Mar 2021 03:13:09 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:40752 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhCEINI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Mar 2021 03:13:08 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12585B3h065091;
        Fri, 5 Mar 2021 08:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=thJbeMQoSGAdNvh1/MCjpLoM4c4zEqtINa8N7nrM+eA=;
 b=h5AAj613kDkzssehxDBFqyYVa1Ef212bAwF3Xx5+hHYtebHiU+tM8yTk3wL9SZkYv86N
 6zS9gitLUadS/zmL1RrLcSmcKBUhLN8CC/zn76BweQKgKrYFzh3jKI8eKGaSl5zyMmep
 BF1t0ud00oVU1rlIYqrk1NKIxfV+hfeSUdq6II6Yf3ToDfsEr8rR7yG4iAJCzI24+AwL
 h3HIDvRwxteAEEi4HSLc/oVGLLMjL5scCBwpR/0Y0XSW163/CopiuUTGJJ4zvJbP5r0v
 3C1at/6cj5sG8S1C9a73k2Ddm1EomHXIiwOLC7pfAuS3im+s5wKPdyUEX6V5f/eQxb1M Yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 36yeqn9jqr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Mar 2021 08:13:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12585CnQ008640;
        Fri, 5 Mar 2021 08:12:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 370003q0mf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Mar 2021 08:12:59 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1258Cu7k024654;
        Fri, 5 Mar 2021 08:12:57 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 05 Mar 2021 00:12:56 -0800
Date:   Fri, 5 Mar 2021 11:12:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Straube <straube.linux@gmail.com>,
        Simone Serra <serrazimone@gmail.com>,
        Lourdes Pedrajas <lu@pplo.net>, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org, Lee Gibson <leegib@gmail.com>
Subject: [PATCH] staging: rtl8192u: fix ->ssid overflow in r8192_wx_set_scan()
Message-ID: <YEHoAWMOSZBUw91F@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050038
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050038
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We need to cap len at IW_ESSID_MAX_SIZE (32) to avoid memory corruption.
This can be controlled by the user via the ioctl.

Fixes: 5f53d8ca3d5d ("Staging: add rtl8192SU wireless usb driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8192u/r8192U_wx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_wx.c b/drivers/staging/rtl8192u/r8192U_wx.c
index 175bb8b15389..5211b2005763 100644
--- a/drivers/staging/rtl8192u/r8192U_wx.c
+++ b/drivers/staging/rtl8192u/r8192U_wx.c
@@ -331,8 +331,10 @@ static int r8192_wx_set_scan(struct net_device *dev, struct iw_request_info *a,
 		struct iw_scan_req *req = (struct iw_scan_req *)b;
 
 		if (req->essid_len) {
-			ieee->current_network.ssid_len = req->essid_len;
-			memcpy(ieee->current_network.ssid, req->essid, req->essid_len);
+			int len = min_t(int, req->essid_len, IW_ESSID_MAX_SIZE);
+
+			ieee->current_network.ssid_len = len;
+			memcpy(ieee->current_network.ssid, req->essid, len);
 		}
 	}
 
-- 
2.30.1

