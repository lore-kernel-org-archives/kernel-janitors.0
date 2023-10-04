Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B64BE8FDDB
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Oct 2023 08:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbjJDI3g (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 4 Oct 2023 04:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbjJDI3e (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Oct 2023 04:29:34 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9703383
        for <kernel-janitors@vger.kernel.org>; Wed,  4 Oct 2023 01:29:31 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so3168372a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Oct 2023 01:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696408170; x=1697012970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jnNSTFNXYMGhiBE5TTn8XlAm70fbHnUZa7Uv0OEiDKY=;
        b=h5RBeT3jHoWbl7vwlGcUqpo8XQLNIcqcbohc5qzSDdx28TPXkQmg1Z0tUeRpj2BVRy
         DU0myfdqEU5g+t991714pACcCJkgXekeXyuXMsADlKLfCdM7egArw/TYBtZUW0rAlP/k
         nBsvTDi2dGa0wisJ6BUhLlPFou8BJ6lHmcwkxrnMl35ezWdnad8Iq9Bh/DSWVLUi3z/h
         TahaYJNjNEC4LiI0xZlNnMJVJOpjIEmEQ/plkVGXO7q49jeyrqhumFenF7Ig6TOVuVdc
         LO4NzwLujmEcCulZ4jmgV2HiF7RRcMVH4VOeUxzhGcqtgu6ds1qsD0ZEDMakFP/qdRGC
         GcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696408170; x=1697012970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnNSTFNXYMGhiBE5TTn8XlAm70fbHnUZa7Uv0OEiDKY=;
        b=lLXmrn8oBZSv6skE/tAlZPBOlUGr4zu3XBrKIfx5m05xdv0jWWMd4CwsioLxtVQNMP
         hDeURYhFjJhm9Fkw3BHJ1B3hLuPcVDZIuq2lU/lhq44ZHv0TMYIfzmzzHotjBDmApjfZ
         yQWmOZdkttZaM8ezrBxFSz3t4oFK3+2vC8L32lHcxD6lus7MFyDc7eChGGxK0Tk6SeoB
         xScb5caOW9FDtlcKGhe54jkBIl0JEr1+shqDMNShQRVonGu2FzkjQHuv/bllc8ZsErMJ
         nowjs1pKdvWH2WLDX82BoxGG0pvqMOKjPPKJYj/tHKRSzo1bEeMXPQew7tILHx4aFXto
         lnvg==
X-Gm-Message-State: AOJu0YyMPgUYSe2PANlrZ5ujQtU7caO8mD79aKFSjnOjrBLB97uQSRPj
        li5FCpL1qZJwq9Hdd7OWGpOrpA==
X-Google-Smtp-Source: AGHT+IEouVepWQWLdQeh/NMGAzc47HjCU0/MoBhFC47e/nw7G0peD322pC5n9Skvs0n93OtTDlR4hA==
X-Received: by 2002:aa7:c907:0:b0:534:7b49:9036 with SMTP id b7-20020aa7c907000000b005347b499036mr1303715edt.12.1696408170018;
        Wed, 04 Oct 2023 01:29:30 -0700 (PDT)
Received: from linaro.org ([86.123.99.172])
        by smtp.gmail.com with ESMTPSA id s7-20020aa7c547000000b0052595b17fd4sm2043606edr.26.2023.10.04.01.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 01:29:29 -0700 (PDT)
Date:   Wed, 4 Oct 2023 11:29:28 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: imx: imx8: Fix an IS_ERR() vs NULL check in
 clk_imx_acm_attach_pm_domains()
Message-ID: <ZR0iaOF+uZHGB3bO@linaro.org>
References: <44bacaba-848b-4e62-908c-16538330d4dd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44bacaba-848b-4e62-908c-16538330d4dd@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 23-10-02 10:01:51, Dan Carpenter wrote:
> The device_link_add() function returns NULL on error.  It doesn't return
> error pointers.  Fix the check accordingly.
> 
> Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

However, this doesn't apply for some reason. Can you rebase and resend?

>  drivers/clk/imx/clk-imx8-acm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
> index 1e82f72b75c6..83019b986622 100644
> --- a/drivers/clk/imx/clk-imx8-acm.c
> +++ b/drivers/clk/imx/clk-imx8-acm.c
> @@ -287,9 +287,9 @@ static int clk_imx_acm_attach_pm_domains(struct device *dev,
>  							 DL_FLAG_STATELESS |
>  							 DL_FLAG_PM_RUNTIME |
>  							 DL_FLAG_RPM_ACTIVE);
> -		if (IS_ERR(dev_pm->pd_dev_link[i])) {
> +		if (!dev_pm->pd_dev_link[i]) {
>  			dev_pm_domain_detach(dev_pm->pd_dev[i], false);
> -			ret = PTR_ERR(dev_pm->pd_dev_link[i]);
> +			ret = -EINVAL;
>  			goto detach_pm;
>  		}
>  	}
> -- 
> 2.39.2
> 
