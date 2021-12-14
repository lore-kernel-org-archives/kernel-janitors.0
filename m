Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A23C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Dec 2021 23:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237952AbhLNXCz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 14 Dec 2021 18:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237945AbhLNXCy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Dec 2021 18:02:54 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B71C06173E
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Dec 2021 15:02:54 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v1so68717829edx.2
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Dec 2021 15:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rn/GT7DgBbk/oW4rJC6hy7Ss/nDkJtDZDhoaw9Zw4iw=;
        b=Wjdowxc4SEQi/KdHC722G96ed2+b8aJ33YzjtT0PxB3ueqGAuvTHpRnyvvkDLwgwPt
         Q2iL7hhHhr34shhZO7Dob4M+sg+HOO0iU1kK/xl7nC1TkjddiSD2ZAKihyBcTrZkCYR+
         fuljFo47FIzwz4KOnx8POArO1LIbYunQGuflLvWpwRAppOPCx4WAoAlw5n8o19hD74V7
         xor2xVT/YA50NLy9PPV7tLyCn+nqe/sfVljhUiP6UoP+FyvlTAMUZTHvp+NiP0vKNM9R
         D0ZEb+Btq4+VMlGRAwrumG5aBl0Z+n9q/M46asMWNsT5FCqF0NJICY9zLFyUYZX8ceMA
         EePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rn/GT7DgBbk/oW4rJC6hy7Ss/nDkJtDZDhoaw9Zw4iw=;
        b=vo0MhZLG8jqY+LR748D6rKN+YJ7UwUbLN0HyIXRLDyyFyuZBAHvdbhnEliK6TTV3SY
         ad98D9OJSHiXNVdTVwP9iTjqZ5ZVxbopcAyhQHuX2/IezLNoy5nPqHEDyQRUPU9i3nR8
         3jlMJKneD/h+g+iKK/JsLCawAXRfC9wS9VpbS6pcUcZsl0/0Ektd4fikNQ/T3p3+/dd4
         3aetuRD2cQDDhzIupBRW/NPOTC2X78yua5iajs8cThZFAxBzp9AhMigyHDL2hl5oB2wI
         4gStL6zLTcPaCXIUvJi6b2OH+haLhUWkQgamDs8orZOj4vv2V+S9H8oJx9As3/oS0NBJ
         5HOA==
X-Gm-Message-State: AOAM531UtT0u4BQvi4wkgp4lRLUrSRwwKeaVc1+2F1jK3Tmcse+hBDw2
        aBy0T0s29DZ63laiP1yLv+IGmtXWFM+/vUpByVBwNQ==
X-Google-Smtp-Source: ABdhPJyZzEXABB2jVKF7c+30I1OgLhDcmEEO6WPjfnmuxMXZu+L6pRvmmexrJotKJ33smKZItaGp0zyTMEguAYeW+2Q=
X-Received: by 2002:a05:6402:354e:: with SMTP id f14mr11354625edd.245.1639522972746;
 Tue, 14 Dec 2021 15:02:52 -0800 (PST)
MIME-Version: 1.0
References: <20211209143501.GA3041@kili>
In-Reply-To: <20211209143501.GA3041@kili>
From:   Guenter Roeck <groeck@google.com>
Date:   Tue, 14 Dec 2021 15:02:41 -0800
Message-ID: <CABXOdTcny657JOxK-iau2Sj06a5hcDOdWFg8wKUNupgAceUU9w@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: fix read overflow in cros_ec_lpc_readmem()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Benson Leung <bleung@chromium.org>,
        Bill Richardson <wfrichar@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        Olof Johansson <olof@lixom.net>,
        Gwendal Grignou <gwendal@chromium.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

 On Thu, Dec 9, 2021 at 6:35 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If bytes is larger than EC_MEMMAP_SIZE (255) then "EC_MEMMAP_SIZE -
> bytes" is a very high unsigned value and basically offset is
> accepted.  The second problem is that it uses >= instead of > so this
> means that we are not able to read the very last byte.
>
> Fixes: ec2f33ab582b ("platform/chrome: Add cros_ec_lpc driver for x86 devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/platform/chrome/cros_ec_lpc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index d6306d2a096f..7e1d175def9f 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -290,7 +290,8 @@ static int cros_ec_lpc_readmem(struct cros_ec_device *ec, unsigned int offset,
>         char *s = dest;
>         int cnt = 0;
>
> -       if (offset >= EC_MEMMAP_SIZE - bytes)
> +       if (offset > EC_MEMMAP_SIZE ||
> +           bytes > EC_MEMMAP_SIZE - offset)

I think that means we have the same problem if offset >
EC_MEMMAP_SIZE, only now that condition isn't detected anymore because
EC_MEMMAP_SIZE - offset is a very large number.
I think what we really want is
        if (offset + bytes > EC_MEMMAP_SIZE)
only without the overflow. Not sure how we can get there without
checking each part.
        if (offset > EC_MEMMAP_SIZE || bytes > EC_MEMMAP_SIZE || bytes
+ offset > EC_MEMMAP_SIZE)
                return -EINVAL;
Maybe that ?
        if ((u64) offset + bytes > EC_MEMMAP_SIZE)
                return -EINVAL;

Thanks,
Guenter

>                 return -EINVAL;
>
>         /* fixed length */
> --
> 2.20.1
>
