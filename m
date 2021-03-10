Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C4BC43142
	for <kernel-janitors@archiver.kernel.org>; Wed, 10 Mar 2021 09:07:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D57E64FEF
	for <kernel-janitors@archiver.kernel.org>; Wed, 10 Mar 2021 09:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbhCJJGj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 10 Mar 2021 04:06:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbhCJJGE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 10 Mar 2021 04:06:04 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D48C061760
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Mar 2021 01:06:03 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id 7so22390161wrz.0
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Mar 2021 01:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=N4vbXKs7ZJbURzN9BaHYH0I2x/dDDM0xoa3qDCuTQqo=;
        b=E0tggtbIxTWhE0nsjKYhrt9luo08Fu7dmvgy6pT5VOfL4YwxRwArp7itkVIypzv7zM
         wPlLSy2A2W1XKdI5fnwXtABzJFnd8lyDSABUZcG3UgB5O3d7WWhURQ/ckKFkV/6VW8w6
         HTSomeWphrGlKOp/VYxIPe2a+U/ni2iGYdxF9Gh7Q8tjT5pSUrpT0UgXEMEqm4dLabqD
         NUoaESbv1Xg7qyWcxmFUFEdqMg/MVv6EzZ9K4N1wkIjs9Kt8bHAoX9R86Zs42U/fI72b
         rEtQT9dW8HZCCOhHAG6Lkd4wR4J1s0o4eXfFVHix1rSU3hGRO4OeUr67wuudjq6QCHpj
         srOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=N4vbXKs7ZJbURzN9BaHYH0I2x/dDDM0xoa3qDCuTQqo=;
        b=SLTkaW4wZWvCbsTO1+oLDTiA2BFsSJifXOdsQKyJB05IH/WPZjvFOmV21OpMuZ8BDW
         532TX8gjV0ucx1fGo3uw1VYK8EEjq2/x0u9oywZgRLhs567uzYXRST+by18wHXjdhTVR
         hckE4/50RmAR9GHVjKJpQ1whSNGiM2nZMzPkJprWQHIxOPfi0S7GHTCE9LAS+UTvYlYp
         N12LEXQN0lsYdnIZ6EEY5ac2gV4GQUJ4qwX8FmFNDQdWVfjVQQiKBlMWCbyKcW+kMSUB
         bfiCCGcGwW+W7xKjsY2EP3LpfMDmV02Ay6Utglury4oyQfDHWS+WpCT/G9SaOa76hzOo
         2tUg==
X-Gm-Message-State: AOAM533AhTr3E3yiL5nf5zOR/gFiTH/wwPRR1h0t0gA4RBb8rmSxfP9i
        mB0wMviWXPH7SF6AXsvbazOCIA==
X-Google-Smtp-Source: ABdhPJyfbU3j4FXTIzXwazFxh47rBt96RubkMP+WEmnJEr/EeESzflGVfZu8RZd3rGoxoUNH30vJhg==
X-Received: by 2002:adf:b313:: with SMTP id j19mr2348335wrd.188.1615367162112;
        Wed, 10 Mar 2021 01:06:02 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id s3sm1950721wmd.21.2021.03.10.01.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 01:06:01 -0800 (PST)
Date:   Wed, 10 Mar 2021 09:05:59 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next RESEND] mfd: ene-kb3930: Make symbol
 'kb3930_power_off' static
Message-ID: <20210310090559.GI4931@dell>
References: <20210308123147.2340998-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210308123147.2340998-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 08 Mar 2021, 'Wei Yongjun wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/mfd/ene-kb3930.c:36:15: warning:
>  symbol 'kb3930_power_off' was not declared. Should it be static?
> 
> This symbol is not used outside of ene-kb3930.c, so this
> commit marks it static.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Acked-by: Lubomir Rintel <lkundrak@v3.sk>

This should have been a Reviewed-by.

> ---
>  drivers/mfd/ene-kb3930.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
