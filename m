Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170BBC43334
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Jul 2022 07:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237675AbiGZHoJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 26 Jul 2022 03:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237631AbiGZHoE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Jul 2022 03:44:04 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5882DB92
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 00:44:03 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id c72so13837356edf.8
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 00:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H2KeWrOzAXHDnSJ3/65qH1ppJmiHemG/nnbZgxI3jzE=;
        b=Ym+bHhwvskOMHiERPb5yUCs1eGp56rwLMbKAaFS98pgXStoOLSihNMoH4rQRFQfGuz
         4OsAYQ6EuIuFKf7+DuQNVGuwkMfeiTFgH/ipAz5QY0Xb9l5hSk+wOj/Hgb+a9sxvG3gt
         M4+lMQCwSksyAf0ccK2kEPdHrQKIqanxxPsp3IdtPy7hZlPMXpRrb65kmOGPals3Pyv/
         bxIepVZ0fxG5q+LhgCQZ7C6adGImqG4UIfkCiZmULp24+O3hIQBZYlZdU7gT3Y3giI6q
         /93PPLLu/X18mf258zOF/Y8kmUIJIB1Xda+FFHnE/9cpup+/pwo9LEKW9Gz0fey7yrzL
         Lt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H2KeWrOzAXHDnSJ3/65qH1ppJmiHemG/nnbZgxI3jzE=;
        b=SsfmWC4BXM5Dz6+IAyjwUcdnBJDzqCZLVJxmb8rsV6d3TigrzVQ8dEqBBD++m016F6
         k8Ysrt7nWFaqkLMfzCie3HDEAzeD6GFD6xeEDirEGUCZsnwgcv63uHEGm8t9F0wsazb/
         J9fAbPQSVDIsPXEu2zE4/pgd445hhlqjsXwJPDmuZvioe1p53dwEHqGhMyn9odLoFBCw
         /TvUuZu56Ptbt7nJEE9MRt66LR7a1TGh1AuiQg1XU+exbbt0gDn7hK7ZDXIpUan9aMrz
         g785jRohhLXO+3jy3cJng0QWftVFsTcifJNAmL+FFqE4F5bcelAPo0gwMvIqv/AFz1+W
         jlWQ==
X-Gm-Message-State: AJIora8z6yymbDFODDXCxI/K4PdpDhkZ8mPRpWQMM67lsLDaQ1L/SHn5
        USzxJF/zK5+dV3qNr1Ywp0rfmDf5MgV2lTP1Sjy9HWhUDE8uXQ==
X-Google-Smtp-Source: AGRyM1v3kT3K37Yj20BSAcGqG5U8pY1U1AGavoRoQliTz7JyTg1UgxHXgP477tw1Qfv05bbtXF75pBZUuP5jsCDzKdk=
X-Received: by 2002:a05:6402:371a:b0:43a:ece9:ab8e with SMTP id
 ek26-20020a056402371a00b0043aece9ab8emr16905320edb.126.1658821441691; Tue, 26
 Jul 2022 00:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220720112152.22918-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220720112152.22918-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 09:43:50 +0200
Message-ID: <CACRpkdYKn1rLRXs45J4ZDP1G9nsWkH-8g25_onOsY+39+n01bw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ti: remove sound support for DaVinci DM644x and DM646x
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 20, 2022 at 1:22 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 7dd33764486d ("ARM: davinci: Delete DM644x board files") and commit
> b4aed01de486 ("ARM: davinci: Delete DM646x board files") removes the
> support for DaVinci DM644x and DM646x boards.
>
> Hence, remove the sound support for those boards as well.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
