Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49348C4743C
	for <kernel-janitors@archiver.kernel.org>; Wed, 23 Jun 2021 05:22:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23817610A0
	for <kernel-janitors@archiver.kernel.org>; Wed, 23 Jun 2021 05:22:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFWFZH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 23 Jun 2021 01:25:07 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:60532 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhFWFZG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Jun 2021 01:25:06 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d90 with ME
        id LVNn2500B21Fzsu03VNneq; Wed, 23 Jun 2021 07:22:48 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 23 Jun 2021 07:22:48 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     support.opensource@diasemi.com, lgirdwood@gmail.com,
        broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        Adam.Thomson.Opensource@diasemi.com
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ASoC: da7219: Fix an out-of-bound read in an error handling path
Date:   Wed, 23 Jun 2021 07:22:45 +0200
Message-Id: <4fdde55198294a07f04933f7cef937fcb654c901.1624425670.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If 'of_clk_add_hw_provider()' fails, the previous 'for' loop will have
run completely and 'i' is know to be 'DA7219_DAI_NUM_CLKS'.

In such a case, there will be an out-of-bounds access when using
'da7219->dai_clks_lookup[i]' and '&da7219->dai_clks_hw[i]'.

To avoid that, add a new label, 'err_free_all', which set the expected
value of 'i' in such a case.

Fixes: 78013a1cf297 ("ASoC: da7219: Fix clock handling around codec level probe")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/da7219.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 13009d08b09a..1e8b491d1fd3 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -2204,12 +2204,14 @@ static int da7219_register_dai_clks(struct snd_soc_component *component)
 					     da7219->clk_hw_data);
 		if (ret) {
 			dev_err(dev, "Failed to register clock provider\n");
-			goto err;
+			goto err_free_all;
 		}
 	}
 
 	return 0;
 
+err_free_all:
+	i = DA7219_DAI_NUM_CLKS - 1;
 err:
 	do {
 		if (da7219->dai_clks_lookup[i])
-- 
2.30.2

