Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F88C433DB
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 Mar 2021 08:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 440196191D
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 Mar 2021 08:48:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhC3Iro (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 Mar 2021 04:47:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36952 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhC3Ir3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 Mar 2021 04:47:29 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lRA1m-0004fg-PJ; Tue, 30 Mar 2021 08:47:10 +0000
From:   Colin King <colin.king@canonical.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Argus Lin <argus.lin@mediatek.com>,
        alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: mediatek: mt6359: Fix spelling mistake "reate" -> "create"
Date:   Tue, 30 Mar 2021 09:47:10 +0100
Message-Id: <20210330084710.997731-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/mt6359-accdet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 0bef6eaad5ad..4222aed013f1 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -1019,7 +1019,7 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 	priv->jd_workqueue = create_singlethread_workqueue("mt6359_accdet_jd");
 	INIT_WORK(&priv->jd_work, mt6359_accdet_jd_work);
 	if (!priv->jd_workqueue) {
-		dev_err(&pdev->dev, "Failed to reate jack detect workqueue\n");
+		dev_err(&pdev->dev, "Failed to create jack detect workqueue\n");
 		ret = -1;
 		goto err_eint_wq;
 	}
-- 
2.30.2

