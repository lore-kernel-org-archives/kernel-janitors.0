Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E7EC43214
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 Aug 2021 20:10:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A35A60F41
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 Aug 2021 20:10:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbhHQULV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 Aug 2021 16:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbhHQULV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Aug 2021 16:11:21 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896FFC0613CF
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Aug 2021 13:10:47 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id w20so43667310lfu.7
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Aug 2021 13:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dpxtWXdidkihk42GLp16+rQfG20ZX29R6xVicDROa00=;
        b=L78V8Te4PKpOBHB7sz/qEcf5c/H4cEjQvXdPWNe4rhMFkovz3jT5KqczOc8fCsMacu
         EqzABiQ9q4yhtRvAMhfIvfZKpglQaKm6DNUASQ0H2IGSAEqaYtw+O1LQRCmuyabc3lAc
         Wh99cNxB1F2E7Dyy17WaBiqzQomfAhXLGYrkWapS7+gXQHqaJ6tkiyTvq2mGWXEQZBBE
         ibA2E7XB0M6y0GUZBHc2Fksc865UdXM32dw+71xWbzGXX0CgOWTHLKTpG+CSPEZ0sYxl
         pLQlkvAUXp5rkTjqe22OFKrPx8iV05R3BuO4VRljTURJd+bYP3gA6W4Get7aMPPMiJQn
         cmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dpxtWXdidkihk42GLp16+rQfG20ZX29R6xVicDROa00=;
        b=iIMSroM8m3pLBRTV7Legf2YyeXEW7xitnjvKa3tQlKmVIHqt6IFW0VMGmplCv19TJY
         L4GVLZyaAF+oKePwyXka9o4JII9R2zSh/m92QJRmbfP/+fTdmz2arZ/81qtcEEcVxH97
         pjLhoa8fhSkq7JMp/TE4xnRBoRmRjveobEJ7mYLzsOL8ggARc/VpJCPESgz8Yuy05Nyw
         pltuzhYr8T8vklYIeAuciFw3/7mk12Hn6RMCzgYpEqHOWBGX26cHGpfxI/nBiagSUV6Q
         4iVf1EMxKWFVSMGbLLnlY3QEcVHyoORs61sEa1Qz1PiSub6tAxw2MkgGZi9dgrg1KXf3
         EMvA==
X-Gm-Message-State: AOAM532Oomr/KQN4Fk/4F/I710DSySZiUEIPPsm3v91Te6FMdyPe3S8W
        7NV88AO8ApbpegfjUOt0IGHrkXaF6myRuG+FCh6Xrg==
X-Google-Smtp-Source: ABdhPJznsBtZIpUw+keTCjtlPLdkEGb0OuHaFMKJbBFQFrvTfBON2BlSSAWMW93Ctx6m+5gd8Xp6LbtNCd5pzMeFgp8=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr3569664lfu.291.1629231045926;
 Tue, 17 Aug 2021 13:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210817080118.9201-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210817080118.9201-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Aug 2021 22:10:35 +0200
Message-ID: <CACRpkdZYhXT4NQsCvRzNh+M5g6EMe7gTSkpex_tm-MpQprSm9w@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Aug 17, 2021 at 10:01 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit e1324ece2af4 ("ARM: imx: Remove i.MX35 board files") removes the
> config MACH_MX35_3DS in arch/arm/mach-imx/Kconfig.
>
> Hence, since then, the MX35 3DS BOARD MC9S08DZ60 GPIO functions are dead
> code as its config GPIO_MC9S08DZ60 depends on the config MACH_MX35_3DS.
>
> Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:
>
> MACH_MX35_3DS
> Referencing files: drivers/gpio/Kconfig
>
> Remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Makes sense:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
