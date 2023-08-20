Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E23EE49AB
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Aug 2023 09:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjHTJ4s (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 20 Aug 2023 05:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjHTJ4p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Aug 2023 05:56:45 -0400
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D72E1
        for <kernel-janitors@vger.kernel.org>; Sun, 20 Aug 2023 02:51:42 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id Xf5hqwKJwP8tnXf5wq04i8; Sun, 20 Aug 2023 11:51:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1692525101;
        bh=yRDJ9XSY8QRbt3yLCfIDe34UtsQbHZ65Dhi1TjJrFY8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=qmlzG+dR3ODzfEAyq2nozyOmz/4fk68YdpOo4AtnY/6SRR5teLsTrYBxDg5FMysGf
         a0Wh/hh0H1N4ONZdaePGjGGtyX4S4guy3rN0r2kgTPYQnmcAhc9DAU8V8y3qKdMGiN
         fgMu+e+Ek6rMjUMs/M6suC0sLroIChN8RNZCF2nyWiqLTA2Qon726jqaIRCBRdNgQW
         0Yb9V5RCMqjSq+cKhYv4GPnw9+EAlX0/Ixf0DhnSc7tMXWGqE+23Ctpq6z9mapvCp3
         bcajwwUtPgpph45cFMyaGphBxCsn5YvG/ZUtPj+rPsUhp+qwhoNmTOsu3P0doqPQCd
         5HacW/XYLBkmQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 20 Aug 2023 11:51:41 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
        Felix.Kuehling@amd.com, Arunpravin.PaneerSelvam@amd.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/4] drm/amdgpu: Remove a redundant sanity check
Date:   Sun, 20 Aug 2023 11:51:14 +0200
Message-Id: <2f8cf2af583ea6893c6665aae5dcb6d69d0909bd.1692524665.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
References: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The case where 'num_entries' is too big, is already handled by
struct_size(), because kvmalloc() would fail.

It will return -ENOMEM instead of -EINVAL, but it is only related to a
unlikely to happen sanity check.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 571fed04eb7a..c8f59a044286 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -78,10 +78,6 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 	unsigned i;
 	int r;
 
-	if (num_entries > (SIZE_MAX - sizeof(struct amdgpu_bo_list))
-				/ sizeof(struct amdgpu_bo_list_entry))
-		return -EINVAL;
-
 	list = kvmalloc(struct_size(list, entries, num_entries), GFP_KERNEL);
 	if (!list)
 		return -ENOMEM;
-- 
2.34.1

