Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2724C433E0
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Mar 2021 14:53:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C0176197F
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Mar 2021 14:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCVOxF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 Mar 2021 10:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbhCVOwa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Mar 2021 10:52:30 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA897C061762
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Mar 2021 07:52:29 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u9so21753561ejj.7
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Mar 2021 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=t3gPxllU5mvJHQrjHbauoFIiAOe+NDL6oN+LzAey6V8=;
        b=sjH9p+UuSallMkR4SpRTUbjft+fsLuUDwA1MjkXbCf5CN9AqHlCh6caKVntYKdIWkk
         1JRFp8EjExBnVR4TKkEBU0eY+LPWQd5YIDQ7/5WmEd0/dm4DgPrqaDckcinVxBgx3F/T
         jOdEYRBf6scpxx/kSha1gWNtwYewyMmhWOeVLllmI5ypBi3wpVv1RSxFfrht8rNCakVa
         ZNwM4gmVL+iVl5XT2QAGChnt87ciDMZOkNVou4V0ZepvUJIv+l6tZsnfqp7H2/9uyl32
         MGtpPMME6cvvZlXQSgvQGrlu7RpdWfoqBxPIUKTFmdNqrSsyL/evmANbntb5rnTH6SfA
         HDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=t3gPxllU5mvJHQrjHbauoFIiAOe+NDL6oN+LzAey6V8=;
        b=gZzp1tDXOEa9obTZKoXnfkYcPZD85XK0dI1tU/j1rhiXeHnceKyM3d9loTXfBSi6lV
         0CEsF+IEPX1hnFq6+XVaHn84BjGH6u7oM6z9TNRp8wa9kf/GpEWOYYXjISazduJ+wbk8
         ZRBSCWfeJbfAcOBgKBlznK10Bc4RQmUJl6l2yXitLRccpoOTC/II9TIwr8YrWVUHAafI
         pO6ChoN0BuZL1tnWWOjDgVrjGs4hEK11sSSyEgZD3/QWm4DeoEPp51HEgJlnSsaRO0X0
         GqBYyqanSIkuxnarfYFvWtuR50n7qeJxu7bWl8eJiZpWQCnUgg5MrlQFManZe7FYC0dQ
         cf/w==
X-Gm-Message-State: AOAM533vnuBrlo0bi9BXTR7pnc4Gfp+K87X3quWfOvRDcwHr9IGHzq1G
        gm45zTbrsKrxqiaNSdNAu/ggRg==
X-Google-Smtp-Source: ABdhPJwKLjll+CJ3xCqUU+yWGptTPOZKXWCKcZgONpfprHFHNe+nB5P+Yyi5QKdRXZPlJj0vOu/JGg==
X-Received: by 2002:a17:906:9509:: with SMTP id u9mr108444ejx.225.1616424748490;
        Mon, 22 Mar 2021 07:52:28 -0700 (PDT)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id v15sm11450545edw.28.2021.03.22.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 07:52:28 -0700 (PDT)
Date:   Mon, 22 Mar 2021 14:52:26 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] mfd: Make symbol 'atc260x_i2c_of_match' static
Message-ID: <20210322145226.GX2916463@dell>
References: <20210311131507.1902008-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210311131507.1902008-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 11 Mar 2021, 'Wei Yongjun wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/mfd/atc260x-i2c.c:45:27: warning:
>  symbol 'atc260x_i2c_of_match' was not declared. Should it be static?
> 
> This symbol is not used outside of atc260x-i2c.c, so this
> commit marks it static.
> 
> Fixes: f7cb7fe34db9 ("mfd: Add MFD driver for ATC260x PMICs")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mfd/atc260x-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
