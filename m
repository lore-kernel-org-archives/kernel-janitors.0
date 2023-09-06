Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AC0EB8FAF
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Sep 2023 10:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbjIFKyr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Sep 2023 06:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbjIFKyr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Sep 2023 06:54:47 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C35E7C
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Sep 2023 03:54:43 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so3008175f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Sep 2023 03:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693997681; x=1694602481; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LCKeiVfXbpOHNlhl0gQNMuWrM7Q36OD6Fy+jaBM3zr0=;
        b=qDO02dE+NQmf/1dFSD+7woJZiW3GXwBFc7jLWeUzi9hIo4Nb+ejFYwejfwsIhbnhQa
         eboSEVAg8AuHBL9qGHcu8asNTFnXpi3rV92vCQDLxgWKIMcQJf2g9nSzsygL3lpZn9Dm
         jXoGqJEODwgBYfIVMf1+OcczefgulSohkd34bRcP6wi9grIS9KR04uXKcMNYeXTICIyg
         t/t+afQENsPeZxHPAMumJwlRoNj8H0d11GSEzyK2VcWkJ+Ocqvqx85DfSLezVHxS3vlI
         HYKdjcoh+rk3I2O56xOL01dg3PkG6yQ58Ak3O687vg555KYa4ekD7/dTvMNGZkm1V4Ai
         gNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693997682; x=1694602482;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LCKeiVfXbpOHNlhl0gQNMuWrM7Q36OD6Fy+jaBM3zr0=;
        b=hciA/lUiJAunOkgfqLBXkgP3kF/3fx5jiuN8mNbiNDv/NJChjUdFT5moT1i+85mvbm
         xf+YjmSv084Uo23j7DbJYeX0JhKXRkjMaCzmRUfVKS2EPzk5llMg2pSmpv9XnIPkMzGK
         eXhc+ot3RwjMbzigIGfiKxpqg234pVcKRPyamW0nkEPbF/LYnX65waxt0OFVb/47mw0A
         4lr+WZIeEkyOkyvtrrYE98BT4gKqlUFDCv0TNgbwVZ9SJxbcl7zLIhiM7f9pKXuJDpI1
         E1GvVEnx2YTQlbps6/Jxjlnsfh4JSJYbaKgOOs8dwwj1UYl45xu8NMOZJgbwRFQUYYRy
         vgfg==
X-Gm-Message-State: AOJu0YwQf1/8TIsvjnxhv8aaZ7uKVzgMRbTRTcPRIwOPybUmJDGde1SV
        IfWJS4h6SSYuAen9F8RpRbUIdA==
X-Google-Smtp-Source: AGHT+IEgpsMHaoM6HOfWi7u9qCzbaxmCm1tHHH2l8saUdqiH4tWYuh1cPZiI1bMgsHD5B4zKGALA6g==
X-Received: by 2002:adf:fa46:0:b0:317:6ef1:7939 with SMTP id y6-20020adffa46000000b003176ef17939mr1722000wrr.23.1693997681665;
        Wed, 06 Sep 2023 03:54:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r12-20020adfce8c000000b00317afc7949csm19979128wrn.50.2023.09.06.03.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 03:54:41 -0700 (PDT)
Date:   Wed, 6 Sep 2023 13:54:38 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Evan Quan <evan.quan@amd.com>, Yang Wang <KevinYang.Wang@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lijo Lazar <lijo.lazar@amd.com>,
        Asad Kamal <asad.kamal@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix retry loop test
Message-ID: <ea9bfa9b-2689-45cf-95b7-57577f0d76c2@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This loop will exit with "retry" set to -1 if it fails but the code
checks for if "retry" is zero.  Fix this by changing post-op to a
pre-op.  --retry vs retry--.

Fixes: e01eeffc3f86 ("drm/amd/pm: avoid driver getting empty metrics table for the first time")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Obviously this only loop 99 times now instead of a hundred but that's
fine, this is an approximation.

 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index ff58ee14a68f..20163a9b2a66 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -336,7 +336,7 @@ static int smu_v13_0_6_setup_driver_pptable(struct smu_context *smu)
 
 	/* Store one-time values in driver PPTable */
 	if (!pptable->Init) {
-		while (retry--) {
+		while (--retry) {
 			ret = smu_v13_0_6_get_metrics_table(smu, NULL, true);
 			if (ret)
 				return ret;
-- 
2.39.2

