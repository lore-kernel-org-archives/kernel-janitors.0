Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2274DC00140
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Aug 2022 18:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbiHOSsM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Aug 2022 14:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244284AbiHOSrA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Aug 2022 14:47:00 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C506A41D22
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Aug 2022 11:28:26 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-10e6bdbe218so9024146fac.10
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Aug 2022 11:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=4BgACqig1Mi45Cs+/G7h/s0hfyaq7pp4CtuWT3zQedA=;
        b=RKQZbu7SpMqvE8sqFweu7O4+/cwvBEkat1Mvb1JDv3PnHaFXHHobLfNADPKkin/oGl
         SeFRrar+0CyylgfIi9LXMDw0frFLWjYho/RvsG1YH2ISLAA8LXzdwgo0hCz0RBecugT2
         FRTA4p46zLsDXbAidh5VLet1ValWBamov2Fspc64VAsPg19y7kU0wagtr55h4A6Fjf15
         w0jAO1bjk0FqBLRvfFe92UyF+vNz6LwN2Vl9fyCINCs1c5N824PSsKYAoklpzHXP+unf
         NZmWonsJBGtRRGdx35unuA0yp8sZggsxJHUi6CYi7+n2vorTpy81zQkUUoLGXE5tORQg
         vehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4BgACqig1Mi45Cs+/G7h/s0hfyaq7pp4CtuWT3zQedA=;
        b=WfRqAAiFkHR39C3RWUB90NyrgE/00cDb+Q0aEyhQDDSD1D3in+iG+m6Tnp0W6Ef5r3
         0GlZG8xCkROWKpLfPFuadp2ewGI4LRgVhU2Y5x4jBwDfQKr/G0Y8y7aVH7OS817CE9/J
         +9GnufldsQeSdauww47OgWEsWbhina4gBlxvm5BUVjQVNaJ5tBge26XOKH3ant1eJGjY
         LQWOEMUz1fTkScIRuoHzDPZLPUIHDamor1XZlixb5ersCLtvpQoSio7s0mOx6s3UL6Wd
         /7xLgSXpT6Q5BfHIVHIo5AKeRtHpPzcyL7LXS9aQk6UqAVU45BtB+LMn/RydjCbcMWgt
         KukQ==
X-Gm-Message-State: ACgBeo1sstyN2Ah+fwqVrVyslPReKi5URexkII4UMJvjPf4yzQ2kCVvh
        wnkopG5yjkWXiVKZumEcKMXxw7uRnkYNanA7p79iCu/R8jg=
X-Google-Smtp-Source: AA6agR4TTqNoTeU03JIaC+2g5dNCzX/cvpfy1peGRPwAdfwv5xTLb4TGuLv7e+tDPquOFps3OgV/7nglTpV8rmFJvRo=
X-Received: by 2002:a05:6870:65a7:b0:10e:d8ab:dd79 with SMTP id
 fp39-20020a05687065a700b0010ed8abdd79mr7576211oab.53.1660588106133; Mon, 15
 Aug 2022 11:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <6d75855ad4e2470e9ed99e0df21bc30f0c925a29.1658862932.git.christophe.jaillet@wanadoo.fr>
 <07a2dcebf8ede69b484103de8f9df043f158cffd.1658862932.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <07a2dcebf8ede69b484103de8f9df043f158cffd.1658862932.git.christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 15 Aug 2022 20:27:50 +0200
Message-ID: <CAPDyKFr8i1bbxoYpF7tFDMjbJzmL4ZS3v0=gVtc4enZs6S9fjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: pxamci: Fix another error handling path in pxamci_probe()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 26 Jul 2022 at 21:15, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> The commit in Fixes: has introduced an new error handling without branching
> to the existing error handling path.
>
> Update it now and release some resources if pxamci_init_ocr() fails.
>
> Fixes: 61951fd6cb49 ("mmc: pxamci: let mmc core handle regulators")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for fixes and by adding stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/pxamci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
> index 37bf362a0ed5..e4003f6058eb 100644
> --- a/drivers/mmc/host/pxamci.c
> +++ b/drivers/mmc/host/pxamci.c
> @@ -672,7 +672,7 @@ static int pxamci_probe(struct platform_device *pdev)
>
>         ret = pxamci_init_ocr(host);
>         if (ret < 0)
> -               return ret;
> +               goto out;
>
>         mmc->caps = 0;
>         host->cmdat = 0;
> --
> 2.34.1
>
