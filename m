Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C407C48BDF
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 19:03:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E84DD61107
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 19:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbhFVTFn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 15:05:43 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45608 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232635AbhFVTFm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 15:05:42 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MIpQDM015915;
        Tue, 22 Jun 2021 19:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=XuDbtntb4B1H+ct1L+3W3aLq81DM4s8XBhmmMvMJSBU=;
 b=I4gUDbSdGWxQbmVz8zt7UgjEc2ABMbz1r+kItngJzSJWXGnfeo7ffXB905TMEatY63it
 UIfJZMwSFXhSuKCsJm8dlmfccNTaynZIsWadY3QrnEKuwiPk3ZmPCtJFBLNDPUzHW3MO
 e4aEIDp0lbAvvzMBECxewtCICaOVjgXR7S7WIqYHNTxtGx7lEPh0eoooZltul3OsOhjI
 Pe9RYFMi5TvCvChN4aFMlUkLqeeXXsylfmYvrGoUpmvFiOO+FpLbrAyNGJpXAaZtUaFZ
 Q+y9vzcgRK+e3v4B9pdyO/TyVBWpsFXAhIVAF+0fBpTzuQ0Ut1BAp9Lu+CpR0Ogm9u1B Bg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 39as86ur6x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 19:03:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15MIpRRU190295;
        Tue, 22 Jun 2021 19:03:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 3998d7xhfw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 19:03:09 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15MJ30SH034073;
        Tue, 22 Jun 2021 19:03:09 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 3998d7xhf4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 19:03:09 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15MJ36UJ032204;
        Tue, 22 Jun 2021 19:03:06 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 22 Jun 2021 12:03:06 -0700
Date:   Tue, 22 Jun 2021 22:03:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Alistair Popple <apopple@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] mm/rmap: fix signedness bug in make_device_exclusive_range()
Message-ID: <YNIz5NVnZ5GiZ3u1@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: jdHkRmqOmiF1sAW5D8WZXwgl5SZdej6p
X-Proofpoint-GUID: jdHkRmqOmiF1sAW5D8WZXwgl5SZdej6p
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The get_user_pages_remote() function returns a long type, but we are
using "unsigned long i;" as the list iterator.  If "npages" is -ENOMEM,
the comparison "i < npages" is type promoted and "npages" becomes a very
high positive value.  The loop will then iterate until the kernel
crashes.

There are two ways to fix this.  Declare "i" as a long type or add an
explicit check for get_user_pages_remote() error returns.  Either
approach will work so let's do both.

Fixes: fa1e686e5f53 ("mm: device exclusive memory access")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 mm/rmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index e5210dde0c4d..fb5c59b95826 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2187,11 +2187,14 @@ int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
 				void *owner)
 {
 	long npages = (end - start) >> PAGE_SHIFT;
-	unsigned long i;
+	long i;
 
 	npages = get_user_pages_remote(mm, start, npages,
 				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
 				       pages, NULL, NULL);
+	if (npages < 0)
+		return npages;
+
 	for (i = 0; i < npages; i++, start += PAGE_SIZE) {
 		if (!trylock_page(pages[i])) {
 			put_page(pages[i]);
-- 
2.30.2

