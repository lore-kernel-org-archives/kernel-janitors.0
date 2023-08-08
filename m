Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3CDC001B0
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Aug 2023 19:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234016AbjHHTvC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233205AbjHHTuo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Aug 2023 15:50:44 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8538B53F18
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Aug 2023 09:56:42 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1bb89ac2013so4385962fac.1
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Aug 2023 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691513801; x=1692118601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1aaFBO37dpPCuMBG1yWUb85dTTA1EjCFwxXfWyjK7Qw=;
        b=iEyzQCP7QYNiBQ+A9aUqolMX3ZKaVJuSm539CAkcBAqbKTzNxhZRRfNMX+qo0DsIgO
         C99I6CsLl3Zo/3O3n463/Q15dp+Os0FuXrPTP4jCfb57jx7wA811BUxw7gSVTrobSUmp
         6diqeEc9mVh1U7wQUpxNlAQxmB+1p7c8snrIuo84XCQrVAbRk8lNlaUB1JFIcWtbSYQz
         ZTsT7ZGm+nDiAs/gohG/x4xf7ffYOp7QmgldvAkdcum5/kTBHF3jHxXtysZb5qQYX/16
         NahEIwfnfx4YXKqY1x2AglVPA9VElCheNykqEoJ6OlFy6eHRh+3NkHQQlJv9efIXlji/
         GL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513801; x=1692118601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aaFBO37dpPCuMBG1yWUb85dTTA1EjCFwxXfWyjK7Qw=;
        b=I7D1yMmjIS3bnmdDmsHdcKjhGvz+hBbZPWJCrUV3jH9ebDUcCoYMJDWUOdK2bxo7uc
         zQFxNhRoe6Rn6oWxRuZwRUZ8q3xTaloX5jy+GHUp0VLDrgfhPxWavapG6NsfjqHWaumJ
         vN46FAxa4pzph47DesuaXssb9UgZ/+9c5qHbnoyXhy90w40go6fgovS/F51naLL8lhWz
         8rhDrjmLtxmR8Gk2049wPiEOlsf+qZ/n1L/2Fu0nhXolndC8IDT+vqUqWXDhwRabQZ0O
         65wIeb39txE9wMXkgUoER1bIdKOFHBm8TEvZQPVQRPMPoOdIb6GvoFF9rtsZhFUrO8So
         Jq9w==
X-Gm-Message-State: AOJu0YyYaXem68WYsSQA+Vdx+al6XPhMDa1wum0iFcAxZ2kxD0m/mY9v
        sqwzfs+0i7QjsyjV+whRoakTJCJorV1MphiDsGYnPkCpSNGGrOtZLhE=
X-Google-Smtp-Source: AGHT+IFJj9e2EUCkSwSgqtF2y3ZesBe+F0eiTcoGfYJG3GoyMXdp+CIP9EhdafPQbyNW+qk99mZLa2MicI2Cz2nNz/g=
X-Received: by 2002:a25:4ec6:0:b0:d35:9a48:51b0 with SMTP id
 c189-20020a254ec6000000b00d359a4851b0mr7568564ybb.7.1691485293733; Tue, 08
 Aug 2023 02:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230801052321.1328225-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20230801052321.1328225-1-harshit.m.mogalapalli@oracle.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 8 Aug 2023 11:00:57 +0200
Message-ID: <CAPDyKFr9inG4dgAUYhrQOEND1Fu1CDajEPoO3W=dBRRXB=kceQ@mail.gmail.com>
Subject: Re: [PATCH next] mmc: sunplus: Fix error handling in spmmc_drv_probe()
To:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc:     Tony Huang <tonyhuang.sunplus@gmail.com>,
        Li-hao Kuo <lhjeff911@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dan.carpenter@linaro.org,
        kernel-janitors@vger.kernel.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 1 Aug 2023 at 07:23, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> There are few issues in spmmc_drv_probe():
>
> 1. When mmc allocation fails, goto is a no-op.
> 2. When mmc allocation succeeds, the error paths should use goto instead
>    of direct return.

