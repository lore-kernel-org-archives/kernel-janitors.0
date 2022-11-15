Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610B4C4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 13:15:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbiKONP3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiKONP1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 08:15:27 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D495A28E12
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:15:26 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id cl5so24189521wrb.9
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BpTzxdWsroir2TADvB2KmE3YUOWbZr2+gw3f997fLWU=;
        b=BjLiVXO7rPktmnSloyRKTw89zsyRc5anlyi048AL4TGTWqxNniSQ37AEJeUepJn0Yw
         EhjRgv63DQ7cbxUwuBYEtIx3QB3K4eKUzv5etumcyRsk/bvD0XV+d/TMGGnnlfsNELhu
         c7OE4+ZTWZ+FyTR7EcyCefuYxpA3IrYFomJgHxTKwPchU6jyKfz8dBUKA7/N08Vpu0Fc
         cmOQ712jeOOpm552+TpNEoSxuM9HjeLd0jzFSAFuKW8jaUhW/GhEd2OroqCWhWihKO7r
         LZ9sTUxH3fddWBFDn5+P3yL0kxcUStBblGtCfrg9Mot2t9k4IjnhkVaXfz0fnpIqHwEr
         pBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpTzxdWsroir2TADvB2KmE3YUOWbZr2+gw3f997fLWU=;
        b=SmO3ZFfTzJBhB7fpQpWUR0xXA77VReT7Vjh0AnbE4lQ+3D1n4gSLxP9esoHOtm9Y8A
         duGjAqqBp7inX5TNRxXwYqZ3yfK9o+fr2LDttilZL8hNyzYmgz6RnU32P+dQ674N/vYm
         JEmSfLdFb4r7u7WMXxE8oQGsI5rBt/wutMhxNGFI0QSPHE4TIiU0a+Yrd9b0u2PxzEga
         uOkQ/yyWAIoXhq6rVECKlCSZXTpfCYqyAlxb2/16wske8G/ijGZH3ROUjZ95F8QAYpYK
         GsM4y9h/48dDwZ9p7Bw62ZiC3Dp6ZUjnR574Twr4I3T71sArKXJibptFMRY1L8RYeU3p
         UsTQ==
X-Gm-Message-State: ANoB5pkXrN/ppvoI4Y3HX6sDAJgUKg78UNzKCPKFOlRw47gmNxR5AqUS
        xjVUmNCUwf62/2qwx+S68j4=
X-Google-Smtp-Source: AA0mqf6641Vr9iKo+3ShhVapAT9C337vfupiTOE6HjInAzOEWYmrGA516RzG9nwcUO+nT1JHJ8C47Q==
X-Received: by 2002:adf:e3c7:0:b0:241:94bc:2796 with SMTP id k7-20020adfe3c7000000b0024194bc2796mr4343422wrm.184.1668518125454;
        Tue, 15 Nov 2022 05:15:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d58c3000000b00241727795c4sm14123577wrf.63.2022.11.15.05.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:15:24 -0800 (PST)
From:   Dan Carpenter <error27@gmail.com>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Tue, 15 Nov 2022 16:15:18 +0300
To:     Zhenyu Wang <zhenyuw@linux.intel.com>,
        Colin Xu <colin.xu@intel.com>
Cc:     Zhi Wang <zhi.a.wang@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()
Message-ID: <Y3OQ5tgZIVxyQ/WV@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Call intel_vgpu_unpin_mm() on this error path.

Fixes: 418741480809 ("drm/i915/gvt: Adding ppgtt to GVT GEM context after shadow pdps settled.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index d6fe94cd0fdb..8342d95f56cb 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -696,6 +696,7 @@ intel_vgpu_shadow_mm_pin(struct intel_vgpu_workload *workload)
 
 	if (workload->shadow_mm->type != INTEL_GVT_MM_PPGTT ||
 	    !workload->shadow_mm->ppgtt_mm.shadowed) {
+		intel_vgpu_unpin_mm(workload->shadow_mm);
 		gvt_vgpu_err("workload shadow ppgtt isn't ready\n");
 		return -EINVAL;
 	}
-- 
2.35.1

