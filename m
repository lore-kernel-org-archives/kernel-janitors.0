Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7404C47096
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Jun 2021 12:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BF3261242
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Jun 2021 12:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhFCMhP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 3 Jun 2021 08:37:15 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45586 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbhFCMhP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Jun 2021 08:37:15 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 153CU84S018983;
        Thu, 3 Jun 2021 12:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=7YYlwYQghMPQ5VcvVwzn3a1GY+ZK8stZyV1/KnbW7kA=;
 b=sINnHuHWf0Ba0tj/x7wzWd1wn870tGyEHS7H9TmL9kxPnx3X/5zRCOuy6GngpoRBr34v
 NmCX4yH0FYMbA7SAPG646A6qKFxG9Ab3FOdoW5USQLy+cneHyWUObGXHQFQU5Dw1GT/L
 eEox9m1fWru3yKyefv6ft+k7Vv6J4+W0j4a4fvMlqG0qj+yEvMz6hKQvE/MCHncgQeAK
 P+9UE9e6zc1VjgV4may9Gmy1tCvf2LzvKXixPOHoT9l8OliUaikhQCMsrRW2dWhUbfPc
 xvFxiBt4LWjY8UjNuj58rD9kLSjWTwilpwLoKeVWAgC84mRytjyig+HDSOb8b/YAitku 7A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 38ud1sk734-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Jun 2021 12:34:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 153CUodu146314;
        Thu, 3 Jun 2021 12:34:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38ubneu0a6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Jun 2021 12:34:18 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 153CYH5r151945;
        Thu, 3 Jun 2021 12:34:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 38ubneu09y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Jun 2021 12:34:17 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 153CYHuQ005634;
        Thu, 3 Jun 2021 12:34:17 GMT
Received: from mwanda (/10.175.206.145)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Jun 2021 05:34:16 -0700
Date:   Thu, 3 Jun 2021 15:34:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Marc Dionne <marc.dionne@auristor.com>,
        linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] afs: Fix an IS_ERR() vs NULL check
Message-ID: <YLjMRKX40pTrJvgf@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: uN86AkJlawDhgicIXXzHr9OMnGmGxGPW
X-Proofpoint-GUID: uN86AkJlawDhgicIXXzHr9OMnGmGxGPW
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10003 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1011 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106030085
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The proc_symlink() function returns NULL on error, it doesn't return
error pointers.

Fixes: 5b86d4ff5dce ("afs: Implement network namespacing")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/afs/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/afs/main.c b/fs/afs/main.c
index b2975256dadb..179004b15566 100644
--- a/fs/afs/main.c
+++ b/fs/afs/main.c
@@ -203,8 +203,8 @@ static int __init afs_init(void)
 		goto error_fs;
 
 	afs_proc_symlink = proc_symlink("fs/afs", NULL, "../self/net/afs");
-	if (IS_ERR(afs_proc_symlink)) {
-		ret = PTR_ERR(afs_proc_symlink);
+	if (!afs_proc_symlink) {
+		ret = -ENOMEM;
 		goto error_proc;
 	}
 
-- 
2.30.2

