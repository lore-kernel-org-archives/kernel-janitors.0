Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3608C48BE5
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 14:22:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1D7F61450
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 14:22:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbhFOOYf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Jun 2021 10:24:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33836 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbhFOOXB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Jun 2021 10:23:01 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lt9vt-0003Rp-3k; Tue, 15 Jun 2021 14:20:49 +0000
From:   Colin King <colin.king@canonical.com>
To:     Clemens Ladisch <clemens@ladisch.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] ALSA: bebob: Fix bit flag quirk constants
Date:   Tue, 15 Jun 2021 15:20:48 +0100
Message-Id: <20210615142048.59900-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The quirking bit-flags are currently set as contiguous integer enum values
and so currently SND_BEBOB_QUIRK_INITIAL_DISCONTINUOUS_DBC is zero and so
he quirking never getting set or tested correctly for this quirk. Fix this
by setting the quirking constants as shifted bit values.

Addresses-Coverity: ("Bitwise-and with zero")
Fixes: 93cd12d6e88a ("ALSA: bebob: code refactoring for model-dependent quirks")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/firewire/bebob/bebob.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index c06579d9380e..4d73ecb30d79 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -76,8 +76,8 @@ struct snd_bebob_spec {
 };
 
 enum snd_bebob_quirk {
-	SND_BEBOB_QUIRK_INITIAL_DISCONTINUOUS_DBC,
-	SND_BEBOB_QUIRK_WRONG_DBC,
+	SND_BEBOB_QUIRK_INITIAL_DISCONTINUOUS_DBC = (1 << 0),
+	SND_BEBOB_QUIRK_WRONG_DBC		  = (1 << 1),
 };
 
 struct snd_bebob {
-- 
2.31.1

