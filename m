Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFD9C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Apr 2021 15:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5566F61155
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Apr 2021 15:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235366AbhDBP5e (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Apr 2021 11:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBP5e (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Apr 2021 11:57:34 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4B1C0613E6
        for <kernel-janitors@vger.kernel.org>; Fri,  2 Apr 2021 08:57:32 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id b7so8021807ejv.1
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Apr 2021 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NjT54jtHRWKb63cV3/hvdT10b8Uf7zTQ4kkn5xjn2aM=;
        b=FUjZ/sKKfq/dlrPz8u+SJ62Ga8K959fAd5BunVNKzOn/gAZ6fJYs27mZwf6RJOZTQn
         dpHYSItXJjJC4A0ekocKCMtK5C4EvS/dAZAWewVW3h/TYBK4GFz24XBY2b0WxPuQJWAX
         CP3RKFN8yGf5jO9TEtGkevkavP9D9upUCvyneOr9XN57RMLIw437TuLJ3utLEF0eTxrl
         mzioT1k8en4NqqkZohpKdOUz6qkg660nxewtJxaG9eECxpsZ3Uqg3VWmhM9Up8n2AOl5
         nYUs2vu42noqZnTT7DjlPNFU5348frOLqWe9eU+jtoNw/ah8JDTH2qBkkWj9Qk3jOwEr
         uBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NjT54jtHRWKb63cV3/hvdT10b8Uf7zTQ4kkn5xjn2aM=;
        b=F7sImafG5qHEfdLjPDrzJ0FfLmLfnUjmypPZrK/MD6dNUnO9BssEVKhnuS9EEKQTyE
         JDrDSr+fuW7pXn9i4DndAszlEsh2qZBDWloErSxoKnh8osLwR4xjQXm7gcgVjVh1HnPd
         /XS5L2tyBuRdZKQrf6fEZuJ++9s6vS0xe7uTgrYagw5F/YdZjFXJp+AlvRW7kAk0HGxD
         2KFtzIVonQgV+bNssztvSVfvIdHtxx42CrGHr987MyfwmjRyUW6Z5UuFCQZpYFrsMYfx
         IwTf9XAN0I08JRonaLoEUqo2xlsz2XCs9DA/pcKqDuS7n6Uot0GaHNfHidbmwjNf3pGm
         c76g==
X-Gm-Message-State: AOAM5318R0jmcXitwyL7WLWJIRLleAGJ8ZCSjTV9l88J+FGiux1LA0SP
        kxWUV3l+RQNyRLyi9bwwjmaCTdiVZvdot7knA7JbAKqZJw==
X-Google-Smtp-Source: ABdhPJzHGKOWAt5592FR69/C4RRWwtwIrfzvGzE/+gvH00fewfB4eOPn+6tpjVTvpOEP4zkXW11lI7AjMOKwnvxyvso=
X-Received: by 2002:a17:906:3d62:: with SMTP id r2mr14487188ejf.488.1617379051355;
 Fri, 02 Apr 2021 08:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <YGcD6HO8tiX7G4OJ@mwanda>
In-Reply-To: <YGcD6HO8tiX7G4OJ@mwanda>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 2 Apr 2021 11:57:20 -0400
Message-ID: <CAHC9VhQ4D25kvzjXyvk8eJFXCOAaxuzUkSyNTePSrBHONxXZwQ@mail.gmail.com>
Subject: Re: [PATCH] netfilter: nftables: fix a warning message in nf_tables_commit_audit_collect()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pablo Neira Ayuso <pablo@netfilter.org>,
        Richard Guy Briggs <rgb@redhat.com>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        Florian Westphal <fw@strlen.de>,
        netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Apr 2, 2021 at 7:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The first argument of a WARN_ONCE() is a condition.  This WARN_ONCE()
> will only print the table name, and is potentially problematic if the
> table name has a %s in it.
>
> Fixes: bb4052e57b5b ("audit: log nftables configuration change events once per table")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  net/netfilter/nf_tables_api.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks Dan.

Reviewed-by: Paul Moore <paul@paul-moore.com>

> diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> index 42bf3e15065a..2fb2ccf87011 100644
> --- a/net/netfilter/nf_tables_api.c
> +++ b/net/netfilter/nf_tables_api.c
> @@ -8022,7 +8022,7 @@ static void nf_tables_commit_audit_collect(struct list_head *adl,
>                 if (adp->table == table)
>                         goto found;
>         }
> -       WARN_ONCE("table=%s not expected in commit list", table->name);
> +       WARN_ONCE(1, "table=%s not expected in commit list", table->name);
>         return;
>  found:
>         adp->entries++;
> --
> 2.30.2

-- 
paul moore
www.paul-moore.com
