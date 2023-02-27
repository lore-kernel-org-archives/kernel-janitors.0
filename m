Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CCEC64ED6
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Feb 2023 10:27:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjB0K1Y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 27 Feb 2023 05:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjB0K1T (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Feb 2023 05:27:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CF22055B
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Feb 2023 02:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677493598;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ORysGkdK/Pguqa6KzjHxllcwhbHEv5qK0Wn8PNtiKpA=;
        b=fq83vbvrGJB3LZ4t98xZfuvnnU/P+zPLqjbm/XBlXjn/vRH9eJgkeo1dF6o8tZxHYoQP2q
        3Xne85ZRZdX8kO5YiG093/92Famd4KGa8axFcI5eiWBUsh/D/jq98nIeFygiB1nx3EoblD
        ci4J2PhhtrmY5EhJIcW2rwz0oz9Q+f4=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-OAn7PJ7bMWaBY1E4R9kbww-1; Mon, 27 Feb 2023 05:26:36 -0500
X-MC-Unique: OAn7PJ7bMWaBY1E4R9kbww-1
Received: by mail-vs1-f72.google.com with SMTP id v13-20020a0561020f0d00b0041f24dc9c47so5161319vss.9
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Feb 2023 02:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORysGkdK/Pguqa6KzjHxllcwhbHEv5qK0Wn8PNtiKpA=;
        b=g8Bgw2A/bbV3x8oHWidKDe23yP2SgxJnio0JBDYxy1t/bsYu1orKO8wL6MsrvQyF8q
         m4CxGcZPjIYhaUtXcaXmTzjCz4lz5WOB7fT8ISYceBOGyyXW80fT8YEgz4W+vZAU5v0o
         Mg9suF358jdhlpjhr7vIekBxGZVjluwYny6LjBpATTjni2cu6PWX+OeVJWOEIDv8o5YD
         uEfgGta26lhkVibd+8KJbhCkXU0LrK2e1ClLYbqAB0tWC4LunZExWPBsTKLugeHW7vP8
         qxJ2gPbL99RkYbVNSEb8jEcwXJHL6u88CaWVCCFjdmuCINDKEz8B+Be2fnhSp8zNoEyl
         geLA==
X-Gm-Message-State: AO0yUKXf76hRcZsWENISafLvFLDBlLkrh2aMTIxvuomtbZw7uCrxK8fr
        fwX5ezISu/DuTAreAPCQcdc1SC/3RZ91S0j8tBizOixc443e3TNbhv72bPffsZb/gAnjmxQyUQv
        Xq19DiY6hZeJAtKBrEppdiVKoAj0U1pC8ZG1+PvQuwNYb
X-Received: by 2002:a1f:bf16:0:b0:413:1498:e843 with SMTP id p22-20020a1fbf16000000b004131498e843mr7165640vkf.0.1677493596353;
        Mon, 27 Feb 2023 02:26:36 -0800 (PST)
X-Google-Smtp-Source: AK7set992JZJfczXidh5nXBnsu5o2gkRvL073x6tl2UuRSKy8og8GT5X66IeGe+wctC68z1nH/ku6NujpNQ8OHcKkJ8=
X-Received: by 2002:a1f:bf16:0:b0:413:1498:e843 with SMTP id
 p22-20020a1fbf16000000b004131498e843mr7165626vkf.0.1677493596036; Mon, 27 Feb
 2023 02:26:36 -0800 (PST)
MIME-Version: 1.0
References: <Y/yAzR6sWvPedLej@kili>
In-Reply-To: <Y/yAzR6sWvPedLej@kili>
From:   Eric Curtin <ecurtin@redhat.com>
Date:   Mon, 27 Feb 2023 10:26:20 +0000
Message-ID: <CAOgh=FyxFuENe6SgJB7aUwPS-ZB_51q6a=zWEcZSAsGqX034hA@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: apple-soc: Fix an IS_ERR() vs NULL check
To:     Dan Carpenter <error27@gmail.com>
Cc:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Marc Zyngier <maz@kernel.org>, asahi@lists.linux.dev,
        linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 27 Feb 2023 at 10:16, Dan Carpenter <error27@gmail.com> wrote:
>
> The of_iomap() function returns NULL if it fails.  It never returns
> error pointers.  Fix the check accordingly.
>
> Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---

Nice catch!

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

>  drivers/cpufreq/apple-soc-cpufreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index c11d22fd84c3..021f423705e1 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -189,8 +189,8 @@ static int apple_soc_cpufreq_find_cluster(struct cpufreq_policy *policy,
>         *info = match->data;
>
>         *reg_base = of_iomap(args.np, 0);
> -       if (IS_ERR(*reg_base))
> -               return PTR_ERR(*reg_base);
> +       if (!*reg_base)
> +               return -ENOMEM;
>
>         return 0;
>  }
> --
> 2.39.1
>
>

