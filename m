Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9E3C4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Nov 2022 09:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbiK2Jpj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 29 Nov 2022 04:45:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbiK2Jpi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Nov 2022 04:45:38 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75035C740
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Nov 2022 01:45:35 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id q7so20245095wrr.8
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Nov 2022 01:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=COppZajkt4EWHP4TcI4+tgWNQUyyajXa4qnC9c1n0EM=;
        b=Vw9DVXPyPdaZyUb6IddAz0h4Dk7BRWemag4IUiyZOgYAAxTYnOvbMZPnbZ8JlDmfG9
         /59mkdcSgFkNlWlWSBUQ8prn6Vqvhiuo0h22r0pcW9NnUj0H/OF2LOaIny1mr8ln2gsm
         xuJvyWOAk0s3JQvxmKUiIyNat/SlC76ZXxa1+4Ig2ICJgN40zAfkvCEMPjU5+fw7uyoY
         2rOK+gduJgEB9i9htFbxTiBBTZbKiOzlrPqMkvZvLvr0DO5TZeHArtJNZcPH5LLzv4LE
         +8swuf9MP8FP6MVngcme81QPC+7/kZ4Ps2slcW0Dxu/bzd1LsFbRqEflVAPZIYDPD8IR
         T49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=COppZajkt4EWHP4TcI4+tgWNQUyyajXa4qnC9c1n0EM=;
        b=o4MX147+Yhq/EU2S37nHwYG1MekuP/tD9Py4YFr011kvDOWTKstNmTaWeCBMqP9Gwz
         cgKw1uR+B1OLjzyk1CICEyOcIGrTp1A4VzE4c3nP0YjLjXDD0uF4mryUpcRQU7q/LWpJ
         jQHPGISrKbo+NgssGZEO7Y0mF2udVP/u4orNisVHbHQthab5HPChdYLldJ0NzOvObEjf
         +u83J+QjK1YE2Wb+/M228aduyiMMTiS1E35XL1Gp/Z8RXXf+0pmHHrzIGMwEZUDdzLs+
         x2N/2epzFOYHlcbYrKQLYP5xmikzubvmvJFsCPzxwGXrH+vGMLWLbc6CSqbqPSvH8VUh
         dIyw==
X-Gm-Message-State: ANoB5pkyv3dKr0yS+I83mmvnexy3CXaGvVL4z3uKAS0lO8eOg9BBqz5j
        XRsMmuxX/7v5T8DNe0ba1jg=
X-Google-Smtp-Source: AA0mqf44784vK1ZJD251DLHoYNFxkZw+QumzwaciNBqk8qS62sgKY+UjRZT3rBMwvuo7jNCc77MSAQ==
X-Received: by 2002:adf:e5d0:0:b0:242:17c9:a1e with SMTP id a16-20020adfe5d0000000b0024217c90a1emr5680321wrn.514.1669715134379;
        Tue, 29 Nov 2022 01:45:34 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e14-20020adfe7ce000000b00241e7007905sm13104927wrn.75.2022.11.29.01.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 01:45:34 -0800 (PST)
Date:   Tue, 29 Nov 2022 12:45:31 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
        John Harrison <John.C.Harrison@intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/uc: Fix double free bug
Message-ID: <Y4XUuyFi3fr354sP@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "fw" pointer is freed again in the clean up code at the end of the
function.  Set it to NULL here to prevent a double free.

Fixes: 016241168dc5 ("drm/i915/uc: use different ggtt pin offsets for uc loads")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 0c80ba51a4bd..8aa9bcae8e72 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -585,6 +585,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 
 		/* try to find another blob to load */
 		release_firmware(fw);
+		fw = NULL;
 		err = -ENOENT;
 	}
 
-- 
2.35.1

