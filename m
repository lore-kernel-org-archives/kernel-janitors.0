Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5D7C4320E
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Aug 2021 18:37:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8477060F01
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Aug 2021 18:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241374AbhHEShg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Aug 2021 14:37:36 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:26907 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241364AbhHEShf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Aug 2021 14:37:35 -0400
Received: from localhost.localdomain ([217.128.214.245])
        by mwinf5d63 with ME
        id dudJ250055JEng903udJWQ; Thu, 05 Aug 2021 20:37:20 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Aug 2021 20:37:20 +0200
X-ME-IP: 217.128.214.245
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        ray.huang@amd.com, evan.quan@amd.com, Xiaojian.Du@amd.com,
        kevin1.wang@amd.com, Jinzhou.Su@amd.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/amd/pm: Fix a memory leak in an error handling path in 'vangogh_tables_init()'
Date:   Thu,  5 Aug 2021 20:37:14 +0200
Message-Id: <fd28a9cec24a8d32ebb26dd857c399d0a15acdd5.1628188477.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'watermarks_table' must be freed instead 'clocks_table', because
'clocks_table' is known to be NULL at this point and 'watermarks_table' is
never freed if the last kzalloc fails.

Fixes: c98ee89736b8 ("drm/amd/pm: add the fine grain tuning function for vangogh")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 335b3c70e1a7..06eea917284e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -256,7 +256,7 @@ static int vangogh_tables_init(struct smu_context *smu)
 	return 0;
 
 err3_out:
-	kfree(smu_table->clocks_table);
+	kfree(smu_table->watermarks_table);
 err2_out:
 	kfree(smu_table->gpu_metrics_table);
 err1_out:
-- 
2.30.2

