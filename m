Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B32C432BE
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 10:10:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57F7160F6C
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 10:10:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240838AbhHaKLx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 31 Aug 2021 06:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbhHaKLw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 31 Aug 2021 06:11:52 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBB2C06175F
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Aug 2021 03:10:57 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id c206so13160181ybb.12
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Aug 2021 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ISxd34HYL0xjjOXHW7kuXX550qqQagXKpShLACv/6Vc=;
        b=wAPCMoKwU05z5kBh0NgRCLoqGJtz4RamP0Orhks576hOah8T3G6UgLnYJYBEkFre8L
         oSFTvrLdEPXULpB0bj8drBfDT8pBn9jepOWwWiNNcH4QgifGzMYNG1Z4ODCm4WYH0Qu+
         jsCM/Z8JmQN+jdiOVWjU4tTxOEsZt6MgLSCC6NT63EzqfESIR56u8GJ0vpeQAwhLX8MW
         X66ecTL5g2+PO3PwzUjIQSaTFegD+tUJZ/0ZikB/qAURyDqq7ze7exyv1yhDAkbglrFy
         +SBWrd5X5zyAcXbtkAYiLDqx2Q/1dKbrtUvS8mTfqUebKuQfDebRKWZ/fLD+VvE6kc2H
         5MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ISxd34HYL0xjjOXHW7kuXX550qqQagXKpShLACv/6Vc=;
        b=h4GqA4TTzdGqky3lwb6zk+GBwjt4LlocsaaPOlRmdkC9FR9FEdiL8HTZf18IgajwuC
         CGh5Dg3PqSW1cUZHdtBmUutEp+FsZNXiwxfqi+NOoDlHAVeLsy9niVewrLrOdAz82FoC
         tuYYKn1Bwvo/mYXbejWgeU1FFGvJFJNBWhcrpr9BC8noR7Isi0gmx54QHkwiKc0eGnYK
         5ho11SmuSF4JP8a4ziRvWRc6MuxphAdMa35cwoQRK2kEvlOUdA41EStqtedCY7xr17MD
         08JdPUfErM0st34bbr9k3x0EzbTSVA68xzc3PEjW7DSiRbfOGbFxWdjzhikkBdjeoSXa
         Ylww==
X-Gm-Message-State: AOAM531q2L8Inmiw9OR+wWR9s+l2E2KQSKVfyYpBIprqrBfAkTHvv9l0
        LXZNc4SIlGf1yR6uUXS9uB0GUbX5YWiunoGAb+DX7Q==
X-Google-Smtp-Source: ABdhPJxgnxQciiKvtmt8jY0P1jl1VcavsxWSNwbcPmDFrcZnoiO3LYi3Mc3V1MiZQbPOxOO3F8RNH8QS8Kb8657Se9c=
X-Received: by 2002:a05:6902:150c:: with SMTP id q12mr2213332ybu.25.1630404657076;
 Tue, 31 Aug 2021 03:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629472813.git.christophe.jaillet@wanadoo.fr> <800564ff82277544269add84bf78a5321e1090ed.1629472813.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <800564ff82277544269add84bf78a5321e1090ed.1629472813.git.christophe.jaillet@wanadoo.fr>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 31 Aug 2021 12:10:46 +0200
Message-ID: <CAMpxmJWefa_NdguY7K2JaSZ_EjxswgNEJOue4bWJ=XV99rQSXg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: mpc8xxx: Fix a resources leak in the error
 handling path of 'mpc8xxx_probe()'
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

On Fri, Aug 20, 2021 at 5:37 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Commit 698b8eeaed72 ("gpio/mpc8xxx: change irq handler from chained to normal")
> has introduced a new 'goto err;' at the very end of the function, but has
> not updated the error handling path accordingly.
>
> Add the now missing 'irq_domain_remove()' call which balances a previous
> 'irq_domain_create_linear() call.
>
> Fixes: 698b8eeaed72 ("gpio/mpc8xxx: change irq handler from chained to normal")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Is the 'irq_set_chained_handler_and_data()' of the remove function also
> needed here?
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 67dc38976ab6..241bcc80612e 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -416,6 +416,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>
>         return 0;
>  err:
> +       if (mpc8xxx_gc->irq)
> +               irq_domain_remove(mpc8xxx_gc->irq);
>         iounmap(mpc8xxx_gc->regs);
>         return ret;
>  }
> --
> 2.30.2
>

Applied, thanks!

Bart
