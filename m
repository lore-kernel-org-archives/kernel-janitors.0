Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49607C433DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Mar 2021 05:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5E7B64F8F
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Mar 2021 05:15:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhCQFOi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 Mar 2021 01:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbhCQFOS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Mar 2021 01:14:18 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDEEC06174A
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Mar 2021 22:14:17 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x26so300073pfn.0
        for <kernel-janitors@vger.kernel.org>; Tue, 16 Mar 2021 22:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=CNdGMKqM0pQjbLelZc2KiS3A+5IeroB8GexfPgW33zQ=;
        b=TmZoZANKCbUzvYSCuu4tjz9Bzddgny2LMOa5H1sRP7Wxx8uuhohlb1a3hXvBAENyX0
         aShFNO/ASaCOGZKhT2ctrEYhV6n0w1tz0UuzmGHCAeQWGniBI4Dk0XBmgE/nSQBLOGb/
         Gi8iO+FW+nLrvrRc6GOdOpz9+cmY7uf76EFxZARRAUFnK7VNINsnXpwfA7A1RS5nVTgF
         7rrTASfr/QpecMXavnF1HagwNhvCCIc05BgJh4C0aOPykHIa6VDQbbgKPnw2Q3irDstp
         gaUpUUO22k3edr6SMaVENWAip9dylik5QOWuComOHrM3LR4omDvpBuRgUjmEPAhAqWRR
         x/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=CNdGMKqM0pQjbLelZc2KiS3A+5IeroB8GexfPgW33zQ=;
        b=YbnBMa2VImRCZXF0KXt4BhV2DiVK1tis0RdrBUpKxEEpxgF2HBvAU2hHbHgQf/CmQZ
         w5r/8mdZiOjO3nDmVRYrBM+wPtyWge9dioGaLqVNALlMv2zGwdiw98SX5vOCMv0syrIM
         xndMg1J0Y+VKahCqEOalGBTxUjUvTpEvATxI9YryuGT+HgwQyZ58Qf4Lc46UjQ5nC4w7
         42gpvAmMHrYatqs039BlTti0yGKDpGqUypivBRrlZU5DHdbeeWlzUrqXupCxZMR9g9O8
         kYjQhBPO+Ear+Qh4m/KM7lHdphZ5NWn8Qg/MAKYrQPEfZcvzouBC5JMrEuWHyMlxf4RQ
         HyaA==
X-Gm-Message-State: AOAM5305WoU0MQ1RuYN2MPtYUCNM77POR7K0tG6+5+TLfZoMbdA5U1hM
        IufFuu3zq0a7B/LM4W1Imn868w==
X-Google-Smtp-Source: ABdhPJx25sOT3lNg8mxIzP8z3booUHLSdwDwXkB5viC5Gl5IpBe7X1pW34ymCnnaL1K9kU0v6sIZfQ==
X-Received: by 2002:aa7:908c:0:b029:209:aacd:d8b with SMTP id i12-20020aa7908c0000b0290209aacd0d8bmr2748693pfa.74.1615958056674;
        Tue, 16 Mar 2021 22:14:16 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id 14sm18249938pfo.141.2021.03.16.22.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 22:14:15 -0700 (PDT)
Date:   Tue, 16 Mar 2021 22:14:15 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 22:14:14 PDT (-0700)
Subject:     Re: [PATCH] riscv: Fix spelling mistake "initialisation" -> "initialization
In-Reply-To: <20210316093054.GA1081018@LEGION>
CC:     Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
        musamaanjum@gmail.com, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     musamaanjum@gmail.com
Message-ID: <mhng-884ba68c-f5f0-4808-869a-611720dec5ee@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 16 Mar 2021 02:30:54 PDT (-0700), musamaanjum@gmail.com wrote:
> There is a spelling mistake in a comment. Fix it.
>
> Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
> ---
>  arch/riscv/kernel/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index ea028d9e0d24..1ec014067855 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * SMP initialisation and IPI support
> + * SMP initialization and IPI support
>   * Based on arch/arm64/kernel/smp.c
>   *
>   * Copyright (C) 2012 ARM Ltd.

The internet seems to suggest that both of these are words and that they mean
the same thing.
