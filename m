Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4222C433ED
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 19:58:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC420610C8
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 19:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234548AbhDJT6t (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 10 Apr 2021 15:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbhDJT6t (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Apr 2021 15:58:49 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9155EC06138A
        for <kernel-janitors@vger.kernel.org>; Sat, 10 Apr 2021 12:58:34 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id y4so9429915ioy.3
        for <kernel-janitors@vger.kernel.org>; Sat, 10 Apr 2021 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xKHUslv6i9mDjkCCi0QH2CiGkD8d1MX3fdXcvxVLiz8=;
        b=Sn3ptpkUwv93a4meGWUT1wnxzctHhzGxrUGcYFMXGfxefU/cMBvEG0mp0buFS3NPf2
         BnnEc8NjIW5NPAxuDQ401O9JVxTTP5QMU91tSk1jUiAW/dndiacTbgA35nONmkYlkxZW
         PbNXD0qYZLQTE86mHob1vuBWFQ5ZQsUINbcmzMC3mr+lG/5ViZ2ZegrYtn2cOddyGmY4
         Vn0fLUEufwj/bD8Eg46/g1q16IOtufPq2k9UBMDtCaQVpsOOl09tfB90UFZIWMkkiMro
         X0xDtet+N2y9t0WIQSXGUhakDJ2sauBDuI2qmGNhRTOLDf9cfB9vQbKihiWJdVu7OUS4
         Umag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xKHUslv6i9mDjkCCi0QH2CiGkD8d1MX3fdXcvxVLiz8=;
        b=I9IIB0/20hoPJVHtGfkcGjlLdd92KRKgRiPtg9fPQAkD1H2873v+73BQmKN1CbX/Vu
         YS2+2RrfP/s6VAUTvnyDeXp42rKP+/vj9/J9DEL2iNtsBinWiYJ/bXnl/fiLou1m7Cjk
         so3w7spEJfrhVwYITrVyhZUQ1LEPbP2Hl0bBx47YDb6LZxQwOdeXXTEFLI84LKpc9EEy
         45KW1tUN/T+rxXDPh892xI0W0A3e9TP6G9NUA2ojEwubB3D649QuxLEOBWIsBYA/nXKY
         MULo4xcn4epHClG8YLFEyShUSbgmWMauwBPCBpZj5ZUclGurrCguXBfHpbiZFJ2Qazwq
         vY3w==
X-Gm-Message-State: AOAM533DFHX9uT19bk5SJ7wRsPkXuDIVgkNxqvSY4aN9Db0S13d/mxiD
        XTIQWS3VxbqmBwBDsYZ5M1yLLpR6yeXqF3F0we0=
X-Google-Smtp-Source: ABdhPJzcAAwFOEGZr+qFkbI/fMPAU8Dd6Cd8i/TAXqVImr1sHQmtp2qcdE1svUglce5yQ+2pkTatIVn9wGAUuqvVNbI=
X-Received: by 2002:a5e:8d05:: with SMTP id m5mr16675244ioj.114.1618084713861;
 Sat, 10 Apr 2021 12:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210410181117.23967-1-eantoranz@gmail.com> <874kgeezc6.wl-maz@kernel.org>
In-Reply-To: <874kgeezc6.wl-maz@kernel.org>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Sat, 10 Apr 2021 13:58:22 -0600
Message-ID: <CAOc6etaqPprFHidXwRy+wNWqDr9FXe2=dDN9H81ODHwXpbX5yA@mail.gmail.com>
Subject: Re: [PATCH -next] arm64: vdso: correct definition of macro vdso_clocksource_ok
To:     Marc Zyngier <maz@kernel.org>
Cc:     catalin.marinas@arm.com, will@kernel.org, avagin@gmail.com,
        0x7f454c46@gmail.com, mark.rutland@arm.com, tglx@linutronix.de,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Apr 10, 2021 at 1:03 PM Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Edmundo,

Sup!

>
>
> No difference? Have you simply tried removing the macro and witness
> the effect? If it made no difference, why have the macro at all then?

Oh, come on! so having the macro defined so that you can do things like

lib/vdso/gettimeofday.c:34:#ifndef vdso_clocksource_ok

counts as "a difference" to you? XD ok ok ... so, I have deleted
"extended linux kernel C preprocessor knowledge" from my linkedin
profile.

I can safely assume that this is a big resounding NACK, right? :-D

>
> Also, run this, for example:
>
> git grep '^\#define' arch/arm64/include/asm/| awk '$2 == $3 { print }'
>
> Are you going to "fix" these too?
>
> Thanks,

Thank you for the lesson, man. Still have a lot of stuff to learn in
front of me.

Pura vida!
