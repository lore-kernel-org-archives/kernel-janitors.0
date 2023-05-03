Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7E5C77B75
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 May 2023 15:09:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbjECPJ2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 May 2023 11:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjECPJ1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 May 2023 11:09:27 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CBF5593
        for <kernel-janitors@vger.kernel.org>; Wed,  3 May 2023 08:09:26 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f18dacd392so33896885e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 03 May 2023 08:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683126564; x=1685718564;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hrqzZ7cl8VrtR/TAxnvpJyyUePNXIse9aaN0F9mcED8=;
        b=k+mEvhkF3uKpEJD2wjFkUiNyY14LN6OGYP9piujHBpmYpEqYvzmS4UT95OzVxmlRjK
         QBUXbRpMvjzzliHlpDfc7taXh1uGmew5OHFFAwWoBzQP8zLfvfCHXJrpBr0Vc4OYaUpY
         +YEpKVW/Yp0UFr9HsI5NR97FwRlBF3aPjPaxVn91pRQ6lSLVKknj4s+DjpsM0e4ngb99
         +xixWMDGLb0cXiDgj+DbtYYFz+Ue8W/rmqTyf7HU2/X5yszZ7Qzl/3QxgUL9FADCJv7g
         JdBfkq89Yq9wKRRyZCiAveWgnvWXG9afgSLq3CtfCUR/uN4tep/ZTH0bdI/LxfGVGNyF
         6LRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683126564; x=1685718564;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrqzZ7cl8VrtR/TAxnvpJyyUePNXIse9aaN0F9mcED8=;
        b=i5rrbpmlRpQqgbNlIhGMj4o7bh6LX9HYJjMyBB6b0QAZ9UNPwHWnMfw3sGMM2AVRmr
         VBF0HPwWI7VLwerQgk3TOkzMHwsUrA6AuWbW2htSBgv3lRJ/ljSPUZYvw53ubkXREdqL
         5CH5Xwkf1uNB3I92/9CATSd41b+H3R+k/GvqINv3a5R2SKIDhZTPcFGmQfoAisXtW1ja
         NE6pZ11lNLNc1x1e6l1rc/WaMUYI1AiW91xPs3HUzFcGaLL2kbVDzIHUZKAxPIYBNXt3
         RjieEYOnZHVItvm0Sgi3TqDUzGT1vH4eqtX9Q5h3b8v1/iEmXXNLQVxPjGGUD54P4sNj
         nqrw==
X-Gm-Message-State: AC+VfDwogkLjWT5VveKpm52IhDOB4xPb05qRB0So40A4I3YkxiiB+qvR
        KRELlbnRrrdtJzPn2PtBY7k2bQ==
X-Google-Smtp-Source: ACHHUZ59pkQEr7QUrGFWqjZnRra9u6FwHuf75XZEu80zdhinKzCq+M1Huv7BZqixQDqcC0WMwmTArQ==
X-Received: by 2002:a05:600c:2212:b0:3f1:7aff:e14a with SMTP id z18-20020a05600c221200b003f17affe14amr15227267wml.39.1683126564433;
        Wed, 03 May 2023 08:09:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z18-20020a1c4c12000000b003f188f608b9sm2164834wmf.8.2023.05.03.08.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 08:09:23 -0700 (PDT)
Date:   Wed, 3 May 2023 18:09:18 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Le Ma <le.ma@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Tao Zhou <tao.zhou1@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
        Lang Yu <Lang.Yu@amd.com>,
        Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
        Likun Gao <Likun.Gao@amd.com>,
        YiPeng Chai <YiPeng.Chai@amd.com>,
        =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: unlock the correct lock in
 amdgpu_gfx_enable_kcq()
Message-ID: <072c8bbb-76bd-42f8-bb97-ebc38acad470@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We changed which lock we are supposed to take but this error path
was accidentally over looked so it still drops the old lock.

Fixes: def799c6596d ("drm/amdgpu: add multi-xcc support to amdgpu_gfx interfaces (v4)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 60bb4bba1994..1de3fffae9d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -566,7 +566,7 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev, int xcc_id)
 						kiq->pmf->set_resources_size);
 		if (r) {
 			DRM_ERROR("Failed to lock KIQ (%d).\n", r);
-			spin_unlock(&adev->gfx.kiq[0].ring_lock);
+			spin_unlock(&kiq->ring_lock);
 			return r;
 		}
 
-- 
2.39.2

