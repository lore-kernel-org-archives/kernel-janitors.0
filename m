Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D0CC4338F
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Aug 2021 07:28:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42BE160FC0
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Aug 2021 07:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235454AbhHKH3V (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 Aug 2021 03:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235356AbhHKH3U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Aug 2021 03:29:20 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B15C061765
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Aug 2021 00:28:57 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id l18so1665159wrv.5
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Aug 2021 00:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=33brLztFm7epuRTZxl5Qnoky/aRPy2My1C2Ig5x+qyw=;
        b=gGXEI++zwjG4J2LMhN62sAOU29Q1xeuzYXTu7LWr8FOdjyjUYgkZHZlG6OeQTeS2bb
         ByMXf2IOg2xTUVJy2E5zL3B1urlG5e8tsW6/10wm0Kvuzhjf7PQhRlOwoYs49DqhwgZm
         clg+PAH9tzjU0nvUryZXXUlR47KL3TDBQcWPh39A01yJrif9cxWoMEjm9pLeRZVS6CUJ
         VvxS81jcvTUXoAxLmv8uDBx78S+O13REtGPozP2cm0W6IuGpJ01Jhsi1Glw9lKYQcPjw
         /dzdJKzWFHg418ZA0fLlDMMo6WjtrJxfeDS3wJBtqFJsGCT4fSFdc2YbpnNi5S3sAxmv
         oWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=33brLztFm7epuRTZxl5Qnoky/aRPy2My1C2Ig5x+qyw=;
        b=e4yTdr07UySngaD0q5KuM1Thg1mVgbC3ZvroFb48w7ZNWZVpdNlphGuKMTrkBvEZ0l
         79VEsU7CveQEgBVdWw5153WHFna1EXBV8vHzESnN7vKOi89T6KUJVT9me3qCfDP58H6+
         QibMuhSuyzXf9aOxlJhYCFsHjnKJiGPNkgLecKwr4G6yKxJvMRU/qAP7xz/kcc/TDmca
         dxvDSq6WdERq+N7rc6L5RvqtdrKDpuCFANKn9VwBLjz+zKHLOD6BbkV5Kd3zN/sdonz+
         qMVON4Ex2jpOEEr8TtEqpUbHeIDzVXDkbTaHXn7O5jc9v/67GVOePPEat8x6oklqr6tI
         2qDA==
X-Gm-Message-State: AOAM533zKalZoKoU55gqGMRN/srFcw5ZHh2Q9iLxidLJUL6wsnX9A5Qr
        viRXsAwPMAQ/GRw9BK4VS+rdHw==
X-Google-Smtp-Source: ABdhPJyqinaGIcncaVykCG/eusM2TzITbn25ZEc0Fgvmlu8UIfe1vvHG03dm8MiylYGulanWYl7fkQ==
X-Received: by 2002:a5d:6451:: with SMTP id d17mr18160454wrw.154.1628666935664;
        Wed, 11 Aug 2021 00:28:55 -0700 (PDT)
Received: from google.com ([95.148.6.212])
        by smtp.gmail.com with ESMTPSA id l18sm5854377wmc.30.2021.08.11.00.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 00:28:55 -0700 (PDT)
Date:   Wed, 11 Aug 2021 08:28:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: adjust ARM/NOMADIK/Ux500 ARCHITECTURES to
 file renaming
Message-ID: <YRN8NTvGUmEJ6VBN@google.com>
References: <20210810191724.24452-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210810191724.24452-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 10 Aug 2021, Lukas Bulwahn wrote:

> Commit 8f00b3c41ae7 ("mfd: db8500-prcmu: Rename register header") renames
> dbx500-prcmu-regs.h to db8500-prcmu-regs.h in ./drivers/mfd/, but misses
> to adjust the ARM/NOMADIK/Ux500 ARCHITECTURES section in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/mfd/dbx500*
> 
> Remove the obsolete file entry after this file renaming.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210810
> 
> Linus, Lee, please pick this patch on your -next tree on top of the patch
> mentioned above.
> 
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
