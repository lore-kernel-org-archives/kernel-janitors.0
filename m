Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5570CCCA47C
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Jun 2022 14:30:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbiFWOab (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Jun 2022 10:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiFWOaa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Jun 2022 10:30:30 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DA43B2B2
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jun 2022 07:30:29 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id e2so17884307edv.3
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jun 2022 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3FqgQSdckr3OdNUbYCmdpzsVtzVQYCqYvXjlPe3jt2g=;
        b=K40v64solAooVxeHtoh68eeXXDCpTf4IVCfUdTc3gLmgaD1d+8LG8dd1DcKhsE3U2+
         eltq4RSYfUwYXY78KixRbCIcWlyWKXaPhMLzTepOoxMn1DRa8Da5neE4xN9GoPCexboz
         1nttK+6LN6M4/lVROsOqhNBQ8Je966WVdoIrTPMBmIZHMbcnpxL4NkvEGnONDLle1C3W
         lhlP4J4k3A6YhL6zWlTbhlhKo1VVHwpYs11JEh0XzSIlHO7iCh0PVZVgvBnua2yMpQrE
         l0E2Yc95YNqIyvjYN4fU3WBHC/X8EqooSxI8hVY1NxOunjm1wSvm4Ra7rKtfbHOBH9lX
         rSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3FqgQSdckr3OdNUbYCmdpzsVtzVQYCqYvXjlPe3jt2g=;
        b=tVnXTk4AXK23BJQE1WbaEp1bjgVb1AYCxya6R2L8DjblyKaRLDIUiOEoed8OXGrsem
         POUM/Zqsj8+r1p21KTGNLIAM37WIB/Yzn2fqg6sEhJTnjIz0BxMTqDGKTOIf1wMTaSX2
         4+oYntDz6Vqht5a0PVjLy31kf3aunlPR7IvN6EWWEvCLSp9mHNw1iBTv41bTOuCu6I1i
         GAMSMPxOxEbLmI4KS/XkuGeSvweE2kM5xhOEPB1AcXd4Pjcy7K2qWc0oBUuCqo9rFlR4
         xjUTyYyLOcuTSS18KKqzTTuFkZ8ZLw6WQAvtAU+ydtIuJrE20erySvCAJWnSLTtWLdyU
         hFwQ==
X-Gm-Message-State: AJIora9+Bkx/63ET9IY5VVkigxDLXOtVRSxh/Pn58sXdijBhIqVviEbp
        Z+UmG2bhooMZFG56gNdzwqmwFBnCG4KDeDJFY/YQ/j6DB8+wtQ==
X-Google-Smtp-Source: AGRyM1s1vCdehuZoBSyt1SZuQzboeTxZY5Ghl6aMY2Vf7vd7oVHFM4kF0yullI0Wj3aV1Bhz4PleNU/GBe4E+Ul7efc=
X-Received: by 2002:aa7:cb94:0:b0:435:9054:db5 with SMTP id
 r20-20020aa7cb94000000b0043590540db5mr11079105edt.29.1655994627724; Thu, 23
 Jun 2022 07:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <YrQkfBuIHArxHSNr@kili>
In-Reply-To: <YrQkfBuIHArxHSNr@kili>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 16:30:17 +0200
Message-ID: <CAMRc=Me95xJspeUkdmKNowWY+Z-r02zDc-CUuQ8xF5taiTxUgQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: winbond: Fix error code in winbond_gpio_get()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 23, 2022 at 10:30 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This error path returns 1, but it should instead propagate the negative
> error code from winbond_sio_enter().
>
> Fixes: a0d65009411c ("gpio: winbond: Add driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpio/gpio-winbond.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-winbond.c b/drivers/gpio/gpio-winbond.c
> index 7f8f5b02e31d..4b61d975cc0e 100644
> --- a/drivers/gpio/gpio-winbond.c
> +++ b/drivers/gpio/gpio-winbond.c
> @@ -385,12 +385,13 @@ static int winbond_gpio_get(struct gpio_chip *gc, unsigned int offset)
>         unsigned long *base = gpiochip_get_data(gc);
>         const struct winbond_gpio_info *info;
>         bool val;
> +       int ret;
>
>         winbond_gpio_get_info(&offset, &info);
>
> -       val = winbond_sio_enter(*base);
> -       if (val)
> -               return val;
> +       ret = winbond_sio_enter(*base);
> +       if (ret)
> +               return ret;
>
>         winbond_sio_select_logical(*base, info->dev);
>
> --
> 2.35.1
>

Applied, thanks!

Bart
