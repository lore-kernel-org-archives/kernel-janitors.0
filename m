Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D8DC433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Oct 2021 21:58:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25BAC61131
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Oct 2021 21:58:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239786AbhJFWAn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235627AbhJFWAm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Oct 2021 18:00:42 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E71C061753
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Oct 2021 14:58:50 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i24so15463545lfj.13
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Oct 2021 14:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gDe/CCgzbVL8cdlihpSKcZ9kkAIpNWk3w42F2ZBCbZg=;
        b=DpDarEaj1O5yO8x4BdIM2Z/QGnUEayQsIHKYbYRjnyzgH1esE022dwFqrhXwc6O5fb
         JOSG4NCOh4lBDQG6UOc7cvFWeA+sj0AzYTEr5cClzf3a4p3Y8LB8oqaZqBjiauJr5xg1
         8ESjgwjYcEbeS9PfhXdSQvk9oMdgLTik5/iZ4V2CY+r2yFgBbUSdTXI9yjXFPtgJEb7V
         HiCutC1fb4tudyIy8/s+qObuEJFapRCQJNeYJyQ1ywTjoFE7Q9b+HFci138yJTYwwokH
         z2w9tMdPXLiJSuSsAdZT7xIXmA9tEjdSrm4bRyzkEn2vaaR7N8RIYBh5M4vHHJi/EQaS
         cLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gDe/CCgzbVL8cdlihpSKcZ9kkAIpNWk3w42F2ZBCbZg=;
        b=7MoHNmQFEhMF+GdypfYwuw84TJJxAWNmPs/mgxkJGOGheL/I7fVeucnRvt8epOf25I
         yw2ky1JCQWiwGJsKx5FrT3ZgKqj4UxEqGgW4PpVboOjynC5xXuFq2YZvIxlC3yRvAeM4
         J73v831sDlHTjsoE2fPYjunyX+Z4SS2CWXAIGR2rs4Dwtoi3JnJ4bbHljoMSKZigTx0p
         0NzbYiYc2t3js2H/KW/aTSozVZLkeYqKrmumgYcCF+MRyHSAM7GBDeB2SJlCW0Y09LA5
         SygP/sxPVRKA1WmtJ/brkpGB9EBMdFCHWFN3WDqF/qj6w6Po7Z5hZxRnoHV2ygMbJslz
         9NJg==
X-Gm-Message-State: AOAM530Rwr4mOIuNseHh6okEUmhr0VyAT5sx4oUMTcbVUnvrdFhNkAYV
        1A+EWLPQG59ZKfXSMS8ijQi2Gm35APUWL6Fk+TDZx/9+TmHjCQ==
X-Google-Smtp-Source: ABdhPJw6/4P9YojbZ4+TF/BbAh9j+NIH0UVeOWkFJsuSEGRFBhFgpeb3nv6DA7bKovrjbGLFVHAi7Nh6gnC/VpLE9m8=
X-Received: by 2002:a05:651c:b20:: with SMTP id b32mr578167ljr.62.1633557528140;
 Wed, 06 Oct 2021 14:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211006082209.417-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20211006082209.417-1-lukas.bulwahn@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 6 Oct 2021 14:58:36 -0700
Message-ID: <CAKwvOd=X-ZFPraS2EL24ps1aKdT3bWhtASA0vUjXdzo655XGiQ@mail.gmail.com>
Subject: Re: [PATCH] elfcore: correct reference to CONFIG_UML
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
        kernel-janitors@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

+ Catalin who just sent a very similar patch after Lukas:
https://lore.kernel.org/lkml/20211006181119.2851441-1-catalin.marinas@arm.com/
EOM

On Wed, Oct 6, 2021 at 1:22 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 6e7b64b9dd6d ("elfcore: fix building with clang") introduces
> special handling for two architectures, ia64 and User Mode Linux.
> However, the wrong name, i.e., CONFIG_UM, for the intended Kconfig symbol
> for User-Mode Linux was used.
>
> Although the directory for User Mode Linux is ./arch/um; the Kconfig
> symbol for this architecture is called CONFIG_UML.
>
> Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:
>
> UM
> Referencing files: include/linux/elfcore.h
> Similar symbols: UML, NUMA
>
> Correct the name of the config to the intended one.
>
> Fixes: 6e7b64b9dd6d ("elfcore: fix building with clang")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20211005
>
> Arnd, please ack.
> Andrew, please pick this fix.
>
>  include/linux/elfcore.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/elfcore.h b/include/linux/elfcore.h
> index 2aaa15779d50..127716b58235 100644
> --- a/include/linux/elfcore.h
> +++ b/include/linux/elfcore.h
> @@ -109,7 +109,7 @@ static inline int elf_core_copy_task_fpregs(struct task_struct *t, struct pt_reg
>  #endif
>  }
>
> -#if defined(CONFIG_UM) || defined(CONFIG_IA64)
> +#if defined(CONFIG_UML) || defined(CONFIG_IA64)
>  /*
>   * These functions parameterize elf_core_dump in fs/binfmt_elf.c to write out
>   * extra segments containing the gate DSO contents.  Dumping its
> --
> 2.26.2
>


-- 
Thanks,
~Nick Desaulniers