Rather than adding a bunch of new "gotos", how about converting into
using devm_mmc_alloc_host()?

> 3. platform_get_irq() doesn't return zero, so '<' is sufficient.
>
> Fix the above issues by adding goto instead of direct return, also
> remove NULL check in 'probe_free_host' as we changed the goto to return
> when mmc_alloc_host() fails.
>
> Fixes: 4e268fed8b18 ("mmc: Add mmc driver for Sunplus SP7021")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/a3829ed3-d827-4b9d-827e-9cc24a3ec3bc@moroto.mountain/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Other than the above, this looks good to me!

Kind regards
Uffe

> ---
> This is based on static analysis with Smatch. Only compile tested.
> ---
>  drivers/mmc/host/sunplus-mmc.c | 41 ++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/mmc/host/sunplus-mmc.c b/drivers/mmc/host/sunplus-mmc.c
> index a55a87f64d2a..21cd49be08c0 100644
> --- a/drivers/mmc/host/sunplus-mmc.c
> +++ b/drivers/mmc/host/sunplus-mmc.c
> @@ -864,10 +864,8 @@ static int spmmc_drv_probe(struct platform_device *pdev)
>         int ret = 0;
>
>         mmc = mmc_alloc_host(sizeof(*host), &pdev->dev);
> -       if (!mmc) {
> -               ret = -ENOMEM;
> -               goto probe_free_host;
> -       }
> +       if (!mmc)
> +               return -ENOMEM;
>
>         host = mmc_priv(mmc);
>         host->mmc = mmc;
> @@ -875,30 +873,40 @@ static int spmmc_drv_probe(struct platform_device *pdev)
>         host->dma_int_threshold = 1024;
>
>         host->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> -       if (IS_ERR(host->base))
> -               return PTR_ERR(host->base);
> +       if (IS_ERR(host->base)) {
> +               ret = PTR_ERR(host->base);
> +               goto probe_free_host;
> +       }
>
>         host->clk = devm_clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(host->clk))
> -               return dev_err_probe(&pdev->dev, PTR_ERR(host->clk), "clk get fail\n");
> +       if (IS_ERR(host->clk)) {
> +               ret = dev_err_probe(&pdev->dev, PTR_ERR(host->clk), "clk get fail\n");
> +               goto probe_free_host;
> +       }
>
>         host->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -       if (IS_ERR(host->rstc))
> -               return dev_err_probe(&pdev->dev, PTR_ERR(host->rstc), "rst get fail\n");
> +       if (IS_ERR(host->rstc)) {
> +               ret = dev_err_probe(&pdev->dev, PTR_ERR(host->rstc), "rst get fail\n");
> +               goto probe_free_host;
> +       }
>
>         host->irq = platform_get_irq(pdev, 0);
> -       if (host->irq <= 0)
> -               return host->irq;
> +       if (host->irq < 0) {
> +               ret = host->irq;
> +               goto probe_free_host;
> +       }
>
>         ret = devm_request_threaded_irq(&pdev->dev, host->irq,
>                                         spmmc_irq, spmmc_func_finish_req, IRQF_SHARED,
>                         NULL, host);
>         if (ret)
> -               return ret;
> +               goto probe_free_host;
>
>         ret = clk_prepare_enable(host->clk);
> -       if (ret)
> -               return dev_err_probe(&pdev->dev, ret, "failed to enable clk\n");
> +       if (ret) {
> +               ret = dev_err_probe(&pdev->dev, ret, "failed to enable clk\n");
> +               goto probe_free_host;
> +       }
>
>         ret = mmc_of_parse(mmc);
>         if (ret)
> @@ -940,8 +948,7 @@ static int spmmc_drv_probe(struct platform_device *pdev)
>         clk_disable_unprepare(host->clk);
>
>  probe_free_host:
> -       if (mmc)
> -               mmc_free_host(mmc);
> +       mmc_free_host(mmc);
>
>         return ret;
>  }
> --
> 2.39.3
>
