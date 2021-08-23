Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95006C432BE
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Aug 2021 07:58:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E21761368
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Aug 2021 07:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhHWH7I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Aug 2021 03:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235243AbhHWH7H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Aug 2021 03:59:07 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A7AC061756
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Aug 2021 00:58:25 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id z18so32414813ybg.8
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Aug 2021 00:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A4LdKTAjdulkWp1Ey9+qLuBWHOHSRlpXXa8uWwlXNjo=;
        b=GslNxTVCcaBeHsIHdetgMcBsNjshjeP/C6kPGlWqGcT78U70fD6TFPTuGye0Chi+x0
         IXwyzql5xIXrd/4S1mW8KoLCeV7ZI3oNe7CNNK0eE6qm5CfB+w5xOe7j1SL+47mRaNOe
         ShhB6r3ngHUOoYI6ZRO+tZ6dF5vniJIKdlrJehAFPO2ehLPLElmTAYxwZd9viBkZaY9O
         VQaJQmey03oZVBDbxJxm16JJqFbgn48h+gyzdxmQaqKcFBVHcPH9yrlysDmXez99T8JA
         XUMhjQSV47tT2xXnrEwjvugrx0bqSBcAssa04Gyqq6xqAku9Z3J/Xrya4U4qDd/V0qkp
         6CWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A4LdKTAjdulkWp1Ey9+qLuBWHOHSRlpXXa8uWwlXNjo=;
        b=rLfGbV2/hB+AoWZWHxbuSkjvXtO/86MOlcoBVpn8TsP4xd2H1NwNerh31KxKO/3aha
         5+rApza/kpBV0GBxiziNoW5OGOINZRQx6nMyU1slCGCx5dccGSW7VZH0X/sVKvCG7pY8
         /aiKMtta7azT/3t1IHSKf2+NEQLz9GdjlMkE3Ah0LgmQpjBQW7/50pOqdgx158l45Z4Q
         D79zhprcog04SoMNy5BEmC4EsmlHVltjD9OeTJmVg/awtWMpNdjRso3tO/088xrDbtPI
         cNTjmi9MP2BASiwNsfItVNVau3yVsoCgE83fw3EfqYO40E4n+2GL8mWdc272Zk5wi85A
         hDqg==
X-Gm-Message-State: AOAM533aDXR/FXZtdFNwWGHQyk+VXzLGlWMMKbEipZqUmEjuWJ3Q64tI
        wHNPDI/5p/g6fFoBa4guWGY/KVDYI5heGguNJ9LyPA==
X-Google-Smtp-Source: ABdhPJwjNaJ0hN3PHVi5IZ2QI8E+CCiS9LJzKyaG004QjwuuEnEOsH6ar0YZsZ6ezMCs/rcpcY3iHXosrDILyt8vmvA=
X-Received: by 2002:a25:abf1:: with SMTP id v104mr589768ybi.25.1629705505102;
 Mon, 23 Aug 2021 00:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210817080118.9201-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210817080118.9201-1-lukas.bulwahn@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 23 Aug 2021 09:58:14 +0200
Message-ID: <CAMpxmJVvz8G4XgE=12HVNgcdgwLgWnDY7M7oifBpNT76O2YWUA@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Aug 17, 2021 at 10:01 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
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

Patch applied, thanks!

Bart
