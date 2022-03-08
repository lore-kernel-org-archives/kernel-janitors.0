Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A925C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Mar 2022 15:26:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347808AbiCHP1p (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Mar 2022 10:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347809AbiCHP1o (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Mar 2022 10:27:44 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D73F49F9A
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Mar 2022 07:26:47 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2db569555d6so205391027b3.12
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Mar 2022 07:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BDg83KmxExGv2FTVzKSEUkIFPafp8SLQqggPFQR6FYo=;
        b=i57L6Z+tbb7HROJlg+BbVrHHFL+dr6ZTQym4TJ1LIhKfteG/s4OkwFbOkBRqfS20+W
         Uk+h5tB3/gb4V9xAXo0nr8EDXvCGyWb9ES6bLCNWr9IcFfhgrYwOrVd/TnY+dKIVbwsM
         W8YH4JqK1fYahcX8d5Q3KaTgozihTANwCFeYfHfEw2t7ZjfIjtwFqp3KuQW5nJvXo/CG
         JrLHkgDQjz1Ks88fc21Pf62HB4li084AMgHs33PuzW3KG3aJbdvUXniwB3WsPlMEGjmH
         Zw1z4XHSrlpgBy+BmcQuuhrn0/pqh3D60f3Zn6UIyPM83YBBW5enm31VcSYI859ljPEG
         5EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BDg83KmxExGv2FTVzKSEUkIFPafp8SLQqggPFQR6FYo=;
        b=ewA1VzeiU/lxlAFzMbUYempdlwid3EhVmknpAZ1xZd1IlL33WJOi73OohrRydtUeLa
         miWugcnruILmbH/X1D+fPZD6h+kA0y0lq/skYx3GNjRGQsQmHYNNKpUrpFaKD+gq+6sU
         n6Xjy+fV3jh7DO/5OmIM8j5/uzOfVbABohxSFGNUYk4FGpwbOlPsVqDdPyq/SUDUmoIa
         0/P15hdH60CuSIff15EyDJ1FHyJEo0KugGj19Pz9Ev4JavGmitvQb16zWRgUperX9IGD
         Ra1zkcPUppH7yha6Cpr1Kk5K+73GKMomWm2/q+RNNwdC82iGlERb7tbDSvow8AXRAIUz
         t7Xg==
X-Gm-Message-State: AOAM531VKxR0+Wn8Si1JQuHpBR1ts0SmtcD0mHB8Eo56/SR61RFw7XvP
        P9j/KYls7Ubq26E5WCg1VhkGiUqIecp3nJipw7byqA==
X-Google-Smtp-Source: ABdhPJxLlp5No+qYWJ6byYFHq0gYnFD75Zl8qKyzpnp75MjksryAO9rMKbI2ZtH9mya7XknA9Tix8MROT4Q2zzrd3oI=
X-Received: by 2002:a81:9c47:0:b0:2db:9e18:6e75 with SMTP id
 n7-20020a819c47000000b002db9e186e75mr13379232ywa.437.1646753206417; Tue, 08
 Mar 2022 07:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20220308103027.32191-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220308103027.32191-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Mar 2022 16:26:35 +0100
Message-ID: <CACRpkdZJYVRQKWDkp95pF8cdokBw3C0gx1ckmHq=F3tDiV3FvQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for REALTEK RTL83xx SMI DSA
 ROUTER CHIPS
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        =?UTF-8?Q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 8, 2022 at 11:30 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 429c83c78ab2 ("dt-bindings: net: dsa: realtek: convert to YAML
> schema, add MDIO") converts realtek-smi.txt to realtek.yaml, but missed to
> adjust its reference in MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
>
> Repair this file reference in REALTEK RTL83xx SMI DSA ROUTER CHIPS.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
