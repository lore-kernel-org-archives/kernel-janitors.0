Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F21C43460
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 09:01:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4BC660FF3
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 09:01:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235580AbhEQJCl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 May 2021 05:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbhEQJCk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 May 2021 05:02:40 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D1CC06174A
        for <kernel-janitors@vger.kernel.org>; Mon, 17 May 2021 02:01:24 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id t193so4207181pgb.4
        for <kernel-janitors@vger.kernel.org>; Mon, 17 May 2021 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9OkKHJwSRtsD1XoVSI9D7062oV0S6RC6cgh0CBzJGxQ=;
        b=wurd6Th2hC0CtygbnWfpzXlmQIro6bMhdR7DCsDpr4cXF8QvJWfU2H7SuFcfuyl/on
         xtOSzL9mRf6Qpm+/yH9LQawbpjRtEIfDuKPownnp0Bixi4DHYm0Cv4Ovg/7BeVIjwGte
         Vgvdu50DNIgJdrMFWpziD3ZSowR3zWxzQazg7uoQJt6bE8+uPeOEhd7o2h/HBsYbh8lU
         hlikFoTOsIDijq4sx06mXFj7NwWE6z4lsmpAtBJraB2mLA7f3Dcuke8KR7G53Vp1OhUK
         kMKP77uZj4QYkMbZjh+ysYt/FSCyNPtmGQ0qYnuNvshMWQykCTz+CBHahzQff7YY7bCB
         17QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9OkKHJwSRtsD1XoVSI9D7062oV0S6RC6cgh0CBzJGxQ=;
        b=eRsy8F3V2ISSzQGW7tkAAO8rr1hWHU1u+kd6igLSZhUeqYa3C/8jw0Yx2e2NboFZks
         w/z0SEKqPKtGdXzheyvAqBzBlC3wdti+US+V/PdMyzr6vKNg2A4/0Zyx+XO7ZhwJLJ1Z
         8lpYpQWM/o47seUNidoRnhh3AKjuMXYBr8IkWEpSGgYoLVFuyiB7oFd7h2ayeC3SgvVE
         ROYuqOx5cgl9J3PH+ub/KNtg82n2D/78TCkBFkafyXSklx6eJuecJctqKU/T5a4PN5ZX
         ltBrh4GwbL6IkWkIdyjvQOgGwTJg+0hCtWNdIFw4STuOk3H2KlXyjjEVfFLMdqWSkKc3
         vNzw==
X-Gm-Message-State: AOAM531YuCXKUM9Jko7S0GdMfAvg+VRnJylZJOO73rGkG3CNLc/HJBAt
        MErAD6AvQHa/XWWUHUkAjX63g+GjMRrYiZtFIEiXHw==
X-Google-Smtp-Source: ABdhPJyp+18LHyzRAiO7+sc3FHiRgXNmFI/UTNc7tUNrDDRlUREycMbppyLtZcKvXSr6KiyqKSsBhvaEt7CAlg7Cf0M=
X-Received: by 2002:a63:4e01:: with SMTP id c1mr46758645pgb.265.1621242084104;
 Mon, 17 May 2021 02:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210514070306.606-1-linqiheng@huawei.com>
In-Reply-To: <20210514070306.606-1-linqiheng@huawei.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 17 May 2021 11:01:13 +0200
Message-ID: <CAG3jFytWqa9CwPto4Q1b5wZvHkviLgtY_pqYWyVCa5Trx0otwg@mail.gmail.com>
Subject: Re: [PATCH -next] drm: bridge: fix wrong pointer passed to PTR_ERR()
To:     Qiheng Lin <linqiheng@huawei.com>
Cc:     Phong LE <ple@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hey Qiheng,

Thanks for submitting this bugfix.

The title of this patch should probably be:
drm: bridge: it66121: fix wrong pointer passed to PTR_ERR()

With this fixed, feel free to add my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>


On Fri, 14 May 2021 at 09:03, Qiheng Lin <linqiheng@huawei.com> wrote:
>
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index d8a60691fd32..6980c9801d0d 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -943,7 +943,7 @@ static int it66121_probe(struct i2c_client *client,
>         ctx->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
>         if (IS_ERR(ctx->regmap)) {
>                 ite66121_power_off(ctx);
> -               return PTR_ERR(ctx);
> +               return PTR_ERR(ctx->regmap);
>         }
>
>         regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
>
