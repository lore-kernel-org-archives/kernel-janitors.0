Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113B5C47082
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 16:06:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0C7C6100B
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 16:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235429AbhEZQHw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 May 2021 12:07:52 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34446 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235382AbhEZQHw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 May 2021 12:07:52 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1llw2y-0006jH-K7; Wed, 26 May 2021 16:06:16 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Connor McAdams <conmanx360@gmail.com>,
        alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] ALSA: hda/ca0132: Make a const array static, makes object smaller
Date:   Wed, 26 May 2021 17:06:16 +0100
Message-Id: <20210526160616.3764119-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array dsp_dma_stream_ids the stack but instead
make it static. Makes the object code smaller by 21 bytes.

Before:
   text    data     bss     dec     hex filename
 189012   70376     192  259580   3f5fc ./sound/pci/hda/patch_ca0132.o

After:
   text    data     bss     dec     hex filename
 188927   70440     192  259559   3f5e7 ./sound/pci/hda/patch_ca0132.o

(gcc version 10.3.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/hda/patch_ca0132.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 49b4fdd2feab..b66e7bdbf483 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -7598,7 +7598,7 @@ static void ca0132_alt_free_active_dma_channels(struct hda_codec *codec)
  */
 static void ca0132_alt_start_dsp_audio_streams(struct hda_codec *codec)
 {
-	const unsigned int dsp_dma_stream_ids[] = { 0x0c, 0x03, 0x04 };
+	static const unsigned int dsp_dma_stream_ids[] = { 0x0c, 0x03, 0x04 };
 	struct ca0132_spec *spec = codec->spec;
 	unsigned int i, tmp;
 
-- 
2.31.1

