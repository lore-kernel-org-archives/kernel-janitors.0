Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2C4C77B73
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 08:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236429AbjFFIYX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236301AbjFFIYV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:24:21 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B06E47
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:24:03 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30ad458f085so5141106f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686039841; x=1688631841;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cu00erad5bhnLhrnHtwRHa2XDxNFsi3EuA1QgEK2MPg=;
        b=izIWW1PrYM03lQFHH/qXUTUE4kbL8MXfzNUe7V1iIEoaSdn3we/K/6t9S+ZqkRZqln
         1jy6J4W7vFxq15cjA6LgJOb2yy2bCKrdllkpO9NNqIsTtnWdBDPMfQ1Iaxb6ZM38y8sa
         Fp9GGLui/y1XXnx6xgV68OJAj8lAU43Lnmgh6fQk9szZ+Vbl6wOsDC90u2z84fWDop1r
         kvo0TzjnXu1deUqfoOrfsukbgD7qEBnjYuNg7vdfcS/fU6n0Rqwii/IhkGwfqaFXHu96
         qUy4+c1cIY46Cf0KFcSUPij1lDsdV2KzRqa334LylXd4aHZv0r5l0ZnkluBBA2WAP4lu
         v5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686039841; x=1688631841;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cu00erad5bhnLhrnHtwRHa2XDxNFsi3EuA1QgEK2MPg=;
        b=d8uyoCfpRtbDyTmVPNJ32RHOai+lQqoO5+2oFAmd9npQVKDYDNUzgeJ6HIU7rd/hjg
         E3zUFI4s4eBWCB/dPDvW5nX+ewcG3Ii9gG3l4TI66Q6HHeEKN8v3tLQSEBRRsr+ComfE
         VU014gVr0AgsOeZGmSK29kcHghA21zSpWIB94oJj9YtEbOIDBxVteKEmI8mTRazAfSa8
         TjapERVFEaPGtB4CJrnpXkq+LiqTInE9Vep4K5o6kUfnRU5P2vP0NYCZ6N18pDQw0djl
         JZIyOnZiiHVF8HOFd2uajuRY+AramaPEOWbHw7UTIdODvjbEptAjmUX0Fmvkv+MDDXgp
         rylg==
X-Gm-Message-State: AC+VfDx55vArKMG+xEsJb2yp3vJVOg+q61mzOdtWMZzu0b+CPy8BvgKm
        IqCvfCdFojEUeKGRj9FwfzVKwQ==
X-Google-Smtp-Source: ACHHUZ4+U56Oim5d9z0fzzpQFWt87wPRBPzyCzagTvFDjwvOyFAFiNq+4kkmkNkoElYtiOJuv5pJvw==
X-Received: by 2002:adf:f7c8:0:b0:30a:f20b:e71 with SMTP id a8-20020adff7c8000000b0030af20b0e71mr1198004wrq.33.1686039841487;
        Tue, 06 Jun 2023 01:24:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h14-20020a5d504e000000b00300aee6c9cesm11936977wrt.20.2023.06.06.01.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:24:00 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:23:56 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Nirmoy Das <nirmoy.das@intel.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        Anshuman Gupta <anshuman.gupta@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Fei Yang <fei.yang@intel.com>,
        Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915: Fix a NULL vs IS_ERR() bug
Message-ID: <ZH7tHLRZ9oBjedjN@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The mmap_offset_attach() function returns error pointers, it doesn't
return NULL.

Fixes: eaee1c085863 ("drm/i915: Add a function to mmap framebuffer obj")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 4e7a838ab7bd..aa4d842d4c5a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -1085,8 +1085,8 @@ int i915_gem_fb_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma
 		/* handle stolen and smem objects */
 		mmap_type = i915_ggtt_has_aperture(ggtt) ? I915_MMAP_TYPE_GTT : I915_MMAP_TYPE_WC;
 		mmo = mmap_offset_attach(obj, mmap_type, NULL);
-		if (!mmo)
-			return -ENODEV;
+		if (IS_ERR(mmo))
+			return PTR_ERR(mmo);
 	}
 
 	/*
-- 
2.39.2

