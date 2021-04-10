Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD53C433ED
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 18:13:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4C0D60FF1
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 18:13:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbhDJSN1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 10 Apr 2021 14:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234831AbhDJSN0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Apr 2021 14:13:26 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F2BC06138A
        for <kernel-janitors@vger.kernel.org>; Sat, 10 Apr 2021 11:13:11 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id c123so4400371qke.1
        for <kernel-janitors@vger.kernel.org>; Sat, 10 Apr 2021 11:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xs+QjBbewUBM7r9aLD4uwR+wDO2RKF/8rwn0KYkg/P0=;
        b=Lc4c9FRlxCNDlIeyXEYYcxknwC2W2Zbw/pi76iPFWQ+cA9nIjBQruYXEnkTzNDbGAx
         i7xxkjTYigppueICLIuNKD6h+hxpKmX8RKMq3J2U7I2WDLtc8GH8mOPNjB5SNfMti0hO
         X1QPHrJmUypUXRkEDLXdGr2y4A3l52lVscMl9iRSlaYoUxZPCf2BNNUzgw/MmCLKvt/n
         FC17UcNwfuMfB1jRLecWktd3IyZS43ZtP4yyKW+OuiQMI/6gL3P240bgGxP2SD2tSG1k
         9qEIAo+UUivb1IUl6+zYUmkpw6cmqrIWf/lsqiTAhXlt6K8h5asm4BIH2jiHIZl7ra4V
         aNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xs+QjBbewUBM7r9aLD4uwR+wDO2RKF/8rwn0KYkg/P0=;
        b=M2Pqwzna3LtLsy93X66HndajeOg3eC2JsKDBulyiO5jUgV0QfKPSbg2D1kJZ+14RVC
         DpK8qvmQxV/6jdqfGdNF6vAVbEMbU0LCmGSmT/nWzIN1h86N8vsmgaQEWAo/N1cnKP7e
         UnpVWqq34u4tTs6BZHGLPTC7Nrq0pgE5NDi4wHR14xIeowwRmdROdpjD5RmPuOBIWNNO
         9OdEdvym8xcMTVGG+9/mqsRGVi7qNnTTQUyyH0ZP1UYp6AwMYPfSr+1jdR1uYA0KmNBs
         OQs9CSnar1M44BU9QhlzUNY7ofOiNtQduxYblbFQK8YnlsOb2RHFi7LOHABlQ2o1X3t1
         4iXQ==
X-Gm-Message-State: AOAM530Q8tI/LSR1SptJkIeKd02IUKTOBz8I+SVX3IzxQMSXxibZkhVZ
        02T5KLD4eGjcOq2MMmz1+XY=
X-Google-Smtp-Source: ABdhPJzbzH5iWhC4Mx9cPDcDcGwAM/TUQq5rprErnFrNRADayF+qBU7tNyQsq+tCr8/5mP5KZgk8TQ==
X-Received: by 2002:a37:4595:: with SMTP id s143mr19832553qka.394.1618078390833;
        Sat, 10 Apr 2021 11:13:10 -0700 (PDT)
Received: from localhost.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z124sm4522917qke.36.2021.04.10.11.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 11:13:10 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next] arm: vfp: correct typo in kerneldoc
Date:   Sat, 10 Apr 2021 12:12:59 -0600
Message-Id: <20210410181259.25113-1-eantoranz@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

kerneldoc for vfp_notifier in vfpmodule.c says THREAD_NOFTIFY_SWTICH
instead of THREAD_NOTIFY_SWITCH. Correct it.

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 arch/arm/vfp/vfpmodule.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
index 2cb355c1b5b7..4f8c6f583b79 100644
--- a/arch/arm/vfp/vfpmodule.c
+++ b/arch/arm/vfp/vfpmodule.c
@@ -140,7 +140,7 @@ static void vfp_thread_copy(struct thread_info *thread)
 /*
  * When this function is called with the following 'cmd's, the following
  * is true while this function is being run:
- *  THREAD_NOFTIFY_SWTICH:
+ *  THREAD_NOTIFY_SWITCH:
  *   - the previously running thread will not be scheduled onto another CPU.
  *   - the next thread to be run (v) will not be running on another CPU.
  *   - thread->cpu is the local CPU number
-- 
2.20.1

