Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42D1C74A5B
	for <kernel-janitors@archiver.kernel.org>; Wed, 29 Mar 2023 05:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjC2F1x (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 29 Mar 2023 01:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjC2F1v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Mar 2023 01:27:51 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106832D5E
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Mar 2023 22:27:50 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id v1so14384181wrv.1
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Mar 2023 22:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680067668;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WeQ/sOncvnANQNphvPs5lHLCwBueTwnNxBud57wwVnQ=;
        b=g6dYsmufGz+mac52ggb7T1tx2HzETOO5bHT4DD5M8nZ6qyLNOEEGrF3EPJoRXv38Ep
         5Fo1AahFWFeNLsdAo1mR4UZuSLEey1IxF7DeZp2a9cMouqiUdOAmbrTCchFV4oOwBwLe
         4t8BSRmtu8e8xshqBl8RFb5KMFGpQR3nILgHo+U6rjTHowL/PNSq92x7Yzh/otaV4i0Q
         VtJCdQhFwg78W+bJEbUXWGwOB4N2T9b1JqZU+EscUcPbz/ferrOYGhGLCuwvYYnPqmt1
         /qDmBXiqjqU7smaEZpunjyqlJYxCjtyLvKcSPhHt+XBvirBIYfpXDbr9DYm+L+zjHiow
         C9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680067668;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WeQ/sOncvnANQNphvPs5lHLCwBueTwnNxBud57wwVnQ=;
        b=zD05O7QUKuJihxfKcSA3LIAzJta9ssPeUqRaUkTlhLc19CooCcGssSd67c/Z6qHvy8
         GPi8NLwKm2SUpMlNANSB+NilmVcNCuNzipd607bcROdlWUaEloluJL/d5WTSY4jywsEp
         c8uIwy0S1ENQMNwrZk8CbQ/HN3MoZTK/R8+f0tFiPKK3OrqbMkf8ELnskZblosrK2QeD
         WKYyNlXytmom8U8eBQkDPm4eAvGDD1fMKiaFkbm8VBNHf6Pl9rb/FlHRIz1mP5wk9Pm2
         Lj8WRZ0Vg8FvnvDiftmxJl6YJcTUrnYKFOoRTWrj3mZEaHaiLxgNM3NRaa76329A8OT0
         mlOw==
X-Gm-Message-State: AAQBX9fck4UZ1AacNRDeWxQJeMEceNUGYVKNgPrjJZudJ0K6OJA+F/iS
        lvzOZeeiaC/cqU3LG2/eAiI=
X-Google-Smtp-Source: AKy350busIuXZ5du0beLTAckg2jZkMI5wGvgABsSD8Un2dej76ZAcUhY4TeLe/BmyRnFGNol7MfLCA==
X-Received: by 2002:a5d:526a:0:b0:2d0:58f9:a6a with SMTP id l10-20020a5d526a000000b002d058f90a6amr14848429wrc.57.1680067668388;
        Tue, 28 Mar 2023 22:27:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm29256299wrn.64.2023.03.28.22.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 22:27:47 -0700 (PDT)
Date:   Wed, 29 Mar 2023 08:27:39 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Hawking Zhang <Hawking.Zhang@amd.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Tao Zhou <tao.zhou1@amd.com>,
        "Stanley.Yang" <Stanley.Yang@amd.com>,
        YiPeng Chai <YiPeng.Chai@amd.com>,
        Victor Zhao <Victor.Zhao@amd.com>,
        Candice Li <candice.li@amd.com>, amd-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix AMDGPU_RAS_BLOCK__DF check
Message-ID: <580414df-4adf-49cf-9930-743f7c539d46@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a mixup where AMDGPU_RAS_BLOCK__DF is used as a mask instead of
a shifter.  It means that this condition will be true for
AMDGPU_RAS_BLOCK__MMHUB instead of for AMDGPU_RAS_BLOCK__DF.

Fixes: b6f512168478 ("drm/amdgpu: Add fatal error handling in nbio v4_3")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
From static analysis.  Not tested at all.

 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index fac45f98145d..4069bce9479f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2564,7 +2564,7 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
 			adev->nbio.ras = &nbio_v7_4_ras;
 		break;
 	case IP_VERSION(4, 3, 0):
-		if (adev->ras_hw_enabled & AMDGPU_RAS_BLOCK__DF)
+		if (adev->ras_hw_enabled & (1 << AMDGPU_RAS_BLOCK__DF))
 			/* unlike other generation of nbio ras,
 			 * nbio v4_3 only support fatal error interrupt
 			 * to inform software that DF is freezed due to
-- 
2.39.1

