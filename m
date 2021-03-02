Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9560DC433DB
	for <kernel-janitors@archiver.kernel.org>; Tue,  2 Mar 2021 13:19:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52BBA60231
	for <kernel-janitors@archiver.kernel.org>; Tue,  2 Mar 2021 13:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446091AbhCBNJj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 2 Mar 2021 08:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244095AbhCBKk0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Mar 2021 05:40:26 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68E0C061221
        for <kernel-janitors@vger.kernel.org>; Tue,  2 Mar 2021 02:39:36 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id l192so10343649vsd.5
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Mar 2021 02:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9y/OLbMdtDESdX9cxpVBPkgzPGOeodSxawca/q+mpKk=;
        b=lF7i96mD7IhEXlug+vEnfPbJSPNTmN975tD3fkSobYZjokRjMZLrk7stkm6jNfWpw2
         9gSJ8D/tzPavPFvpWknhwzjiN+v7in2gbRvy50dxYRvBI0iTIOTmWVGy/XT2Reg1kzGx
         xFf/Dglm+AZjuA2xp2bfwu+VrynvHw2e6nGoxSuQJ6MY4m/SrEOKsRCmcsnKwXrPG9Qs
         +X14rJ6nPzVwAu3FyEu2E4RaAzVQ80Vu+pT2v31xTxuzPnoNtqnkM13xAh9Qnb6p5sec
         xWsApc6FW3Qa3efI0r8tSTZw/QSQH8JQy2z2o4qENU6ECC/9Kw0cWK0IMYe/NM0BnlTH
         0JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9y/OLbMdtDESdX9cxpVBPkgzPGOeodSxawca/q+mpKk=;
        b=AtdUwcpwaV47PE+Dxl0i1yhWtha5K9tMK+uKQygwLn3iB/oQus67chCAJXsm8zPo/t
         1dceNao5W/ap8oqQ3G34JFbb3nps31MrfU7yQjXQENizJHq7iqvJqn0PdcTKSr/AoQp0
         yBhov5bWHzDXqcOh/YU2PtC+czJnCeAmEYZ1G5LWixqu44lm4d/76Gxl8efJrlPlC+x4
         2rkPbuhLsXo60XnJcLRrUarZ6zZWaxeJP0ZX2f22duh0dJJiosrtU9T4h77kOgblfMOP
         3zwzybc3yiPnSUcFII7vs7yJY1/eL1rhtVoKYZo8FqbmG7YggpVDKi51a/injACclgqZ
         xy7w==
X-Gm-Message-State: AOAM530J6Yg3eXfFTGSFuTPGF7ernZ765ymwY4L5YTXDwVRvb5pyCS+E
        4z8iYQADMVrJDflqxsxVW/jGK+qXvvnAdd71UHKKXg==
X-Google-Smtp-Source: ABdhPJwX80Q9SU3s5pG9sH20LwYNls+0ukRvdY+lJRo0x+xCw/4R/wLkzDCaJrl8uxcmAJ4SIsXJfn/wHbxIkF1eJ/E=
X-Received: by 2002:a67:ec7:: with SMTP id 190mr1803896vso.42.1614681576170;
 Tue, 02 Mar 2021 02:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20210220142953.918608-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210220142953.918608-1-christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 2 Mar 2021 11:38:59 +0100
Message-ID: <CAPDyKFozVZ9PR1JeQ6F8Ua-YcdpK-rS9TLDe6BW71avpiF5f4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: uniphier-sd: Fix a resource leak in the remove function
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Shimoda, Yoshihiro" <yoshihiro.shimoda.uh@renesas.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Doug Anderson <dianders@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 20 Feb 2021 at 15:29, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> A 'tmio_mmc_host_free()' call is missing in the remove function, in order
> to balance a 'tmio_mmc_host_alloc()' call in the probe.
> This is done in the error handling path of the probe, but not in the remove
> function.
>
> Add the missing call.
>
> Fixes: 3fd784f745dd ("mmc: uniphier-sd: add UniPhier SD/eMMC controller driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/uniphier-sd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
> index 6f0f05466917..ccbf9885a52b 100644
> --- a/drivers/mmc/host/uniphier-sd.c
> +++ b/drivers/mmc/host/uniphier-sd.c
> @@ -660,6 +660,7 @@ static int uniphier_sd_remove(struct platform_device *pdev)
>
>         tmio_mmc_host_remove(host);
>         uniphier_sd_clk_disable(host);
> +       tmio_mmc_host_free(host);
>
>         return 0;
>  }
> --
> 2.27.0
>
