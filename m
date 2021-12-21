Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18BFC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Dec 2021 13:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238074AbhLUNDq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Dec 2021 08:03:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbhLUNDp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Dec 2021 08:03:45 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF3CC06173F
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Dec 2021 05:03:45 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id k37so29233650lfv.3
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Dec 2021 05:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5qR/GFbAQWP29cRyrgKwJq8PjwisWjVet0Dha36hCWQ=;
        b=uYspa3g8B9SsxDs/tLuDv19oblTeaNeb02v3391IOxEDqHhVX4UxlnZRXTlirRx0eT
         +LHlcmsmcSd0NrKaoEuMLdnqZEfbAGbD5E0cLSzHogURrZv43jj5PxiXas9P56g/T6m0
         L6eiuTUK2+5agrHly7tgp1k/8eLJTuVPmiha6ywcvMJVs9gZa5rfoweqVX9ZeTkrBYq0
         W/TZ4jCwhgDB17yyQqnJWkUKQMgSh+8FraLjuQTRsW3agoIiI3CGOZZlnXliQZjQUoWR
         ZmkOWXzrdbGQ7v8WME3agrke5sC1iH/t1O2GWDVTvGqUDtQvswYVKbeXvPii8oJwznxV
         i9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5qR/GFbAQWP29cRyrgKwJq8PjwisWjVet0Dha36hCWQ=;
        b=PMGMp65icOBhMxF06YrT3h9ftumcUiLWhBeC0GiQybi7pCv1wEO5LFN+US+xgI8QQY
         Vlmeou+k0YT39zyb6cad7pTRrWFqHzD8LGgGddpgyVwKq48uKrptUjSyXxVK8J1mGlg8
         8OjCa9FN8j7xXsvTn8GMBPHd8RfmHf8kThTAvS1TPXDxlCn83dXf9j9l+VsXgfYQVeQo
         LWzA0Cwvju5Rf3TlMH7W7VVBfJszMW+la4UtsxvZKujfpm77lR9NX03fQ70I/bUM7Rjq
         /uclMMrn7SY3naSXnDeg82bOHVik0sSa0ayLMGgoWWUWh8HRF0H7DWmJgCr3qIHudAUc
         pW4Q==
X-Gm-Message-State: AOAM533B5VOLKhiO/hmeINJYcLn/ZT1KQc3boaTiRN3CuaN2t7EL6YxU
        v7/HrwLKcSBEc9zgs30c+h3Qk2rDpAH4VKmSLlFYPA==
X-Google-Smtp-Source: ABdhPJxCR2r6nDI4PVDe3rh8Y73ZbHsuC141WD6b3/NR927XHgDS+fSxwzsHi+NR9IvtQr3eUFW31CxBpDcjclaBphA=
X-Received: by 2002:a05:6512:10c4:: with SMTP id k4mr2952802lfg.373.1640091823281;
 Tue, 21 Dec 2021 05:03:43 -0800 (PST)
MIME-Version: 1.0
References: <20211217150348.GD16611@kili>
In-Reply-To: <20211217150348.GD16611@kili>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 21 Dec 2021 14:03:07 +0100
Message-ID: <CAPDyKFrLYFAP6SxVLy8zsr9mpno2g47AetivTEeTOwZXMzKmUA@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: clean up a debug message
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jaehoon Chung <jh80.chung@samsung.com>,
        =?UTF-8?Q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>,
        linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 17 Dec 2021 at 16:04, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "0x" prefix is redundant when # flag is used.  It prints "0x0x".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index f2a14a434bef..bec4796283fe 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -1307,7 +1307,7 @@ static void dw_mci_set_data_timeout(struct dw_mci *host,
>                 tmout |= (tmp & 0xFFFFFF) << 8;
>
>         mci_writel(host, TMOUT, tmout);
> -       dev_dbg(host->dev, "timeout_ns: %u => TMOUT[31:8]: 0x%#08x",
> +       dev_dbg(host->dev, "timeout_ns: %u => TMOUT[31:8]: %#08x",
>                 timeout_ns, tmout >> 8);
>  }
>
> --
> 2.20.1
>
