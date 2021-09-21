Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE97C4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Sep 2021 18:13:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55C0961184
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Sep 2021 18:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbhIUSOv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Sep 2021 14:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbhIUSOr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Sep 2021 14:14:47 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97ED5C061756
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Sep 2021 11:13:18 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y28so1349276lfb.0
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Sep 2021 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EW1vW7sWjftd7hrs0dLX4IMwefEJeY8UuH5WCPSWExA=;
        b=LZJuB9HS05MS44ICxvif8myY5ie/+eFNBBomTnoXTSqdYFutmN16Rl/OjOLkZZh6jQ
         72pjRft7V+Wg6EUsnSOgvRWWq82TlnqfhIMtpVZDHpU7AnAXxIhhHDjqFLeMBbO7op3M
         v+4rG8XZGjTqtzgkqZQt07pEhpBpxQS1aBjTk+4MBijZG5ISNv7YFGJwaTxUe8F3hvH3
         1qZ1QCO2vr+49tpOCMCCLQHXfvzLfpUt/Y9QP6NAySr9mkROwv7XaqX0F/8RLQRLgFri
         O8v6fRSXBZax1tldtMvaevvAoGhAxOFmu+vocFyUGYkt/45OxJgu7tC8JPU6fF5KeKT8
         3M8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EW1vW7sWjftd7hrs0dLX4IMwefEJeY8UuH5WCPSWExA=;
        b=vl3zsK+j0QbO7vFIJgmHCNQQN0GGcyk19Q+i0PFXHwQvF+7SCALVzq7WAxJ1/VrRPV
         efM4Oq5w0xiWQU5BoanEw7gs1fgVoj5H2e1qdaHuqYgfXlfg3IzH+56d/5M86wSMmx7Z
         FhkI4e9D+bjqEji2/bnRsjiHGmzekBVumpxQIsWicmj0g8wUuyqXL8iMlp9E2BvX7v/5
         oDf65XBbeu2YveNKCHVlzusSICK4N3Of/y3uOIlfbgtQD8qIiASpob+Ayk1jP+T4RHAX
         4jSU9SfXg95Y2ok242QjVFZ8fdEIo4dczVk3TofMRFPRzSmocVeFpluqDngqzylzXuvt
         8VDA==
X-Gm-Message-State: AOAM533hrtiwAVacauZUcye0lpPDkc2beaJSoizrERY1xXxzTgtwZHxY
        jC1VDMn+gbnGto3UeXBK5+mU3AG0sx9TCOy/mHguag==
X-Google-Smtp-Source: ABdhPJyHNbMQuJb6Tgu7TZrvW5IeIkg4OaG9Y6i4c0e5aLwDyZE47u/VgQ/J+p/1JvRrc8gmONqFKIBQHcXEe0PYUGY=
X-Received: by 2002:a2e:b5a7:: with SMTP id f7mr29396764ljn.19.1632247996570;
 Tue, 21 Sep 2021 11:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210921122146.13132-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210921122146.13132-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Sep 2021 20:13:05 +0200
Message-ID: <CACRpkdbW+rP4mj6RWCAJRnW7yWTnfZXBcRnKO=mfdwFL-qVhGg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: fix typo in DRM DRIVER FOR SAMSUNG S6D27A1 PANELS
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Markuss Broks <markuss.broks@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        phone-devel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 21, 2021 at 2:22 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit ebd8cbf1fb96 ("drm/panel: s6d27a1: Add driver for Samsung S6D27A1
> display panel") introduces a new section DRM DRIVER FOR SAMSUNG S6D27A1
> PANELS with a minor typo in one of its file entries.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   warning: no file matches  F:  driver/gpu/drm/panel/panel-samsung-s6d27a1.c
>
> So, repair the entry and make get_maintainer.pl happy.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210920
>
> Linus, please pick this minor quick clean-up patch on drm-misc-next
> (on top of the commit mentioned above).

Patch applied!

Yours,
Linus Walleij
