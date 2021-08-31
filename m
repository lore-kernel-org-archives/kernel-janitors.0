Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BA4C432BE
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 10:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C530B60ED4
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 10:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240867AbhHaKME (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 31 Aug 2021 06:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240859AbhHaKME (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 31 Aug 2021 06:12:04 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71C2C06175F
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Aug 2021 03:11:09 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id f15so33802074ybg.3
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Aug 2021 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p908OU1E8CzrpDUzYGZuUBjZvVs4SSIM0jaSnlZ/+ig=;
        b=UfiBBWOTypAlVrhNlbjtNJhxXfXng2eEC7fA5RgfRb9zMTk3g4kVS5SpPXe3hRXfKA
         EY3yGMn1hVhVO9NWr+od4K0eCl6AJQrrklIYq+DMjB4j+9ZwhczyBrR9OJT2AjwRTcwF
         8kVfgHvQToXN2CAKRX9Fns19TKXM2JQzPyjNMbz/KPdeUYQlNlEq+Oymgg/+zg7ljitJ
         Q0aS9n4lkPAAjkZ9Qj5438WsN6FQnUGHEun78LZqGAb0Rp+etKBvwdNPd1HHc4sjSoGl
         aDd0Pun6KJRZ+sFYQ3kGJNJCBYOD8w1vzUSr4lqRYMl/QPG97XDIzws8N8gbF2LW3Bqh
         gMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p908OU1E8CzrpDUzYGZuUBjZvVs4SSIM0jaSnlZ/+ig=;
        b=JnhWHzd3ym7rUJE+Oc2fq/esmEaXrRLDyJraWNSEiI9CNfJyqcjxg36tQM+8iHq4x6
         pu519rb/YVB2dwDE/YrFLK2oxnZZDRl1r70XhCzcOfY1Bv/eEUpKvAW96Q3YSYzU8u2X
         m0/Y7kvbrrpILDO1rA62UcEA76pT6SaaEhopBawLvSed/N6U0j+BQYll+7VFKiiJdpL6
         6fBPeHA5cwlpO+aFbxsZumlvOSNGMm9cLRU7rX92sojVVBBdXpVcOxioqyFjE2zgxnmZ
         YiBd0A/wcTq3rCD5IyZJNj1SQF1eC4a6Kwx9feBuDKwpGkVZ7q6hhVnVOuEbg94mC46l
         HfEA==
X-Gm-Message-State: AOAM531dGcoq6YVOQlNtgDHt7ebaSmOHgnQeXSpcCLeFqwQzptbe0an9
        PbtieedH76r3x+MdFqLrrDqdvI/d7WVKHun2NTWdbg==
X-Google-Smtp-Source: ABdhPJyg3yJ5XGUgLYfDThVSCxupYgXwLkJH7506KDFxf2y1yQ9FAqiu0Ro6CvXGj/mOOrn4hASxloMRGT+EkpM+7ic=
X-Received: by 2002:a25:e013:: with SMTP id x19mr30181508ybg.366.1630404668979;
 Tue, 31 Aug 2021 03:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629472813.git.christophe.jaillet@wanadoo.fr> <5341e631dc93902ef13840807163a2883764b8ed.1629472813.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <5341e631dc93902ef13840807163a2883764b8ed.1629472813.git.christophe.jaillet@wanadoo.fr>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 31 Aug 2021 12:10:58 +0200
Message-ID: <CAMpxmJX+diO-d-0sxFheMyPYJGxun6QOzddP-hrnU=ac2hSCKw@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: mpc8xxx: Fix a potential double iounmap call in 'mpc8xxx_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        alexandru.marginean@nxp.com, Laurentiu.Tudor@nxp.com,
        Hui Song <hui.song_1@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Ran Wang <ran.wang_1@nxp.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Aug 20, 2021 at 5:38 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Commit 76c47d1449fc ("gpio: mpc8xxx: Add ACPI support") has switched to a
> managed version when dealing with 'mpc8xxx_gc->regs'. So the corresponding
> 'iounmap()' call in the error handling path and in the remove should be
> removed to avoid a double unmap.
>
> This also allows some simplification in the probe. All the error handling
> paths related to managed resources can be direct returns and a NULL check
> in what remains in the error handling path can be removed.
>
> Fixes: 76c47d1449fc ("gpio: mpc8xxx: Add ACPI support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 241bcc80612e..fa4aaeced3f1 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -332,7 +332,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>                                  mpc8xxx_gc->regs + GPIO_DIR, NULL,
>                                  BGPIOF_BIG_ENDIAN);
>                 if (ret)
> -                       goto err;
> +                       return ret;
>                 dev_dbg(&pdev->dev, "GPIO registers are LITTLE endian\n");
>         } else {
>                 ret = bgpio_init(gc, &pdev->dev, 4,
> @@ -342,7 +342,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>                                  BGPIOF_BIG_ENDIAN
>                                  | BGPIOF_BIG_ENDIAN_BYTE_ORDER);
>                 if (ret)
> -                       goto err;
> +                       return ret;
>                 dev_dbg(&pdev->dev, "GPIO registers are BIG endian\n");
>         }
>
> @@ -384,7 +384,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>         if (ret) {
>                 dev_err(&pdev->dev,
>                         "GPIO chip registration failed with status %d\n", ret);
> -               goto err;
> +               return ret;
>         }
>
>         mpc8xxx_gc->irqn = platform_get_irq(pdev, 0);
> @@ -416,9 +416,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>
>         return 0;
>  err:
> -       if (mpc8xxx_gc->irq)
> -               irq_domain_remove(mpc8xxx_gc->irq);
> -       iounmap(mpc8xxx_gc->regs);
> +       irq_domain_remove(mpc8xxx_gc->irq);
>         return ret;
>  }
>
> @@ -432,7 +430,6 @@ static int mpc8xxx_remove(struct platform_device *pdev)
>         }
>
>         gpiochip_remove(&mpc8xxx_gc->gc);
> -       iounmap(mpc8xxx_gc->regs);
>
>         return 0;
>  }
> --
> 2.30.2
>

Applied, thanks!

Bart
