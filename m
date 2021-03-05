Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798A2C433E0
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 08:59:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 461E364EDF
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 08:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbhCEI6j (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 Mar 2021 03:58:39 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:53918 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhCEI6Y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Mar 2021 03:58:24 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1258tjB2076918;
        Fri, 5 Mar 2021 08:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=nJ6xyN7tTx6zu1Wf8tmSZj7awmOmSqHSXODxHLNJySc=;
 b=eZuIxe0D8sdt0UpyK97q/cMkVZVftXmdlpRgN/aoQ66CyzZeNChy/luZP3oPFgdByRCr
 tlfMgHSrlNQLbwkZS7ZpOACfS1UZYLEKsTRoa96+c3xUBB7aTH+bS4dEIjoprmz+hqQ7
 9TBf33jJ/O+z6x63d5CY0a5YPmBAGUTkofWw1dX7iMirqNcXLso78rq4cZMOaSDq8IUQ
 zHYkWXhlpU+dqnu3JUJ3ZqMuIifnjd0CG89SUAjKjcfZ2WmSdI8/4Z3UGwiYcp20Bx/j
 d21esqzWAgFeMBrewoIHW282Js2CEC9UQkDxe/ItMu/uOVg2CgLO2MbmZ/mxxlI8wL+0 GA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 371hhcb3y0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Mar 2021 08:58:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1258pDkw185665;
        Fri, 5 Mar 2021 08:58:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 370003r6mb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Mar 2021 08:58:13 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1258wC58022487;
        Fri, 5 Mar 2021 08:58:12 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 05 Mar 2021 00:58:11 -0800
Date:   Fri, 5 Mar 2021 11:58:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        Ivan Safonov <insafonov@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Takashi Iwai <tiwai@suse.de>, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: prevent ->ssid overflow in
 rtw_wx_set_scan()
Message-ID: <YEHymwsnHewzoam7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050043
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050043
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code has a check to prevent read overflow but it needs another
check to prevent writing beyond the end of the ->ssid[] array.

Fixes: a2c60d42d97c ("staging: r8188eu: Add files for new driver - part 16")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8188eu/os_dep/ioctl_linux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
index bf22f130d3e1..58954b88a817 100644
--- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
@@ -1133,9 +1133,11 @@ static int rtw_wx_set_scan(struct net_device *dev, struct iw_request_info *a,
 						break;
 					}
 					sec_len = *(pos++); len -= 1;
-					if (sec_len > 0 && sec_len <= len) {
+					if (sec_len > 0 &&
+					    sec_len <= len &&
+					    sec_len <= 32) {
 						ssid[ssid_index].ssid_length = sec_len;
-						memcpy(ssid[ssid_index].ssid, pos, ssid[ssid_index].ssid_length);
+						memcpy(ssid[ssid_index].ssid, pos, sec_len);
 						ssid_index++;
 					}
 					pos += sec_len;
-- 
2.30.1

