Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BCDC433FE
	for <kernel-janitors@archiver.kernel.org>; Sat, 30 Oct 2021 15:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C99E460F0F
	for <kernel-janitors@archiver.kernel.org>; Sat, 30 Oct 2021 15:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhJ3PPv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 30 Oct 2021 11:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbhJ3PPu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 30 Oct 2021 11:15:50 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E76C061570
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Oct 2021 08:13:20 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w1so29820924edd.0
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Oct 2021 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hF2D2p8R03MXzhio9eo1V6ljCWCm/2b9pw+faHVE6UQ=;
        b=C+QHVLjyfNj1RMDbT/2ZWGgiW8GaTiLQSR8+yk4wLMBKR1Ui1hSE57P+HmW2s7gRbS
         K9gmM194msV9u4wah9FCMjroBOOm0cqoMU43Ckvwtzf1YET+5eN3JNj5Xb1NewxdK2QR
         CgqydKB7JfOrgoU9afKDLQjzBTi4JoIImsRMAL+GuaIOEyrChgF06h+JSixg2wOXo7xK
         id2HghqJIVPveKGcfBh8km9y51utwKMaooqUHEJbN+ISxY8D2CFDGn0LrtTbDvxRg7Av
         D1SO1a0NUuHeUAAVlbiftSg12tdvqQQq6rAthDd6k6hAv1+7VJx4qt5dVrrj07E9MGr/
         G5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hF2D2p8R03MXzhio9eo1V6ljCWCm/2b9pw+faHVE6UQ=;
        b=g8jPoZ6SYSuYlIF3BZaVLF61YmEficAR5xEQYItk7triijYwuXsPR1tnq1OFUllR8t
         hSaHgVI0Lpv9JGxw7rvehGa5DoXGK67jW6dgYQOMnyy74vUqHqbTbpmF0fm2VUyPq74L
         VFBZsoskLYzh+TVjC6OdZo3yXod5UgCxWihpbjsajLPgm/4NXElsip7dwARUubhnXa9O
         L1Q/ULvlfIPdFHC4cEg5NyGAUn5drlK23YfnCefhyJCfwXydlE4l4qpCHeVqPF3fckvy
         A2Kv2LXhhK5rLpgmh0t+sFVjhaZ2ykohfTtuvaJ2otfgBmSwaLmbKnkRSX+VMbaYGnWN
         gHmg==
X-Gm-Message-State: AOAM533t1EaaLyNDI4xbQjlK0E6TiFTHM2+yZ+GX122Bxx0bgsVGoZ5q
        /r0Cn7qGs0stXf71lxp4V+Al0eWS17llMI9ym66OOQ==
X-Google-Smtp-Source: ABdhPJy34XwCcmYaIo7aLruDKeslQBQc3GziCc4YeYQA5TYkQlaQNCnuLcDPmEznfwWAkG0+JU+ZHYRr2m126T4kXe8=
X-Received: by 2002:a05:6402:51cf:: with SMTP id r15mr25228272edd.60.1635606799114;
 Sat, 30 Oct 2021 08:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211030040757.2168399-1-weiyongjun1@huawei.com>
In-Reply-To: <20211030040757.2168399-1-weiyongjun1@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 30 Oct 2021 17:13:08 +0200
Message-ID: <CAMRc=MfEytPqH3PFnWLcyGaVgM+=KPpRqEPK-f+Lu8dnj9u2kQ@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: sim: fix missing unlock on error in gpio_sim_config_commit_item()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Oct 30, 2021 at 5:54 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Add the missing unlock before return from function
> gpio_sim_config_commit_item() in the error handling
> case.
>
> Fixes: b48f6b466e44 ("gpio: sim: new testing module")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpio/gpio-sim.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index d8bf84b604d9..e2113092f85b 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -789,8 +789,10 @@ static int gpio_sim_config_commit_item(struct config_item *item)
>                                                 config->num_line_names);
>
>         fwnode = fwnode_create_software_node(properties, NULL);
> -       if (IS_ERR(fwnode))
> +       if (IS_ERR(fwnode)) {
> +               mutex_unlock(&config->lock);
>                 return PTR_ERR(fwnode);
> +       }
>
>         pdevinfo.name = "gpio-sim";
>         pdevinfo.fwnode = fwnode;
>

Applied, thanks!

Bart
