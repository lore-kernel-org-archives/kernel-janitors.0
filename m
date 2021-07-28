Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EE9C4338F
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Jul 2021 10:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3839D60FC2
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Jul 2021 10:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbhG1KgH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 28 Jul 2021 06:36:07 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:53378
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232231AbhG1KgG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Jul 2021 06:36:06 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 286E63F245;
        Wed, 28 Jul 2021 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627468564;
        bh=X0DrZSFLZf175Lh2Gia6ktHZuwvpS8paTwWSPxV8GHA=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=T6Y2WsacwjCrVOGIAr0Do6u3JceM7xIZX3vQxqhljqaU74Qw8MZf9tQobWPEnxyTX
         1emVK4+0r/5KP+BzYfWjEo/QG0dv5rm3Y0jJigCN5qLXd8DiM7eVbNKxpXJI4AteuR
         NLsta805WyClfdupYkSPOBbQTHbYNtWyPoY8h2gJroexvxJOX6KWsTSY0kh0ghVPCR
         eRxc8Y9JNozJ7ZQQVAU1MgHf3GvgbsmHIpoubS7RC7k4m598VZIpCLoP17M1dk4NyT
         FFDZDM4o5kUgEa5u6AwVUYdQDQdkLg42eZtUqEhKqBcmF1/3XOgpoMxt353ZwkRYpI
         uGemIUG0atygA==
From:   Colin King <colin.king@canonical.com>
To:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jie Yang <yang.jie@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: Fix spelling contraction "cant" -> "can't"
Date:   Wed, 28 Jul 2021 11:36:02 +0100
Message-Id: <20210728103602.171817-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/intel/atom/sst/sst_ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst_ipc.c b/sound/soc/intel/atom/sst/sst_ipc.c
index a8a9aa0057d3..4e8382097e61 100644
--- a/sound/soc/intel/atom/sst/sst_ipc.c
+++ b/sound/soc/intel/atom/sst/sst_ipc.c
@@ -128,7 +128,7 @@ int sst_post_message_mrfld(struct intel_sst_drv *sst_drv_ctx,
 		while (header.p.header_high.part.busy) {
 			if (loop_count > 25) {
 				dev_err(sst_drv_ctx->dev,
-					"sst: Busy wait failed, cant send this msg\n");
+					"sst: Busy wait failed, can't send this msg\n");
 				retval = -EBUSY;
 				goto out;
 			}
-- 
2.31.1

