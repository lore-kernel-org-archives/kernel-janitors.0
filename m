Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B645C54EBD
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 Jan 2023 10:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238205AbjAMKKL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 Jan 2023 05:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234982AbjAMKKD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Jan 2023 05:10:03 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD72B4F13A
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Jan 2023 02:10:01 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso14030264wmq.3
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Jan 2023 02:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gSVl5Sds0K3+KZcEdjR8SvziCTcv9fxNo6Bvw/idysI=;
        b=aswETd7JofjodlQwRTEaMY39q6cLRxXbGz4sWS1z4HdfSFlFlacI44O6PW90eNGTSL
         9PNSxYGISkPqoE1XYUGtdCEb/Fv9a1Q7OwNqkzMJosXzjZOQCbGoBFhd2i6eu863RW5o
         YuRlk2GHemgttWcKomFKBrImFmlepSAu7SliiZWD1+rblpd5eJF+mP6L6dpm3R6Zt1d1
         SIkpNyIhcsTyINYRonZz8szOAxajrf36wgd2NgxvXM4Wosedex5mwhFC1BGFEzMHwYqc
         VRekTeVxVC5ZEJRqn9FZG2DN3fiUHKuT9FHwBbyOoL7sVdyqtPc0mvM5PnB5R2xfl07F
         WYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSVl5Sds0K3+KZcEdjR8SvziCTcv9fxNo6Bvw/idysI=;
        b=WQRGV0JSeJ90V4NYCfbmLOcZolnoNgUdZ/oMtgCq0Mli0DdnQ94NKwJsa1+YEEnO7w
         giTajPNt3ceQ/e8iEJ2TthI6Yhl+Gl1NDiM4JM6JbyxL2PZ/FJCJ/rSDeguMmWsFlX/b
         Yj8KXQ3S/nDhBcdrVZh3DVhCAp3Ru+dN1kwmm5R53zt+6icGYYalJDUIJw0ouW8eg0VQ
         MNUue4bF8gKnU9Rczn8WDH0inNmN5pUIxx5MylxnRsy4K/PPchHow4Jx8oT86EwfHjVq
         SauuxFqbDsjZ8b31CP6jIXdcNpVstFQrjDMI20st9qipHjXfF/qXn5t40+PYVScNbEsf
         JGaw==
X-Gm-Message-State: AFqh2krgC4NHKru5w5odI6TMWn3qq02C6PWKultUSCDXSFMdiKBFXEnH
        b4VysDl5BExuiP5DjTpvq+EdTLSyt78n5g==
X-Google-Smtp-Source: AMrXdXuF09ofFhbUjN2nSi9BnZQwyr37SS3M2YFjX0/cPjEHxEHVFvUMYjog736OW7NXewReG7u+3Q==
X-Received: by 2002:a05:600c:22ca:b0:3d1:ebdf:d586 with SMTP id 10-20020a05600c22ca00b003d1ebdfd586mr57862681wmg.29.1673604600315;
        Fri, 13 Jan 2023 02:10:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id he12-20020a05600c540c00b003d9ddc82450sm23762476wmb.45.2023.01.13.02.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:09:59 -0800 (PST)
Date:   Fri, 13 Jan 2023 13:09:55 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Zack Rusin <zackr@vmware.com>
Cc:     VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Martin Krastev <krastevm@vmware.com>,
        Maaz Mombasawala <mombasawalam@vmware.com>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix uninitialized return variables
Message-ID: <Y8Et8+c8+JAGNqTP@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code accidentally returns the wrong variable (which is
uninitialized).  It should return ret.

Fixes: a309c7194e8a ("drm/vmwgfx: Remove rcu locks from user resources")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 9359e8dfbac2..0ee30a1aa23d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1156,7 +1156,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
 	ret = vmw_user_bo_lookup(sw_context->filp, handle, &vmw_bo);
 	if (ret != 0) {
 		drm_dbg(&dev_priv->drm, "Could not find or use MOB buffer.\n");
-		return PTR_ERR(vmw_bo);
+		return ret;
 	}
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo, true, false);
 	ttm_bo_put(&vmw_bo->base);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 0ee30a1aa23d..fa3761b3e956 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1210,7 +1210,7 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
 	ret = vmw_user_bo_lookup(sw_context->filp, handle, &vmw_bo);
 	if (ret != 0) {
 		drm_dbg(&dev_priv->drm, "Could not find or use GMR region.\n");
-		return PTR_ERR(vmw_bo);
+		return ret;
 	}
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo, false, false);
 	ttm_bo_put(&vmw_bo->base);
-- 
2.35.1

