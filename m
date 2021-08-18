Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6449FC4338F
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Aug 2021 12:41:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 435D26109E
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Aug 2021 12:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235754AbhHRMmA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 18 Aug 2021 08:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235842AbhHRMl6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Aug 2021 08:41:58 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B76C061764;
        Wed, 18 Aug 2021 05:41:23 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so1689471wml.3;
        Wed, 18 Aug 2021 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7PolFHl4BCa4E4HG380dOZoCiWwe/gYoL591bvSVGBo=;
        b=c1GxZdd+2+kkeJZ4syYgj51Zg98RTZjLY/Z4IwPBEdIzTt49XtuWKeCb1bcCrVU4oN
         Izk9NWmOwP7kkaXp/2Mn53YkQfR/7fHJVcp92ZTDesjLkyO/DRCwZPWJ/yByOLYJPR1+
         zm3svX0pIC64LD+lGZ/dry6ECz8aimrYj58KwAVIIrG/NcA68jPJnvyNefOs93CZBhJV
         XRtCybrx9SAedtP7wZC98ZPPZw/S3G7fWok4s3NPfPyIVxnVtcL1R8XkAMXU6YiC+k1r
         Cng2mo0cabsYhxGtZHOCTmTKdD8C4WsukMjHHdCZOaziFfCFM3uJVRmet9G6TQB/MB6H
         FsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7PolFHl4BCa4E4HG380dOZoCiWwe/gYoL591bvSVGBo=;
        b=R3KbCJPeyfvtQ4dHnKg1jKWtItNs9bF7tReh4zg3caayguS7TtnxQSbATobaWz8rNQ
         /AyA4UZTVzJ+ZKWqKChzO8sLtS755mQOxrfsqzMqIldR5CWSGfdWz40edmwPHnVzhTXr
         fqTnV9wKbTYFN8l5QtKRMHCA0rS4aD3kP9cH+LL9QrlTg16cBK8+4dXytruER4OUDpsp
         DSlZe0uIYVwWpe6fCPJIMIN7CujTAU2G8x0bQPRcPuwFwJ/LtM5iXHzSxf6p/B1inJU/
         lUbjAEM1daJSA8deaiVLMS4c1sdsFBpTguFNpQrQH/BS3tBeXkslPOSP2BQaFCbTOXz3
         +PBg==
X-Gm-Message-State: AOAM532BcBmH30rloBNs5V+xK4WoiOt2Uecu1dhael7pYRqUZcVrmwyV
        YZJ29mlz17m8FTzWVmvufOY=
X-Google-Smtp-Source: ABdhPJyQ1VzwCaTRFpydCdrpCWhltvqmLieDWRpbd4w6l19jVmVkcZ/Q2gsXj0wLcwh21T24m+Fr8A==
X-Received: by 2002:a1c:1dc4:: with SMTP id d187mr8462745wmd.1.1629290481835;
        Wed, 18 Aug 2021 05:41:21 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id a11sm5720454wrq.6.2021.08.18.05.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 05:41:21 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Cc:     Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Emma Anholt <emma@anholt.net>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 2/5] drm: amdgpu: remove obsolete reference to config CHASH
Date:   Wed, 18 Aug 2021 14:41:11 +0200
Message-Id: <20210818124114.28545-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
References: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Commit 04ed8459f334 ("drm/amdgpu: remove chash") removes the chash
architecture and its corresponding config CHASH.

There is still a reference to CHASH in the config DRM_AMDGPU in
./drivers/gpu/drm/Kconfig.

Remove this obsolete reference to config CHASH.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/gpu/drm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f3bc90baca61..8fc40317f2b7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -257,7 +257,6 @@ config DRM_AMDGPU
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
-	select CHASH
 	help
 	  Choose this option if you have a recent AMD Radeon graphics card.
 
-- 
2.26.2

