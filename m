Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C084AEB64DD
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Jun 2023 14:53:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbjF2OxZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 29 Jun 2023 10:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjF2OxY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Jun 2023 10:53:24 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D952102
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Jun 2023 07:53:23 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbc130c67aso3480555e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Jun 2023 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688050402; x=1690642402;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uN1J5xa3FVh4bD4ml4KG3rbztEGXp/axaEMd83F0aQU=;
        b=RNMcmVVh/6xvu1yhgwNx5rdqCNiaK5dq8hMCnTonCw4mSu6m9HwRc7ybjcI84LhqZe
         ZvlrCrI3DDL2xRkGNBMNADICKrjznx2U1bKZjV8WALHbf+/BszMuJq+hjV+RY2bQyMDV
         JqVNQR3eML7pRm/Gtpr5tz8yQUw7ndHKZUWRSgexQVlcSyjcbO0MKHgjHz6M8iNJ2QY2
         kjVa1g8FTVs2ovd/UNq+K9ac6kBvBljnvgqds7nGEn9MnkTWu48J75CZxZjCS+YC1Yun
         dEHy1DOMMw5+QWnWf9KR0fK615xDHf5q/EU2GttPPv61Fkcd5yX+OEJwLUBH2hI2/L9q
         +AQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688050402; x=1690642402;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uN1J5xa3FVh4bD4ml4KG3rbztEGXp/axaEMd83F0aQU=;
        b=W+UH7Yu/qMt1/T+eAx56PSXtKF5aK8DduaaL+MVwx3FOkqKCK4LncK5t2nb2fwOKxv
         UmoWLCCT3PXu0uhfprWXjdw4U/dywyry+to7LcOn6Yw1mxmrc6d3/b98DS+WlltKYFrk
         LjdLW5SAoeYV/pPIAZ6WUzLFCactJNSAvRVrfFVrSXSB9piEV7nsBX+lKJB/H4C6U16S
         q0d8/mDasPlg31B37blowqNUvnnrqRD+yGPWg7IY4N/cVH3UMKP39xQ4aFA1cRz+qndh
         f+BfWdEwx2Tq9ORutuCW7fhcZ1sQx3l5EOnXpTXnrwCOC5VyFYM+OPqlPr6kQFoR8h84
         UavA==
X-Gm-Message-State: AC+VfDxk4Q6IXYPWTIygWpCbQkmXJQ7/NVstZ0PHmp/a3a3AogDfLlJD
        fCQ6dwCABg9FwrcxNU51sZDwRw==
X-Google-Smtp-Source: ACHHUZ6d0IS9/vC20Nu9Aj1oMknXjrUeHgo5kmTECQRo1GzUpKVocy4Lf6Y+Tj7y1Ne+Vah7f9PmYA==
X-Received: by 2002:a05:600c:c6:b0:3fb:b18e:9b1a with SMTP id u6-20020a05600c00c600b003fbb18e9b1amr4313602wmm.8.1688050401899;
        Thu, 29 Jun 2023 07:53:21 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c205300b003fbc2c0addbsm78628wmg.42.2023.06.29.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 07:53:20 -0700 (PDT)
Date:   Thu, 29 Jun 2023 17:53:16 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     geert+renesas@glider.be
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] lib: dhry: fix unstable smp_processor_id(_) usage
Message-ID: <0469eb3a-02eb-4b41-b189-de20b931fa56@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Geert Uytterhoeven,

The patch 13684e966d46: "lib: dhry: fix unstable smp_processor_id(_)
usage" from Mar 15, 2023, leads to the following Smatch static
checker warning:

lib/dhry_run.c:38 dhry_benchmark() warn: sleeping in atomic context
lib/dhry_run.c:43 dhry_benchmark() warn: sleeping in atomic context

lib/dhry_run.c
    32 static void dhry_benchmark(void)
    33 {
    34         unsigned int cpu = get_cpu();
                                  ^^^^^^^^^^
get_cpu disables preemption

    35         int i, n;
    36 
    37         if (iterations > 0) {
--> 38                 n = dhry(iterations);
                           ^^^^^^^^^^^^^^^^
dhry() does sleeping allocations

    39                 goto report;
    40         }
    41 
    42         for (i = DHRY_VAX; i > 0; i <<= 1) {
    43                 n = dhry(i);
    44                 if (n != -EAGAIN)
    45                         break;
    46         }
    47 
    48 report:
    49         put_cpu();
    50         if (n >= 0)
    51                 pr_info("CPU%u: Dhrystones per Second: %d (%d DMIPS)\n", cpu,
    52                         n, n / DHRY_VAX);
    53         else if (n == -EAGAIN)
    54                 pr_err("Please increase the number of iterations\n");
    55         else
    56                 pr_err("Dhrystone benchmark failed error %pe\n", ERR_PTR(n));
    57 }

regards,
dan carpenter
