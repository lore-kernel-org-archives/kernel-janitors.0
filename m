Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8257EE49A0
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Aug 2023 06:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbjHUGWx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Aug 2023 02:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjHUGWw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Aug 2023 02:22:52 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A16AA102;
        Sun, 20 Aug 2023 23:22:15 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 7DC1B6061F466;
        Mon, 21 Aug 2023 14:22:06 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     airlied@redhat.com, tzimmermann@suse.de, airlied@gmail.com,
        daniel@ffwll.ch
Cc:     eich@suse.de, tiwai@suse.de, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Su Hui <suhui@nfschina.com>
Subject: [PATCH] drm/ast: Avoid possible NULL dereference
Date:   Mon, 21 Aug 2023 14:22:00 +0800
Message-Id: <20230821062159.198691-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

smatch error:
drivers/gpu/drm/ast/ast_dp501.c:227 ast_launch_m68k() error:
we previously assumed 'ast->dp501_fw' could be null (see line 223)

when "!ast->dp501_fw" and "ast_load_dp501_microcode(dev) >= 0" is true,
there will be a NULL dereference of 'ast->dp501_fw'.

Fixes: 12f8030e05c6 ("drm/ast: Actually load DP501 firmware when required")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/ast/ast_dp501.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 1bc35a992369..d9f3a0786a6f 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -224,8 +224,10 @@ static bool ast_launch_m68k(struct drm_device *dev)
 			    ast_load_dp501_microcode(dev) < 0)
 				return false;
 
-			fw_addr = (u8 *)ast->dp501_fw->data;
-			len = ast->dp501_fw->size;
+			if (ast->dp501_fw) {
+				fw_addr = (u8 *)ast->dp501_fw->data;
+				len = ast->dp501_fw->size;
+			}
 		}
 		/* Get BootAddress */
 		ast_moutdwm(ast, 0x1e6e2000, 0x1688a8a8);
-- 
2.30.2

