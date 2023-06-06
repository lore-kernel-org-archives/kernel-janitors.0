Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA789C77B73
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 08:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236788AbjFFIeT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236914AbjFFIeO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:34:14 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D966411B
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:33:53 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3063433fa66so5097869f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686040432; x=1688632432;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixVKLJG1J3IvnujzAUwpwAiWuL5lceT9xTDyP3ttmAs=;
        b=Ft1ai+Nebad4F1ztgqj/bHSM3UpcMV0hLzfc2Yvd1I8NsAhtx50lHj67VHwCCLIoS3
         zNm0f8obTd2fFypVUKb7KY0w3taJk3vB7UA4CUuO4ada24UHRB4JZWpS2aEZOquwgB+s
         CsGyN97LMcMvXpkjPF+Ki2OAbf6RTjBbDlypjNdCKMAj9c74b5E9U8JkDmFz342c5VO/
         8bmgd0IrjRLWbibgv+EuXAo2FDSQnu5QpWK8cZrgwmEEnE/aV/zD7O/7Hql6ZIi2h1n8
         LD8HAwrfM++ZMlJ5ZyEHkZFKW/Z9KLI4x8OF78zPrRRfmzEmY25Nm3MdGrrzAziqYDc8
         qmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040432; x=1688632432;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixVKLJG1J3IvnujzAUwpwAiWuL5lceT9xTDyP3ttmAs=;
        b=H/+sPecZI644xeFOCGVaON8VrT4o055iYW8IZvPqcybDWd/+zLtveS8Cf44eUgUeYh
         fwFRHSpudw3Hzbh799Jua22gRjp7x8KxdxCvu50lPZS34/zVyN7TTXW8lErA+dNLNgUm
         v+uK914pn/fT8zNfCMHCcbfWBi3m0Abqqyhg+sKlr8iS/wqzabHZgTl3yGMoFWrqdGwR
         HmP2vfChvSp4WBAb/ozgDu0mWKjcCuEttpAC6hKxbvUOxLWDaTJBw7Cn4VU17N/DOiqD
         0kxsTEsiu7LXVeFm5zIjB8kWkUlwr6a8ALxMDfZG8uwfmuUDALi9IheFkI0ZsFeC0UO1
         jh1A==
X-Gm-Message-State: AC+VfDxLQZL82Q/UzSS9c+zEZssNNvRsPiN8j6AhfQWCerm4hZHAt8b9
        xioyfIehybGCC5KZmWHw5fkJhg==
X-Google-Smtp-Source: ACHHUZ6lXzUpAjlfOeWOwBgeuDEnlhI2XzFjrVsD3GMCZ2NqsCr9yljQBRIfLU53A7J1i47n26l4xw==
X-Received: by 2002:adf:dec3:0:b0:309:49e3:efb4 with SMTP id i3-20020adfdec3000000b0030949e3efb4mr1196426wrn.63.1686040431927;
        Tue, 06 Jun 2023 01:33:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d8-20020adff848000000b0030ae849c70csm11965924wrq.37.2023.06.06.01.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:33:50 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:33:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Evan Quan <evan.quan@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lijo Lazar <lijo.lazar@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Kenneth Feng <kenneth.feng@amd.com>,
        Candice Li <candice.li@amd.com>,
        YiPeng Chai <YiPeng.Chai@amd.com>,
        Yang Wang <KevinYang.Wang@amd.com>,
        Horatio Zhang <Hongkun.Zhang@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/pm: Fix memory some memory corruption
Message-ID: <ZH7vaonsPEHJpy1j@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "od_table" is a pointer to a large struct, but this code is doing
pointer math as if it were pointing to bytes.  It results in writing
far outside the struct.

Fixes: f0a0c659fb96 ("drm/amd/pm: fulfill the OD support for SMU13.0.0")
Fixes: e3afa4f988b3 ("drm/amd/pm: fulfill the OD support for SMU13.0.7")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 4 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 5ac5ea770c1c..413e592f0ed6 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -1535,7 +1535,7 @@ static int smu_v13_0_0_od_edit_dpm_table(struct smu_context *smu,
 		 * settings. Thus we do not cache it.
 		 */
 		offset_of_featurectrlmask = offsetof(OverDriveTable_t, FeatureCtrlMask);
-		if (memcmp(od_table + offset_of_featurectrlmask,
+		if (memcmp((u8 *)od_table + offset_of_featurectrlmask,
 			   table_context->user_overdrive_table + offset_of_featurectrlmask,
 			   sizeof(OverDriveTableExternal_t) - offset_of_featurectrlmask)) {
 			smu_v13_0_0_dump_od_table(smu, od_table);
@@ -1548,7 +1548,7 @@ static int smu_v13_0_0_od_edit_dpm_table(struct smu_context *smu,
 
 			od_table->OverDriveTable.FeatureCtrlMask = 0;
 			memcpy(table_context->user_overdrive_table + offset_of_featurectrlmask,
-			       od_table + offset_of_featurectrlmask,
+			       (u8 *)od_table + offset_of_featurectrlmask,
 			       sizeof(OverDriveTableExternal_t) - offset_of_featurectrlmask);
 
 			if (!memcmp(table_context->user_overdrive_table,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index 0bd086360efa..cda4e818aab7 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -1524,7 +1524,7 @@ static int smu_v13_0_7_od_edit_dpm_table(struct smu_context *smu,
 		 * settings. Thus we do not cache it.
 		 */
 		offset_of_featurectrlmask = offsetof(OverDriveTable_t, FeatureCtrlMask);
-		if (memcmp(od_table + offset_of_featurectrlmask,
+		if (memcmp((u8 *)od_table + offset_of_featurectrlmask,
 			   table_context->user_overdrive_table + offset_of_featurectrlmask,
 			   sizeof(OverDriveTableExternal_t) - offset_of_featurectrlmask)) {
 			smu_v13_0_7_dump_od_table(smu, od_table);
@@ -1537,7 +1537,7 @@ static int smu_v13_0_7_od_edit_dpm_table(struct smu_context *smu,
 
 			od_table->OverDriveTable.FeatureCtrlMask = 0;
 			memcpy(table_context->user_overdrive_table + offset_of_featurectrlmask,
-			       od_table + offset_of_featurectrlmask,
+			       (u8 *)od_table + offset_of_featurectrlmask,
 			       sizeof(OverDriveTableExternal_t) - offset_of_featurectrlmask);
 
 			if (!memcmp(table_context->user_overdrive_table,
-- 
2.39.2

