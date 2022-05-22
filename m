Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C306AC433F5
	for <kernel-janitors@archiver.kernel.org>; Sun, 22 May 2022 20:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350963AbiEVULJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 22 May 2022 16:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiEVULH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 May 2022 16:11:07 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4363AD126
        for <kernel-janitors@vger.kernel.org>; Sun, 22 May 2022 13:11:05 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id f9so24910557ejc.0
        for <kernel-janitors@vger.kernel.org>; Sun, 22 May 2022 13:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XbAugljicpY/y7Zy1EEXCv1U3t4omHv8RYC64W6lHFg=;
        b=RH0617/a3hE57yA5bfOEtRbVlvoZZ/lXnbDnJEPXIt4AA5RqWlPA8AhxizHNehnYEI
         YhDsy1R2t7aHOEHZ8RPC0I2e+4DkQA6GSy6+AdnIbqpMX92LrT6ob6V7sLyJNVzzrBeW
         fl256B2WWJjVctMBQH2g/aJ67jKbnboB4TjlOYDZUIgKIlLf3FlL9oQt5WCdulj2j7W+
         aF2ePVq9DTprxl44nfKSOG0z7mFieHUXQBWwcH7Ni1JjdEBhRZiojUh6w9iowhhmBPOG
         Vd1+hz7bhxSUsUB1FTRByyv+K5CPSVQuhIUe395ppH037CkQIy1xp8Ug4SRC7Icu7Rre
         wbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XbAugljicpY/y7Zy1EEXCv1U3t4omHv8RYC64W6lHFg=;
        b=1zF5PLLfrEmduqYJE1l0FY4NJAih/ziCSyhcbMk954HCddh712DDa+l+4LwlfmwbSm
         k0zYxCKAvUa7ODj/0+ECkuMNL63dEB2zmRP1xnq8NzM3BJEbGYpOkofn10fkA869AgjO
         +wU6DXpVDIbq1H+sZgPD+m6OgSxSd/EyKnKt51UOP3bnMh+/CV/z3abNQRr1y9y7LVN5
         CzaMVHaG15+XdbYIQ0NUNf3rtNCtJdYSYJlInY0AHlVV/feqFL1/b06B77vGE2fLjcOp
         MVrLEHWEczWODTvzWmRbIZJEmuvtQwDvWhAusQNMSbE76BZaFY2BBdgTPT1o4PQ+zys3
         PzaA==
X-Gm-Message-State: AOAM5311/Y3CuV5h5JAkLIxw7MwYOO5bipj+PJvZyn6tyi3MhtR77Jxb
        l+9NRkqkjaUx1ggtHVpawBlXq4jMschpVfK9Bf2I9A==
X-Google-Smtp-Source: ABdhPJzc5GUR9U9Il0WUoTYcgZGdj3P4tfGqlFhaPWz4WKm4XeGYOe7uuIWsUJWHY2Wr50WmK05jU4mkxgrUi5D4x1Y=
X-Received: by 2002:a17:907:6eab:b0:6fe:b5e2:7b0e with SMTP id
 sh43-20020a1709076eab00b006feb5e27b0emr9939588ejc.736.1653250263841; Sun, 22
 May 2022 13:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <dde628b73ca95e3e7598cb755cf2350a8e9e4796.1653074495.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <dde628b73ca95e3e7598cb755cf2350a8e9e4796.1653074495.git.christophe.jaillet@wanadoo.fr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 22 May 2022 22:10:52 +0200
Message-ID: <CAMRc=McR+=55XooEikdee5vCfsLyfPKuc_pvAdfDwvn_dfnc7Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: Use correct order for the parameters of devm_kcalloc()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 20, 2022 at 9:21 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> We should have 'n', then 'size', not the opposite.
> This is harmless because the 2 values are just multiplied, but having
> the correct order silence a (unpublished yet) smatch warning.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpio/gpio-sim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 41c31b10ae84..98109839102f 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -314,8 +314,8 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
>
>         for (i = 0; i < num_lines; i++) {
>                 attr_group = devm_kzalloc(dev, sizeof(*attr_group), GFP_KERNEL);
> -               attrs = devm_kcalloc(dev, sizeof(*attrs),
> -                                    GPIO_SIM_NUM_ATTRS, GFP_KERNEL);
> +               attrs = devm_kcalloc(dev, GPIO_SIM_NUM_ATTRS, sizeof(*attrs),
> +                                    GFP_KERNEL);
>                 val_attr = devm_kzalloc(dev, sizeof(*val_attr), GFP_KERNEL);
>                 pull_attr = devm_kzalloc(dev, sizeof(*pull_attr), GFP_KERNEL);
>                 if (!attr_group || !attrs || !val_attr || !pull_attr)
> --
> 2.34.1
>

Applied with an added Fixes tag.

Bart
