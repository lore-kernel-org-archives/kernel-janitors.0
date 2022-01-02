Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3D7C433EF
	for <kernel-janitors@archiver.kernel.org>; Sun,  2 Jan 2022 06:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbiABGoL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 2 Jan 2022 01:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbiABGoL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 2 Jan 2022 01:44:11 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AC8C06173F
        for <kernel-janitors@vger.kernel.org>; Sat,  1 Jan 2022 22:44:10 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id p7so50372396ljj.1
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Jan 2022 22:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hBaWxbtCPSIrnNlIsbfh2h4Tv6caCN36fG0hhG2CIl8=;
        b=LKWp+IYCyLW4ZX96eGz/dV09zm/C4GQJD6VrQPa0poZqvUtqjlgw3StfoK3yDymwMa
         ZKx2yg8V7f0vO85X6DNIfkZaJq54KDLElws6cxTxN7TIgdcDzTkWw+k7UOyKnk1dkVrd
         b2WdYZdZjyRaYDdMg0on/B/yIfCKbfV58tx4OL1mMsUyZJ/hr8pcHkPlQzLaHAu/PCCl
         OWFX+Jb4z43XV2ckzxKf3Z3a7W9iex+wqSmuObiUXdUIxQ4kMQlN72ILXxi0uAAQSrXX
         n2P1trawr3hvy+1mayya9jySsrk7jXR+3wyWtQG6MHcEOjz9zg4m4siEhyx1ffGpX7AN
         1I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hBaWxbtCPSIrnNlIsbfh2h4Tv6caCN36fG0hhG2CIl8=;
        b=HrLA23EtH5SCghJuH9k4xgGLkts1FJfVJ0p2NGjq8FpIwAwbZhMsUOKTJC2v8/ycXZ
         diWjX47qGFRQPBL+rC0l//Xj0aB5QMIv7bg3+MbeK/uugzWMjyDF0wwjS0baOaj6x8iH
         A2h9ZjPdflbdgjj26D7QVrSm4QzvY5ZyNoPU6lNFwUzAsPXzmCykUIIVp5qwWSaEJEsy
         JSRv2SRABfIjvwCWG2e35Ig+B9ewz6RMRB+EcE5ePeMi1tNokv0xK6XDjEDoej8GD2eV
         a9BhQEZZyEJIoVyutAggFH2l69Dwz7w4IMQVuSPJ98uxpPW7xExTECRHOZwU81lAeo+E
         XxIA==
X-Gm-Message-State: AOAM530E5HE9dmOwXTsGhPghArieZE4LSKFtB1HG0PT/keFYPyyJ087+
        WlzQURvlcUkf7gtTQ4/9McBGB2S6RbphcAxdeLL0UA==
X-Google-Smtp-Source: ABdhPJyXo+R0z+uJrO92Rt1Mnb4iQGwk2XG4mkcsGblvjFALPbeSf7AIV8rwEKDL3J5LKtcXrVr0+Yg+wPnrsuqFwyw=
X-Received: by 2002:a2e:3a07:: with SMTP id h7mr30066567lja.478.1641105849036;
 Sat, 01 Jan 2022 22:44:09 -0800 (PST)
MIME-Version: 1.0
References: <24a8b7e7b7b8f9f4b8eaad6707f420d55fd10aac.1640722789.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <24a8b7e7b7b8f9f4b8eaad6707f420d55fd10aac.1640722789.git.christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 2 Jan 2022 07:43:55 +0100
Message-ID: <CACRpkdbTo2Xp9EUWPHjGafLRTh_9Vt54VoJ8fwDsbBukai3+Fw@mail.gmail.com>
Subject: Re: [PATCH] power: supply: ab8500: Fix the error handling path of ab8500_charger_probe()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     sre@kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Dec 28, 2021 at 9:43 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> Since the commit below, ab8500_bm_of_remove() needs to be called after a
> successful ab8500_bm_of_probe() call.
> This commit has only updated the remove function.
>
> Fix the error handling path of the probe the same way.
>
> Fixes: 6252c706cdb0 ("power: supply: ab8500: Standardize operating temperature")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Nice catch,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
