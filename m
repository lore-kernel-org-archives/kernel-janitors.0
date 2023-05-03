Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217D7C7EE2A
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 May 2023 15:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbjECPJq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 May 2023 11:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjECPJo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 May 2023 11:09:44 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E1F4ED2
        for <kernel-janitors@vger.kernel.org>; Wed,  3 May 2023 08:09:43 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-2f27a9c7970so4950692f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 03 May 2023 08:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683126582; x=1685718582;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lHn2q/LoLyqphWxooc9AtkUCXjbjiXmoO7+MLExrCDY=;
        b=mw6w9ImEn7ZTvxm+NpxjKfmIQCh2uH2sftTF71syVQ0PfSUhCyehC4HCVEJlSHMNc4
         djmwOVpXSHX5AxK4i0IaLrfzIxSsHgD+tUHrpMqpzz2GdiFNR71VHI1msZeahtxePojv
         fpKX2q6grqG2ilzrNnu1z1GkZMzVWN0y8+Aluig6/5cPW4iocaavD0CditZhhKvj2Ppc
         cWbBvd3hhL7JErTmLAmlOa+/HPq32qUWxGai8ILTrZ2h/3DjC3qb+himjYevcUBG9e82
         gdy/opjeNZ5ih2w/LnD7J9udlH8vlWCh+aFUnVPToo7wP2TB1xkYd+x2u+F2wjC84oV2
         rzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683126582; x=1685718582;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lHn2q/LoLyqphWxooc9AtkUCXjbjiXmoO7+MLExrCDY=;
        b=BC76ElR5iTfwpBcQUWl121MlBywwlP9R6WsMjfSh6CQHldSGw+pxmDYw0gRBvWli9S
         F9WMQiHgHREt9HbZgWvLX60jXbW51nwt3QgeHqudiUpaTMU/rYYq4XStVvM17cz/IxON
         G4FfIZOx36Mx9RhvuGqg5STfjfxzDty7cflB+JZCe5w6/qtHJOhPyUUTBlRRsi5jrN9W
         S0oYEvhzcchN2JiizJCzFgob/4FXSwkMIT5rFymYW6H5xqOo9+L8NgJNdKcC41OHXYoI
         0mPstMBmj3c7QbpcSNtWsIO9W1R+kpG7UgjaW646hu7UySMhwJeOuc/duO27dLtB5JU1
         HAQg==
X-Gm-Message-State: AC+VfDwyPlim03YOqnG0Jr11+C6RGkB81b/YKThL/rmJdWLhdpqqHz5q
        As+OB8RUWrAWBvmU0TEP6+sCmA==
X-Google-Smtp-Source: ACHHUZ7ta6829UORYzvq44Fqpb5GVNr04656qcKelYhqGaHHB1HPOWYiohvxlAg+tnS8YZhx2nMsuQ==
X-Received: by 2002:a5d:5942:0:b0:304:8147:f0ba with SMTP id e2-20020a5d5942000000b003048147f0bamr343888wri.3.1683126581860;
        Wed, 03 May 2023 08:09:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q7-20020a1cf307000000b003f18b52c73asm2139024wmq.24.2023.05.03.08.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 08:09:40 -0700 (PDT)
Date:   Wed, 3 May 2023 18:09:35 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Le Ma <le.ma@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Morris Zhang <Shiwu.Zhang@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: unlock on error in gfx_v9_4_3_kiq_resume()
Message-ID: <cb48ef1c-5f1a-449f-a9f6-909042661ce6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that we need to drop this lock before returning.

    drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:1838 gfx_v9_4_3_kiq_resume()
    warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.

Fixes: 86301129698b ("drm/amdgpu: split gc v9_4_3 functionality from gc v9_0")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
The Fixes tag is weird, but I think it's correct?

 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 56a415e151d4..552729a514d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -1827,8 +1827,10 @@ static int gfx_v9_4_3_kiq_resume(struct amdgpu_device *adev, int xcc_id)
 		return r;
 
 	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
-	if (unlikely(r != 0))
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unreserve(ring->mqd_obj);
 		return r;
+	}
 
 	gfx_v9_4_3_kiq_init_queue(ring, xcc_id);
 	amdgpu_bo_kunmap(ring->mqd_obj);
-- 
2.39.2

