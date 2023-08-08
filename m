Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC34C001B0
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Aug 2023 17:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234825AbjHHRpc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233429AbjHHRpD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Aug 2023 13:45:03 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A9424985
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Aug 2023 09:20:24 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-447d6748aacso1363089137.1
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Aug 2023 09:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511579; x=1692116379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KdNPcZqmtXQcuBkzS9CoNBBYMwWbfur9izXMF+UKcpU=;
        b=biQC8U60Tk8tOhynEGeMqM8zU1RcKka/5u6OMdj1plS7YUtS7Bgt3txwqvvOA60eT+
         rykdwc/KstjV7YrBWZf2uGXi04heGIH9JhSevrGhouEYJ+sRg4GVUUsGnWcydKIqFyeK
         4p/sTg75auwkPJjlBtl7xQ3DDI1DdMUttsTpBIKN89ZcoV56+9pKmzaqpt72NDuwrW0g
         zQrXuf/z4YMtYPapWk9pvQUMFDxp2MUp5OQUgAEH9W+cmUUhmaGsdz3XcmlbVFv+0PJ0
         OabZ6vNgmF8fbdI1TUtZGiQjT1rVI0wIWO7P5IOkFEsZCTbMDq8gByLt+CtilsdfRlzR
         4Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511579; x=1692116379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdNPcZqmtXQcuBkzS9CoNBBYMwWbfur9izXMF+UKcpU=;
        b=JPkyMY1GA0A1NcubevJKuDmX/fTwdtk+icji9bqdRuabzf1mUeAF6G4LLXa4wQYCjy
         Y0uEDGPnGVCnA3tRPKjafZ7BcgfUUhv1v3Xrj7+yaJ2oUVLh1H2EWVn1J1CXlzPWBYdT
         1FmxE7bd0ARf/YQRT2SmJbSYy9TGhSgvn2qc6GWCSjT9J+Oz7EtZn221bRezkunshc0P
         ZREroGKnciPmUI4Oc6jf8XvXTnUs/0bSj9twQRlsaa9dSwVdlAxleHGR2AnWSVMoZlZ4
         /3Bbv9788qyK7dEwc3xs+42DPeA4tQtxWw+sektBN2H7XyOoaqDVMkYUR9eNNSURjxrr
         YO8g==
X-Gm-Message-State: AOJu0Ywm+W4Nuw4FXSZLbs9tBJfs5qtMwszBK537ZPxiO3dV3AIHb6Wj
        /5xRHSEPeFnSR9NeNcHrT3B+wElilUVBdNfEZwV567R75Q5DY1JUSLU=
X-Google-Smtp-Source: AGHT+IGuyTfHVUm0ldXaXrpMjSkfrIAQhLkFo1ndJ+yOlR8TxUe3HqDJUGXb27eojG4uRIDIwVCqRszIGFSQKMDYZi8=
X-Received: by 2002:a25:ced1:0:b0:c6f:b2de:21ba with SMTP id
 x200-20020a25ced1000000b00c6fb2de21bamr11990109ybe.17.1691507553159; Tue, 08
 Aug 2023 08:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230731122611.4309-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230731122611.4309-1-lukas.bulwahn@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 8 Aug 2023 17:11:56 +0200
Message-ID: <CAPDyKFpffTGpiQ5PSyKm+hcVntE==SH6O0XnvafgyReXwxNT_g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in STARFIVE JH71XX PMU
 CONTROLLER DRIVER
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Walker Chen <walker.chen@starfivetech.com>,
        Changhuang Liang <changhuang.liang@starfivetech.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

+ Arnd

On Mon, 31 Jul 2023 at 14:26, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit f3fb16291f48 ("soc: starfive: Move the power-domain driver to the
> genpd dir") moves:
>
>   drivers/{soc/starfive/jh71xx_pmu.c => genpd/starfive/jh71xx-pmu.c}
>
> However, the update to the file entry in MAINTAINERS only addresses the
> move in directories, but misses the renaming from jh71xx_pmu.c to
> jh71xx-pmu.c. Hence, ./scripts/get_maintainer.pl --self-test=patterns
> complains about a broken reference.
>
> Adjust the file entry in STARFIVE JH71XX PMU CONTROLLER DRIVER.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied for next (and the immutable branch) to my new genpd tree [1], thanks!

Kind regards
Uffe

[1]

git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git next


> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 003b0461641a..7a20d6ab1d18 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20408,7 +20408,7 @@ M:      Walker Chen <walker.chen@starfivetech.com>
>  M:     Changhuang Liang <changhuang.liang@starfivetech.com>
>  S:     Supported
>  F:     Documentation/devicetree/bindings/power/starfive*
> -F:     drivers/genpd/starfive/jh71xx_pmu.c
> +F:     drivers/genpd/starfive/jh71xx-pmu.c
>  F:     include/dt-bindings/power/starfive,jh7110-pmu.h
>
>  STARFIVE SOC DRIVERS
> --
> 2.17.1
>
