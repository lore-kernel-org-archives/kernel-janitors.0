Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEE3C07E9B
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jul 2021 10:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0412660FF4
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jul 2021 10:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236060AbhGSJuH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jul 2021 05:50:07 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:46406
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235172AbhGSJuF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jul 2021 05:50:05 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 649FB40207;
        Mon, 19 Jul 2021 10:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626690644;
        bh=hya7L108CUJRjE5JN1TFdEqd6eaNpO4wxcvgoKtlo4E=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=r9RMg/uw6Hh0RhemOxOA48/WC6wWMhhZaTazsd8bzf7WwLE8AB4J75mBB7uW50AF7
         VdpuGf9RK92KMGZ+cUWE1DlZKQx7mUALg/5RPu0gfIGo214asrEAg60n7OO/Zt0JkV
         13eoczS+BP/jC+vSG4Sytsmyce6xonS/4dHd1/75ufQjiywSeVYJnSMsoOlYlUlYml
         O8/p26IDhLgfhPNA/FGMOJkEiD3AXws/Nmf37a0IflXM8YC3cRlzC2cUC+hspIUsOa
         D1RCIgtzQMVdoGlyfACT63DD4jlzv7p4w+J1vchiLIiJRz3l07/EjK5xJUTHhiUkd5
         wLxe7hE61o0KA==
From:   Colin King <colin.king@canonical.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] sound: Fix spelling mistake "synchronization" -> "synchronization"
Date:   Mon, 19 Jul 2021 11:30:44 +0100
Message-Id: <20210719103044.15315-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/drivers/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/Kconfig b/sound/drivers/Kconfig
index 7141f73cddd3..ca4cdf666f82 100644
--- a/sound/drivers/Kconfig
+++ b/sound/drivers/Kconfig
@@ -102,7 +102,7 @@ config SND_ALOOP
 	  configured number of substreams (see the pcm_substreams module
 	  parameter).
 
-	  The loopback device allows time sychronization with an external
+	  The loopback device allows time synchronization with an external
 	  timing source using the time shift universal control (+-20%
 	  of system time).
 
-- 
2.31.1

