Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC34C48BE5
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 13:12:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 381BB61554
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 13:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhFONOl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Jun 2021 09:14:41 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:58904 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbhFONOk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Jun 2021 09:14:40 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15FDAC8Q075541;
        Tue, 15 Jun 2021 13:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=qLiokJ1tzVb9+rR7CMgRGqAj4ViwhanH3KxArF77KFI=;
 b=eh2DifBx061/KQ681zuyL54cqJtXAx1FhDjD/6GlKkYx/S2AKNb7O3sw6P22BhoOiTwC
 7LijEAhG3pYD50pGN4+wt/mTD227Voi4sBO5V2bFK9BZDyxtg+jeXE3rzygJe2T2s8iR
 NLvnY1igZIM03sKRPoeZIi8+Ew5f9YGjEkW7RabDy4c9UPxkxQWJgPqtLonP2gFOeCe7
 rihe/vGWozgBNt9cQzG9M2ekRol00kj3gce6Cz5/WzduyBvw1aNAZpB1/QZMSIM7kIiy
 IMyCw1tEx7j4/GEAThomibsYy2jY40hJgBFzPAjz1Qw0+CLQkMDw/Te4r4F13HGUpiUq HA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 394mvne659-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Jun 2021 13:12:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15FDAm4C177839;
        Tue, 15 Jun 2021 13:12:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 394j1ugq7w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Jun 2021 13:12:24 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15FDCHql181026;
        Tue, 15 Jun 2021 13:12:24 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 394j1ugq6q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Jun 2021 13:12:24 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15FDCF3Q011202;
        Tue, 15 Jun 2021 13:12:15 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 15 Jun 2021 13:12:14 +0000
Date:   Tue, 15 Jun 2021 16:12:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <treding@nvidia.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau: fix double free in nouveau_gem_new()
Message-ID: <YMinJwpIei9n1Pn1@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: gJ-ZN4n7OqcJnHFopUbQ9HzrZvJnUHyS
X-Proofpoint-GUID: gJ-ZN4n7OqcJnHFopUbQ9HzrZvJnUHyS
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10015 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150086
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The ttm_bo_init_reserved() function calls ttm_bo_put(bo) which calls
nouveau_bo_del_ttm() which frees the "nvbo.bo" so the nouveau_bo_ref()
call leads to a double free.

Fixes: 019cbd4a4feb ("drm/nouveau: Initialize GEM object before TTM object")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This fix is obvious enough and fixes my double free, but unfortunately
there are other bugs here so my system still hangs when I try to open
ten latest version Firefox windows in a row.

 drivers/gpu/drm/nouveau/nouveau_gem.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index c88cbb85f101..d612c1a720f8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -211,10 +211,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	}
 
 	ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
-	if (ret) {
-		nouveau_bo_ref(NULL, &nvbo);
+	if (ret)
 		return ret;
-	}
 
 	/* we restrict allowed domains on nv50+ to only the types
 	 * that were requested at creation time.  not possibly on
-- 
2.30.2

