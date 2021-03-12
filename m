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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBB6C4332B
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 15:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87A6E64FC3
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 15:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhCLPAP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Mar 2021 10:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbhCLPAC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Mar 2021 10:00:02 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965D8C061574
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 07:00:02 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id m18so12675125vsa.1
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 07:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PLL4V/pkjsui/1u55ShevcHZ/Q68ADdE/IA8JTDl4dM=;
        b=G+pSc5ao1p/IeOyw53EUjWPTeW8tJKdc1nuwcuyYPrJwqUVUq0n/2CGY4zLHFCTtpx
         ysCWQXnYnWo3R6aHo0tGD+yxxWJ4nEOXUZC9Z248h9rUzJ/6rsnpCo+0TF1wLrMYJOZD
         lqqTMx0HRk7gqS4jyOyIzinh7YysScA0mn6wrhU3VysS7cZ9E5mezxxaQGFra5wFkVGt
         Xjh3di84bj1M3Tnvquc7vt6tnmpWzUPPQxajF+2DGhL57pHsCm7+yv9V9SSR6UTvD260
         5o6WDVAVPAhdIYitLI1m+KRehfX4qsRYx9CBLpe7k7AAc594xSHMCf1nXbgf12lREguc
         lRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PLL4V/pkjsui/1u55ShevcHZ/Q68ADdE/IA8JTDl4dM=;
        b=a8E2/spOFwRXKAroeHJthsIR888zWQ8/V4xZaHdiAJanXH1zSE87mG1RWe/OhPd21O
         SbdyQJh+QVZsRZWuJg+4KL5fERmgilgrE2+h1itlcVZe8xuHj4FpFQgPWt6KBZlAtNrv
         iWQqBIAxTvtMEZAagGO9qud96J8c/lgm8MMFsRaoQszLPbw8tMS0e5jcuGhIhoGEXo1s
         z1diY9uLPtV8jvFo0GvpFtGp+8bLpQpSVIcQvB+m/wFycEOB6q/4+1Mp3UbWZgVz38Si
         vhyq0Z0V1gME+yTDog8sC1JDCdjhhsakZwrIIF6yf5/r80BngHxaGVuEo3BM1L0tlphM
         5a9A==
X-Gm-Message-State: AOAM5303fQQwIMfwUo2VdKVCLinu9jQOBRmY7s+lxZrq67fLmgbJVdVv
        M5FngDlAHZzThCIMGbabP6KAAlmnCpNgKA==
X-Google-Smtp-Source: ABdhPJzcAdONNTEV3SFNOLTpMx+WFXQF+Bw687Le9kI5Tjp1E1gnLsD1URtRHuelkNid7H80bOL9dA==
X-Received: by 2002:a05:6102:a05:: with SMTP id t5mr8467113vsa.37.1615561201767;
        Fri, 12 Mar 2021 07:00:01 -0800 (PST)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id 127sm809345vse.19.2021.03.12.07.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 07:00:01 -0800 (PST)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     kernel-janitors@vger.kernel.org
Cc:     arnd@arndb.de, Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH v2] staging: vt665x: fix alignment constraints
Date:   Fri, 12 Mar 2021 08:59:41 -0600
Message-Id: <20210312145941.1721627-1-eantoranz@gmail.com>
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
2.30.1

