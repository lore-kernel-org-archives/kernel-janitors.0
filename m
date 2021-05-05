Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68F6C433B4
	for <kernel-janitors@archiver.kernel.org>; Wed,  5 May 2021 18:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76F3F61027
	for <kernel-janitors@archiver.kernel.org>; Wed,  5 May 2021 18:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234901AbhEESzW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 5 May 2021 14:55:22 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35422 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234293AbhEESzV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 May 2021 14:55:21 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1leMf4-0007BG-6u; Wed, 05 May 2021 18:54:18 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: make a const array static, makes object smaller
Date:   Wed,  5 May 2021 19:54:17 +0100
Message-Id: <20210505185417.69780-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array frs_limits on the stack but instead it
static. Makes the object code smaller by 128 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  24835	   7440	     64	  32339	   7e53	drivers/gpu/drm/bridge/tc358768.o

After:
   text	   data	    bss	    dec	    hex	filename
  24739	   7408	     64	  32211	   7dd3	drivers/gpu/drm/bridge/tc358768.o

(gcc version 10.3.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 8ed8302d6bbb..2495ea46b091 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -291,7 +291,7 @@ static int tc358768_calc_pll(struct tc358768_priv *priv,
 			     const struct drm_display_mode *mode,
 			     bool verify_only)
 {
-	const u32 frs_limits[] = {
+	static const u32 frs_limits[] = {
 		1000000000,
 		500000000,
 		250000000,
-- 
2.30.2

