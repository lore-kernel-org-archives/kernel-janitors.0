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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D7CC433E0
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 05:44:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D1C764F2C
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 05:44:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhCLFoW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Mar 2021 00:44:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhCLFn5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Mar 2021 00:43:57 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91F6C061574
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 21:43:56 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id w76so11939568vsw.10
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 21:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNZ6zPF3bFreaqUvLgJ3QL9jFhrBQtGUItEnZtcgyxw=;
        b=VtLk0do76Mz22ErsrWosikZs4jUQ7kGXhTejAHOUzOyWP3UWfo7Gf7vKE5wwxGARBi
         VR3q6jGHqk4YO3j+YGIalKz7S6c8ST+FMiQSX2vLWzNdE9k4duCFHjLUTFTI6mu8lSzh
         2wcfwPp2zl3WRl8ZodHP3gqTwxjiR3BYORCLAj8zjd2+339Cc93DcuVfHS/+AHvH2ac+
         ExekYjL5mzagqJqRuLi0Cmzkm6G3eEH7ZTK7zJne5iBp4HADo3LISooSrJRzevvB7Ls9
         eHmkohkpzTtiQ8TAfKh+qKuVoGtqCc/VOR6GcyZCqx3rUEzJFw5AqlBwiuHqF2wyHDDW
         yyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNZ6zPF3bFreaqUvLgJ3QL9jFhrBQtGUItEnZtcgyxw=;
        b=lXK0xDUwc8N/JZcuf4Z3au6RJ06/dcTSOZ/ti9Cgr8QXlUvStcGaDv54ngH0NADCE/
         mpSdhxvDmJpkVwOxQslkhGpguIVBXm3Cz9U/7OgqESS/bOd2sjBXAxlKYBTy/jEIh1Y8
         fpeeCU25o0NYfko3Wc8kg3IE8UGtc5mjyHvOY9ovRYlTSYNpMjracs6CzhBht6b9ZHsg
         I0Pse+zub9WQS6vuj7El0jUS9kdgaeyt/829yh/s/xIw+MKv+d4QlzPQqeWaARnBl5mS
         BKBe6iF7V9Ujn4MBkOqhDYEKpQH7EEo1EcdQ+hszmN7/QoJ0G8yymKSP8sLI+CQKkqCi
         16aQ==
X-Gm-Message-State: AOAM531uZXaI3LqeZToH7avVPiOWP1BaLwCHf9fM9XKxgEG7enC8J9/v
        7Udkd4wE/SBH0ELlDSE57QFzzoX3TWnqZA==
X-Google-Smtp-Source: ABdhPJyNRX08T43ZGSJH3dbn3JiuulL8lEgICGjk70FDdI/Z4opPy17Fwq1q18msohjx8yjcU95RNA==
X-Received: by 2002:a67:2dc1:: with SMTP id t184mr7376398vst.56.1615527835820;
        Thu, 11 Mar 2021 21:43:55 -0800 (PST)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id r5sm680062vkf.43.2021.03.11.21.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 21:43:55 -0800 (PST)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     kernel-janitors@vger.kernel.org
Cc:     arnd@arndb.de, Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH] staging: vt665x: fix alignment constraints
Date:   Thu, 11 Mar 2021 23:43:25 -0600
Message-Id: <20210312054325.1706332-1-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Removing 2 instances of alignment warnings

drivers/staging/vt6655/rxtx.h:153:1: warning: alignment 1 of ‘struct vnt_cts’ is less than 2 [-Wpacked-not-aligned]
drivers/staging/vt6655/rxtx.h:163:1: warning: alignment 1 of ‘struct vnt_cts_fb’ is less than 2 [-Wpacked-not-aligned]

This patch is related to 2faf12c57ef (staging: vt665x: fix alignment constraints, 2021-02-04)

The root cause seems to be that _because_ struct ieee80211_cts is marked as __aligned(2),
this requires any encapsulating struct to also have an alignment of 2.

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
2.30.1

