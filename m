Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2ED3C433DB
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Feb 2021 19:36:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A96B64E7A
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Feb 2021 19:36:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhBPTgh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Feb 2021 14:36:37 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:33862 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhBPTgg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Feb 2021 14:36:36 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GJSsnM056695;
        Tue, 16 Feb 2021 19:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=PJsDiZfN2hh0MkNa+YxpTM9fU0UPucWVMyXUvhjmB/g=;
 b=uX64ataN02e3ngG1C0XqEKXCtowAxXC5G6l+h405nWzPFhp2qExSVnU4Qx/ynqTlU3Cz
 sld1Ui5LmL7/tRh7NjDzOSBEVs+WVnXo1ej5hqeoyCzNDKL0zcnB653qIudZKqAdoTok
 cK/WBZMUgQkn142OBDnS+oQdOyvhjKmXiweS6Dh7Dl2gI0mK1Gx8u16l66hn0LAfw8tN
 FfFabHhkDMWOC/wch+gfexYoFNZ+gBPksOo6aUlboLkr+6r7f9pE9iw1RU0w7iowIjj9
 RYgMAPr4rIxNIOONbPwEdV4Utugtmgkhhe8k/TyhSRQvQ6Zr4Z9QpDEUHgSBqaaxH087 Hg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 36p66r031j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Feb 2021 19:35:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GJUCN0066701;
        Tue, 16 Feb 2021 19:35:43 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 36prnybtjd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Feb 2021 19:35:43 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11GJZboO024611;
        Tue, 16 Feb 2021 19:35:37 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 16 Feb 2021 11:35:37 -0800
Date:   Tue, 16 Feb 2021 22:35:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Deucher <alexander.deucher@amd.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ben Skeggs <bskeggs@redhat.com>,
        Harish Kasiviswanathan <harish.kasiviswanathan@amd.com>,
        Jonathan Kim <jonathan.kim@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix an error code in
 init_pmu_entry_by_type_and_add()
Message-ID: <YCwefEWbsHeME7vQ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160162
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102160162
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If the kmemdup() fails then this should return a negative error code
but it currently returns success.

Fixes: b4a7db71ea06 ("drm/amdgpu: add per device user friendly xgmi events for vega20")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c     | 4 +++-
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
index 19c0a3655228..82e9ecf84352 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
@@ -519,8 +519,10 @@ static int init_pmu_entry_by_type_and_add(struct amdgpu_pmu_entry *pmu_entry,
 	pmu_entry->pmu.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
 								GFP_KERNEL);
 
-	if (!pmu_entry->pmu.attr_groups)
+	if (!pmu_entry->pmu.attr_groups) {
+		ret = -ENOMEM;
 		goto err_attr_group;
+	}
 
 	snprintf(pmu_name, PMU_NAME_SIZE, "%s_%d", pmu_entry->pmu_file_prefix,
 				adev_to_drm(pmu_entry->adev)->primary->index);
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 72f35a2babcb..3786b1c85182 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -274,6 +274,7 @@ nouveau_backlight_init(struct drm_connector *connector)
 
 	if (!nouveau_get_backlight_name(backlight_name, bl)) {
 		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
+		ret = -ENOMEM;
 		goto fail_alloc;
 	}
 
-- 
2.30.0

