Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8A9C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 10 Nov 2021 08:29:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96612610CB
	for <kernel-janitors@archiver.kernel.org>; Wed, 10 Nov 2021 08:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhKJIbx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 10 Nov 2021 03:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbhKJIbw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 Nov 2021 03:31:52 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE876C061766
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Nov 2021 00:29:05 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id bk14so3874043oib.7
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Nov 2021 00:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f7rHKPXF7IbvrxgZBgwaRfmurIG9HqN9DpJB72wC+bI=;
        b=TuB7tlTlxNHJ06giSMcvKP5BOduliRU9Wes+BVl8jRlSWGR3FOyQqy+C6b/4/JF22I
         xLP1ip3PpAsa5FPNqLzHoXDq9IQlGTO2CQ2v/acPdM3w5ZysyMIyMC8AarTjopkU7Eue
         x7YjTocStBQ45qy16SWD2Fejhl16N3PrMRDNR6q/SGfIFm5vXWXHtaTjQ5F0Hjh8ABnS
         +8TQFzoFcl2LmKr7Uue/nnd1fcfUVsR8DEkDxgnRBbruYHHHs+wh9PZ67QbtQKtMuIYQ
         oehJVgH8VUG0UFomg/6EedRCxpDDMmrKiiY98mlS/mUv1HxTbnHm7lQ6JP/s/qxur8sb
         B2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f7rHKPXF7IbvrxgZBgwaRfmurIG9HqN9DpJB72wC+bI=;
        b=K27eFrZK4PwcDIEqpeM/RacBdVxC/bVhMS1SEve+dN6XaM7X0soxohXuQrL0yLofYt
         lBgulPo21EWlA0nUUrtf4blSVVLcnrMFemOVKOeCT2ADms3Yy3Ujw7l2rbE+XCIM8yqA
         Pqjoh7pYrlLAFOjiR2pKvlpusU6XudHovrygAO70P548QAup1RfoepCr28gerwlIIo1q
         ttlyv6PgAL3rBZ+RiAQJnLBVSiwSrwe9sL2YwLLotz84U67Wudt1We3vlU9JLVAEEeKj
         MC7HlMQexKCyhCor2pzwCIfFz4UoM/k6QpgBDBb53QXPNT60GpkZrt+dbi+/iNJkXqQ5
         ok5g==
X-Gm-Message-State: AOAM532IkYqV0zScT9JinJtIfiQZcNmpF3HxeGl56rwAnb0PrLUNISFB
        +vANh632I+QxrFJKstQm70JOE+xqqRkyK4I+MVKU7g==
X-Google-Smtp-Source: ABdhPJyaEL5vlz5N6A4nMGJI6OOxAb6rO5+DSFGzls44RzkLp58y9QExK/RBI8PkIc3s+dGBR+D8Ys2jtTo0M+HHy4U=
X-Received: by 2002:a54:4791:: with SMTP id o17mr11897170oic.114.1636532945359;
 Wed, 10 Nov 2021 00:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com> <20211028141938.3530-11-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-11-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Nov 2021 09:28:53 +0100
Message-ID: <CACRpkdakmQinPTHfV7m_Zbwh78k12gf9if4b1xiyEEW004KDCg@mail.gmail.com>
Subject: Re: [PATCH 10/13] arm: nomadik: drop selecting obsolete CLKSRC_NOMADIK_MTU_SCHED_CLOCK
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

> Commit 85b6fcadcf66 ("clocksource/drivers/ux500: Drop Ux500 custom
> SCHED_CLOCK") removes a sched_clock workaround and its corresponding
> config CLKSRC_NOMADIK_MTU_SCHED_CLOCK. Since then, selecting
> CLKSRC_NOMADIK_MTU_SCHED_CLOCK in ./arch/arm/mach-nomadik/Kconfig has no
> effect and ./scripts/checkkconfigsymbols.py warns:
>
> CLKSRC_NOMADIK_MTU_SCHED_CLOCK
> Referencing files: arch/arm/mach-nomadik/Kconfig
>
> Simply drop selecting the obsolete CLKSRC_NOMADIK_MTU_SCHED_CLOCK.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Patch applied to my Nomadik tree!

Yours,
Linus Walleij
