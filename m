Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AD5C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 May 2022 18:44:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243400AbiEWSoh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 May 2022 14:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244205AbiEWSoU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 May 2022 14:44:20 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CBD67D1E
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 11:27:08 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bu29so27100568lfb.0
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 11:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cNu8GgvsbpstMN5PR/r7FbQyBoA4doE2J/KRSOCWuco=;
        b=P4pCSBFcumSIj5G4eIByQ1cm/h9Hiq5VA5X97Wk5UNf0wFrpzLrxjDCqTalhhKVTsz
         PvwpPZ9FJfsbf0ox3kCgikqETgzKMdva4NshPTE1JP4W53KKH+sW+wrW+54VARwa4YMX
         BfsdHFkVHasswm9iaWq3P9l1cagN2JnEWskhgSbu/kTSPUGqS4cUtzJDscd1ugPrui5H
         p0CHPAwR6+c3l1JmiveYG6JaNwZ38USv8NdSsZV/p0I9FfOdpCH7Ex/VpCqvNeG0mFL6
         dJDZJIX2UzkTIsywtWdqKf1Ca5Mf11nB3+8oZMzd6xdPNwOhDScTVsFtzdwmFVfjIIgt
         tylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNu8GgvsbpstMN5PR/r7FbQyBoA4doE2J/KRSOCWuco=;
        b=hyZ+pbUFOfWE2K5h00ivSLk56HJolNPu/2bjwbCMYTtXnxJ+WR0alTGRdgT+NewIdI
         AyafJnQUKqaKL0vCjvfGvcY9FKZHizuTlvlX+KbxzXwakkPwdyd3O3fyQVh0ZU5OF3RW
         J3HW5NRNO3b7TrcXlfWQLWgNVMK6mpsNG2Gr1OB5wytCZVOPL0eIZnIMVsTpL3qHfTYQ
         QHgVF6DK7pT9oqvsYE8jN+VTdVJO6JADD1oW9cBRpz4B8n6/uAOdRDUdWDfMfKtSXjvm
         AwmOcXHFZ3VRRI0OjFITXpXk5Rm5t43N0h3wR60MB6EPGrrJghB8jDHlP+5DttOi0vJ+
         v9Cw==
X-Gm-Message-State: AOAM531kWlRxayXFGkndnvzxYbyWfRQB1Pen9Qt0hfKmbwkbLCCPjK4+
        F2gEd7NG9zdzAhD9yJA2HFfNc2W3Ln9jVImmTjE9OA==
X-Google-Smtp-Source: ABdhPJwtL/9b9Op6DZncvq9prrrbtQImTZ5H/bUzajfBqooqYDKMkJ9dAI4p7nxMhLDrq+Oyhd6w4ml0b0qA5xV8mAk=
X-Received: by 2002:a19:651c:0:b0:477:87cf:de6 with SMTP id
 z28-20020a19651c000000b0047787cf0de6mr16656479lfb.432.1653330426475; Mon, 23
 May 2022 11:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <23e0ba7863d51ab629498762a97d477645aeafea.1653123744.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <23e0ba7863d51ab629498762a97d477645aeafea.1653123744.git.christophe.jaillet@wanadoo.fr>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 23 May 2022 11:26:54 -0700
Message-ID: <CAKwvOdneqUvq+Nz_zPmJmuPFfAvWQgnzrw1AJt=WqQF2hThF-A@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: Add an option to enable -O1 and speed-up
 compilation time
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     dan.carpenter@oracle.com, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 21, 2022 at 2:04 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Add a new compilation option which speeds-up compilation time.
> This can be useful when using static checker such as smatch or build-bots.
> In such cases, the speed and quality of the generated code is not
> important.
>
> Using -O0 would be even better, but unfortunately, building fails with
> this option.

Which is a tragedy.

As with the Rust series, I'm not a fan of this (or
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3):
https://lore.kernel.org/lkml/CAKwvOd=7QTUH69+ZbT7e8einvgcosTbDkyohmPaUBv6_y8RfrQ@mail.gmail.com/

These feel more like attempts to wrap every conceivable command line
flag in a kconfig option, which makes me think of that meme from
Jurassic Park: "your scientists were so preoccupied with whether or
not they could, they didn't stop to think if they should."
Not a fan.  I'd ask for measurements, but that would be a request for
a "rock fetching quest" for something I still wouldn't be a fan of.

>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  Makefile     | 5 ++++-
>  init/Kconfig | 8 ++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 1f8bef92868f..14467386f947 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -817,7 +817,10 @@ KBUILD_CFLAGS      += $(call cc-disable-warning, format-truncation)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, format-overflow)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, address-of-packed-member)
>
> -ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
> +ifdef CONFIG_CC_OPTIMIZE_FOR_COMPILATION_SPEED
> +KBUILD_CFLAGS += -O1
> +KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 1
> +else ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
>  KBUILD_CFLAGS += -O2
>  KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 2
>  else ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
> diff --git a/init/Kconfig b/init/Kconfig
> index a96776a9b080..3177a1830c9a 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1384,6 +1384,14 @@ choice
>         prompt "Compiler optimization level"
>         default CC_OPTIMIZE_FOR_PERFORMANCE
>
> +config CC_OPTIMIZE_FOR_COMPILATION_SPEED
> +       bool "Optimize for compilation speed (-O1)"
> +       help
> +         This option can be useful when running a static checker such as smatch
> +         or a build-bot.
> +         Compilation time is slighly faster than -O2 and it requires less

s/slighly/slightly/

> +         memory.
> +
>  config CC_OPTIMIZE_FOR_PERFORMANCE
>         bool "Optimize for performance (-O2)"
>         help
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
