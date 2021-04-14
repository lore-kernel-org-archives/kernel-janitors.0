Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377BCC433ED
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Apr 2021 06:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1404E61166
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Apr 2021 06:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348387AbhDNGCV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 14 Apr 2021 02:02:21 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:56338 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348322AbhDNGCR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Apr 2021 02:02:17 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13E601U7001576;
        Wed, 14 Apr 2021 06:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=gW4oiXh+iAqx96/tBx5seQYpdGC6Z5uSNUhdjgtyYSM=;
 b=Jn92ijpHWRkP/Tmh+YhG0dOsHiibrowU65xcSOVlwtBiJUQv68t8Oa/RN8IlZPhQCBV3
 21dcs2J0wpAHyBU3irU/KSapQVBjPOeuApfbvSAop5y58a42f2TydFjw9/+s4d4hi3LQ
 Xg9VbZAGHpmobhsyYv2OT9QBJ+VtgbppFvnuX9FZblh66VXHCsomO2ypKkPO6DF9b/ki
 Wnn43TlyX5LeeH8GkmWsjxs/kumlB0IDeuQcmf2okkmc0qt/a547NPQDzqm9xVFN4kdn
 qYuGIhcqJL4nJbTwL/1VnC5Sf6/FTndBTwzR/i8aUiClRlQJYbwX+VTovhqU4HDeV93+ HQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 37u3erh6a7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Apr 2021 06:01:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13E5xg9b079213;
        Wed, 14 Apr 2021 06:01:49 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 37unx0u380-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Apr 2021 06:01:49 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13E61jZV023364;
        Wed, 14 Apr 2021 06:01:46 GMT
Received: from mwanda (/10.175.166.128)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 14 Apr 2021 06:01:45 +0000
Date:   Wed, 14 Apr 2021 09:01:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Zhenyu Wang <zhenyuw@linux.intel.com>
Cc:     Zhi Wang <zhi.a.wang@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, fred gao <fred.gao@intel.com>,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: Fix error code in intel_gvt_init_device()
Message-ID: <YHaFQtk/DIVYK1u5@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140042
X-Proofpoint-ORIG-GUID: KDXb3uz4OhTYrQt0XDC12lC0qEL9fdcp
X-Proofpoint-GUID: KDXb3uz4OhTYrQt0XDC12lC0qEL9fdcp
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 clxscore=1011
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140042
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The intel_gvt_init_vgpu_type_groups() function is only called from
intel_gvt_init_device().  If it fails then the intel_gvt_init_device()
prints the error code and propagates it back again.  That's a bug
because false is zero/success.  The fix is to modify it to return zero
or negative error codes and make everything consistent.

Fixes: c5d71cb31723 ("drm/i915/gvt: Move vGPU type related code into gvt file")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/gvt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 2ecb8534930b..1deb253ffe80 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -126,7 +126,7 @@ static bool intel_get_gvt_attrs(struct attribute_group ***intel_vgpu_type_groups
 	return true;
 }
 
-static bool intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
+static int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
 {
 	int i, j;
 	struct intel_vgpu_type *type;
@@ -144,7 +144,7 @@ static bool intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
 		gvt_vgpu_type_groups[i] = group;
 	}
 
-	return true;
+	return 0;
 
 unwind:
 	for (j = 0; j < i; j++) {
@@ -152,7 +152,7 @@ static bool intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
 		kfree(group);
 	}
 
-	return false;
+	return -ENOMEM;
 }
 
 static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
@@ -373,7 +373,7 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 		goto out_clean_thread;
 
 	ret = intel_gvt_init_vgpu_type_groups(gvt);
-	if (ret == false) {
+	if (ret) {
 		gvt_err("failed to init vgpu type groups: %d\n", ret);
 		goto out_clean_types;
 	}
-- 
2.30.2

