Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430F6C001DF
	for <kernel-janitors@archiver.kernel.org>; Sun, 23 Jul 2023 06:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjGWGlm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 23 Jul 2023 02:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjGWGll (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 23 Jul 2023 02:41:41 -0400
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D60310D3
        for <kernel-janitors@vger.kernel.org>; Sat, 22 Jul 2023 23:41:40 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id NSmdq59F14DtINSmdqfFoy; Sun, 23 Jul 2023 08:41:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1690094498;
        bh=Q7o0UQvRfkS/4+Mc6nSPTzH0IapT9/fEsaA6pwimGA0=;
        h=From:To:Cc:Subject:Date;
        b=N/o86135ANjyjKGmokuS7xBDhOlV15gvy89zRuss8Qpd7KKHc/I4AvMRy0vHpTNPP
         CdHlSFsd+qtazyI5QGlhGEa7t2s+ezl1Wb0N6mE9oRHSoYuvUBlBdxTuuwctbFxR2A
         9Zk5/e8z356kbKZSdmRnh2veOy8ewV5V48lDUyg0xuZHjeRIA/sxilDnSt8F7xqOnf
         4DmDV+b4GJow+4SNILdEJP+Bla9fs59NxWl1NOK80l4LU2T6INRhrrsH+zD1gGPb4e
         3J3PTblIWoQEMzg6a8hURf62+DuwkL5YE/vJoHpuj+ZKimoSeJBJVwoZCInRtvdcx7
         t0prBJ/xef2wQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 23 Jul 2023 08:41:38 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Slightly simplify memory allocation in submit_lookup_cmds()
Date:   Sun, 23 Jul 2023 08:41:33 +0200
Message-Id: <9861e8b1ce385a556e0c9c4533beee9c4a92809c.1690094459.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If 'sz' is SIZE_MAX, kmalloc() will fail. So there is no need to explicitly
check for an hypothetical overflow.

Remove the check to save a few lines of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3f1aa4de3b87..6ca8f8cbb6e2 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -211,11 +211,7 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 
 		sz = array_size(submit_cmd.nr_relocs,
 				sizeof(struct drm_msm_gem_submit_reloc));
-		/* check for overflow: */
-		if (sz == SIZE_MAX) {
-			ret = -ENOMEM;
-			goto out;
-		}
+
 		submit->cmd[i].relocs = kmalloc(sz, GFP_KERNEL);
 		if (!submit->cmd[i].relocs) {
 			ret = -ENOMEM;
-- 
2.34.1

