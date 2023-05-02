Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0227C77B73
	for <kernel-janitors@archiver.kernel.org>; Tue,  2 May 2023 13:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbjEBNAH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 2 May 2023 09:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbjEBNAF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 May 2023 09:00:05 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC194682
        for <kernel-janitors@vger.kernel.org>; Tue,  2 May 2023 06:00:04 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f196e8e2c6so37214945e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 02 May 2023 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683032402; x=1685624402;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KN5DwxFH9ZHQdijbpvDL8/gNlVBQ0FOvg+tNx3WkTWM=;
        b=hPysCzJRgbbN0mQ6qv+ylKC7vkBf+zvIpyEkZOSenueWi+VOU8jYsZBmpUzQQPDIwQ
         KYfNa/58ehwKA2mxeBiMNuwfr+7ySqUBA5IxVS11H1fD+k4wR9reNrdSr40z7p3OoT9e
         EFKOMtv7DdVkLi/B+d9MQHSyqpA65Xd3UvUwicuRUBCNqTxaUo17h2S9FI65RFtEnwCc
         Jz1tAfuLPNRsu6HT2l4uWWIk9tRvpHGyX1XZXru0L/VIzvACAVMWYWhdKXaXNlmKz1NM
         lkabS0SskEdiYYCwjvhDC84DDi46260KZJu22k2dCuFUIedcX1ULWAukantibuFJnjIS
         FcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683032402; x=1685624402;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KN5DwxFH9ZHQdijbpvDL8/gNlVBQ0FOvg+tNx3WkTWM=;
        b=adz9ylsstPHW6rkDzsoT7dt70Wgpb7Cuk4Lqao2+3mBJi8o82Jp5ffXLEi6lK16LTT
         EQCQfpOUXKaA7X0AznC7WbAeyaMHQP8/M4zq6MBq2G8spzXRlOhTFcrHq0skaeu059n8
         zM61kyQmciAZ/8FQXYPus1g7S/NdG3AjYjTXyZFpSTPOXp34CVMeMaUPsEkiwFffxoNS
         XuX0w7kT+vuMB61MaKuX9UII/Cmw16VeziuEr5lQKyp93qcLW0R+pQnsyfZnCd50idUs
         6tuvgnSHWt5fwmSOX8dVhW+I7XPKtsbmbTFfxhSD2jt0UhPrn0oiWFqw2kHO0P0wY9ic
         GtOw==
X-Gm-Message-State: AC+VfDySiD4jcPe99n8wBEWrHxhsPNS2R0+U0zKCdxc5sevxZFYTUJ4q
        7Vn8yR1ujWSy9y7pcDZTi69f0A==
X-Google-Smtp-Source: ACHHUZ4xh4sT90PCCgn3h0W/yGDi9Vp52BFYj3sw0YnTDAkwtopiToJv/pjulfyRh25XpqL1UxuCVQ==
X-Received: by 2002:a1c:7312:0:b0:3f3:2e4e:c738 with SMTP id d18-20020a1c7312000000b003f32e4ec738mr8313404wmb.3.1683032402584;
        Tue, 02 May 2023 06:00:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z19-20020a1c4c13000000b003f173419e7asm35184594wmf.43.2023.05.02.05.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 06:00:00 -0700 (PDT)
Date:   Tue, 2 May 2023 15:59:56 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dave Airlie <airlied@redhat.com>, Takashi Iwai <tiwai@suse.de>
Cc:     Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/udl: delete dead code
Message-ID: <e0e35421-8746-43b6-971e-e25d1cd1d6a7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "unode" pointer cannot be NULL here and checking for it causes
Smatch warnings:

   drivers/gpu/drm/udl/udl_main.c:259 udl_get_urb_locked()
   warn: can 'unode' even be NULL?

Fortunately, it's just harmless dead code which can be removed.  It's
left over from commit c5c354a3a472 ("drm/udl: Fix inconsistent urbs.count
value during udl_free_urb_list()").

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/udl/udl_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 061cb88c08a2..3ebe2ce55dfd 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -255,7 +255,7 @@ static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout)
 	list_del_init(&unode->entry);
 	udl->urbs.available--;
 
-	return unode ? unode->urb : NULL;
+	return unode->urb;
 }
 
 #define GET_URB_TIMEOUT	HZ
-- 
2.39.2

