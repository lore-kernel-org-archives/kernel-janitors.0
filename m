Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF13C04A95
	for <kernel-janitors@archiver.kernel.org>; Sat, 22 Oct 2022 06:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbiJVGJE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 22 Oct 2022 02:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiJVGJC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 22 Oct 2022 02:09:02 -0400
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7F52B731C
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Oct 2022 23:09:01 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id m7gmoMnOL09yum7gnoVAtL; Sat, 22 Oct 2022 08:08:58 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 22 Oct 2022 08:08:58 +0200
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: imx: imx93-pd: Fix the error handling path of imx93_pd_probe()
Date:   Sat, 22 Oct 2022 08:08:55 +0200
Message-Id: <717cb5dee892bc01257d52b10bb9a1ee79ced87f.1666418916.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In imx93_pd_probe(); if an error occurs, some resources need to be released
as done in the remove function.

Fixes: 0a0f7cc25d4a ("soc: imx: add i.MX93 SRC power domain driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/soc/imx/imx93-pd.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/imx93-pd.c b/drivers/soc/imx/imx93-pd.c
index 1f3d7039c1de..4d235c8c4924 100644
--- a/drivers/soc/imx/imx93-pd.c
+++ b/drivers/soc/imx/imx93-pd.c
@@ -135,11 +135,24 @@ static int imx93_pd_probe(struct platform_device *pdev)
 
 	ret = pm_genpd_init(&domain->genpd, NULL, domain->init_off);
 	if (ret)
-		return ret;
+		goto err_clk_unprepare;
 
 	platform_set_drvdata(pdev, domain);
 
-	return of_genpd_add_provider_simple(np, &domain->genpd);
+	ret = of_genpd_add_provider_simple(np, &domain->genpd);
+	if (ret)
+		goto err_genpd_remove;
+
+	return 0;
+
+err_genpd_remove:
+	pm_genpd_remove(&domain->genpd);
+
+err_clk_unprepare:
+	if (!domain->init_off)
+		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
+
+	return ret;
 }
 
 static const struct of_device_id imx93_pd_ids[] = {
-- 
2.34.1

