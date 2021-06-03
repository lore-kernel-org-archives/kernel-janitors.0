Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7702C47096
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Jun 2021 11:37:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D839613E6
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Jun 2021 11:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhFCLiw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 3 Jun 2021 07:38:52 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35663 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhFCLiv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Jun 2021 07:38:51 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lolel-0004sI-6m; Thu, 03 Jun 2021 11:36:59 +0000
From:   Colin King <colin.king@canonical.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Lee Jones <lee.jones@linaro.org>, alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2][next] ASoC: rk817: remove redundant assignment to pointer node, add missing of_node_put
Date:   Thu,  3 Jun 2021 12:36:59 +0100
Message-Id: <20210603113659.82031-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer node is being initialized with a value that is never read and
it is being updated later with a new value.  The initialization is
redundant and can be removed.

The function is missing a of_node_put on node, fix this by adding the call
before returning.

Addresses-Coverity: ("Unused value")
Fixes: 0d6a04da9b25 ("ASoC: Add Rockchip rk817 audio CODEC support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: Add missing of_node_put call, kudos to Dan Carpenter for spotting this 
    issue.
---
 sound/soc/codecs/rk817_codec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index fd3a5ba034a9..a44d3cad1119 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -456,7 +456,7 @@ static const struct snd_soc_component_driver soc_codec_dev_rk817 = {
 static void rk817_codec_parse_dt_property(struct device *dev,
 					 struct rk817_codec_priv *rk817)
 {
-	struct device_node *node = dev->parent->of_node;
+	struct device_node *node;
 
 	node = of_get_child_by_name(dev->parent->of_node, "codec");
 	if (!node) {
@@ -466,6 +466,8 @@ static void rk817_codec_parse_dt_property(struct device *dev,
 
 	rk817->mic_in_differential =
 			of_property_read_bool(node, "rockchip,mic-in-differential");
+
+	of_node_put(node);
 }
 
 static int rk817_platform_probe(struct platform_device *pdev)
-- 
2.31.1

