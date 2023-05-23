Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF9AC7EE2E
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 May 2023 20:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237038AbjEWUFb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 May 2023 16:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjEWUFa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 May 2023 16:05:30 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1484911D
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 13:05:29 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64d2981e3abso177852b3a.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 13:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684872328; x=1687464328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xxXVUOaFN1Qv+6eAQzosOhjOl+94anVe0xXKbzcrKW0=;
        b=Z1UfLh8zwQ4gGkVeoNzdf7gNB+vkVFBoxp+/Y2vwDp7ns/GM5u9C4vSDIBCs/fw/ii
         92XGpa8kQFDw88Bqx0REdQVhQafzDeGATQcQ0YHuOKOLO2CMYCZXEq54VBggA+mOUuX5
         lH5Yi8VSe62WZpgb57rw12rbw2hpSeuwCummsJiFzJlU7+d7wQD9iSPC4p0gbzcvLIDj
         FiOUA1ZN0NdQSh09ZL4AcUFBu5es2ubK87MmrFdarhGIe8sfph8Pi47Ry9BenJBVDDz2
         SMe+pwJBaqXAQbwk5+Nh5qNcr4kYcfczdiGNEEXco2r/tDa/tDbefbTvoQgStRxxTgZg
         EV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684872328; x=1687464328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxXVUOaFN1Qv+6eAQzosOhjOl+94anVe0xXKbzcrKW0=;
        b=gE6RpiBxXi8o2ZuZVsJKt5RTs7SwUBtZGkuIthHl+zxVKVu/6kh01XWHEmu/cC1jm9
         U6L7vaGWoOLyYRvBrKAoQ18Xhj6rFKhkzYGNain92u0x94E23yPEPs9iAZL2Gv97fSKZ
         eje8LYe+qvamk0sM7p3lCES5TV223ETFz1YwxSY2zr6xKJhO8rHjcC5fiZvMjORNNQ/h
         J6fome/qMmvxgv+fFZxTEV8lPTmi/wxLdoGpSxi6wALPHK07d1lFLE8r5zfAWG4nrrH9
         obUSEgz6zYKNq9EaHPPbz0qMKAPjKvtUhnb6uTCoudZ2mQ6AZqDSYgSc5GkkjCen3r1j
         8RLw==
X-Gm-Message-State: AC+VfDyDroQ6VVBpkSu8XUPi29azkUvYMf2rOsRBorRWCuT4dr9zoHRv
        WauhNmGwdZzx7buzzc/jE4tg+w==
X-Google-Smtp-Source: ACHHUZ49fyumpSoubA/QSL2euXQxNkK8YT8+yIAjR9IgC5rGDCadGOaus7RUj9TiIgEIp6v5Xzd0HQ==
X-Received: by 2002:a05:6a00:23cc:b0:645:c730:f826 with SMTP id g12-20020a056a0023cc00b00645c730f826mr201405pfc.24.1684872328385;
        Tue, 23 May 2023 13:05:28 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7a5b:c1e7:4298:b147])
        by smtp.gmail.com with ESMTPSA id x10-20020a056a00270a00b00640e64aa9b7sm6370805pfv.10.2023.05.23.13.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 13:05:27 -0700 (PDT)
Date:   Tue, 23 May 2023 14:05:24 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: stm32: Fix error code in
 stm32_rproc_parse_dt()
Message-ID: <ZG0chM7o2f7gTNyg@p14s>
References: <6f457246-6446-42cb-81ae-d37221d726b1@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f457246-6446-42cb-81ae-d37221d726b1@kili.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 22, 2023 at 10:46:11AM +0300, Dan Carpenter wrote:
> There is a cut and paste bug so this code was returning the wrong
> variable.  It should have been "ddata->hold_boot_rst" instead of
> "ddata->rst".
> 
> Fixes: de598695a2ad ("remoteproc: stm32: Allow hold boot management by the SCMI reset controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 0e322697d210..a7457777aae4 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -755,7 +755,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	ddata->hold_boot_rst = devm_reset_control_get_optional(dev, "hold_boot");
>  	if (IS_ERR(ddata->hold_boot_rst))
> -		return dev_err_probe(dev, PTR_ERR(ddata->rst),
> +		return dev_err_probe(dev, PTR_ERR(ddata->hold_boot_rst),
>  				     "failed to get hold_boot reset\n");

I have applied this patch.

Thanks,
Mathieu

>  
>  	if (!ddata->hold_boot_rst && IS_ENABLED(CONFIG_HAVE_ARM_SMCCC)) {
> -- 
> 2.39.2
> 
