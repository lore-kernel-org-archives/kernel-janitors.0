Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C298C7EE22
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 May 2023 14:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjEIOVW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 9 May 2023 10:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235195AbjEIOVV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 May 2023 10:21:21 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35355198
        for <kernel-janitors@vger.kernel.org>; Tue,  9 May 2023 07:21:20 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f19ab994ccso59623925e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 09 May 2023 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683642078; x=1686234078;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tKxPPgYNyYSo5DBFq3CPZcdXe5HoTU5bwZzAoSKP9zY=;
        b=OI1NQ1W5f3mp3fG4eqJ6ffb5S2ZxWAYinNYSgokbDOyIyzElP3DIhIGYbKhJIRXgzJ
         88VJJWxaA8RuyLjFV/GM7Ib+6JRBnY9QLzPSajNT8rHPKEykxRi9h8DGbOON6aF+ruL4
         pyZxn/Ri+JNaWnmG5uz4XzM3wgHhavhHWeow2sfcbviZrlil9eSPdC9gKh9Z3fDtudbh
         Na/ohNQPN+HV+b2whejPpA/e3+TTGp3k0Dq6bIGBW2urdyd5JaIxn+xNzHyJev3ZlN0Z
         dKNct4vUDCpQZ0EPo2CAoLQ6J74rMLBkHYNXz9y2z06LGLzOrmir75/3EDbTYE/FMnSs
         9hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683642078; x=1686234078;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tKxPPgYNyYSo5DBFq3CPZcdXe5HoTU5bwZzAoSKP9zY=;
        b=Toqxz4MhV6VR5dOShlPBp+fuSCKuIlED7Alzuf3T82crMtI8axvoyR+fzJ8RgPd38d
         t4Q5GYoojUxtvCGX+MzgX7pBtQ6pAEbm2pGJZkn5V8dKv4aENdYzTS+orP8hF8FL55tZ
         DahxE5Rfq3LGU5ct/Jg9y8rVF6OTSOVCWB5ihcvnNAbCNtzLTe5BfwwLVVvztFynTtZG
         loUQuqBC6HG+L8gp237daLRLy4edxq3/g+B+mKTdNUhHkJp8/8Xeupf4GFwu82Swl9SG
         TjjAsjsuoCN9ncEsl9U2HfUl5HzUo6G8k213JlTwGDsRCR7YSmEj5jgtoimCruOXPPo+
         jWaw==
X-Gm-Message-State: AC+VfDy4ZmcQgouirLvy+UVo3jCkVh14CyMBghF9duGTQ/10AvCUYcs8
        +dI8JaEwHg3ijcoj/gkIUlKfzA==
X-Google-Smtp-Source: ACHHUZ5yT9mNx0iVJS45hDO9GhW7CW1PKVcX2BFfRjBmKez5Mh/Sl4r98fbSYl4QoCE8fpT3gu2Mgg==
X-Received: by 2002:a1c:720e:0:b0:3f0:7e15:f8fc with SMTP id n14-20020a1c720e000000b003f07e15f8fcmr10417276wmc.14.1683642078664;
        Tue, 09 May 2023 07:21:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d10-20020a1c730a000000b003f325f0e020sm19879491wmb.47.2023.05.09.07.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 07:21:17 -0700 (PDT)
Date:   Tue, 9 May 2023 17:21:14 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Alex Deucher <alexander.deucher@amd.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hawking Zhang <Hawking.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
        Tao Zhou <tao.zhou1@amd.com>,
        Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
        Lang Yu <Lang.Yu@amd.com>, Likun Gao <Likun.Gao@amd.com>,
        YiPeng Chai <YiPeng.Chai@amd.com>,
        amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: release correct lock in amdgpu_gfx_enable_kgq()
Message-ID: <75e5d2a6-9be4-4530-b8f8-c98d1bd96b03@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This function was releasing the incorrect lock on the error path.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 9bfa241d1289 ("drm/amdgpu: add [en/dis]able_kgq() functions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
The LKP robot sent me an email about this after I had already written
the patch.  (I review LKP Smatch emails and hit forward).

 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 969f256aa003..7d2f119d9223 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -644,7 +644,7 @@ int amdgpu_gfx_enable_kgq(struct amdgpu_device *adev, int xcc_id)
 						adev->gfx.num_gfx_rings);
 		if (r) {
 			DRM_ERROR("Failed to lock KIQ (%d).\n", r);
-			spin_unlock(&adev->gfx.kiq[0].ring_lock);
+			spin_unlock(&kiq->ring_lock);
 			return r;
 		}
 
-- 
2.39.2

