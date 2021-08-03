Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B820C4338F
	for <kernel-janitors@archiver.kernel.org>; Tue,  3 Aug 2021 12:28:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 269FB60F70
	for <kernel-janitors@archiver.kernel.org>; Tue,  3 Aug 2021 12:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235533AbhHCM2w (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 3 Aug 2021 08:28:52 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:49830
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235309AbhHCM2w (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Aug 2021 08:28:52 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id D154A3F09C;
        Tue,  3 Aug 2021 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627993719;
        bh=oXGtMXBZ6/OGmpA64zDaYIoChgBpydPk9ddxo6Jrg+c=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=cl6lKJkA1kWqtnek77yG6ZDauzengYEyslQAmlke+/fKzcUd5URP+119L6+WU4+0J
         vufZbJu/7E2+bvdxVwlBBfgO9FEyuOOOtAH9/9kPLQPfuDDZHO0Dna27WuGK2J+aBr
         yGtbQOaRQ+gu2mUOXIbDzUpN1kT73/BC48lbrSUPKJbD3A+R8xzguds9yWO2QdOBmm
         +/2kl6c0ZOMYamQv3YsqP8Ydziv70so/hF/HmYgzV325PQq4i7P49ryTu19ixD0yIe
         KCbhtM5JuEMLA0Ti84hcJaT4Klobkthv1o1AQwto30KyIFZtsMrgtBkM9eA7JHLMeI
         vwJQ9N/nJjkPA==
From:   Colin King <colin.king@canonical.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] ALSA: usb-audio: make array static const, makes object smaller
Date:   Tue,  3 Aug 2021 13:28:39 +0100
Message-Id: <20210803122839.7143-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate array names_to_check on the stack but instead it
static.  Makes the object code smaller by 56 bytes.  Also clean
up checkpatch warning by adding extra const for names_to_check
and pointer s.

Before:
    text    data     bss     dec     hex filename
  103512   34380       0  137892   21aa4 ./sound/usb/mixer.o

After:
    text    data     bss     dec     hex filename
  103264   34572       0  137836   21a6c ./sound/usb/mixer.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Clean up checkpatch warning on const-ness for names_to_check.
    Add extra const to clean up build warning on pointer s.
---
 sound/usb/mixer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index db7cb6b6dc4e..43bc59575a6e 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1572,9 +1572,9 @@ static size_t append_ctl_name(struct snd_kcontrol *kctl, const char *str)
 static void check_no_speaker_on_headset(struct snd_kcontrol *kctl,
 					struct snd_card *card)
 {
-	const char *names_to_check[] = {
+	static const char * const names_to_check[] = {
 		"Headset", "headset", "Headphone", "headphone", NULL};
-	const char **s;
+	const char * const *s;
 	bool found = false;
 
 	if (strcmp("Speaker", kctl->id.name))
-- 
2.31.1

