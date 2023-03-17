Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C5DC6FD1D
	for <kernel-janitors@archiver.kernel.org>; Fri, 17 Mar 2023 10:16:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjCQKQ1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 17 Mar 2023 06:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjCQKQ1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Mar 2023 06:16:27 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E97467ABD;
        Fri, 17 Mar 2023 03:16:25 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y4so18404052edo.2;
        Fri, 17 Mar 2023 03:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679048184;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svJFXvAXFyAIcInqGbm4Qf5TecWoXKKIsaHq6MM4eZI=;
        b=dd0XOFKbObM0OqDj3C3ozoIWWuOdjZ9qxGglWCqtbiO8PVIGCnfup8xOTx2I1ea/PW
         kxy/8IvQ/2kzRKhl1A4Xgur3+tA3tyvJ3Q23dqVSK/D92Xz6MPEmqHr2X9Sx7OH62Q8W
         hS3JZRgMcJbvRI/bfjztmpVCjMlUsdOJYp9EqEW1pbnMa09jwEQ7Xh8xc3EHLMYVI/M5
         cSw0lsmvMwkOSvCh5XRkVwl96wcTJY/xb0Vrg5Ov+Ek8kcJCd2GHA+1HExV7hoElIqI2
         u2II0fGTPWQVg/OO+bbX1D5cJhhsXS6ufa+TFLmE4S0YoqbAa+zgFMNPKMUIVboolHfB
         7+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679048184;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svJFXvAXFyAIcInqGbm4Qf5TecWoXKKIsaHq6MM4eZI=;
        b=4xmtUqV3+yRzgzWpA9A8Fc2YORWr96mpZlWEbMT7bsQp5PRNRkbhQ+1kOH7Pt1rVQT
         Mu9QddgQOpgPyPra7OXXHAVRfyz7JO99BRa5g8dHUrORZNUyLtmBi4dmVOaOTPsl+H85
         9R4uxZZLHzjbByQEqU1Y2TRGkiVNE6cMGnJ7ZgBZ5j56qWSoBA3pBdamEZwXq+6jpMdd
         8MIw4UWCeCEhXF4T9s9fhEsjRZBmxSlQdVdzXdatsbeshwjGw5FwNj/6kZbAVsymrhPO
         8uvIVvNCKs4aYdNvaB+TmrdyRz+fuMCzWzX/hK8PWmSLpvgwha1g3lpE9cvula0BT8ls
         C2mA==
X-Gm-Message-State: AO0yUKVFt7vFmxtAG2e5ko19RrykCNgCF7M9GeLIUNRZRUPn5tjXvQF6
        io8o0g8Wsqk8SjPEuCQlccI=
X-Google-Smtp-Source: AK7set+m5SyqhsthHi/VvwpRA9srp+RZ5TiVPoLk/CugtVR5huROGYhlTugcDR6IHeYidL/AoaqRVg==
X-Received: by 2002:aa7:d3d4:0:b0:4ac:bbaa:867a with SMTP id o20-20020aa7d3d4000000b004acbbaa867amr2308986edr.24.1679048184337;
        Fri, 17 Mar 2023 03:16:24 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:d59c:b746:d2ef:469])
        by smtp.gmail.com with ESMTPSA id a18-20020a50c312000000b004c06f786602sm841028edb.85.2023.03.17.03.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 03:16:24 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Dou Liyang <douly.fnst@cn.fujitsu.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] x86/Kconfig: Remove obsolete config X86_32_SMP
Date:   Fri, 17 Mar 2023 11:16:21 +0100
Message-Id: <20230317101621.14413-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Commit 0f08c3b22996 ("x86/smp: Reduce code duplication") removes the only
use of CONFIG_X86_32_SMP.

Remove the obsolete config X86_32_SMP.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/x86/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 453f462f6c9c..cacf51420c45 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -377,10 +377,6 @@ config HAVE_INTEL_TXT
 	def_bool y
 	depends on INTEL_IOMMU && ACPI
 
-config X86_32_SMP
-	def_bool y
-	depends on X86_32 && SMP
-
 config X86_64_SMP
 	def_bool y
 	depends on X86_64 && SMP
-- 
2.17.1

