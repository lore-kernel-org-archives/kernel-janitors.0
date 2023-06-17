Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E33EB64DA
	for <kernel-janitors@archiver.kernel.org>; Sat, 17 Jun 2023 10:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjFQKpB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 17 Jun 2023 06:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235451AbjFQKnZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 17 Jun 2023 06:43:25 -0400
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCD210C8
        for <kernel-janitors@vger.kernel.org>; Sat, 17 Jun 2023 03:43:23 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id ATOnqRvYtW2GfATOnqWHgB; Sat, 17 Jun 2023 12:43:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1686998601;
        bh=dKDAfxkXlHVsJUzF+jDhXkw3h2hy4fQcOsDAMiH6vY4=;
        h=From:To:Cc:Subject:Date;
        b=N/+2G7ro0cOieiYfSGRu4oOD4rzio+1S+cwLFwFObllOAg8gR9n3DI6lSql7Ys5yO
         bDXtmMNOuAnwGZLvBScxHFBcFKktnUhVoBqWBMyyVJ43QAWohlcMcEuz0E1nS7ajAI
         rbtw+vf3nqzq9Y8YAOTzCF3kFZlKtIASBcXAyNQEGtNysmwhHZcz8KyrfX8NbrOvmg
         /f0GsPsJPxW7DygrYPTAyZ+399BQdlioSgCEMqvAaZIBQB783lHDJaOrLgEHc4D8WA
         nygElOWOyjkpM5Mi6QzVPrRra6cZ2iSmDm95azheQieqVvlXHGqh0Uqyu1F4VsTEwj
         X5oa76s2Az5YA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 17 Jun 2023 12:43:21 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Lee Jones <lee@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mfd: stmpe: Fix a corner case in stmpe_probe()
Date:   Sat, 17 Jun 2023 12:43:16 +0200
Message-Id: <8de3aaf297931d655b9ad6aed548f4de8b85425a.1686998575.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In stmpe_probe(), if some regulator_enable() calls fail, probing continues
and there is only a dev_warn().

So, if stmpe_probe() is called the regulator may not be enabled. It is
cleaner to test it before calling regulator_disable() in the remove
function.

Fixes: 9c9e321455fb ("mfd: stmpe: add optional regulators")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mfd/stmpe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index a92301dfc712..9c3cf58457a7 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1485,9 +1485,9 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 
 void stmpe_remove(struct stmpe *stmpe)
 {
-	if (!IS_ERR(stmpe->vio))
+	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
 		regulator_disable(stmpe->vio);
-	if (!IS_ERR(stmpe->vcc))
+	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
 		regulator_disable(stmpe->vcc);
 
 	__stmpe_disable(stmpe, STMPE_BLOCK_ADC);
-- 
2.34.1

