Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50A4C43460
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 08:34:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 957CA60FF1
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 08:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhETIfx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 May 2021 04:35:53 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58421 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhETIfx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 May 2021 04:35:53 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lje8P-00027g-0B; Thu, 20 May 2021 08:34:25 +0000
From:   Colin King <colin.king@canonical.com>
To:     Clemens Ladisch <clemens@ladisch.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] ALSA: firewire-lib: Fix uninitialized variable err issue
Date:   Thu, 20 May 2021 09:34:24 +0100
Message-Id: <20210520083424.6685-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently in the case where the payload_length is less than the
cip_header_size the error return variable err is not being set
and function parse_ir_ctx_header can return an uninitialized
error return value. Fix this by setting err to zero.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: c09010eeb373 ("ALSA: firewire-lib: handle the case that empty isochronous packet payload for CIP")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/firewire/amdtp-stream.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index af5c3629f1ac..242b1147d768 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -663,6 +663,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 		} else {
 			// Handle the cycle so that empty packet arrives.
 			cip_header = NULL;
+			err = 0;
 			*data_blocks = 0;
 			*syt = 0;
 		}
-- 
2.31.1

