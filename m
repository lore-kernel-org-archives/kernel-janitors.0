Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B88DC47082
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Jun 2021 11:03:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69EB461003
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Jun 2021 11:03:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhFCLFO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 3 Jun 2021 07:05:14 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34723 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhFCLFO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Jun 2021 07:05:14 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lol87-0001vJ-K7; Thu, 03 Jun 2021 11:03:15 +0000
From:   Colin King <colin.king@canonical.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] ASoC: rsnd: check for zero node count
Date:   Thu,  3 Jun 2021 12:03:15 +0100
Message-Id: <20210603110315.81146-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Most callers of_get_child_count() check that "nr" is non-zero so it
causes a static checker warning when we don't do that here.  This
does not cause a problem or a crash, but having zero SSUIes does not
make sense either so let's add a check.

Addresses-Coverity: ("Unchecked return value")
Fixes: c413983eb66a ("ASoC: rsnd: adjust disabled module")
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: Rephrase commit message based on Dan Carpenter's suggestion.
    Thanks Dan!
---

 sound/soc/sh/rcar/ssiu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index 5682c74bb7ff..0d8f97633dd2 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -515,6 +515,9 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 	else
 		nr = priv->ssi_nr;
 
+	if (!nr)
+		return -EINVAL;
+
 	ssiu	= devm_kcalloc(dev, nr, sizeof(*ssiu), GFP_KERNEL);
 	if (!ssiu)
 		return -ENOMEM;
-- 
2.31.1

