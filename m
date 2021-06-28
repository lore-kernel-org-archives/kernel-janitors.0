Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D04C11F64
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Jun 2021 19:29:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF4B261159
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Jun 2021 19:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236532AbhF1Tby (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Jun 2021 15:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236526AbhF1Tbx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Jun 2021 15:31:53 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16E2C061766
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Jun 2021 12:29:27 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id m17so9516608plx.7
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Jun 2021 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZJ6u2k6/dJhmtJ+a/0MHT0Ak2qWLb/bcwrC6FvorPSQ=;
        b=n8uh5BL5JUgY4xOLSY/QFzLUx4h8+eiR4ud8YSIx+mmGU6c63SdHzwx80jLkxQ9F0X
         cXGjXnat+9O9uXio1+z/Ddfrr4DgcSmFCVAscxsdku5pADBHOYwd0tRP0Hko3vanwFOZ
         wGTHwxwKuKFVFh3JknoR1UpDe9WJ3gcTeZd/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZJ6u2k6/dJhmtJ+a/0MHT0Ak2qWLb/bcwrC6FvorPSQ=;
        b=okXdijnrmWhKq1wmmFosfBP+Oj3KnmrPf2BASpRgFwARSzzYsfBYUwYIBVxEkKdVAb
         6SpCsL3vYbbmpwHb+3c21ZRyffefy6epiM1e3/rKIM9jn/viWtdgUZFB/FlUINwDf7eY
         HcwC9a6aW8uck+//t2Ibfs0T6qkeq4QuqkKtoAJIy5wdNQBor0MUmab+oxAzQHHhBY8D
         ahSjEuPleKFAE1CrL24Wf9MhQRNLSE/AW3xJtyzPHVa9rTW7n+9CKQZf0RF5l0zKUgnj
         eeRwJ96ujnMdPYHOuirNUoMJ6pFralMd/Qi3QbSf8llEnoeWTKbLaGh7elkM/1TJmHf3
         Nl6g==
X-Gm-Message-State: AOAM530lqQWKVup1I9RldpS/XsHrViksKDaEx3muN2683iL+87kfMm8P
        zt7gbqcuaMpbrDhwvyYdzQGsEg==
X-Google-Smtp-Source: ABdhPJz1uj/MMaj6X3iG0Y158vKYXBq1/oub7G1h8/NnL5WdpAzImby8uj7C6j+B72ZmmUCSgoaJQw==
X-Received: by 2002:a17:902:720b:b029:113:19d7:2da7 with SMTP id ba11-20020a170902720bb029011319d72da7mr23791449plb.55.1624908566889;
        Mon, 28 Jun 2021 12:29:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n12sm14973518pfu.5.2021.06.28.12.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 12:29:26 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>,
        clang-built-linux@googlegroups.com,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Bill Wendling <wcw@google.com>, linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] pgo: rectify comment to proper kernel-doc syntax
Date:   Mon, 28 Jun 2021 12:29:19 -0700
Message-Id: <162490855630.2191955.7188154193447975503.b4-ty@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210628055947.6948-1-lukas.bulwahn@gmail.com>
References: <20210628055947.6948-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 28 Jun 2021 07:59:47 +0200, Lukas Bulwahn wrote:
> The command ./scripts/kernel-doc -none kernel/pgo/pgo.h warns:
> 
>   kernel/pgo/pgo.h:112: warning: cannot understand function prototype: 'struct llvm_prf_value_node_data '
> 
> This is due to a slightly invalid use of kernel-doc syntax for the comment
> of this struct, that must have probably just slipped through refactoring
> and review before.
> 
> [...]

Applied to for-next/clang/features, thanks!

[1/1] pgo: rectify comment to proper kernel-doc syntax
      https://git.kernel.org/kees/c/6a0544606ec7

-- 
Kees Cook

