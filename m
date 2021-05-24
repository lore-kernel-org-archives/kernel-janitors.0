Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C546C2B9F7
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 May 2021 14:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAB9F61370
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 May 2021 14:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbhEXOCF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 May 2021 10:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232902AbhEXOCD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 May 2021 10:02:03 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521B1C06138B
        for <kernel-janitors@vger.kernel.org>; Mon, 24 May 2021 07:00:34 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id 105so9353316uak.8
        for <kernel-janitors@vger.kernel.org>; Mon, 24 May 2021 07:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bhZvYF2rrfsZa6Xf7+GPLv45uKVXrZPOlQNANCKECQI=;
        b=QFwnDovX8FbineGyWDzBEnowUBB99r0szO6EctLouJ+VM2LiCGRhsvhsWGG63bQ38u
         L8737OQdQqtbmzB2DOFHbAMHFz4mbgFynB6Hr6LEPzS2NlZebCoksFMUbpIrF5cEwx7B
         T/9TaMS4c84GbC8mE2fvp1gao9RKc70VhhCRbiSPgOwHjT4x4MyLQ3y1AeJYjQvkEDI3
         hTtFD7vvnj9PNncgtHBXpOzlA5KQG9P4JKmzwSe61ZYFSHnEWhrel6yZkKW/kbqSnTbg
         QZOdLzAcRz1zB3xj9RzYvlmwEpHqCOREpVzye076+kpjJ8eDCQmKr6UsQZJa1pqzWEHI
         lPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bhZvYF2rrfsZa6Xf7+GPLv45uKVXrZPOlQNANCKECQI=;
        b=kP1ftb+tc39N3n1zz1kgW+RtKrm8MQa0roiBO3O5UcMJMfeelRWSg0O4VvCn3LJ9/e
         Es8bH2ybXGA2kS0C3h1onIUTUSdwIP4yr90mGkJBKeV3I028BnfveI3+EfuVXy7EPsT6
         9cRLmIVZsXdhaBaV6KVXdjucOzb/VOvGaQGGGP7JI44loFtMeLXjN654rCsmLeo9wNzr
         bBhjRGtNV8wQ45L4xSXv3nlIS9klvTftLY2IxSAu44opL567VQEqo+CATl2FZvb8Y8C3
         IGeqZk3oUqi0UA0K7UVeQER4jlMqtsyDbhUQGFrcnJ0vrQAuqTOrSw/6XG/0X7R0MziA
         giNA==
X-Gm-Message-State: AOAM531a+S4zAW3Ty9SJaVdJj10ImEO/SgD0lESqqir2NUh6W4rWEHcn
        99D6xN8G/E2DR2U2g+o4gkXpdKFzT3DHr5BDd8jM/A==
X-Google-Smtp-Source: ABdhPJyTkuNIXW/4VTeu46rTAPJNrdcFFBw/FDfMkyZ8gV3dDP2TWej1nRS1wo4Y1zZF3ITB+QVUCzn16nazwshQD3Y=
X-Received: by 2002:a9f:24b4:: with SMTP id 49mr12816796uar.100.1621864832999;
 Mon, 24 May 2021 07:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <d05074c11962a046ff9c2f457c240432ca8a7194.1621600443.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d05074c11962a046ff9c2f457c240432ca8a7194.1621600443.git.christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 24 May 2021 15:59:56 +0200
Message-ID: <CAPDyKFrS3wdYs3AQtjZEOsLzNvxgy1n3EfxZ+a8w8J8rH8kQ-w@mail.gmail.com>
Subject: Re: [PATCH] mmc: mxs-mmc: Disable the 'reg_vmmc' regulator when needed
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Doug Anderson <dianders@chromium.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Chris Ball <cjb@laptop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 21 May 2021 at 14:36, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> The 'reg_vmmc' regulator is never disabled. Neither in the error handling
> of the probe, nor in the remove function.
>
> Add a managed action to do the required clean-up before a 'regulator_put()'
> call.
>
> Fixes: 4dc5a79f1350 ("mmc: mxs-mmc: enable regulator for mmc slot")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mmc/host/mxs-mmc.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
> index 947581de7860..b043d53dd728 100644
> --- a/drivers/mmc/host/mxs-mmc.c
> +++ b/drivers/mmc/host/mxs-mmc.c
> @@ -552,6 +552,13 @@ static const struct of_device_id mxs_mmc_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mxs_mmc_dt_ids);
>
> +static void regulator_disable_action(void *_data)
> +{
> +       struct regulator *regulator = _data;
> +
> +       regulator_disable(regulator);
> +}
> +
>  static int mxs_mmc_probe(struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
> @@ -591,6 +598,10 @@ static int mxs_mmc_probe(struct platform_device *pdev)
>                                 "Failed to enable vmmc regulator: %d\n", ret);
>                         goto out_mmc_free;
>                 }
> +               ret = devm_add_action_or_reset(&pdev->dev,
> +                                       regulator_disable_action, reg_vmmc);
> +               if (ret)
> +                       goto out_mmc_free;

Even if this improves the behaviour, there is a standardized way for
how we deal with regulators for mmc.

1. Call mmc_regulator_get_supply() during probe to fetch the optional
regulator. If a regulator is found a corresponding OCR mask, in
host->ocr_avail is assigned.

2. In the ->set_ios() callback, invoke mmc_regulator_set_ocr(). This
will also set the correct voltage-level and turn on/off the regulator,
depending on the requested OCR/voltage-level.

>         }
>
>         ssp->clk = devm_clk_get(&pdev->dev, NULL);
> --
> 2.30.2
>

Kind regards
Uffe
