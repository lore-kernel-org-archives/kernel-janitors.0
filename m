Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B74C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 14:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C59361457
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 14:27:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbhENO3H (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 May 2021 10:29:07 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:37344 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234393AbhENO3E (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 May 2021 10:29:04 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14EEOQTp126175;
        Fri, 14 May 2021 14:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=xoGMcMduUxbkEKICEOxnEMCQqvsCuv5m2wxRFwEknrE=;
 b=jB75CIxTXHKAV9h/I3HrdNMhgAZmhafRKC75P7KZaYz33tRV85ASBFWEmJqSiZTeGwxW
 v+oW1Qyhcu9W4LZvxTJMVU41g7/xCZW567tp46LnQguXhzTCfklwBXLXoPvWV4LqRY5C
 AeGxS8bCh9esgJPSSrRVKcNVMdUOtr5Fj37t0qPznq8aYhex1smbNJqbNk4Dm2oFlkrR
 +jbhyheXA6eLFNwQSwjb6TL52tUOPP5M9wNSOyzDDjPstAA8LjxJilbIzQQ9rbrdKlFd
 uvoX+LctnIZC5G8jK+/WBc11JvmPY2TycgyiLikLQ81+GEyTK/WYTtXidIGvLa3aBfWi Zw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 38gpndcg67-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 14:27:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14EEOsVD167793;
        Fri, 14 May 2021 14:27:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38gppecqpn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 14:27:30 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14EERUlk194103;
        Fri, 14 May 2021 14:27:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 38gppecqmb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 14:27:30 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14EERMX1000849;
        Fri, 14 May 2021 14:27:24 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 14 May 2021 14:27:21 +0000
Date:   Fri, 14 May 2021 17:27:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Michael Walle <michael@walle.cc>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: core: Potential NULL dereference in mtd_otp_size()
Message-ID: <YJ6Iw3iNvGycAWV6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: iXhTkydWML_4O-1CgPpjGH9HkquPLdT3
X-Proofpoint-GUID: iXhTkydWML_4O-1CgPpjGH9HkquPLdT3
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105140117
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If kmalloc() fails then it could lead to a NULL dereference.  Check and
return -ENOMEM on error.

Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/mtdcore.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 3ae261661eea..9624ad1b999c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -779,12 +779,16 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 
 static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
 {
-	struct otp_info *info = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	struct otp_info *info;
 	ssize_t size = 0;
 	unsigned int i;
 	size_t retlen;
 	int ret;
 
+	info = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
 	if (is_user)
 		ret = mtd_get_user_prot_info(mtd, PAGE_SIZE, &retlen, info);
 	else
-- 
2.30.2

