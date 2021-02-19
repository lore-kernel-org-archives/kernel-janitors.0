Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9991C433E0
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Feb 2021 13:47:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B70AB64E76
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Feb 2021 13:47:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhBSNrD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Feb 2021 08:47:03 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:38175 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhBSNrB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Feb 2021 08:47:01 -0500
Received: by mail-ot1-f46.google.com with SMTP id s3so1927063otg.5;
        Fri, 19 Feb 2021 05:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N87u3s4tu/lot3REjHTTkliSBZT6KlVyweiixUFivig=;
        b=LRRTAnZzOkrk8OAXNFBvsxT+sOKCiKmSp9rZRXzLVs6TlIkahGYYTa2MVkLLbZFLPW
         hAr6EjFsk6f3VSOBu0huZL/uG3wdFOYSLseAQYxgFri6gfIx12knIFpCXGKjMsmE7g7L
         9PVkN61qCtzwGDPVkRSWtpCh+WY7mhu1gwXit/FK50cUj9busSGbgFMerk/SAeq7ujrK
         syDBZaFSUdE4L8PaNTztSqjrMq9LMPECEUF6K2Og2+oZg8hiKXtBKhq4wmUBpbV2b6tm
         s6ACJ6UFztugvpdpAa5jfsL4xZG3lSW6y8gzm3L0C4V1mqKW3fkilrs9vVY5s30ipxzM
         VFuQ==
X-Gm-Message-State: AOAM533LUfsMn+ddT45HxgraHB0kjjSFa3m4AhCpW9zrLFgw9URLR9Or
        Fz6kWTByKCYB1gSxAb74nFGlGJnneju0FxLZPtk=
X-Google-Smtp-Source: ABdhPJxII/q4/GNmq5MAWnP8pwaesn/5iH3kJjObe4JJa517d72g2yY+hEP7Dkrw6hLE7jGwlZAmN9frgTqniK3cSZ8=
X-Received: by 2002:a05:6830:2106:: with SMTP id i6mr6825709otc.260.1613742380552;
 Fri, 19 Feb 2021 05:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20210218202837.516231-1-colin.king@canonical.com>
In-Reply-To: <20210218202837.516231-1-colin.king@canonical.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Fri, 19 Feb 2021 14:46:08 +0100
Message-ID: <CAJZ5v0johrMqzCpu7jYtJX8OFWcw+yrNaQo0BKh-CZvsuVkHGw@mail.gmail.com>
Subject: Re: [PATCH][V2] drivers/base/cpu: remove redundant assignment of
 variable retval
To:     Colin King <colin.king@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Feb 18, 2021 at 9:28 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable retval is being initialized with a value that is never read
> and it is being updated later with a new value.  Clean this up by
> initializing retval to -ENOMEM and remove the assignment to retval
> on the !dev failure path.
>
> Kudos to Rafael for the improved fix suggestion.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
> V1: Remove initialization of retval
> V2: Initialiation of retval with -ENOMEM and remove assignment in
>     !dev failure path.
> ---
>  drivers/base/cpu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 8f1d6569564c..2b9e41377a07 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -409,13 +409,11 @@ __cpu_device_create(struct device *parent, void *drvdata,
>                     const char *fmt, va_list args)
>  {
>         struct device *dev = NULL;
> -       int retval = -ENODEV;
> +       int retval = -ENOMEM;
>
>         dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> -       if (!dev) {
> -               retval = -ENOMEM;
> +       if (!dev)
>                 goto error;
> -       }
>
>         device_initialize(dev);
>         dev->parent = parent;
> --
> 2.30.0
>
