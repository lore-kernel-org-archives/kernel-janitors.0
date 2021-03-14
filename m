Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0795CC433E9
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 15:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C112164EC4
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 15:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhCNPCy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhCNPCb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 14 Mar 2021 11:02:31 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B085C061574
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Mar 2021 08:02:31 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id k76so2307829vkk.10
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Mar 2021 08:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sdpged4MGNfj7KeAJcqoodmGIMmG2GS7cm1JBj0925c=;
        b=ZWvbUXiJkY6i1PKBJ+6CNRhdoi459Mqs48O/E5dzgLflz+VLF5vOMcwyq2PryPP76i
         hI4MQTt/u4bycL1qMgg4IP+Wr+G7GgOCGM9OGdbsaBAGByQT8845L5yDZmx5twBBvBOP
         QwPeT1SJiThEsRTFCdtpYNfJesupchXDvv8gYR3SEIYwI747pN6iqVNzWAUhHUtHrjHR
         OmcCcH/UKjaCL57VavNQJyYJnIzWOAWTxXgfRAQgo7x2OCyTj03iKIKOLPVKpss+UL9l
         n9dpKSsbDe++i9N3WB5Jill2lWHPqUheV5ge8IeEm2JVhPGdQjtQqeBmZvPd0Qd67teW
         aZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sdpged4MGNfj7KeAJcqoodmGIMmG2GS7cm1JBj0925c=;
        b=uMI+Tyxca4pOzfD9Z1vGoP5ELzu9ZU1VKxcwMOjURV1Mapyuw8xaZV5ukrlzrYJSMI
         iDK83mLwlx2L+39zU0zc0NR9V2bfXrlwbD7Na8bxWQMt+iJgo3uYTqTbdYKXvVi57kNM
         rFhw1+vJYrZQUnyC9X7+VxYcNz5FV6jMsFhSbLS977pABmsOWmm1Q37NCGoAi8bkrgZz
         Li6Q6cWfSSijUCFN7La+GAJu5h1nWh9X1vZOUZwmZc6Lx64XU5jEwLkZD4uPVYkLqNh2
         wHL+JzKXvaFb78fCORhDodXen6hPoTQ3z4RXTsz7udTQO2ARyzBCAi07MPIWcYgh+4nV
         k/YQ==
X-Gm-Message-State: AOAM530uCKBwisnkegJdPNXKZJ7nNJQjMiT4mWrlJW+m2ct0kUFxsls8
        e7c3CmP7d2qS4uVeg92QTHU=
X-Google-Smtp-Source: ABdhPJw5LZ6VVeXV9nhgrl1wPEn3YpBo8iEH0k12CsV/MvcWFfFYHvYwSWPZHYtQFN50P3E70dZ0YA==
X-Received: by 2002:a1f:2302:: with SMTP id j2mr11641084vkj.23.1615734150302;
        Sun, 14 Mar 2021 08:02:30 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id 4sm583451vsl.19.2021.03.14.08.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:02:30 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 3/3] staging: vt6655: remove duplicate code
Date:   Sun, 14 Mar 2021 08:59:43 -0600
Message-Id: <20210314145943.1933245-3-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210314145943.1933245-1-eantoranz@gmail.com>
References: <20210314145943.1933245-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In the definition of vnt_init_bands(), there are two sections of
code that are very similar. Unifying them through a new
function that takes care of initialization of a single band.

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/vt6655/channel.c | 38 +++++++++++++++-----------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index ba92b7259ec6..cf46ee63681a 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -114,40 +114,38 @@ static struct ieee80211_supported_band vnt_supported_5ghz_band = {
 	.n_bitrates = ARRAY_SIZE(vnt_rates_a),
 };
 
-void vnt_init_bands(struct vnt_private *priv)
+static void vnt_init_band(struct vnt_private *priv,
+			  struct ieee80211_supported_band *supported_band,
+			  enum nl80211_band band)
 {
-	struct ieee80211_channel *ch;
 	int i;
 
+	for (i = 0; i < supported_band->n_channels; i++) {
+		supported_band->channels[i].max_power = 0x3f;
+		supported_band->channels[i].flags =
+			IEEE80211_CHAN_NO_HT40;
+	}
+
+	priv->hw->wiphy->bands[band] = supported_band;
+}
+
+void vnt_init_bands(struct vnt_private *priv)
+{
 	switch (priv->byRFType) {
 	case RF_AIROHA7230:
 	case RF_UW2452:
 	case RF_NOTHING:
 	default:
-		ch = vnt_channels_5ghz;
-
-		for (i = 0; i < ARRAY_SIZE(vnt_channels_5ghz); i++) {
-			ch[i].max_power = 0x3f;
-			ch[i].flags = IEEE80211_CHAN_NO_HT40;
-		}
-
-		priv->hw->wiphy->bands[NL80211_BAND_5GHZ] =
-						&vnt_supported_5ghz_band;
+		vnt_init_band(priv, &vnt_supported_5ghz_band,
+			      NL80211_BAND_5GHZ);
 		fallthrough;
 	case RF_RFMD2959:
 	case RF_AIROHA:
 	case RF_AL2230S:
 	case RF_UW2451:
 	case RF_VT3226:
-		ch = vnt_channels_2ghz;
-
-		for (i = 0; i < ARRAY_SIZE(vnt_channels_2ghz); i++) {
-			ch[i].max_power = 0x3f;
-			ch[i].flags = IEEE80211_CHAN_NO_HT40;
-		}
-
-		priv->hw->wiphy->bands[NL80211_BAND_2GHZ] =
-						&vnt_supported_2ghz_band;
+		vnt_init_band(priv, &vnt_supported_2ghz_band,
+			      NL80211_BAND_2GHZ);
 		break;
 	}
 }
-- 
2.30.1

