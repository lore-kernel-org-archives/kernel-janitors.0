Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE584EB64DA
	for <kernel-janitors@archiver.kernel.org>; Sat, 24 Jun 2023 05:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjFXFfL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 24 Jun 2023 01:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjFXFfJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 24 Jun 2023 01:35:09 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC1DC2
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Jun 2023 22:35:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f86840c45dso808e87.1
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Jun 2023 22:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687584906; x=1690176906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=unxnCCJRCGrLNc6DK9W9SYp6CzMnpymgA+tJ26E5z4c=;
        b=zoPKyonEhRanEEwlo+h8+8Z8VRfqp1l6ONyly/Jeg40dr4nnrFRY0rCyCuX8t+B/6I
         OV/oMJ7VBNL1xEANXaDAm/XgPA7U/DCxttNq13cr3tIy78k9Dm1UmAtXUY0f+ib3OF1/
         zUw5knm1BQr3x5/PP+gFeYXjNTCapZhVJz33Sn6Ux+EbifEnlp9BclirjVvHertYZoSN
         PMU+M3ydOHl9qk4ZKQsmJ04nIrOWjZ1Aa8tU+/NdHMkpT9XBJChYmgWzR91z9YODjqEZ
         vxE+9cEeVlUgXxmD+iUcFBzwV80cyQs7/UJqyLRPBf4YN03MDRAkACIRIgAJbSOVjP8x
         L5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687584906; x=1690176906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unxnCCJRCGrLNc6DK9W9SYp6CzMnpymgA+tJ26E5z4c=;
        b=UCEyNB4nsoyHRmio5lwxU1xVWnCn7CfpF1JkauzywSoXejwv6hjn9LGFg1++PP9LhI
         0sWL2XZg+hgGBtaRMhFfcIReOO9pJ/OavOPb2V4sPi/rhHRLfTTNzMTRmn/2LYq3txaM
         Cz8N/oeh2ySIFSgjNRf/s15zX9CJgIxnu3S4xi6i3yKBlN4uVZiKnQrhoOmzYG06HTsi
         21ig/gVlr0AVOXVDqBegf+xmwdXwi6s8S+CGzSn4CvSOkE0jrc2hk6pdFuTyhrEINdla
         VAGx+0Lcia3w1IIWmZXJKEg2vIr9G7/yQ9oTgVqVFzRnPyH4iHjfi6Ey/ju/lgIHv0mF
         T6lQ==
X-Gm-Message-State: AC+VfDzhxtD3VssQacJlZ1wJBqu4u3thvUx7Xs6VNt4ok64KESLa1b7e
        ISwrVNyWDyCVEW4uv6ZRkSnQcw02RVFNLw2w6oT5AYSIIodlif6nLmQ=
X-Google-Smtp-Source: ACHHUZ4ojDUlNlceCFt6jQy142S4bZfLuwkTRRSpILzz1gubQeWsasHU6g2lTN35oFzz28Lu0C/XMPqy4fQcg/S4zIo=
X-Received: by 2002:ac2:43d5:0:b0:4f7:5f7d:2f9b with SMTP id
 u21-20020ac243d5000000b004f75f7d2f9bmr12852lfl.1.1687584905392; Fri, 23 Jun
 2023 22:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230623211457.102544-1-Julia.Lawall@inria.fr> <20230623211457.102544-18-Julia.Lawall@inria.fr>
In-Reply-To: <20230623211457.102544-18-Julia.Lawall@inria.fr>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Sat, 24 Jun 2023 07:34:52 +0200
Message-ID: <CACT4Y+ayUeSpdmkec3pCna1kVSd1QTgBYLAb3zNJJ-7wcDHGdQ@mail.gmail.com>
Subject: Re: [PATCH 17/26] kcov: use array_size
To:     Julia.Lawall@inria.fr
Cc:     keescook@chromium.org, kernel-janitors@vger.kernel.org,
        Andrey Konovalov <andreyknvl@gmail.com>,
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 23 Jun 2023 at 23:15, Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Use array_size to protect against multiplication overflows.
>
> The changes were done using the following Coccinelle semantic patch:
>
> // <smpl>
> @@
>     expression E1, E2;
>     constant C1, C2;
>     identifier alloc = {vmalloc,vzalloc};
> @@
>
> (
>       alloc(C1 * C2,...)
> |
>       alloc(
> -           (E1) * (E2)
> +           array_size(E1, E2)
>       ,...)
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  kernel/kcov.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 84c717337df0..631444760644 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -900,7 +900,7 @@ void kcov_remote_start(u64 handle)
>         /* Can only happen when in_task(). */
>         if (!area) {
>                 local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
> -               area = vmalloc(size * sizeof(unsigned long));
> +               area = vmalloc(array_size(size, sizeof(unsigned long)));
>                 if (!area) {
>                         kcov_put(kcov);
>                         return;
>
