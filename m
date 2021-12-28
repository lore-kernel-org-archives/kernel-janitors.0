Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6383C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 28 Dec 2021 00:48:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbhL1Ask (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 27 Dec 2021 19:48:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234220AbhL1Ask (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Dec 2021 19:48:40 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BAE3C061401
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Dec 2021 16:48:40 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id i11so15686831ljm.13
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Dec 2021 16:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XtuWE/7YOF3x03Po58Geo500jbjpw4aXGFZe7H1t3CI=;
        b=qSrhZ3HID5P1K215GYn6az/E3YOHR4V+n1o3qrHfCaXPRXWuI16WyFBIgyAPplqHpC
         eozVgT8RksGh5GZD1GyfZNaM98GHS1AYsU0ubwahvUSjIgOt5w4DoJC+swdDADLjwKJ6
         IQ8Wp6YJX7pwaXUyu3SVhUMPzAboueXiZ1hJhZuJ7dYwn/8FsCneq7cDlKPx/v8Bi+Pj
         aX/0KWz1yb2+Ko1TcX6Z+ubqLl24SsSE810Yr4Y2A7IuKAInO8Yahv7vO1YtNvgfbXIp
         Cs9wCfu0cwmPm84b/45Kg3lr7H8t4mnju5zmUnZeO3zZR6Fr7SC5JdrmbxT4if2cJdih
         OkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XtuWE/7YOF3x03Po58Geo500jbjpw4aXGFZe7H1t3CI=;
        b=g2zJf+JrzEaEHcVguS+nw/X3cvIE6TSeHONfRMuS/HE2j9KN6I85X5Nr6Sz7Qn0ylH
         ziEq9VMjzLjYLZN0pyDLUATPk2hPcTkPqJXBv+tPVcMbbu7saHg6RFEac91uMROLi/5A
         D1p8Zq6jZjQQCZ/3QGHt4F9Hps3ynkPZ1rpdlWhS2ssXgk1dJaE1FM7jWJA5/MFAPnx0
         waa+YnBJjEybCSnXAIJvV2JAG7Ii+8M8bSukD8/oy7coY9MYKNTrL8XxOgjjBoH6nYqY
         dtVp3rgNr6A4OjebkZRceZYHOJe95BTIO5tLGnNKMi2pGRsDRJlK+/jctz1hR5WCxj2m
         UcuQ==
X-Gm-Message-State: AOAM531hXnqgDDJnML2NSFOeTTcXt/GusL+01/lKod0sNBCO2XPrKAfZ
        id+Q8gSjG3JHehD53gDJX/HMjfanuFYNvpdMms0aQeZqXQk=
X-Google-Smtp-Source: ABdhPJw7f+4TOsVnf8moFCphqcwcelZmfg7R8/arZs7x/WoTBDS9UtMoqS1q5cAE0LOY84YO6+pwJWluB+zZNcwQz4Y=
X-Received: by 2002:a05:651c:623:: with SMTP id k35mr16242703lje.133.1640652517883;
 Mon, 27 Dec 2021 16:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20211227064839.21405-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20211227064839.21405-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Dec 2021 01:48:25 +0100
Message-ID: <CACRpkdbFf3cNk6AKoahGsvY_RU+F0hnM6NWv0vcfjJO6RsQa+g@mail.gmail.com>
Subject: Re: [PATCH] mfd: db8500-prcmu: remove dead code for a non-existing config
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Dec 27, 2021 at 7:50 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> The config DBX500_PRCMU_QOS_POWER was never introduced in the kernel
> repository. So, the ifdef in  ./include/linux/mfd/dbx500-prcmu.h was never
> effective.
>
> Remove these dead function prototypes.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

BTW: Lukas are you using this platform or just general winter cleaning?

Yours,
Linus Walleij
