Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CC6C433B4
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 May 2021 10:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEAE5600D4
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 May 2021 10:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239441AbhESKzy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 May 2021 06:55:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54828 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238667AbhESKzx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 May 2021 06:55:53 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1ljJqL-0000Tq-4b; Wed, 19 May 2021 10:54:25 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Henningsson <coding@diwic.se>,
        alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] ALSA: rawmidi: fix incorrect array bounds check on clock_names
Date:   Wed, 19 May 2021 11:54:24 +0100
Message-Id: <20210519105424.55221-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array bounds check on clock_names is currently checking the size
of the entire array rather than the number of elements in the array
leading to a potential array bounds read error. Fix this by using
the ARRAY_SIZE macro instead of sizeof.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: 08fdced60ca0 ("ALSA: rawmidi: Add framing mode")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/core/rawmidi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 4a6534db77d6..6c0a4a67ad2e 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1679,7 +1679,7 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 					    buffer_size, avail, xruns);
 				if (substream->framing == SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP) {
 					clock_type = substream->clock_type >> SNDRV_RAWMIDI_MODE_CLOCK_SHIFT;
-					if (!snd_BUG_ON(clock_type >= sizeof(clock_names)))
+					if (!snd_BUG_ON(clock_type >= ARRAY_SIZE(clock_names)))
 						snd_iprintf(buffer,
 							    "  Framing      : tstamp\n"
 							    "  Clock type   : %s\n",
-- 
2.31.1

