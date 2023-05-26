Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42948C77B73
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 11:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjEZL7j (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 07:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjEZL7i (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 07:59:38 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F2C125
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 04:59:37 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30a8c4afa46so569806f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 04:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685102376; x=1687694376;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xmuBDrlBpQbtrys/Qf8AocII7gV0XMhC8+i/ej21270=;
        b=HtZKWKl6N4Hu9jhvdgpgoBwmpeb0KQxF6iy25p4ERux2pJYIJQbc74jN/4Z6Wh49DJ
         OkolH5SrvNC3axkhttZ7uy0n6eA4Rw1aKcNKRw8ySrqVJoEf1sleGn16+OLzFpSHtXbn
         WwgBETxaKo/ymJvkuMiomvLYwZiyJuTDiLB78oNxBnFhkfMfWkdxczLQpHStsmeZuX84
         yLSozzy9hs4GzjV5aG4+HqQTrjOEjJnxTNUFikz1NmmPKy/YNtBe5GcU3G8k85n5Y9Mz
         QwGbfk3eaZSh25DHpM+wNFiEKyHqvGmmVsWYCqn2CT+pPoNoELnh8mIwuIVsM4tEknfx
         M9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685102376; x=1687694376;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmuBDrlBpQbtrys/Qf8AocII7gV0XMhC8+i/ej21270=;
        b=HiWcdt1SC2lel6J+ZpGubu1EZJ5wCk4OGWLc9V07+Sr1Dyp2Ktkj9pbSgEy2LfyS5D
         skuqPzKbBiZsGGS79UXc7hmLvB6hilHSLtoSdTaJ9qe+xPwDlFo2X9vbiYTIdAkSUFnH
         rnfLsznlSrzuVTRUXoUDVjlNN5xtAH4d9YCyU5zSHw2aBt98dpQ2oqb1shFtMnqgaDzo
         5RHjDd8tKOM08OjVMGrIOOrvJcaeQw8OKmkHmCUM9LacnH5f+uhMt70/IUreZigbObwO
         0JSTnmkITXAHwZEdykfLEaOmHlGaKYgecV34Zrbc2gLDxHmAqdorp9WJ/XxFuK5tOFkW
         Zt2A==
X-Gm-Message-State: AC+VfDw3KsQod+VhOyXMkdoClPCq1RP+2XhJEnUSLqoBYaZJERu2Sk1S
        ToZOAou4zFY+hISF2InKH4u3WA==
X-Google-Smtp-Source: ACHHUZ6KQQagZsTWWsJi4zpOqN7RHhUd2mr8Ex4eBHrdpPfHi/9Qg5DZ7Po3996wiMzpzGgjNg3P+A==
X-Received: by 2002:adf:e2c8:0:b0:309:4642:8795 with SMTP id d8-20020adfe2c8000000b0030946428795mr4663108wrj.12.1685102376168;
        Fri, 26 May 2023 04:59:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s26-20020a7bc39a000000b003f42328b5d9sm4992147wmj.39.2023.05.26.04.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 04:59:34 -0700 (PDT)
Date:   Fri, 26 May 2023 14:59:31 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthew Auld <matthew.auld@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/selftests: fix an error code in copy()
Message-ID: <f6b876f1-4dd7-4d96-bee5-966817cc1644@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return the error code if i915_gem_object_create_internal() fails,
instead of returning success.

Fixes: cf586021642d ("drm/i915/gt: Pipelined page migration")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gt/selftest_migrate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index e677f2da093d..a26429fd5326 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -55,8 +55,10 @@ static int copy(struct intel_migrate *migrate,
 
 	sz = src->base.size;
 	dst = i915_gem_object_create_internal(i915, sz);
-	if (IS_ERR(dst))
+	if (IS_ERR(dst)) {
+		err = PTR_ERR(dst);
 		goto err_free_src;
+	}
 
 	for_i915_gem_ww(&ww, err, true) {
 		err = i915_gem_object_lock(src, &ww);
-- 
2.39.2

