Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C440C48BE0
	for <kernel-janitors@archiver.kernel.org>; Fri, 11 Jun 2021 18:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C4B0613C6
	for <kernel-janitors@archiver.kernel.org>; Fri, 11 Jun 2021 18:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhFKTBD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 11 Jun 2021 15:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhFKTBC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Jun 2021 15:01:02 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD6DC061574
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Jun 2021 11:58:58 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id b9so5691939ybg.10
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Jun 2021 11:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=txpJhphRW+zqWc5SQouuoFiurfy3eRal/BliZF5gMZY=;
        b=e32Jo77VruUyLGp0VsLav7hbQCXF0PIP8+t2IFaYoI/UgSpO0vFG54LQ2pshvnIPZn
         UmdQ654CCLVvuVOHEYgbR+VWeNkUQxr0SmLjEO2vwRK5Ts5u4EZhck/dkEnrF0FyFbdp
         8l2zKux+pUr05MseofQvdhLU0JN8KQJT/hesaItN7z2QqmmAgeEl1+dJpss7svcbyCIZ
         yJSXhDf+c8Xx58VZwu5yLry82dEhAc3GXTTemtTuT2pekR+CbX8YvefmYxjRl0nUSkbU
         ZrNEnzg7GuGQzfstfweThMbNqqjAEOTQiI9v3A/LdhcneTwUspur7vKE2xDaRK9gyE7s
         QE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=txpJhphRW+zqWc5SQouuoFiurfy3eRal/BliZF5gMZY=;
        b=e+XAypFtjtc71SDLh8uEQnCpBgPW15x6hUtWBp18hTVbrfKwAgwObB3Jrf8L6Lg974
         4GIIVlFOJ5F2TAxePJ0FuRqcCpNhcE5CXxjWcK8UBm5KBHNd+SGJ8FckiBlxuXVC+J0p
         A9dd4qE0eOsM9/8uFnzisAggthL8Q/StqtAXdMd3dYNmm8er5T2zAAAPUAhpRAplum3n
         03a3vUvfYUp76NWeaioyB2PkFPI5GGeUt+OuczjBI+jVe6XOXcvDk7SW/Z0cW2hwtyl7
         HhnZhLd/B2Ltw4kR8H+VtrpAEEKSnoq/CoiIQw+CSKC+b1sQIDtRPFHl6GoKd4xSz2W8
         pWhA==
X-Gm-Message-State: AOAM532YNOrlBD0X6WKdXndd474oFCWCK2GCbb+/0kUM6t1mb5gVnzeR
        IMAeqy+hRSt6Onuugjpme5Whfm8LQBJEiidiNc28/w==
X-Google-Smtp-Source: ABdhPJx/T3Qz3DWAlDtZBVE06lIWFdevaKCMfE+rTQDoCAabJnjIt58EzU+PLA6oUU03k5IkIMUe2RJoNCQ9eRsuSbk=
X-Received: by 2002:a25:18c3:: with SMTP id 186mr7839000yby.0.1623437938147;
 Fri, 11 Jun 2021 11:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210608143853.4153234-1-weiyongjun1@huawei.com>
In-Reply-To: <20210608143853.4153234-1-weiyongjun1@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 11 Jun 2021 20:58:47 +0200
Message-ID: <CAMpxmJVBwiZ__Lmg7dgt0Vnxpa1dd_rvK=oXCc_YbXjijmsweg@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: idt3243x: Fix return value check in idt_gpio_probe()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 8, 2021 at 4:28 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In case of error, the function devm_platform_ioremap_resource_byname()
> returns ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
>
> Fixes: 4195926aedca ("gpio: Add support for IDT 79RC3243x GPIO controller")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpio/gpio-idt3243x.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
> index e961acee1571..50003ad2e589 100644
> --- a/drivers/gpio/gpio-idt3243x.c
> +++ b/drivers/gpio/gpio-idt3243x.c
> @@ -142,8 +142,8 @@ static int idt_gpio_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         ctrl->gpio = devm_platform_ioremap_resource_byname(pdev, "gpio");
> -       if (!ctrl->gpio)
> -               return -ENOMEM;
> +       if (IS_ERR(ctrl->gpio))
> +               return PTR_ERR(ctrl->gpio);
>
>         ctrl->gc.parent = dev;
>
> @@ -160,8 +160,8 @@ static int idt_gpio_probe(struct platform_device *pdev)
>
>         if (device_property_read_bool(dev, "interrupt-controller")) {
>                 ctrl->pic = devm_platform_ioremap_resource_byname(pdev, "pic");
> -               if (!ctrl->pic)
> -                       return -ENOMEM;
> +               if (IS_ERR(ctrl->pic))
> +                       return PTR_ERR(ctrl->pic);
>
>                 parent_irq = platform_get_irq(pdev, 0);
>                 if (!parent_irq)
>

Applied, thanks!

Bartosz
