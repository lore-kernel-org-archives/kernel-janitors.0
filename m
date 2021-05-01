Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928DBC433ED
	for <kernel-janitors@archiver.kernel.org>; Sat,  1 May 2021 15:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B74761606
	for <kernel-janitors@archiver.kernel.org>; Sat,  1 May 2021 15:13:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhEAPOM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 1 May 2021 11:14:12 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:56171 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhEAPOL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 1 May 2021 11:14:11 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d06 with ME
        id zTDH2400S21Fzsu03TDJFe; Sat, 01 May 2021 17:13:20 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 01 May 2021 17:13:20 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     hjc@rock-chips.com, heiko@sntech.de, airlied@linux.ie,
        daniel@ffwll.ch, miquel.raynal@bootlin.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/rockchip: Fix an error handling path
Date:   Sat,  1 May 2021 17:13:16 +0200
Message-Id: <248220d4815dc8c8088cebfab7d6df5f70518438.1619881852.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'ret' is know to be 0 a this point. Checking the return value of
'phy_init()' and 'phy_set_mode()' was intended instead.

So add the missing assignments.

Fixes: cca1705c3d89 ("drm/rockchip: lvds: Add PX30 support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index bd5ba10822c2..489d63c05c0d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -499,11 +499,11 @@ static int px30_lvds_probe(struct platform_device *pdev,
 	if (IS_ERR(lvds->dphy))
 		return PTR_ERR(lvds->dphy);
 
-	phy_init(lvds->dphy);
+	ret = phy_init(lvds->dphy);
 	if (ret)
 		return ret;
 
-	phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
+	ret = phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
 	if (ret)
 		return ret;
 
-- 
2.30.2

