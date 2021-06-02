Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CF5C4708F
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 10:37:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC1C56138C
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 10:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbhFBKjk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Jun 2021 06:39:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51795 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232539AbhFBKjT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Jun 2021 06:39:19 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1loOFW-0001Bi-Eu; Wed, 02 Jun 2021 10:37:22 +0000
From:   Colin King <colin.king@canonical.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: rsnd: check for zero node count
Date:   Wed,  2 Jun 2021 11:37:22 +0100
Message-Id: <20210602103722.12128-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to rsnd_node_count can potentially return a zero node count
so add a check for this corner case. (Note that the two other calls
to rsnd_node_count in the kernel perform this check, so I think it
justifies adding this). This avoids using a zero nr in a devm_kcalloc
call.

Addresses-Coverity: ("Unchecked return value")
Fixes: c413983eb66a ("ASoC: rsnd: adjust disabled module")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
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

