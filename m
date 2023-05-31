Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C21C7EE2E
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 May 2023 04:38:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbjEaEi4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 31 May 2023 00:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjEaEiz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 May 2023 00:38:55 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E6CBF97;
        Tue, 30 May 2023 21:38:53 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 26EE7180106EEA;
        Wed, 31 May 2023 12:38:29 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     airlied@redhat.com, dri-devel@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Su Hui <suhui@nfschina.com>
Subject: [PATCH] drm/nouveau/nvif: use struct_size()
Date:   Wed, 31 May 2023 12:38:26 +0800
Message-Id: <20230531043826.991183-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use struct_size() instead of hand writing it.
This is less verbose and more informative.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/nouveau/nvif/object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 4d1aaee8fe15..4bd693aa4ee0 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -65,7 +65,7 @@ nvif_object_sclass_get(struct nvif_object *object, struct nvif_sclass **psclass)
 	u32 size;
 
 	while (1) {
-		size = sizeof(*args) + cnt * sizeof(args->sclass.oclass[0]);
+		size = struct_size(args, sclass.oclass, cnt);
 		if (!(args = kmalloc(size, GFP_KERNEL)))
 			return -ENOMEM;
 		args->ioctl.version = 0;
-- 
2.30.2

