Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862FFCA5504
	for <kernel-janitors@archiver.kernel.org>; Wed, 13 Sep 2023 08:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbjIMISn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 13 Sep 2023 04:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbjIMISm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Sep 2023 04:18:42 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40C81996
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Sep 2023 01:18:37 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so3280099f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Sep 2023 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694593116; x=1695197916; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0T8G3R6507VORdtnswAiI9E09gNgvj+W/NjhPnIOgc=;
        b=a9bJIDmvMoKGbxP30LbfvoGSibKlid/XXdBJLYkAtHFdTjJekp/3mdsxGOm7G7tP2L
         lMfw0rXrOUUsHdWqnaB1X77WgXI0Z3oGJf79UWJqs0NrmS1ZeJRp57LXP1ZqUot0qeVK
         6AOXrGow6yhSV40KNz61e+43pA1BEGK+3ovU6ZPzluWPBeDzqi2lOxzYIlj3AfIQ74pY
         MCYZX7ajfp07omW1/HypHoPj4IBW+655WHKHr7YB3lwi1nocrVkThxwdLaQmDECSw2l9
         CPeflBGsMx04LjpSIof5/g/K2UFAOERk1ABv0u5G4AzXveNpjzEQQUyRd2HFjJjEzsbD
         GczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593116; x=1695197916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0T8G3R6507VORdtnswAiI9E09gNgvj+W/NjhPnIOgc=;
        b=Oo99Iss+/FbOlIbwk0oH/vCaGdIt9exDbYFGK/jxXOvQva6ZQb1tsGI57QiwwPxOLC
         J5Djq9bT2at0RV9IsTd8Yi5V9GkfE78x9vxskzq07J+D3dc3/Wei6ti2LHQ2ry5J0zh9
         OgxpV4MwcJrbJv0GLMDeFpDli6ZWlM9XuelsXkV/jpqKkuPAe3VUFlfgHgWkrED/k6pH
         g43k9PA5i315/qmnpL9iPqu+Jo0jPQHAXe5uGnJK3d9o6gpvXc928JGx3pOSVUWuuK83
         0w0Dlm0GL4Iff39XZqBiyBD98VFUDV9goThtKpoPxKdUjL7mZDcC/ZfzJiaX7fTxsJ5f
         OGlg==
X-Gm-Message-State: AOJu0Ywn/sN9jgQx6FG3cuY+ENRzKgbhXU2fGuqBFueHcFSdBuMxpzv1
        CXpL5jVBQfy7tuE2YcC88A/39Q==
X-Google-Smtp-Source: AGHT+IHeUTw7CplSMuNF9IZLmnrwVvu9RTNpnTc9kOuLVW/S+0mQbzZT1Fpm5Ke/E/yXYbLhgadW7A==
X-Received: by 2002:adf:ea85:0:b0:319:7c1f:8dae with SMTP id s5-20020adfea85000000b003197c1f8daemr1673532wrm.3.1694593116282;
        Wed, 13 Sep 2023 01:18:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c6-20020adfed86000000b0031de43fe9bfsm14899765wro.0.2023.09.13.01.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:18:36 -0700 (PDT)
Date:   Wed, 13 Sep 2023 11:17:41 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Zhanjun Dong <zhanjun.dong@intel.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matt Roper <matthew.d.roper@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Fei Yang <fei.yang@intel.com>,
        Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/gt: Prevent error pointer dereference
Message-ID: <455b2279-2e08-4d00-9784-be56d8ee42e3@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Move the check for "if (IS_ERR(obj))" in front of the call to
i915_gem_object_set_cache_coherency() which dereferences "obj".
Otherwise it will lead to a crash.

Fixes: 43aa755eae2c ("drm/i915/mtl: Update cache coherency setting for context structure")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 957d0aeb0c02..c378cc7c953c 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1094,6 +1094,9 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 					  I915_BO_ALLOC_PM_VOLATILE);
 	if (IS_ERR(obj)) {
 		obj = i915_gem_object_create_shmem(engine->i915, context_size);
+		if (IS_ERR(obj))
+			return ERR_CAST(obj);
+
 		/*
 		 * Wa_22016122933: For Media version 13.0, all Media GT shared
 		 * memory needs to be mapped as WC on CPU side and UC (PAT
@@ -1102,8 +1105,6 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 		if (intel_gt_needs_wa_22016122933(engine->gt))
 			i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
 	}
-	if (IS_ERR(obj))
-		return ERR_CAST(obj);
 
 	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
 	if (IS_ERR(vma)) {
