Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5FBC00140
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Aug 2022 21:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240994AbiHEVrG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 Aug 2022 17:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240183AbiHEVq4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Aug 2022 17:46:56 -0400
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr [80.12.242.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E032376450
        for <kernel-janitors@vger.kernel.org>; Fri,  5 Aug 2022 14:46:54 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id K59foKolUKOP1K59foWKJI; Fri, 05 Aug 2022 23:46:53 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 05 Aug 2022 23:46:53 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Matthias Brugger <mbrugger@suse.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: pm-domains: Simplify some error message
Date:   Fri,  5 Aug 2022 23:46:49 +0200
Message-Id: <e6ba80d8e27fdb2b1527c7eae6687e481960c81d.1659735996.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

dev_err_probe() already prints the error code in a human readable way, so
there is no need to duplicate it as a numerical value at the end of the
message.

Fixes: 123e8b4fd0cd ("soc: mediatek: pm-domains: Add subsystem clocks")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 9734f1091c69..09e3c38b8466 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -393,7 +393,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
 			dev_err_probe(scpsys->dev, ret,
-				      "%pOF: failed to get clk at index %d: %d\n", node, i, ret);
+				      "%pOF: failed to get clk at index %d\n", node, i);
 			goto err_put_clocks;
 		}
 
@@ -405,8 +405,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
 			dev_err_probe(scpsys->dev, ret,
-				      "%pOF: failed to get clk at index %d: %d\n", node,
-				      i + clk_ind, ret);
+				      "%pOF: failed to get clk at index %d\n", node,
+				      i + clk_ind);
 			goto err_put_subsys_clocks;
 		}
 
-- 
2.34.1

