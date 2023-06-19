Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1801AEB64DB
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 03:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjFSD5i (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 18 Jun 2023 23:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjFSD5f (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 18 Jun 2023 23:57:35 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FDD2E62
        for <kernel-janitors@vger.kernel.org>; Sun, 18 Jun 2023 20:57:34 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3420b22365fso17486265ab.1
        for <kernel-janitors@vger.kernel.org>; Sun, 18 Jun 2023 20:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687147053; x=1689739053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo1lPT4dJxUXmcsYL9c21QpbMwQpKCql33uWmmBp3AQ=;
        b=d28etc9GW+7SyTsfFDYvAxiGRbQt8jaXBBRUmXY2ZFTbwVKId+P0cvGMLdwTIYetnW
         BgDyrf9ADyqtbuQ9uuwYB/VsK56eT7VZcU+QPJAAtzaFttvk8/2atNUecJLL2dE+eBho
         SlruaguEbJP0brGHlkoMnpTfnaMLto7rjM+3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687147053; x=1689739053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo1lPT4dJxUXmcsYL9c21QpbMwQpKCql33uWmmBp3AQ=;
        b=gxhOFpp/jg6IZjskwyiUyfmzqP4bOb/MT8HeBUXHr2m/KPb8m1krDqGzl4E//hzoKr
         lCz6uKPg2FK4/23AKDh762+qndHClbV6ZL0UzYRK00upebxn/UF/vevNRhgp0LykoGp6
         1EUDQWeMATO3HCFj68/P6ZxAksDycMXdT4yBtMczTie3ki/KZvalvquH6wWyVzA5CjW9
         cLRuzaE/8N2hkvqvSGVNPcpzyndUWTtkRc7i1bOiMg5s09NSNH3mt0GnXGvsXX083dwe
         5ukfLOcibuT7Y1n6crzdPAiIClAXe3sGWMJhDsk1wmle0RXhLLjz1gt+s4g40pXPFL+n
         Af/A==
X-Gm-Message-State: AC+VfDxiZ3vn6FCp/lZ4CTMC29aQPLaS3tjyiDQytrsjmMS5qBkp7Cm3
        tUaWCAi8CufAMNC+tMkjE1bYzEAB4D7X5nylSRAomw==
X-Google-Smtp-Source: ACHHUZ7t/jfGxXZ+jgaBkgRRCrnjuFqgprQdViEGRRnzLHZ+oUw/FTyg8bk/qdJCCJNKeTzIP0b6HA==
X-Received: by 2002:a92:c08a:0:b0:33e:6230:aa6f with SMTP id h10-20020a92c08a000000b0033e6230aa6fmr7098948ile.2.1687147053702;
        Sun, 18 Jun 2023 20:57:33 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id j18-20020a926e12000000b00326bd11f5d1sm6793343ilc.11.2023.06.18.20.57.32
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 20:57:32 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-77e2f4498d3so119836439f.1
        for <kernel-janitors@vger.kernel.org>; Sun, 18 Jun 2023 20:57:32 -0700 (PDT)
X-Received: by 2002:a5d:9404:0:b0:774:8b28:6c34 with SMTP id
 v4-20020a5d9404000000b007748b286c34mr7383720ion.8.1687147052283; Sun, 18 Jun
 2023 20:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230617160901.1.I2b151cdf7a72d9e3ecc7ab2ff38409ebe6d65d6b@changeid>
 <71168ceb-8273-4067-d0e0-c6c219d4618e@web.de>
In-Reply-To: <71168ceb-8273-4067-d0e0-c6c219d4618e@web.de>
From:   Fei Shao <fshao@chromium.org>
Date:   Mon, 19 Jun 2023 11:56:56 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngN=TFQa0Y4FoSCOTUs8HRi4NEP1OwY8WccUEUMG_UDeQ@mail.gmail.com>
Message-ID: <CAC=S1ngN=TFQa0Y4FoSCOTUs8HRi4NEP1OwY8WccUEUMG_UDeQ@mail.gmail.com>
Subject: Re: [PATCH] clk: Fix memory leak in devm_clk_notifier_register()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jun 18, 2023 at 4:06=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > This fixes the issue.
>
> Please replace this sentence by an imperative change suggestion.
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.4-rc6#n94
>
> Regards,
> Markus

Thanks for the feedback. I just sent v2.

Regards,
Fei
