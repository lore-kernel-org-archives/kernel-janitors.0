Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDC4EB64DC
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jul 2023 14:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjGUO6K (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jul 2023 10:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbjGUO55 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jul 2023 10:57:57 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BD9114
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:57:56 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-316f9abf204so1747157f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689951474; x=1690556274;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPQpaJOnqLf9UDb4uXUGcUWJo8wk2AIw2cPDMM0EptM=;
        b=vOR6lvAGYSRM+b/6mY6rDgti9+yZEIUSxHTyBgCB5+fkizJoa2AuQmN7tIm3tkw1wB
         hrW/sHNJz1G7mgKNnBfgtvLVRxil7QsFjWUnUWHk1ZO72bcDHTovup5mLFBwC2OpyjXv
         IMTQpUId6n/F3B8sbmnyb2Upbjly3l/qq6C6NrKrf3O4jPrQ8gpqylzLbl7PvzvDv4dK
         DV4zwC9IKyctFV3+nGCXcJ27Fm/XbQvMh72lpFJ8mVTdR5ukWOpZAZzWFGQ+1DNWmJo4
         NzH2esTrV2ZhipnkOWQRxIwU3OvaYtPUKMSnDAOP1MoYCdWBFS/6IzdDbK4vsTaZ2mbs
         3IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689951474; x=1690556274;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPQpaJOnqLf9UDb4uXUGcUWJo8wk2AIw2cPDMM0EptM=;
        b=FLjlLHSscPVfi7Wl3GhcJ7gPb8ec2bNPqbK6XbnkFdxEkmLfXQuhzAktqR3iV0IA1L
         b74ZT8K9EfRDovB/Ll5N8zsgvpExMoSQ0hdUyudfwbcLwRrVgFPdz44KNy+xk6+x0EVf
         +hK8HOrREXQoUShcjsn/OtPbPwj5i03BUUxWsmdbI6hRB5Aw1iqCccd60Qbh2bSNWGJq
         AvDgM28RCeeVLZsCpSOehXTPPx266pNvVQJ6HnmIkKptTZSAcwu+khq6ySh23XtFYeqR
         ATT/4tZI4RCEFP4HaPqASJBMWSLNa9NYYeSkDJ8WswcZa5I/q0qEuKQTtE0QfjKzZIFi
         lqdg==
X-Gm-Message-State: ABy/qLaP2Efkh1wzLC2lDyME3M2MLG4z0lskl7IxOAI4W5xaJTCz5JJm
        G9DSNCIjbd3AuPpGM280xd4RXqmDLPTZI6L/PJg=
X-Google-Smtp-Source: APBJJlHf12iTj2XIZFYCHGgNNJK1PIyLvIRCwMsa3dnbCrEmbtJZgPtVxnTebkbq8CGmJvu9kzFw7A==
X-Received: by 2002:a5d:51cb:0:b0:314:f18:bc58 with SMTP id n11-20020a5d51cb000000b003140f18bc58mr1552225wrv.58.1689951474654;
        Fri, 21 Jul 2023 07:57:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q4-20020adfdfc4000000b0031134bcdacdsm4437126wrn.42.2023.07.21.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 07:57:53 -0700 (PDT)
Date:   Fri, 21 Jul 2023 17:57:49 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/managed: Clean up GFP_ flag usage in drmm_kmalloc()
Message-ID: <ddf86b59-696a-45f0-96dd-b87aa7b9ab2e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code is not using the correct gfp flags which were passed in.
However, this does not affect runtime because kstrdup_const() is a
no-op in this context.  (It just returns the "kmalloc" string literal
without doing an allocation.)

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_managed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 5423ad883729..bcd111404b12 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -196,7 +196,7 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
 			       size, gfp);
 		return NULL;
 	}
-	dr->node.name = kstrdup_const("kmalloc", GFP_KERNEL);
+	dr->node.name = kstrdup_const("kmalloc", gfp);
 
 	add_dr(dev, dr);
 
-- 
2.39.2

