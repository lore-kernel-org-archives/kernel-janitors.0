Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B40EC433E6
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 14:47:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73DA464F62
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 14:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhCSOqj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Mar 2021 10:46:39 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43086 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhCSOqO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Mar 2021 10:46:14 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JEZt0e134892;
        Fri, 19 Mar 2021 14:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=7oEfdv+3/2yP0OxsSopJ7O49C2upcE4d3ElLL7Dz4dU=;
 b=FaiiJ/Yn1Yxa/kg1/8ZsU1pzJiTg+dz+DCodZBvle/IWoAIKtkPaY3g51E2OJIDTI21A
 V6kEdFfFUH+kSmZfd/IwSt3SAB7Hn5tMAfo32Cx0R9Ca/3jsFsOcFPr5/YJiVY+usvuF
 0pVTFUrsSE3rvNm8OeAubXnQdsAhKh1Fl7eg8ej05xgMsZYO/C4pmEN8zcHg3WxxpCwD
 F+vGexQTMCiCA86VIIgvDmUylOO0zY38dcoA0muDrckvQh1HdUWHyIMAV7GRV/5j6jAV
 6xp76MEEiKm1r0XQJe8nvyF+NgO7tUeI2SnWHdei7X3dWntvzTZ0w9TQRw+Y2tIog+X4 rQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 378p1p3744-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Mar 2021 14:46:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JEYr2U122407;
        Fri, 19 Mar 2021 14:46:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 3796yxj2qb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Mar 2021 14:46:09 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12JEk88Z021034;
        Fri, 19 Mar 2021 14:46:08 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 19 Mar 2021 07:46:08 -0700
Date:   Fri, 19 Mar 2021 17:46:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] Documentation: megaraid: fix spelling "consistend" =>
 "consistent"
Message-ID: <YFS5KV7ejNoZmt6H@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190106
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190106
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Change the spelling from "consistend" to "consistent".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 Documentation/scsi/ChangeLog.megaraid | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/scsi/ChangeLog.megaraid b/Documentation/scsi/ChangeLog.megaraid
index d2052fdbedd2..cbb329956897 100644
--- a/Documentation/scsi/ChangeLog.megaraid
+++ b/Documentation/scsi/ChangeLog.megaraid
@@ -220,7 +220,7 @@ Older Version	: 2.20.4.5 (scsi module), 2.20.2.5 (cmm module)
 
 4.	Use the pre defined DMA mask constants from dma-mapping.h
 	Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
-	pci_set_dma_mask() or pci_set_consistend_dma_mask(). See
+	pci_set_dma_mask() or pci_set_consistent_dma_mask(). See
 	http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for more
 	details.
 		Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>
-- 
2.30.1

