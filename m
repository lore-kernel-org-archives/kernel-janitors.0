Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D180FC433B4
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 21:39:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A59EA61430
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 21:39:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236789AbhELVk5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 May 2021 17:40:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39607 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384183AbhELT5W (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 May 2021 15:57:22 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lguxl-00041H-P0; Wed, 12 May 2021 19:56:09 +0000
From:   Colin King <colin.king@canonical.com>
To:     VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/vmwgfx: Fix memory leak of object fifo on error return
Date:   Wed, 12 May 2021 20:56:09 +0100
Message-Id: <20210512195609.298326-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where fifo->static_buffer fails to be allocated the
error return path neglects to kfree the fifo object. Fix this by
adding in the missing kfree.

Addresses-Coverity: ("Resource leak")
Fixes: 2cd80dbd3551 ("drm/vmwgfx: Add basic support for SVGA3")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index 027d7d504e78..e5fa210f589e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -107,8 +107,10 @@ struct vmw_fifo_state *vmw_fifo_create(struct vmw_private *dev_priv)
 	fifo = kzalloc(sizeof(*fifo), GFP_KERNEL);
 	fifo->static_buffer_size = VMWGFX_FIFO_STATIC_SIZE;
 	fifo->static_buffer = vmalloc(fifo->static_buffer_size);
-	if (unlikely(fifo->static_buffer == NULL))
+	if (unlikely(fifo->static_buffer == NULL)) {
+		kfree(fifo);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	fifo->dynamic_buffer = NULL;
 	fifo->reserved_size = 0;
-- 
2.30.2

