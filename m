Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D55BC48BD1
	for <kernel-janitors@archiver.kernel.org>; Fri, 11 Jun 2021 23:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A4A060234
	for <kernel-janitors@archiver.kernel.org>; Fri, 11 Jun 2021 23:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhFKX6b (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 11 Jun 2021 19:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhFKX6a (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Jun 2021 19:58:30 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77245C061574
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Jun 2021 16:56:29 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m21so10946567lfg.13
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Jun 2021 16:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8LYdLrXUsPHtUrAexLnjIyiWMIxp9P6puixkz4YwLNQ=;
        b=Mc7V6Z0SCiZSZ33LHbluTp2nfmH59FhCAKlWPz+ZEVq/CpR8GJWkhrkJyP6ZLJkPwJ
         fBFLnMw6ZA7JjSW1+ssgb0QmK1fLRnwUkksVWpcmH1T2qJxoXRfVQIuFBvdTlZ8wuX8L
         oGiNR4Vo1euQjpT051n6CFxt6NLSqZGanX/baDNPpPtxbpSeeh1DFBZOOklXYJAOO/7X
         EobZLrw79hWnJSybJjst+BIHSFM0rUjAsGWt+UvdJMRM0FTIbxEM0CLUaJkVm318RfaY
         sVv/o3Mm1WSDz4PfvUDdaDBtPm0MFlqWMjLZR6FH1icW+vW+7seju3r35kyq+EH6Ro2O
         H23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8LYdLrXUsPHtUrAexLnjIyiWMIxp9P6puixkz4YwLNQ=;
        b=lYD+a3nvsSn7abB2rDB+rqkMM/WcbTnNI3tQ3rxstKZabjPsIvKPgEOBrGVs6T2BEY
         xTAFoFm+dQ+XONJpc6JE2RQC75jmcp4/UlsKxP6WDBy91sgtSACQgDdAgNvDmTKpQotZ
         1jF0adk73s5cJLCxDxGmlbeu+InjCC8ivLef7sOl9+xoMnTQ7RH3mP6JjyMfFlm5tpjE
         9QHo8gzc5TQpjc4ye+Jk2pl8g1tRMyJ+9XNW1ltdHsOu4dT1733VwbkMe1pRKq6bjt9P
         zEtpGVeeBllI2KzGQ/cUm5z/LRxLcQS4C1P5NAwKvBESf95ER8oMA5k1HmKgwVuZ+ZuH
         uHcg==
X-Gm-Message-State: AOAM531YTKqLN5OWB9oTBr5DBgp63oNG2leQmrNJ8Qxtpvw3e2pheIPb
        /RRk5bqS6CgA/xCfkX9jojfj7utqNxzUM5QgjZZcSA==
X-Google-Smtp-Source: ABdhPJxL8izxhEjGJNohMCBmzZw1SvYwftJh3uEeAj2N8KF56Kn7ZOOvLKiwKV2qQ0NkWP1NZkeK0o5DZTXZQzA35tY=
X-Received: by 2002:a05:6512:2105:: with SMTP id q5mr3965064lfr.649.1623455787716;
 Fri, 11 Jun 2021 16:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <YMHjoagGxEfVBW1t@mwanda>
In-Reply-To: <YMHjoagGxEfVBW1t@mwanda>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Jun 2021 01:56:16 +0200
Message-ID: <CACRpkdb=1TmDVvds2WmG+ZyqEL+3cHd9whg=GeQ6cJstgKug+A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: missing unlock in mcp23s08_irq()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 10, 2021 at 12:04 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This code needs to drop the lock before returning.
>
> Fixes: 897120d41e7a ("pinctrl: mcp23s08: fix race condition in irq handler")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Zhou Wei already sent an identical patch but thanks anyway!

Yours,
Linus Walleij
