Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF26CDB47E
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 Oct 2023 07:18:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjJMHSV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 Oct 2023 03:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjJMHSU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Oct 2023 03:18:20 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81448BD
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Oct 2023 00:18:17 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-317c3ac7339so1662707f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Oct 2023 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697181496; x=1697786296; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbVF/4xx0+0vu2fMTNsv16S5m/ukxWZpS5bYJMmX8qM=;
        b=fQHUhy3vDUanMdrmzzXVux/ic01wJ2iX9b/aUS3feozz+Q62J5P3f78MZYWrPV4e93
         h4VM4iAZmmMqZomxPyD71xCjsghzDsANXlwyFgaX0V2JiN8FhMqgWMnYuB9ROf7uKEz2
         9HNGVpZ9XxVDpTmWbJWc5CAOHWUeUGT3/p/WwpjZf3UIgww3spTtLpg7k0Pimswrfuxb
         YHGMYxQ7z3wM1Py/nCj0Hy6J+9Caq5JN43KL9QNzYWaLgwCs6PtcoZmy3NS/7xG/wWn8
         C+o4KWGz7Xvc9/a5hRlJwiD5vZ3hPVuZwRBBLr1Pr4B/+GtRKZsCLmJS6P1Lxuhpfp0J
         5MiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697181496; x=1697786296;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbVF/4xx0+0vu2fMTNsv16S5m/ukxWZpS5bYJMmX8qM=;
        b=mQY1YTdKWJFUTXPrphAOb3USIKzqK0aSZrNv6OmA0lCPjDcX+7knuFRnT/x1Z8ERSn
         b4FlAMIVssUwlH/OosyU80+M/TupDGWCS9TjAcDWxsni7xR3xPeTxlxKbGPHDBZLo6PM
         rpYq6Oua/juFcwYUN5IouPyiLgvzWkONvJrZtKskzVk0Ucr+r26vWHxEfiue0g/J6Dto
         ERd2Xc9s7u7k2iNR95gZTsJks0xLUbxdD7JEtAkrk7ylS1/4q3XdTrwgUQQ7qhEFoNYu
         o5sv+zQUmeeOoW94F0CsmX0DxfnSyQDNXuDNcRPt/KmHCFwOInAkgj/kXiPFn1eXQcDF
         w0Vw==
X-Gm-Message-State: AOJu0YwUhEZXAPC0x3Z0t9PC/xgiNVjZy1e+1hENYZwlKyhEC3xJX1M8
        auhRVPER5fEdeaNTsf+oV9V6LA==
X-Google-Smtp-Source: AGHT+IHPY0n8rs7CXdxLey7IC8iyznm9iVum45QuAoDN95dpOABZsLi4neDzIKvm+jTtIApmyuc7Og==
X-Received: by 2002:adf:e542:0:b0:31a:d4e1:ea30 with SMTP id z2-20020adfe542000000b0031ad4e1ea30mr22635389wrm.17.1697181495839;
        Fri, 13 Oct 2023 00:18:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h12-20020adff18c000000b003232380ffd7sm20203133wro.102.2023.10.13.00.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 00:18:15 -0700 (PDT)
Date:   Fri, 13 Oct 2023 10:18:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Sandipan Das <sandipan.das@amd.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] perf/x86/amd/uncore: fix error codes in amd_uncore_init()
Message-ID: <cec62eba-c4b8-4cb7-9671-58894dd4b974@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Some of the error paths in this function return don't initialize the
error code.  Return -ENODEV.

Fixes: d6389d3ccc13 ("perf/x86/amd/uncore: Refactor uncore management")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/x86/events/amd/uncore.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index 9b444ce24108..a389828f378c 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -1009,7 +1009,8 @@ static struct amd_uncore uncores[UNCORE_TYPE_MAX] = {
 static int __init amd_uncore_init(void)
 {
 	struct amd_uncore *uncore;
-	int ret, i;
+	int ret = -ENODEV;
+	int i;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
 	    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
-- 
2.39.2

