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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0D6C433E0
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 18:19:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D50165115
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Mar 2021 18:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236654AbhCPSTE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 Mar 2021 14:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236700AbhCPSSz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 Mar 2021 14:18:55 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3881C06174A
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Mar 2021 11:18:54 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id a15so18742117vsi.7
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Mar 2021 11:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJ6aVWc+2DYRFh7JhiecPzBTeIWZ23kP9Ncj0Hgb5u8=;
        b=CA9XXZQczMr3rXVm8yBvfZlviUajE2P9RmYD55v7/5HZmsI9RJLEBNpxUAW69/JdGK
         RcawmblHvKnbl1zWqARjNf/4mP/lbpU0jFfAjK5pr4KlvdqTyiiq2/FWTrVpNTqDjwtX
         lgknb7fqIyR4oX0ns4ibzh1ZyPaKrC9TzOjuKAQ5Wc5bfRgV1Qyjb+Kb6ThpdwAQ8Npx
         ehIfCmGnnpvhMQF9BXMKsu6g39D5DIZ08D47dn8yoPzc/ScwKCghG2wA0GDjOKXl/po9
         Ejv8NJRq667QoNGYOkL4/zJlS/+T74+cFnNTp8HuRI85msPsUVlMH0xF/3fsAMQNK01V
         x4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJ6aVWc+2DYRFh7JhiecPzBTeIWZ23kP9Ncj0Hgb5u8=;
        b=gyZEA7loRtpdQcNLOxkmPkehqL0VrBYLHjrShNtF6OkV1ZMinpY/uKdjtbTR4iRJnY
         HpLsEwXmNalAS8Lg6fo6gruByjW6hIrgapoh+LZ7Pr3TzSgo8LQLQ83oPeTXUAQPi8r0
         QyYxPo1dNIrqhYcu2/Z9ACvvo4rb1nVTMs7eYqWipYB6CJEgxVcfJ229aqZC3ffLet8s
         P4PbPzfu3GjWIsxR+zkgFR8skcpuHkymr6dqFrhE1SaagNbuHtB79FSq4CU6Vw8t/AzD
         cmMaguGiJB+lU66flsXSr4cM1Gf7HR/Ls66VZLlZsay7PzNfpQP/k2We2C0o2JNDEN9A
         oCMA==
X-Gm-Message-State: AOAM530XxW8hWvw8JVo1rkdLspkW5gjW6guzGEwlYD8e81sZSSplM0PZ
        urTMRbE/HKaFz/jnJbRCQ9qm4CGshRziGfwG
X-Google-Smtp-Source: ABdhPJwgciPyvakkHVWuMsnARvEJ82PmlK7Y6zHc0RvtHYl1jiB55gmIjINAYv5NUEwMeAz94pB/Hg==
X-Received: by 2002:a67:f842:: with SMTP id b2mr482841vsp.21.1615918733944;
        Tue, 16 Mar 2021 11:18:53 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id a198sm2527299vka.46.2021.03.16.11.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 11:18:53 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     forest@alittletooquiet.net, gregkh@linuxfoundation.org,
        arnd@arndb.de, devel@driverdev.osuosl.org
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH] staging: vt665x: fix alignment constraints
Date:   Tue, 16 Mar 2021 12:17:35 -0600
Message-Id: <20210316181736.2553318-1-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Removing 2 instances of alignment warnings

drivers/staging/vt6655/rxtx.h:153:1: warning: alignment 1 of ‘struct vnt_cts’ is less than 2 [-Wpacked-not-aligned]
drivers/staging/vt6655/rxtx.h:163:1: warning: alignment 1 of ‘struct vnt_cts_fb’ is less than 2 [-Wpacked-not-aligned]

The root cause seems to be that _because_ struct ieee80211_cts is marked as __aligned(2),
this requires any encapsulating struct to also have an alignment of 2.

Fixes: 2faf12c57efe ("staging: vt665x: fix alignment constraints")
Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/vt6655/rxtx.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.h b/drivers/staging/vt6655/rxtx.h
index e7061d383306..c3c2c1566882 100644
--- a/drivers/staging/vt6655/rxtx.h
+++ b/drivers/staging/vt6655/rxtx.h
@@ -150,7 +150,7 @@ struct vnt_cts {
 	u16 reserved;
 	struct ieee80211_cts data;
 	u16 reserved2;
-} __packed;
+} __packed __aligned(2);
 
 struct vnt_cts_fb {
 	struct vnt_phy_field b;
@@ -160,7 +160,7 @@ struct vnt_cts_fb {
 	__le16 cts_duration_ba_f1;
 	struct ieee80211_cts data;
 	u16 reserved2;
-} __packed;
+} __packed __aligned(2);
 
 struct vnt_tx_fifo_head {
 	u8 tx_key[WLAN_KEY_LEN_CCMP];
-- 
2.30.2

