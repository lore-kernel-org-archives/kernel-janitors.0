Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48A5C433B4
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 10:06:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F714613B9
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 10:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhELKHd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 May 2021 06:07:33 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:32874 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhELKHb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 May 2021 06:07:31 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14CA4OgY088822;
        Wed, 12 May 2021 10:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=TUVCWoa1zXQLuxeyVhTdKg4nXXAGy2jpInC/YT3pvL0=;
 b=OSNK8xd7Kc4mUT5ludoG42eIqfCqwToQGz333urOHiEvrdng5w7/VMtTR8Gpeht9yTWQ
 MhMgZF2nUzEJ6Hc0Vo3+G1ZlqpZlLBQoYR/Zz3FOv07s2PdMNf29ZYxhTD5Io6erhl84
 UjIk/L97IE0G5L+76OkcBfAaoGwUmUjkb7iDtEO+VOKKlo+K8PcvR4pvWQNRVRF/l/gm
 eC8sTL6vGRP6PSZBai+uH9R9b14AqvMolzmmXoAF1v2kRzSnZmic/F1gfyMyy2Dxm0H1
 qRo+aWdiFaO/HJI6dJDPjhC8mgnxJbRsj9iJrJTgxUtIkAF8hV40RaXZsoXLB5RnHbxy XQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 38e285grtf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 10:05:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14CA0jIF169140;
        Wed, 12 May 2021 10:05:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38djfb3y5v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 10:05:47 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14CA5k3f023405;
        Wed, 12 May 2021 10:05:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 38djfb3y4h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 10:05:46 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14CA5elP012428;
        Wed, 12 May 2021 10:05:40 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 12 May 2021 10:05:39 +0000
Date:   Wed, 12 May 2021 13:05:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     David Woodhouse <dwmw2@infradead.org>,
        Liu Yi L <yi.l.liu@intel.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Xin Zeng <xin.zeng@intel.com>,
        iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] iommu/vt-d: check for allocation failure in
 aux_detach_device()
Message-ID: <YJuobKuSn81dOPLd@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: _p5dl7WpoAFh5uxri3jLTQN2BMWbjrnc
X-Proofpoint-ORIG-GUID: _p5dl7WpoAFh5uxri3jLTQN2BMWbjrnc
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9981 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105120072
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In current kernels small allocations never fail, but checking for
allocation failure is the correct thing to do.

Fixes: 18abda7a2d55 ("iommu/vt-d: Fix general protection fault in aux_detach_device()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/iommu/intel/iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 708f430af1c4..9a7b79b5af18 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4606,6 +4606,8 @@ static int auxiliary_link_device(struct dmar_domain *domain,
 
 	if (!sinfo) {
 		sinfo = kzalloc(sizeof(*sinfo), GFP_ATOMIC);
+		if (!sinfo)
+			return -ENOMEM;
 		sinfo->domain = domain;
 		sinfo->pdev = dev;
 		list_add(&sinfo->link_phys, &info->subdevices);
-- 
2.30.2

