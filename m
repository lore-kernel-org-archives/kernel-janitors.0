Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F16C4320E
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 18:54:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CADBB60FDA
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 18:54:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhH0Szo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Aug 2021 14:55:44 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:59950
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230380AbhH0Szi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Aug 2021 14:55:38 -0400
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net [80.193.200.194])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 184DF3F232;
        Fri, 27 Aug 2021 18:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630090488;
        bh=NOaiYQ6V99osk22Ft/AUMfAwEocy7/AP80thsSuyMBk=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=tJyXpCEmbw70/Hd9Eb2VGIMc028U6XmTJ6vuUPtOdgS0RyYNyGsbYMZK3t1WHnrR4
         oK4pxGEez9CATGWnQzvHOINfMtCDhIElolI1ACZS53b5WbiETG/GVQ10IQ5rrKNN+6
         9EFb+6JQ89pe4lE3VwLtvxI8i7KJWr7fYOY6v+OsLcMce8wxLoviHCB76ebNANu+tY
         cLZ4oZJ3JQNiNn+q40IZLTG2VBhtP2I1jeA2SnwBI5wgMTW7y3GoL6+dm6hc+VJLZk
         Pcrz0pX/Ck62v7pbpiZmmZUomQwGfpb85ljpmd+iJ9P/iyf/GIXKCfZiX4gmfgF2yO
         GV7/gS4KorJ9w==
From:   Colin King <colin.king@canonical.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: i810: Fix spelling mistake "constext" -> "context"
Date:   Fri, 27 Aug 2021 19:54:47 +0100
Message-Id: <20210827185447.507207-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a printk message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i810/i810_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
index 9fb4dd63342f..ef141d217a72 100644
--- a/drivers/gpu/drm/i810/i810_dma.c
+++ b/drivers/gpu/drm/i810/i810_dma.c
@@ -479,7 +479,7 @@ static void i810EmitContextVerified(struct drm_device *dev,
 			OUT_RING(tmp);
 			j++;
 		} else
-			printk("constext state dropped!!!\n");
+			printk("context state dropped!!!\n");
 	}
 
 	if (j & 1)
-- 
2.32.0

