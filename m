Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7218AC71153
	for <kernel-janitors@archiver.kernel.org>; Sun,  3 Sep 2023 17:02:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343734AbjICRCn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 3 Sep 2023 13:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343697AbjICRCm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 3 Sep 2023 13:02:42 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F30C10C
        for <kernel-janitors@vger.kernel.org>; Sun,  3 Sep 2023 10:02:37 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-44d56d26c32so252096137.3
        for <kernel-janitors@vger.kernel.org>; Sun, 03 Sep 2023 10:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693760556; x=1694365356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChF7THDjn6nGJerOJ4K0rQrL8YxuU1sfo/4nzZ83Szw=;
        b=ssY9YCybjEOpEkxvjvrWW6Ej0D132JdC7acxvJXKoay6WGB5AkfIctL7Jq2UxzhB9o
         e4f+LQWLnp7RsMDqVFl7fn1FX6PpN3+pIPF87w2BPZ4Gli2Jxknefk1I+mWl0Z7cPiRu
         r0t2K452dxeR5eCHnH48qhCHZ6sSaZQUZLQkNkQdmzcZR6e0e4GIJKwi6FwvNcc0eSNK
         s2qiUqqBlCbxtBWKfFKd/9l+vZyq85NFGDPKsZmzt6CJDLPH+fuUWrexYZWkWD838Cz+
         Netv+F4Kz2uRlDFKaK1u0XdJUqZlgoszWjRahpxPlz6AtLkKcrXXYfOVOD/yeEetJ4vT
         U0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693760556; x=1694365356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChF7THDjn6nGJerOJ4K0rQrL8YxuU1sfo/4nzZ83Szw=;
        b=XCiwOC6MmE+u70VaZ94CEGPQeEnMA4u9HvnUWPGvTIE8uD2Kyw0AzbvhzvGf+qC7W8
         8iP3q7IOVZuj6v+R3We4mZaCfxrxPPqxG9kw9jeC4i0WB8dzz9gHI/yQWlGrYufCDcDb
         bi7SxsGEUWJe8vJ0qN01hQAewH7QAcaeMFIr3N+3CEK/6X7hYhvlgVUM+KSDwQyvhslg
         aZ9WnuBb9QmMhcjaBIO+7fJiGg9isPGaIG+9ES2Cb5YhsoAgDX7Ofn/ZjWsUtb/YsoDC
         90Z806bA8yNk1rGW3S/NKxvhRCSPFCzmHeXY08ZLeaCNhBXDlkoKZUMLxkTt/Pnq+4PH
         U5kw==
X-Gm-Message-State: AOJu0YwFqAW+PPDFEuteR9tEB55xDuYZeLKQRXKGwBYdUyYqLRG8Hpn5
        jHqcWQoHEJ3rMQvLoxOw9zz6xgGP3MLGZVzf//YcswQ0c+VTeyoq
X-Google-Smtp-Source: AGHT+IEZlUODYcfxuB5DATMcYGe4rC7+/g+41ydAjEzwpiDUTh/zY/v3GObLUY/j9wJey+nCZLQpZAu91JPo0cwy8s0=
X-Received: by 2002:a67:f5d8:0:b0:44d:63a3:4be4 with SMTP id
 t24-20020a67f5d8000000b0044d63a34be4mr7751365vso.29.1693760556472; Sun, 03
 Sep 2023 10:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <ceeda269bceee1c805f148bcbc628abc9d42601a.1693721348.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <ceeda269bceee1c805f148bcbc628abc9d42601a.1693721348.git.christophe.jaillet@wanadoo.fr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 3 Sep 2023 19:02:25 +0200
Message-ID: <CAMRc=Meq+1z50=tXXt3MFAexRCmfSQ5rs6hT7311KRGO=q2RHQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: tb10x: Fix an error handling path in tb10x_gpio_probe()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linus.walleij@linaro.org, andy@kernel.org, galak@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Sep 3, 2023 at 8:13=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If an error occurs after a successful irq_domain_add_linear() call, it
> should be undone by a corresponding irq_domain_remove(), as already done
> in the remove function.
>
> Fixes: c6ce2b6bffe5 ("gpio: add TB10x GPIO driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpio/gpio-tb10x.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index 78f8790168ae..f96d260a4a19 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -195,7 +195,7 @@ static int tb10x_gpio_probe(struct platform_device *p=
dev)
>                                 handle_edge_irq, IRQ_NOREQUEST, IRQ_NOPRO=
BE,
>                                 IRQ_GC_INIT_MASK_CACHE);
>                 if (ret)
> -                       return ret;
> +                       goto err_remove_domain;
>
>                 gc =3D tb10x_gpio->domain->gc->gc[0];
>                 gc->reg_base                         =3D tb10x_gpio->base=
;
> @@ -209,6 +209,10 @@ static int tb10x_gpio_probe(struct platform_device *=
pdev)
>         }
>
>         return 0;
> +
> +err_remove_domain:
> +       irq_domain_remove(tb10x_gpio->domain);
> +       return ret;
>  }
>
>  static int tb10x_gpio_remove(struct platform_device *pdev)
> --
> 2.34.1
>

That's not enough, you also need to dispose of all remaining mappings.
Please see drivers/gpio/gpiolib.c and how it handles the gpio_irq_chip
domain.

Bartosz
