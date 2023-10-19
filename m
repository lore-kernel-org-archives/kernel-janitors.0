Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B427BCDB465
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 13:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345911AbjJSNVk convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 09:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345894AbjJSNVh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 09:21:37 -0400
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20BB124
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 06:21:35 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d9ad90e1038so8631515276.3
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 06:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721695; x=1698326495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOdWAC+rZcyCYFgGHd9uFdZJkRXbsyb4tcDDTJxNV/E=;
        b=TRh0JeTOtW/0SBomFgKstMAVT2Wc0FqzwqAUYgnW5Asp28IQP0UAyrUd7jUBCgtZ1J
         QXrImVuu4aC1E/4DgHKR9k7m5oFR8nEIYIsq1OSyl42THmssX9Jfw8MFPDwvsoJpEF+u
         iorcoW43NaeKdSbYpwHLv7u6TC3y/nTTgaBHfxg/Ev6fhCTIPKjLOJoOmXPqV8v22kXH
         plFAvhyIKTUS0R8ErmsSXDa2NCFdZ+VKhogOSwDZ8kn+/dinVSO5Pyg3GtRu827aO63d
         R+OBKdAFJBuEd3DF9S9pG+fHQelhBw7pkvR8QFqcMZ4II9uorGwyk6EA+uvloLxW2H6V
         bJQw==
X-Gm-Message-State: AOJu0YwCsbpdwA9bWwFntGG8ApbTjl5dV8ocxsajVnBrJosu52GrUk9m
        CH/XTcHvBHkJ67/i7+L58TnlMboBM9ONug==
X-Google-Smtp-Source: AGHT+IGyQrHNQQgOgH2WiKfJULCiw0UxVCIJQWvE+hg9U7bZsmz1FQ+Yj7miqx8BFnzYiZKzDQvFqg==
X-Received: by 2002:a25:8b8f:0:b0:d9b:8804:3153 with SMTP id j15-20020a258b8f000000b00d9b88043153mr2349784ybl.8.1697721694747;
        Thu, 19 Oct 2023 06:21:34 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id i11-20020a256d0b000000b00d7465a90f0csm2046226ybc.22.2023.10.19.06.21.34
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 06:21:34 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7ad24b3aaso97558257b3.2
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 06:21:34 -0700 (PDT)
X-Received: by 2002:a81:4a55:0:b0:5a7:af72:ad6a with SMTP id
 x82-20020a814a55000000b005a7af72ad6amr2191129ywa.43.1697721694165; Thu, 19
 Oct 2023 06:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain> <CACRpkdbNOmvBg+wHLHcdvp=YE=jYiKKCVWDqs2cMF85rXyv_aQ@mail.gmail.com>
In-Reply-To: <CACRpkdbNOmvBg+wHLHcdvp=YE=jYiKKCVWDqs2cMF85rXyv_aQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Oct 2023 15:21:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2XDJkcTtysz0t+h1UuZCzioE5H2_tBerMz0LuSMAEZQ@mail.gmail.com>
Message-ID: <CAMuHMdX2XDJkcTtysz0t+h1UuZCzioE5H2_tBerMz0LuSMAEZQ@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
        outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 19, 2023 at 2:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Oct 19, 2023 at 6:11 AM Dan Carpenter <dan.carpenter@linaroorg> wrote:
> > We could add that kind of
> > thing to a todo list by using a KTODO line.
> >
> > KTODO: add check for failure in function_something()
> >
> > Then people can look on lore or use lei to find small tasks to work on
> > or they could use lei.
> >
> > lei q -I https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=mid 'KTODO AND rt:6.month.ago..'
> >
> > Then grep ^KTODO ~/Mail/KTODO -R and cat the filename you want.
>
> I like it! There are too many of these things falling on the floor.
> An easy way to stash it on the technological debt hitlist would be
> really helpful.

And if people use appropriate Closes: tags, someone can write a tool
to only list non-closed items.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
