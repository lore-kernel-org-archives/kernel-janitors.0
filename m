Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64444C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 10 Nov 2021 08:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 437D861076
	for <kernel-janitors@archiver.kernel.org>; Wed, 10 Nov 2021 08:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbhKJIaL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 10 Nov 2021 03:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhKJIaL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 Nov 2021 03:30:11 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE6A1C061764
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Nov 2021 00:27:23 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id s139so3806810oie.13
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Nov 2021 00:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wjabyqMriLlEDs0oghOnUdNbhq1Wnfi0um3A6ApanhQ=;
        b=HQOFMTYJ1V/jOeYgrLDR858/DdP3Vy1c/cct+8fLcNBkXEdEq4sc92loWTLjeuONPg
         x47uvloqdX08ZQmEbi3QxrYFYH59xFKmkT2fTFowIYf2/12sp30shdW1IuBO1eBef6El
         YdXTLEbzyYwM3jxajCkH3QibZLkAqs/6pisx3Z1MLcvfheLY1jQ61jeVD7bRjD7SZAD7
         wtR1DJP0T4PDltZ2aR9tz0t00HGa4/OZkLoNUJr5r6vb134jJtJGd1jV3L/isudr8rv6
         WM2rj8sdDkizTeDk9vcZTq+lARV6Y47ubXMpY0KSaPx2FYnLfmtlp1IciHLt5PksPAhc
         bfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wjabyqMriLlEDs0oghOnUdNbhq1Wnfi0um3A6ApanhQ=;
        b=jrq+kBqC8GQ7S6xPtjXhVg3DRbrLVH8OdbwdjhFoMaU9vPp0y+A1I5kWtJvn85cwTh
         TEl8A97jtoqSYv9RN+p+Tpdfaii+Au+PDe5X7SvbaHdU1Kgw65CfGfNCEt6Cg5/Kuznh
         ASQqQTOaT9caFrNgX4nAjwZcvl+LIethAqQYzk9dFyI1wY2VflrfLVOjk7U1C3GLBGL4
         vLlqoMmCfGFqKTOqp8KCf5JDmlavKxmx8dR6GJFl8TbIqT15aOwETi/L3Wy8hzRjpcDH
         D0mjVGhCIyFxG4uxrnEVWr+UkLcHUaYSjUmmYCY+c//bohsbXf9awP8/dIdULJarUMOI
         oV8g==
X-Gm-Message-State: AOAM531+faULrnu/fQTS1duG14PxISQjeZemZRm7UuoqKMXOcTtEeXlz
        OE1pkls9jvSd0A3yDaXa7eRhv5akK/5uWm7+vzpYlw==
X-Google-Smtp-Source: ABdhPJyH1LONHLtwhuZMcEBp+Yg0krY6vZeudqTwP0iP/LrQGnLZpNokAje6id0/RVcqCXpcn5QWiO0vgqMwvF5aEME=
X-Received: by 2002:aca:120f:: with SMTP id 15mr11009740ois.132.1636532843343;
 Wed, 10 Nov 2021 00:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com> <20211028141938.3530-7-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-7-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Nov 2021 09:27:12 +0100
Message-ID: <CACRpkdZa2Y3yUteqQp9br65dj248WpGfwpf-ZZ5=PXambiwEcw@mail.gmail.com>
Subject: Re: [PATCH 06/13] arm: ixp4xx: remove dead configs CPU_IXP43X and CPU_IXP46X
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 28, 2021 at 4:20 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 73d04ca5f4ac ("ARM: ixp4xx: Delete Intel reference design
> boardfiles") removes the definition of the configs MACH_IXDP465 and
> MACH_KIXRP435, but misses to remove the configs CPU_IXP43X and CPU_IXP46X
> that depend on those removed configs, and hence are dead now.
>
> Fortunately, ./scripts/checkkconfigsymbols.py warns:
>
> MACH_IXDP465
> Referencing files: arch/arm/mach-ixp4xx/Kconfig
>
> MACH_KIXRP435
> Referencing files: arch/arm/mach-ixp4xx/Kconfig
>
> Remove the dead configs CPU_IXP43X and CPU_IXP46X.
>
> A further quick grep for the name of those two symbols did not show any
> use of the two config symbols; so, there are no further clean-up activities
> beyond this config removal needed.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Patch applied to my IXP4xx tree!

Yours,
Linus Walleij
