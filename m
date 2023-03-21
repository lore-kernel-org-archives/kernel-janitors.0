Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45460C6FD1D
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Mar 2023 18:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjCUSAH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Mar 2023 14:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjCUR7g (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Mar 2023 13:59:36 -0400
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B21E1C7F3
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Mar 2023 10:59:34 -0700 (PDT)
Received: from localhost.localdomain ([109.190.253.13])
        by smtp.orange.fr with ESMTPA
        id egGTpZTNYNBsfegGWp5b3D; Tue, 21 Mar 2023 18:59:32 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 21 Mar 2023 18:59:32 +0100
X-ME-IP: 109.190.253.13
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     harry.wentland@amd.com, sunpeng.li@amd.com,
        Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, aurabindo.pillai@amd.com, roman.li@amd.com,
        hersenxs.wu@amd.com, stylon.wang@amd.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/amd/display: Slightly optimize dm_dmub_outbox1_low_irq()
Date:   Tue, 21 Mar 2023 18:58:50 +0100
Message-Id: <b7cff2c1976308c64951d466fd627989ef6e46fb.1679421347.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

A kzalloc()+memcpy() can be optimized in a single kmemdup().
This saves a few cycles because some memory doesn't need to be zeroed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5bac5781a06b..57a5fbdab890 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -820,15 +820,14 @@ static void dm_dmub_outbox1_low_irq(void *interrupt_params)
 					DRM_ERROR("Failed to allocate dmub_hpd_wrk");
 					return;
 				}
-				dmub_hpd_wrk->dmub_notify = kzalloc(sizeof(struct dmub_notification), GFP_ATOMIC);
+				dmub_hpd_wrk->dmub_notify = kmemdup(&notify, sizeof(struct dmub_notification),
+								    GFP_ATOMIC);
 				if (!dmub_hpd_wrk->dmub_notify) {
 					kfree(dmub_hpd_wrk);
 					DRM_ERROR("Failed to allocate dmub_hpd_wrk->dmub_notify");
 					return;
 				}
 				INIT_WORK(&dmub_hpd_wrk->handle_hpd_work, dm_handle_hpd_work);
-				if (dmub_hpd_wrk->dmub_notify)
-					memcpy(dmub_hpd_wrk->dmub_notify, &notify, sizeof(struct dmub_notification));
 				dmub_hpd_wrk->adev = adev;
 				if (notify.type == DMUB_NOTIFICATION_HPD) {
 					plink = adev->dm.dc->links[notify.link_index];
-- 
2.32.0

