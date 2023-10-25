Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D134BC07545
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 05:19:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjJYFTr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 01:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjJYFTq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 01:19:46 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 74386A4;
        Tue, 24 Oct 2023 22:19:43 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id D9480605941A7;
        Wed, 25 Oct 2023 13:19:35 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     Su Hui <suhui@nfschina.com>, airlied@redhat.com,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/nvif: avoid possible memory leak of 'args'
Date:   Wed, 25 Oct 2023 13:19:23 +0800
Message-Id: <20231025051922.525940-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use kfree() to free 'args' before return '-EINVAL'.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/nouveau/nvif/vmm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index 99296f03371a..a0afe3bf0d78 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -219,6 +219,7 @@ nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass,
 	case RAW: args->type = NVIF_VMM_V0_TYPE_RAW; break;
 	default:
 		WARN_ON(1);
+		kfree(args);
 		return -EINVAL;
 	}
 
-- 
2.30.2

