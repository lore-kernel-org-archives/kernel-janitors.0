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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DF2C433B4
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 18:11:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 396826115A
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 18:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbhDJSLz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 10 Apr 2021 14:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhDJSLy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Apr 2021 14:11:54 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25274C06138A
        for <kernel-janitors@vger.kernel.org>; Sat, 10 Apr 2021 11:11:40 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id i9so9232142qka.2
        for <kernel-janitors@vger.kernel.org>; Sat, 10 Apr 2021 11:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lQlPOR52GuZghxs8RduYzavBQkGz5NLwxN//OK6hnjw=;
        b=OvNcX5bkGhcWsU5OkkTcONorFNPDJQdh4ypOSt8glUgMV6L+BUNwDLoYZj7S12MxA7
         NPch9/NsqVV3uRSnh0cJ+Yrn7RPv6qhtseGBj126xkAP5NEP01KZuyqJxFsG9U9rAQlu
         NNRZE+sw3C5X+RHuXZvRb/S2ZBRRuAbwluqFab7EUzbidxhyoGCnIzh4vPqCRiYYXIaD
         LCsSaG1psqxhJ8TJNqNVlNYLoWJG5V3PafyXnUurHbJQQ4v3wjJ4ItCd77Ni0zgb9qmy
         /c7qyc6T6vot9zkd0bG4L52iRY/5Pe8yoO27bi/fmhUQruhdzNLf9Cq04iJENl7ufTf8
         SKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lQlPOR52GuZghxs8RduYzavBQkGz5NLwxN//OK6hnjw=;
        b=mqapi7ox67jnL4/Czr584IH66MreJ9NUOxIJhRhaNvwRGIwnDj8FvTryFpbfdF5mX0
         gXIH7lGIypuAsgbHDOLa77MgbhXV6t2nbGnYL24SVA5iA0k88fKeDqoWWHarpl73NIah
         2UdyAZaUjTAbpFeA6cZCTCLv2SnK9Ww4vSIossqcHlOj7Geofmv2/3LnZtG4keAOmZ1v
         RhOqGi/JeAkIR64sv6g0E4NO/ShuOzfBXcRWsci+MNceB5ShwyCGU/6ZcMu7T+paVIgR
         MWHVm1yJQ8UeKfhXaOKwWGduDgaTM3v9OBxyjZpWvV6yxSNiYCbxSB7IOeRPaBBnsqBi
         WqSw==
X-Gm-Message-State: AOAM532FKsodsrk/QnWyWjztzm8EiNAYBxAp+IMDWHHC1j5CMDSKtzdz
        GdnbAMlNEqhv2IweJYcjTyE=
X-Google-Smtp-Source: ABdhPJxCv/Gh97H5qPnCJNQM7MR52k7oxTvLHYhxtNzO1iHIkfJ/T/7PCCNNSJk3SvqEjgTGDpeAGQ==
X-Received: by 2002:a37:b947:: with SMTP id j68mr14035141qkf.108.1618078299279;
        Sat, 10 Apr 2021 11:11:39 -0700 (PDT)
Received: from localhost.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id o125sm4362466qkf.87.2021.04.10.11.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 11:11:38 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     catalin.marinas@arm.com, will@kernel.org, avagin@gmail.com,
        0x7f454c46@gmail.com, mark.rutland@arm.com, maz@kernel.org,
        tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next] arm64: vdso: correct definition of macro vdso_clocksource_ok
Date:   Sat, 10 Apr 2021 12:11:17 -0600
Message-Id: <20210410181117.23967-1-eantoranz@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The macro vdso_clocksource_ok is shadowing a function with the same
name and so it actually makes no difference to have the macro defined
or not. Take a hint from x86, rename the function to have the
arch_ prefix and correct the definition of the macro.

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index 7508b0ac1d21..055d9e42a05d 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -166,11 +166,11 @@ static __always_inline const struct vdso_data *__arch_get_timens_vdso_data(void)
 }
 #endif
 
-static inline bool vdso_clocksource_ok(const struct vdso_data *vd)
+static inline bool arch_vdso_clocksource_ok(const struct vdso_data *vd)
 {
 	return vd->clock_mode == VDSO_CLOCKMODE_ARCHTIMER;
 }
-#define vdso_clocksource_ok	vdso_clocksource_ok
+#define vdso_clocksource_ok arch_vdso_clocksource_ok
 
 #endif /* !__ASSEMBLY__ */
 
-- 
2.20.1

