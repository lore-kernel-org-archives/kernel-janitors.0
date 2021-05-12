Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2CAC433B4
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 21:39:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8430361413
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 21:39:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbhELVlC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 May 2021 17:41:02 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40542 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387087AbhELUcE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 May 2021 16:32:04 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lgvVM-0006Pb-5r; Wed, 12 May 2021 20:30:52 +0000
From:   Colin King <colin.king@canonical.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm: simpledrm: Fix use after free issues
Date:   Wed, 12 May 2021 21:30:51 +0100
Message-Id: <20210512203051.299026-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two occurrances where objects are being free'd via
a put call and yet they are being referenced after this. Fix these
by adding in the missing continue statement so that the put on the
end of the loop is skipped over.

Addresses-Coverity: ("Use after free")
Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 2bdb477d9326..eae748394b00 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -298,6 +298,7 @@ static int simpledrm_device_init_clocks(struct simpledrm_device *sdev)
 			drm_err(dev, "failed to enable clock %u: %d\n",
 				i, ret);
 			clk_put(clock);
+			continue;
 		}
 		sdev->clks[i] = clock;
 	}
@@ -415,6 +416,7 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
 			drm_err(dev, "failed to enable regulator %u: %d\n",
 				i, ret);
 			regulator_put(regulator);
+			continue;
 		}
 
 		sdev->regulators[i++] = regulator;
-- 
2.30.2

