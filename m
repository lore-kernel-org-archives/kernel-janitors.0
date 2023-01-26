Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881FFC54E94
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Jan 2023 09:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236790AbjAZJ3K (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Jan 2023 04:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236936AbjAZJ24 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Jan 2023 04:28:56 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E04027491
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 01:28:55 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so2850310wml.3
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 01:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/IxBVmoaeMHgo4qohihhRMExp2vqEbWrBTuk2dZo30k=;
        b=MfLleEFuHVk5Eqk2rl0bV08WiVj4OMVvz1lAR8CvfOzu4JZhnamDCEDGgw9pcxewwc
         QBKA/M54UwJS50/Za8zbcHI2HX7J5HAlG+8Nt62iTxKSQSDwhymzbIDQq5D5PbZLZ2En
         tlbtVPoQftM06dwGqqKniTBMLs1jZOO4xqSy2Bp6pfQN/1+1jaVOBrbaQFQLcEh8I4zw
         ZSnbwvbqDzJ/kzSunWbJCeZns6ytbsCdttKSXnPUfnIBNtN1dIO/zdXTaYuCaaVekxGZ
         SmJHG/vnxnzAtWl7jZ9MRixmmuqrpcs9KWG1clJYHXmRXEJPWBOz7gKGddyY7WBoTByR
         MeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IxBVmoaeMHgo4qohihhRMExp2vqEbWrBTuk2dZo30k=;
        b=SKwfEsUivMVei5NH554rm+t0P8YQZINbnAwFf5jxOXsQzdRZqa9nAZ952Yq7/D2CLh
         PEi5eebD+QNc0ix5WyVcJV6GoFnD6BldGvjl8JC2IuzhFe8PIS5qO9v+bmC3153/XxBQ
         qcuAADtaXhWiCyvn8OgmCOcJJq1rBoAE23ct9TA3onYRcSj06jxs8cQjIdx9WmbnOLD7
         2wIwOTW8iZFhaMf9b5RWmYDtQD8fAFWT1MF34soPKl3NUI/+22QA9cMfCvcqiM3U0Vcp
         7alOGs0hrNgYghoeKHHuk6qmUOmA9GNTpks1USbeBcRm0fxytOpANe0eKLgNYYQUXIAG
         6dnw==
X-Gm-Message-State: AFqh2kr4LNc5vK0Au55Ot/wddHaXYX385vM65YevszaUG8IPwbfxgURO
        K5Ebiro2mNx3p960Q3k7CN0=
X-Google-Smtp-Source: AMrXdXvuPjKYrz6r9VXVEKS7W8Gs0rtLGgODZ1eB3jGVWEsIQmy5BB/BO50YeASdR8746CRa4aJQTw==
X-Received: by 2002:a05:600c:35cf:b0:3d3:49db:d95 with SMTP id r15-20020a05600c35cf00b003d349db0d95mr34482619wmq.37.1674725333855;
        Thu, 26 Jan 2023 01:28:53 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c42-20020a05600c4a2a00b003da105437besm932937wmp.29.2023.01.26.01.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 01:28:53 -0800 (PST)
Date:   Thu, 26 Jan 2023 12:28:44 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/simpledrm: Fix an NULL vs IS_ERR() bug
Message-ID: <Y9JHzImRcUaa0mi1@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The devm_memremap() function doesn't return NULL, it returns error
pointers.

Fixes: 9a10c7e6519b ("drm/simpledrm: Add support for system memory framebuffers")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 2acc0eb32489..63881a3754f8 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -719,8 +719,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		drm_dbg(dev, "using system memory framebuffer at %pr\n", mem);
 
 		screen_base = devm_memremap(dev->dev, mem->start, resource_size(mem), MEMREMAP_WC);
-		if (!screen_base)
-			return ERR_PTR(-ENOMEM);
+		if (IS_ERR(screen_base))
+			return screen_base;
 
 		iosys_map_set_vaddr(&sdev->screen_base, screen_base);
 	} else {
-- 
2.35.1

