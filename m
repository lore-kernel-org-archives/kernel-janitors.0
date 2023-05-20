Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C3DC77B7A
	for <kernel-janitors@archiver.kernel.org>; Sat, 20 May 2023 14:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjETOs3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 20 May 2023 10:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjETOs2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 20 May 2023 10:48:28 -0400
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42691116
        for <kernel-janitors@vger.kernel.org>; Sat, 20 May 2023 07:48:26 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id 0NsaqFMzTeM6M0NsaqgBHC; Sat, 20 May 2023 16:48:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1684594104;
        bh=xlCNSpYIx4Q8P0eGlPFP+zmi7PyQkFEulkiKsfmFMe0=;
        h=From:To:Cc:Subject:Date;
        b=kyxN6/xcEUZaNVqZX14x0TxlXwiJz7wRFmXY2e5XyX4ujmXgp4CsKYz3gg6Ak1Gjh
         LfGy732H4WrerhkumLSW82tnOjo6wByee5faFkuYOQZ4qwlh/9b0Y380N1WMsSrO+3
         5rIM6bfS5qjNbMPNN739Jf6rFydfI9pxUW1sxOMr5VWUuaiL3dExT6COVb6Atd8/e3
         BkMfcUF2QheLavBdtfQ1QQuvTSZIOKJ5GdDxHAi6M0FuBWKHfW7YJ7rp0zoapPkV1K
         UUbalI5DbIrYLRX2nRtyPlQxh7E5NBvuCRi38G56PmEJEWP4sbKSxspC6NJP+cOu8T
         l9YG/DKrYWBzQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 May 2023 16:48:24 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: adau1761: Use the devm_clk_get_optional() helper
Date:   Sat, 20 May 2023 16:48:19 +0200
Message-Id: <ab0fe7e7ecf965df84b9516ba65428af9b3805c1.1684594081.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use devm_clk_get_optional() instead of hand writing it.
This saves some LoC and improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/adau17x1.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
index 634d4dbca5ec..f2932713b4de 100644
--- a/sound/soc/codecs/adau17x1.c
+++ b/sound/soc/codecs/adau17x1.c
@@ -1059,13 +1059,12 @@ int adau17x1_probe(struct device *dev, struct regmap *regmap,
 	if (!adau)
 		return -ENOMEM;
 
-	adau->mclk = devm_clk_get(dev, "mclk");
-	if (IS_ERR(adau->mclk)) {
-		if (PTR_ERR(adau->mclk) != -ENOENT)
-			return PTR_ERR(adau->mclk);
-		/* Clock is optional (for the driver) */
-		adau->mclk = NULL;
-	} else if (adau->mclk) {
+	/* Clock is optional (for the driver) */
+	adau->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(adau->mclk))
+		return PTR_ERR(adau->mclk);
+
+	if (adau->mclk) {
 		adau->clk_src = ADAU17X1_CLK_SRC_PLL_AUTO;
 
 		/*
-- 
2.34.1

