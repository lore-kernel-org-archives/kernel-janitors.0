Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67882C433E4
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 10:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DAAF61A07
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 10:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235684AbhCXKVv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 Mar 2021 06:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbhCXKV3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Mar 2021 06:21:29 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427A2C0613DE
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Mar 2021 03:21:29 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id l22so11040308vsr.13
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Mar 2021 03:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W+Yocgc3+DKcZ3rZFu2qzPVA/fC6S94lI0lmLGrCF/c=;
        b=lJ6+dIH3dgCozTCyPxT3pCM6Zy2ndU/0HnMIknBElINpSxytfesgYFxMcKiZlRZgH/
         mG0jwfB1ZlMNqnhvRx994j7rSdPRALbPZp5Xoi0wI9IMa/4PoJXkCYjkvnVMjAUcgmfV
         V/4BeC6SzLvcVFHHOOzOuEe4zqa3O1KcoTkV1kM3zMtJpRY+uyxG/lczc0ZqQkpyWptA
         RvMkLIn5q7hQ4jqBkwCiLWdOty2Gm8FTzEZnAoJ+UnLQxm+uqiy7LGd0GzJxHT8mXh8D
         VIBGfsoL9VRm0xeNbionHAjPv5aH66yTNyAd7sSjY1WyIm/W+vYxRfyJOOZWlPAWzWTY
         OKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+Yocgc3+DKcZ3rZFu2qzPVA/fC6S94lI0lmLGrCF/c=;
        b=NfAU9UuwPBVh+kpvYeyIis2PvzRooXsEzBzNCi96+AO827OFotScpuxMzgZ0Vq7XNA
         vTM0qVbQ+4Mi29uwGo/RRpsjn7JIlWVv52RGmFYQmYFnmpoQ5cvOw3KLs6J2W6+RBQjv
         2n4bAVQUwqh8uODB1q9vikUMIwobRj6xxuJ/u2gIMXR331Eh0mkHa0ySmsL/yVO0n4zE
         6GVYTPVEIKzdctzcZn9skLupYtxiq0ayRisjBXD0zIO2qFGBcbQr/HOgWZrtR8q0w5Zo
         7u3GURBt2a9LlMfvWO91uhzlHw0hyQy3qcS9ii8oRVknNpvfqs8OPgR1mzOGOdFAFjTG
         0Jdw==
X-Gm-Message-State: AOAM530CxKyNysgpNseOUozSKaPjLPweSHe1x4hJD65WRmH168vs+Ie4
        WCHEk7ouV1MkZddYE8TDcZ/2KpgFg6P1Su4e0sX/mQ==
X-Google-Smtp-Source: ABdhPJxHF2q1J88OzYBCdZJMJX/jG3OMyPFSYq3DMYBdxj9JZLTxTau0NCkX/I+Zm8p5zwdBulg4KZBlGRn2UW3bxDE=
X-Received: by 2002:a67:6942:: with SMTP id e63mr1052517vsc.48.1616581288543;
 Wed, 24 Mar 2021 03:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210323112956.1016884-1-weiyongjun1@huawei.com>
In-Reply-To: <20210323112956.1016884-1-weiyongjun1@huawei.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 24 Mar 2021 11:20:51 +0100
Message-ID: <CAPDyKFqfqkwkkDAsEjEAG_6a80TRUCPQ3mq0jrAdPEU2gygdmg@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: sdhci-of-dwcmshc: fix error return code in dwcmshc_probe()
To:     "'w00385741" <weiyongjun1@huawei.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 23 Mar 2021 at 12:20, 'w00385741 <weiyongjun1@huawei.com> wrote:
>
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: c2c4da37837e ("mmc: sdhci-of-dwcmshc: add rockchip platform support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 06873686d5e9..e96c628aeeeb 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -383,8 +383,10 @@ static int dwcmshc_probe(struct platform_device *pdev)
>
>         if (pltfm_data == &sdhci_dwcmshc_rk3568_pdata) {
>                 rk_priv = devm_kzalloc(&pdev->dev, sizeof(struct rk3568_priv), GFP_KERNEL);
> -               if (!rk_priv)
> +               if (!rk_priv) {
> +                       err = -ENOMEM;
>                         goto err_clk;
> +               }
>
>                 priv->priv = rk_priv;
>
>
