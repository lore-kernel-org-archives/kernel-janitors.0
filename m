Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892B6C43217
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Nov 2022 02:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiKEC7D (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 4 Nov 2022 22:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiKEC7C (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Nov 2022 22:59:02 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB062419BA
        for <kernel-janitors@vger.kernel.org>; Fri,  4 Nov 2022 19:58:59 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 21so10138459edv.3
        for <kernel-janitors@vger.kernel.org>; Fri, 04 Nov 2022 19:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uDDAW4bfixZV9jxCbkjO/hz8g7Y57vtJ/LbWD2zWZg0=;
        b=aBYv502mu5ffMnm/ju1VA5lVoHbMZd1zLNmKFIYeyVqluZxcQKGuLTGYcvb4TNYZ+c
         S5WL8awJiq5PFIfb7bg3Jhx9mEa4UU5S8CasjXmZASxieB3+IiJPizYBrOkrsVOEuc7t
         eIlcm6UnRaDRjIXpgrqfn1ICHw9+OYnY4LqBdtTG1TafgUOsdWYeRULs1LHtVuuN6ltO
         vKSgcGXivF32sOK6XR2dndvN1WtQMxg7+V+5PBvWM4uPpYj8XIdZ07a3mRBl8EYPYRG6
         fOaNoI8OsZ367sJefgVdXHz+Va62zPqMz4pa0BRVDEle2kjiJfZJ2Ny4XMlRh5GrBCyf
         pIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDDAW4bfixZV9jxCbkjO/hz8g7Y57vtJ/LbWD2zWZg0=;
        b=Kfi0bQUgeM7+VGtL+PS9xUUnV+rZHZHrnru3133nHZ27xny8OinwERi0Rgy3ZJ+o3E
         MIobXDIRcR0APWbrdLtoeCHM7JAZzHQw5GCOmR66bE8pDCtJRuoG5Iw+UJYknpeDNT1s
         +N6NBS3BuRUmTSW6Aet8nOH/+hh4JQdsDq9XVzgkUqDnKSZ5KozMSA26LAKdii4ijBJu
         vCGiNLxRDi+W0shd5JgusFNeMDEeCYIp4VaaMlnglqOFZnvWJVpIRVQ0hPetpsoP9w1d
         AFFlZSi/0y+fH54ktBfaahrc7dYhfgjfWErjQgI2dqJNh83fbnnhiidMSBSvEFWLcBHS
         px5g==
X-Gm-Message-State: ACrzQf3RqPFFIQgdCIyLgmjVHtmQVCWPat/ifnJy8b1KwEfiv99Waz2B
        87zsDWZ29Cr6nK5uhpjV1K862maEWTaNAwt8/nAV/w==
X-Google-Smtp-Source: AMsMyM4/G+GGwu/XWb7PryL7j0Ob5S/pX6DTxOjBIX9oRf9pcoBvcDWaB2iq48g4djXsLr6PkXjNCVNKoQCGxSwdmuo=
X-Received: by 2002:a05:6402:2025:b0:464:67fd:e5d3 with SMTP id
 ay5-20020a056402202500b0046467fde5d3mr6533366edb.59.1667617138320; Fri, 04
 Nov 2022 19:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr> <03f9401a6c8b87a1c786a2138d16b048f8d0eb53.1667336095.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <03f9401a6c8b87a1c786a2138d16b048f8d0eb53.1667336095.git.christophe.jaillet@wanadoo.fr>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Fri, 4 Nov 2022 22:58:20 -0400
Message-ID: <CA+CK2bDJjYuO8Xk_8cP874hxDKA5LFhpdbZ+s0SE6bgFPpMg3w@mail.gmail.com>
Subject: Re: [PATCH 21/30] mm: Use kstrtobool() instead of strtobool()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-mm@kvack.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 1, 2022 at 5:15 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
>
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
>
> While at it, include the corresponding header file (<linux/kstrtox.h>)
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is part of a serie that axes all usages of strtobool().
> Each patch can be applied independently from the other ones.
>
> The last patch of the serie removes the definition of strtobool().
>
> You may not be in copy of the cover letter. So, if needed, it is available
> at [1].
>
> [1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
> ---
>  mm/page_table_check.c | 3 ++-
>  mm/usercopy.c         | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 433dbce13fe1..93e633c1d587 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2021, Google LLC.
>   * Pasha Tatashin <pasha.tatashin@soleen.com>
>   */
> +#include <linux/kstrtox.h>
>  #include <linux/mm.h>
>  #include <linux/page_table_check.h>
>
> @@ -23,7 +24,7 @@ EXPORT_SYMBOL(page_table_check_disabled);
>
>  static int __init early_page_table_check_param(char *buf)
>  {
> -       return strtobool(buf, &__page_table_check_enabled);
> +       return kstrtobool(buf, &__page_table_check_enabled);
>  }

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

>
>  early_param("page_table_check", early_page_table_check_param);
> diff --git a/mm/usercopy.c b/mm/usercopy.c
> index c1ee15a98633..4c3164beacec 100644
> --- a/mm/usercopy.c
> +++ b/mm/usercopy.c
> @@ -12,6 +12,7 @@
>
>  #include <linux/mm.h>
>  #include <linux/highmem.h>
> +#include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <linux/sched/task.h>
> @@ -258,7 +259,7 @@ static bool enable_checks __initdata = true;
>
>  static int __init parse_hardened_usercopy(char *str)
>  {
> -       if (strtobool(str, &enable_checks))
> +       if (kstrtobool(str, &enable_checks))
>                 pr_warn("Invalid option string for hardened_usercopy: '%s'\n",
>                         str);
>         return 1;
> --
> 2.34.1
>
