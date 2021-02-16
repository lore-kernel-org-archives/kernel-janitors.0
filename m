Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F7CC433DB
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Feb 2021 01:24:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F349E64DCF
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 Feb 2021 01:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhBPBYv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Feb 2021 20:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhBPBYp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Feb 2021 20:24:45 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7DAC0613D6
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Feb 2021 17:24:04 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id i8so4310147iog.7
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Feb 2021 17:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PJye+kSqwOydCXOrUXNte65cKiZnVuosg0HZqWH3+fk=;
        b=Z6to2lyDuRB0FdW0XxBmvurM//wT02lgv7/r0jT3SZT8EoPCTJbQbu+21VSGtSFtnH
         f/1ZTL1soBUcwgxsnwyw9E9bOw+XPNRw7+WQydmwJvkO6vMhJnSDbmxLGOdgo+HgOJGm
         iTCONinJWFfd5/8g4wN2JvKprciXK1rqs+CeLZyHH/NYkfOtiT/r6Jut6Jl+Yx4pdle0
         I2UuvvHMKbTyPXo1BGr6kg6XaZA8559c7j7pRqWYlnMAoa/M3O5JIMy3xsjzAl4HxkaQ
         vKYKSR2g7om/Y1GK8W6j7oFr4ISm7mpYQr6qki4RexrpRuzJj5DWnota8scYukdXz68Y
         rxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PJye+kSqwOydCXOrUXNte65cKiZnVuosg0HZqWH3+fk=;
        b=LwWsIO74K5KFrbNW3iSpQ3YrrukKtORyMGLbkL6GpfHKqInnS4vQ6yFz28fW3BpvDE
         NK/pPXtliz/baUpUPzgPY0YUUgEOFZpJEdFOOc4KfwCV15DJ7l8ANVrwNHf/vJPxbY+i
         PjZuaBTzOBH32l2957R2zPAaPBre65t/2ZQvE74pa34sAxgxbt615v3vvlFrt4U1paTT
         OS+FWq3IU55ZfpY6mKjf/YSjeHRzFTgsT57C7oBTW7Nr1f8vRGs8uCP9YYdMQfPp9hFJ
         q/hplqeXZofiWFiEor9XZ/h+tGlYqhc2tI41Bh4BrQ04Up58Ve+0LVjhXZMn48YRjX/o
         Jlnw==
X-Gm-Message-State: AOAM533sM2ro5ih1+TioqvRG/6BzksJvLuWXi86eINsD+Bba4f5EJ99P
        /1ZdrofSPv0P9C1ET4M1ma3f/VTowc8bvScHUcZ3jA==
X-Google-Smtp-Source: ABdhPJxDD54VyBmmZk6hcwEaZpNgzwqtUXGhXQLDibQ32pTyRaCu4xXKAaLhN53SGJR9MGA2MDvqZyppcJER56VW1rI=
X-Received: by 2002:a5d:93c2:: with SMTP id j2mr15222418ioo.166.1613438643994;
 Mon, 15 Feb 2021 17:24:03 -0800 (PST)
MIME-Version: 1.0
References: <YCqZ3P53yyIg5cn7@mwanda>
In-Reply-To: <YCqZ3P53yyIg5cn7@mwanda>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Tue, 16 Feb 2021 10:23:52 +0900
Message-ID: <CAKD1Yr3Gpa4KZXzWDMO4-V-+16FCYPb4nUZMLde+cQLk+zRxaQ@mail.gmail.com>
Subject: Re: [PATCH] USB: gadget: Fix a configfs return code
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        David Lechner <david@lechnology.com>,
        linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20210216012352.AMfIEpFi4w1_AumnIH6iH-UkR-PK0KvHqnIeABcKqEI@z>

On Tue, Feb 16, 2021 at 12:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>         {                                                               \
>                 struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);  \
> -               int ret;                                                \
> +               int ret = -EINVAL;                                      \
>                 u8 val;                                                 \
>                                                                         \
>                 mutex_lock(&opts->lock);                                \
> -               ret = sscanf(page, "%02hhx", &val);                     \
> -               if (ret > 0) {                                          \
> +               if (sscanf(page, "%02hhx", &val) > 0) {                 \
>                         opts->_n_ = val;                                \
>                         ret = len;                                      \
>                 }                                                       \

Acked-by: Lorenzo Colitti <lorenzo@google.com>
