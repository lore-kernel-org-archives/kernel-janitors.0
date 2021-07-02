Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6D9C11F6B
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Jul 2021 12:06:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C73D5613E0
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Jul 2021 12:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbhGBMIl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Jul 2021 08:08:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59357 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbhGBMI3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Jul 2021 08:08:29 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lzHv5-0006TO-1f; Fri, 02 Jul 2021 12:05:19 +0000
From:   Colin King <colin.king@canonical.com>
To:     Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, lyude@redhat.com,
        Dave Airlie <airlied@redhat.com>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: Remove redundant error check on variable ret
Date:   Fri,  2 Jul 2021 13:05:18 +0100
Message-Id: <20210702120518.17740-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to drm_dp_aux_init never returns an error code and there
is no error return being assigned to variable ret. The check for
an error in ret is always false since ret is still zero from the
start of the function so the init error check and error message
is redundant and can be removed.

Addresses-Coverity: ("Logically dead code")
Fixes: fd43ad9d47e7 ("drm/nouveau/kms/nv50-: Move AUX adapter reg to connector late register/early unregister")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 22b83a6577eb..f37e5f28a93f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1362,12 +1362,6 @@ nouveau_connector_create(struct drm_device *dev,
 			 dcbe->hasht, dcbe->hashm);
 		nv_connector->aux.name = kstrdup(aux_name, GFP_KERNEL);
 		drm_dp_aux_init(&nv_connector->aux);
-		if (ret) {
-			NV_ERROR(drm, "Failed to init AUX adapter for sor-%04x-%04x: %d\n",
-				 dcbe->hasht, dcbe->hashm, ret);
-			kfree(nv_connector);
-			return ERR_PTR(ret);
-		}
 		fallthrough;
 	default:
 		funcs = &nouveau_connector_funcs;
-- 
2.31.1

