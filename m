Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320EACD98FB
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Oct 2023 08:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjJKIB7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 Oct 2023 04:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjJKIB5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Oct 2023 04:01:57 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43ADE9C
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 01:01:54 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so61332245e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 01:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697011312; x=1697616112; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YZT/8mXHXiKgkNO5lwynSIruokO6XSAvA489Hqpy4Bo=;
        b=U5hq1/UlIFInSzY1FQ52XyZhXHN2FcPsBIOveRjWKqIYvuhHALTjmmZ7bsMpnaKDRS
         PpZyNltMvf13zJESHa2wU446qs5COThVWKdbo6681t+y+/98aCRGk8Mgub7NTxeqYaSk
         Toi0u9ypuSl7lYsXiPGrzAcXWAX6sosAAckEKQWoWjo4W/I1beAjNdaOJYYFT8MGhN/M
         hWQK07m4A946k1hjdyjUld6Tz1PMGK/ijrVijbTuym0vbCkpNdIqrS5NGizBorIxbvsR
         /3IAQ/yKxfd6FUOnD5NdVlCHatFX8f8UWHFLjXOAL10iYU0ob+q904mlaHNOry/usRHy
         PWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697011312; x=1697616112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YZT/8mXHXiKgkNO5lwynSIruokO6XSAvA489Hqpy4Bo=;
        b=ot2N8gG2XzQRhNiGrXnuI+zCI1WNTBIo030kvJ4kqEPP6KSagVz8CvgE/j+tOlcz84
         IxVs0LPzUSFr/gO2nso3LPmPt3oVYxJdZ7sKIvR4GPEMn4IsXiSqeZrmtJfiQVe3eFM5
         ii5NaPS7YImCgpNfpA7584OG/u6bSpcEwdYgg8Zbpxpem7WQxVI+MVqabdBONIuRvQL7
         Rp9gC/9O5JEWFHc6JdIULbZF3BbfFs1Jei9L1R7SCI7NSM7XYE4Rtmmf57MqtfTZ8Djs
         fVUKiDfB1kQD8V3+T2Tfw9H3jI86lLEaTlkG6VAz6Gc/7xCRj00/fsLoWnBfaVHS8cY4
         l3bA==
X-Gm-Message-State: AOJu0YyygNN2+quZ+Su6g5KY619ffodIutV4QzOsTYIwx3wQmjsCmUrB
        aBwYbckYoBJ6LlX4V19spvV9xJ5nAMRqTPCr21Q=
X-Google-Smtp-Source: AGHT+IHlYGaipThrXKIKMr2CcQW1kf8ZvYk9AY5BdTWtgsZ4chvat2yBykWEZU5sAaKVW2Tsl/EQeQ==
X-Received: by 2002:a5d:5911:0:b0:324:e284:fab8 with SMTP id v17-20020a5d5911000000b00324e284fab8mr19093365wrd.39.1697011312630;
        Wed, 11 Oct 2023 01:01:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n6-20020adffe06000000b003140f47224csm14690117wrr.15.2023.10.11.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 01:01:52 -0700 (PDT)
Date:   Wed, 11 Oct 2023 11:01:48 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sandy Huang <hjc@rock-chips.com>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        rjan Eide <orjan.eide@arm.com>,
        Mark Yao <markyao0591@gmail.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/rockchip: Fix type promotion bug in
 rockchip_gem_iommu_map()
Message-ID: <2bfa28b5-145d-4b9e-a18a-98819dd686ce@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "ret" variable is declared as ssize_t and it can hold negative error
codes but the "rk_obj->base.size" variable is type size_t.  This means
that when we compare them, they are both type promoted to size_t and the
negative error code becomes a high unsigned value and is treated as
success.  Add a cast to fix this.

Fixes: 38f993b7c59e ("drm/rockchip: Do not use DMA mapping API if attached to IOMMU domain")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index b8f8b45ebf59..93ed841f5dce 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -40,7 +40,7 @@ static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
 
 	ret = iommu_map_sgtable(private->domain, rk_obj->dma_addr, rk_obj->sgt,
 				prot);
-	if (ret < rk_obj->base.size) {
+	if (ret < (ssize_t)rk_obj->base.size) {
 		DRM_ERROR("failed to map buffer: size=%zd request_size=%zd\n",
 			  ret, rk_obj->base.size);
 		ret = -ENOMEM;
-- 
2.39.2

