Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9EAC433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 22 Jul 2022 13:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234088AbiGVNA6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 22 Jul 2022 09:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233195AbiGVNA5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Jul 2022 09:00:57 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C0A9CE0E
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Jul 2022 06:00:57 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id c72so2885251edf.8
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Jul 2022 06:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=baynEo7vnNm1XYDH0i7dj9nJYt96fbnXE4sQDZAxVtQ=;
        b=gJmyYtLDyaREVdwZyxpqlcnisGWEXOiTuJ5YWkc7D+Bqb7zBSwwOB4ZFh5n6ZQrA8x
         pCRiAUwXrJxF0oom8kDQB/sbiXCq8JmA0B8JMecIAt/9ePFqGHfHdbcHtinnuZe6BWWl
         n9U2yye/18vIVKalHy2/36N0IeK0feOpme1jpM59ifIE93PYuB1PJMLGbSvmA/lnjePE
         b6tN/esY+/eqTXuopjoHwHEluojCitpttzh/689dpuq+lIDOju9DOO38ExMTI+6uKWE1
         ltJ0nV/hJZMgya+2XmaT8xvUTbKDZs0d9NckUgwkjcEkZfJZrP3bW6bry5SVCBmyudSX
         w8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=baynEo7vnNm1XYDH0i7dj9nJYt96fbnXE4sQDZAxVtQ=;
        b=3FF4BXmMP0kIMXK4LewxlOOgrFWxL4C+GTd14dOAnEUfevzxRvgeg6ddjL9LZsKmcE
         vz87dEmekUveKE0GBOfGEbh15RUG5et46V30/e3r2L+pyH81CU1l2Vuks9NIV+T+y+Ww
         FJS3wRXtbCyfFPBkuoskl7ucKVHiwBjdfjtLO6rS6IHuzGGjPRa3F2AHlBgTNk2fRpBJ
         ZZorR1flVQoxibpiXKpBCZzJQEo2qjPUPuWFy9P1wyb1szTaaJhFg+iUGjSgr9+WkJfi
         d1smGuAdlRyE0u3bKZ8zsooTsyw//xMD0gOWSeYVA5x4Rwz2yZ0besmdC4hLBbOSb7Bb
         dRjw==
X-Gm-Message-State: AJIora+T4ele5Cpgb36aVh4k0H4moddQCJ/umNRfZZWFSia7Q/wSknk5
        lzyhy8roaJLYg1edOPgWkStTvVSAIRTeGsD/1Todiw==
X-Google-Smtp-Source: AGRyM1sfEMb9SVoxsN9BQXeDZdyBMMWHOKQGS3GlRPZlLOUUMleYFQOEwWCeuFpspnuhgXLSul1uaahyl7/RtrX3UHc=
X-Received: by 2002:a05:6402:26c2:b0:43b:ce7b:648b with SMTP id
 x2-20020a05640226c200b0043bce7b648bmr555241edd.133.1658494855592; Fri, 22 Jul
 2022 06:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220720111432.18321-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220720111432.18321-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jul 2022 15:00:44 +0200
Message-ID: <CACRpkdYyHTMYMKwFW5JSNXi+4SiP7=NPQ_uwZHRzPUK9j3EfHA@mail.gmail.com>
Subject: Re: [PATCH] arm: davinci: remove CPU type detection for DaVinci
 DM644x and DM646x
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 20, 2022 at 1:14 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 7dd33764486d ("ARM: davinci: Delete DM644x board files") and commit
> b4aed01de486 ("ARM: davinci: Delete DM646x board files") removes the
> support for DaVinci DM644x and DM646x boards.
>
> Hence, remove the CPU type detection for those boards as well.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Please put this into the SoC patch process.

Yours,
Linus Walleij
