Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB62C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 28 Dec 2021 16:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236498AbhL1Q6m (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 28 Dec 2021 11:58:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236490AbhL1Q6l (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Dec 2021 11:58:41 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66858C06173F
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Dec 2021 08:58:41 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g11so42699043lfu.2
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Dec 2021 08:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zrQnwrOYo44Zy15SHr8SgN0Chy99tnjGBiLMnJFezuA=;
        b=BmyOQ+n+2q8EtIH/+W2DQ5gXaSxydrZiDK9gQHpDFhjnKjR6A8ZiGKOFENrAsf6Kup
         7ZLAlzKRdwHSiPXOZhv7qImo9MVw0HrNTvk8cWiatYdoPJkjmx19D6e3+Zjwof54ELdh
         rDzOQJb8fwd8ex27GBGO4UTLQ3rCOBUXN8Wmi9bmDLnUWhoMgbZtH7yelbeYBB1sYK1c
         VQs6bRoXLKz/h0t+7Z5LMKBkLauP9PBtroxAEcn01Smq8JU0Mp2DOcS1CXKKyGSTke8I
         K6dya80J5nEoQmQ8hMXysyICDX3mgBxEhYMCysmu24r1wSPnKD+Zf1P384FKCozPUIS/
         2HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zrQnwrOYo44Zy15SHr8SgN0Chy99tnjGBiLMnJFezuA=;
        b=GzxsyMJ3OuMFGgweA1DFbpGDCmyxvtTcbhTKRfZzD3klpAZrEPIByTKlpwAJYeDAmi
         lAceN6fC1z2LASJQlQAPlQ+GIeWDXxSGEXBTNwSbIuCO6rnloIdzCAgciivmyzWwZY2R
         /Q+droidrv/msyGnF2lPjsBa34WNl9oQ3HF5Ofav9v++f7shX9N+ti2sa+Z8zY2Uttw5
         PKE9HWf9d4uSx8QbgvkYoJG0PJtzTJ+6AntNW36zFqkvc/gZcCq+eW2VmecWF+tc+cGQ
         k4DIeAwKOWmiTV8e7RARFNPqBg7+fqVoq4HUDF+dmF8mcpMFGsJQiyhukbzdBhf66eZP
         DTyA==
X-Gm-Message-State: AOAM530rUPnUlpwAqLQ8Nl1Pc9q6/+bLQrksS4QYogtNW1rF1SYelwZa
        8N4gy5Q94Dw5lmKyH9jFodreFSRBXfvoNfgBObVolCQHDyskrw==
X-Google-Smtp-Source: ABdhPJx4JoO51qdE7YskaABs81LWtu6BBrmrra8NDnH7XzKiBYGjPn+QvguCjJ0yBPPCmHp7CTk73mpMwcHQOOasimo=
X-Received: by 2002:ac2:4c46:: with SMTP id o6mr20144159lfk.373.1640710719665;
 Tue, 28 Dec 2021 08:58:39 -0800 (PST)
MIME-Version: 1.0
References: <07a8e48db446888bd77f16b88568e80904f52103.1640528089.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <07a8e48db446888bd77f16b88568e80904f52103.1640528089.git.christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 28 Dec 2021 17:58:03 +0100
Message-ID: <CAPDyKFpeiPcbvB2gV3P5z2bGpo_--gpFT_zUaMKA1kX8HT0uEA@mail.gmail.com>
Subject: Re: [PATCH] mmc: pwrseq: Use bitmap_free() to free bitmap
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 26 Dec 2021 at 15:15, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> kfree() and bitmap_free() are the same. But using the later is more
> consistent when freeing memory allocated with bitmap_alloc().
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/pwrseq_simple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_simple.c
> index ea4d3670560e..988467fbb621 100644
> --- a/drivers/mmc/core/pwrseq_simple.c
> +++ b/drivers/mmc/core/pwrseq_simple.c
> @@ -54,7 +54,7 @@ static void mmc_pwrseq_simple_set_gpios_value(struct mmc_pwrseq_simple *pwrseq,
>                 gpiod_set_array_value_cansleep(nvalues, reset_gpios->desc,
>                                                reset_gpios->info, values);
>
> -               kfree(values);
> +               bitmap_free(values);
>         }
>  }
>
> --
> 2.32.0
>
