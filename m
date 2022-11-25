Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C9DC433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 25 Nov 2022 07:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiKYHj6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 25 Nov 2022 02:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiKYHj5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Nov 2022 02:39:57 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3940E275E5
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Nov 2022 23:39:57 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso2740865wmp.5
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Nov 2022 23:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x2uDBlTkBIecsJ0/pVRgZ1UNVKyp5BR8++/Ee6tOums=;
        b=kpu1wXauOilz8J5X8C4St9E56b95mRasnUl4vlQfR+SLfhQkPcWpca+WeHFuOhMX6q
         i/fppI2mFwu+gCcf8izuX8iSqrLuuAUUE6AVRpe7bn5Q01Tau1lrKiZwzTxbXSJLEPuK
         vSSk0DvyXjs91IxMjPt/gXMgK/PR1b7ICrMzemEy/Hb6nFtfoC/eFMPJMmpliGYQKI4w
         Mq2NZ73RdB4F7UdIUpTq6pvlDiQfaW6pq8YxJWrXictO7fPBbqx4V60oxAgVm8rdMEN5
         dIjvxjnLPINK3pzV4CC8QV2+JJY4D65LbBN0tJpoFGlxuO/uGAJmo51S/HgdEk/q3h3f
         g9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x2uDBlTkBIecsJ0/pVRgZ1UNVKyp5BR8++/Ee6tOums=;
        b=zLuOusotYyeCCNvzlXXvpUbfNerR5ZK0vE3DABRPu63fiTUd/VKDLBYTp7jRSpJqsR
         rEeipkosK8bjDMoFWbdx5Xe/MnpjaqwlDp7ZwhMgR0e91cCPJIZOwGFi2k7BhrrGohy8
         rGDpVXcS2s40N0KMX8VS7OOZSh2RtNotPj6jcS//7gZGMGYSHwRdbc0UhXQv8Nif5E+Z
         if4ddSiMzJfDxztqeLEF9mji9vMckhwsbzxRDFLIJ4/xfOm7hsrlmpdz2hwcVby5HKjA
         XpKRojWfZPVjo7ezqh+7VsqBY00FTGrPZcYvwmEVj+Tub4KqxFLkNAzjsL2PiKnpmOR/
         t6Og==
X-Gm-Message-State: ANoB5pl1i8DqbgV7jQ37zRrdL2exFztyLITbQukavOes2osYTpi2VeSh
        Qc+TkJAxLqzbqOJGNDZoiYA=
X-Google-Smtp-Source: AA0mqf7AyhvECyDinFaapQedyGVNf0RiHnyQY1A32J0XXVfS85Ijp1ONmn55E/m2R9bigPakliMf2g==
X-Received: by 2002:a05:600c:5406:b0:3d0:21f6:43ec with SMTP id he6-20020a05600c540600b003d021f643ecmr15867408wmb.162.1669361995675;
        Thu, 24 Nov 2022 23:39:55 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c315000b003cfb7c02542sm4606184wmo.11.2022.11.24.23.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 23:39:55 -0800 (PST)
Date:   Fri, 25 Nov 2022 10:39:49 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Felix Kuehling <Felix.Kuehling@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdkfd: Remove unnecessary condition in
 kfd_topology_add_device()
Message-ID: <Y4BxRRU+aiblAj2Y@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We re-arranged this code recently so "ret" is always zero at this point.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 6f01ebc8557b..bceb1a5b2518 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -2012,10 +2012,9 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 
 	kfd_debug_print_topology();
 
-	if (!res)
-		kfd_notify_gpu_change(gpu_id, 1);
+	kfd_notify_gpu_change(gpu_id, 1);
 
-	return res;
+	return 0;
 }
 
 /**
-- 
2.35.1

