Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4254FEB64DC
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jul 2023 14:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbjGUO4f (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jul 2023 10:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbjGUO4b (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jul 2023 10:56:31 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08991722
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:56:26 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b74310566cso30617761fa.2
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689951385; x=1690556185;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4uPw584/Tdlq/aOQhdIYZ2NWWZUO8Cw8PlRqHsN9Fo=;
        b=JyXtdWR89AuYMt8ebkpbk25d7ot90wKR+CGZh/1m+KMCbvze89anIZrvUjPBHvPZeb
         4xr1L4z3DmX4K2a+5vd2Dmt2AHNVquvN6ej9C99KCBRussfyUuuqNAmuEKPyBx9jAl67
         9LmQvARZTDhRVVq9/xskXgkDm1AanY4JEeWveP6iicOEwbZTfh79hM+I+ZdDu6N9hWm0
         AadUtN8DhlZqXjGpCiI5F/gZAzMqHUx9G4PZrA6SInZOHc+lF82sH7jb6f6WBoplx5a3
         6kWrFO6DioTqSOOwPeykZSXEkU/1vkq3Bravdqwbz4Y1ydxHfbu25tTP5SROv2QLSlmo
         rqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689951385; x=1690556185;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4uPw584/Tdlq/aOQhdIYZ2NWWZUO8Cw8PlRqHsN9Fo=;
        b=V9seoRQhEcMilgx+NBWGU4WmBpFbxeN98lcL/QXTXk4uGcaU/8q9vtQmzlkThEyd2u
         s9/t9nsWWmPUnP9xP9xghxTUMMm1vmy/OeZQ3pE1Wt5Bx1JLYVmYVbJKQqNS4i7OmHso
         1eEG5n66Gdi3GxQFEFp82gm7TB5Q01QZv3Mf40dkGWCtFqvRPnx/n7JUrV29wKl57jba
         Usdo92MM+Xc68y32yHpBJdLxmrC9DAKrZXhPbLDV/iZD6LJnMuaOQf+nq1uZNDRJHGJh
         FdsXpaRaJsZj0sM6EMBCx3Ll1SVsfLx09kA4s2Vf+XvFdTG16+ghOpNscDkwBUjsT6h/
         N1+g==
X-Gm-Message-State: ABy/qLalPXt7bZ+149Vz6VURrWaXL2imlerK+sWgTVoe4Km/gumH9J+X
        vzahu8vVd0OMCMS875AHvupmRw==
X-Google-Smtp-Source: APBJJlFwVWEJ9HCYiiD4k+l7zWH5gfbXV1xm2Y6zHh5t+enoUzr93GJvhTbRarCClp80b1UNBFU3kA==
X-Received: by 2002:a2e:a1cb:0:b0:2b7:842:a64c with SMTP id c11-20020a2ea1cb000000b002b70842a64cmr1673222ljm.5.1689951385241;
        Fri, 21 Jul 2023 07:56:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q17-20020a7bce91000000b003f91e32b1ebsm6300279wmj.17.2023.07.21.07.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 07:56:20 -0700 (PDT)
Date:   Fri, 21 Jul 2023 17:55:49 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Wayne Lin <wayne.lin@amd.com>
Cc:     Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>,
        Hersen Wu <hersenxs.wu@amd.com>,
        Fangzhi Zuo <Jerry.Zuo@amd.com>,
        Hamza Mahfooz <hamza.mahfooz@amd.com>,
        Alan Liu <haoping.liu@amd.com>, amd-gfx@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: Unlock on error path in
 dm_handle_mst_sideband_msg_ready_event()
Message-ID: <0a4b4a77-75e0-4a1f-a944-6ea5c75a2bb9@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This error path needs to unlock the "aconnector->handle_mst_msg_ready"
mutex before returning.

Fixes: bb4fa525f327 ("drm/amd/display: Add polling method to handle MST reply packet")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 1abdec14344e..943959012d04 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -707,7 +707,7 @@ void dm_handle_mst_sideband_msg_ready_event(
 
 			if (retry == 3) {
 				DRM_ERROR("Failed to ack MST event.\n");
-				return;
+				break;
 			}
 
 			drm_dp_mst_hpd_irq_send_new_request(&aconnector->mst_mgr);
-- 
2.39.2

