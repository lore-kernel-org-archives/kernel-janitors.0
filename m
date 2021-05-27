Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB74C47089
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 May 2021 06:10:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BEAD613D8
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 May 2021 06:10:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234895AbhE0GMB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 May 2021 02:12:01 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:52538 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234847AbhE0GMA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 May 2021 02:12:00 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d25 with ME
        id 9iAS2500H21Fzsu03iAThz; Thu, 27 May 2021 08:10:27 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 27 May 2021 08:10:27 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     anitha.chrisanthus@intel.com, edmund.j.dea@intel.com,
        airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/2] drm/kmb: Do not report 0 (success) in case of error
Date:   Thu, 27 May 2021 08:10:25 +0200
Message-Id: <8b7f10d6373e117cc26487e1c6963e637bc01dee.1622095610.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <91d2b0417ccb8497b977e175b0b44417e47405aa.1622095610.git.christophe.jaillet@wanadoo.fr>
References: <91d2b0417ccb8497b977e175b0b44417e47405aa.1622095610.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'ret' is known to be 0 at this point.
Reporting the error from the previous 'platform_get_irq()' call is likely,
so add the missing assignment.

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: New patch
---
 drivers/gpu/drm/kmb/kmb_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index fa28e42da460..d9e10ac9847c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -138,6 +138,7 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	irq_lcd = platform_get_irq(pdev, 0);
 	if (irq_lcd < 0) {
 		drm_err(&kmb->drm, "irq_lcd not found");
+		ret = irq_lcd;
 		goto setup_fail;
 	}
 
-- 
2.30.2

