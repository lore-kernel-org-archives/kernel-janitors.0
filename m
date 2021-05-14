Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167B1C433ED
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 14:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E123D6144B
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 14:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234300AbhENO2g (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 May 2021 10:28:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59052 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234316AbhENO2c (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 May 2021 10:28:32 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14EELgSU006520;
        Fri, 14 May 2021 14:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ONhVRREsn6oqt9dN72snlFy0pQ56k4DOdsN5R+1wTKU=;
 b=N51ufwBf+eMqcLu/TWN9eZQiiRZ+f0ko8hBCVOpqm/vaROFwQqHC1Klwo/ABv1sfqwQS
 a6rpTTTbguIaQ2/dd7UuUnothsSzaycA5st6qJ4nh+5asqWw/G+Ph/zfK+hr3xgpeD1n
 yEGouiI5w540V0Tnqz9oU1hVIjHPHgNt8WeDzbPlvekWUK5M5HXk+xuGIbNc+loEbTg/
 FLXQbK9zGKc615/TnZP/bnMiUo6a10jyiHX+vRJ1Zq7+g8m1vCXGQM+ZUoqPMiOiX+LD
 RdhMp6AnwOKfUYCr5Q9FAS3p6WsIyeyo00Xk87HroNed5/E4O6foX8YC73nZ+rdlIm77 MA== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 38gpphrq46-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 14:27:04 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14EER4M2189914;
        Fri, 14 May 2021 14:27:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38gppecp9t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 14:27:04 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14EER3om189800;
        Fri, 14 May 2021 14:27:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 38gppecp7u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 14:27:03 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14EEQxGG000573;
        Fri, 14 May 2021 14:26:59 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 14 May 2021 07:26:59 -0700
Date:   Fri, 14 May 2021 17:26:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8712: fix the bssid in mp_start_test()
Message-ID: <YJ6IrfkbdaTHgpEv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: QAUX8gAMHEibZYx957NOp8RECIqqGndT
X-Proofpoint-GUID: QAUX8gAMHEibZYx957NOp8RECIqqGndT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We recently moved "bssid" off the stack, and allocated it with kmalloc()
instead.  Unfortunately, this one line was overlooked so it will copy
random data into the &tgt_network->network instead of the data we want.

Fixes: 0b18e5fe6008 ("staging: rtl8712: rtl871x_mp_ioctl: Move a large data struct onto the heap")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8712/rtl871x_mp_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mp_ioctl.c b/drivers/staging/rtl8712/rtl871x_mp_ioctl.c
index adbeb46770d7..26fa09b45c90 100644
--- a/drivers/staging/rtl8712/rtl871x_mp_ioctl.c
+++ b/drivers/staging/rtl8712/rtl871x_mp_ioctl.c
@@ -197,7 +197,7 @@ static int mp_start_test(struct _adapter *padapter)
 	/* 3 3. join pseudo AdHoc */
 	tgt_network->join_res = 1;
 	tgt_network->aid = psta->aid = 1;
-	memcpy(&tgt_network->network, &bssid, length);
+	memcpy(&tgt_network->network, bssid, length);
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 	r8712_os_indicate_connect(padapter);
 	/* Set to LINKED STATE for MP TRX Testing */
-- 
2.30.2

