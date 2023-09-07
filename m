Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F80EC8745
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 16:43:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjIGQnQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242439AbjIGQmY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 12:42:24 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BA2210B
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Sep 2023 09:41:03 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31c7912416bso1250926f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Sep 2023 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694104798; x=1694709598; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AfBRtUznKahZ3dwZyCgaTKUpdQMQZ0q3hwDeizi9iw8=;
        b=tYXtUwB1N6uOxKPJfaRapwNRzWgXtUiYSQx2LpNtLaMyYabYK1vateG+2CFMRJQvit
         HlzrOxUYxgdz2yrSqlk+zeaBsRr41gYxiIGf32hZD9yfaLCM2CE742rUbGiodOCqA7VJ
         Yr6JxZLE+1Ymt9mnIm3fo6YyGEYwK0LltfYRoJyrkZS8/2gFmWrEehgRb3EezpSeXmd7
         u/WahGHgl4jn7iPg3smaD6xbZLHbjU/IsWGap2Wcajd8fvgQruFsy+KZXuXjFEzNNAI9
         4zBsFcs+WcN2a1IfXhq8h3fLQluOtdlPi+jd2RdqjHn1+lSNivnHdTNR3CRuBSiP+Ylp
         mzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104798; x=1694709598;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AfBRtUznKahZ3dwZyCgaTKUpdQMQZ0q3hwDeizi9iw8=;
        b=QF4I0WV0unl/KHLb2T1wX4UYpYasRiU8tiGyiA2DF+UjOK5FeosUnAUa7dex58H5PW
         bwcAG060Ui+yiazYsC9o8UI62ydC8vIqHk9Lj5grHQPjskeB/ui2z1o6gvGD76yz7s2x
         ynHcLLjxDTvUAID6Pxl60YAWBDQxNZiAd5hv7zN2AyZtuVM/hDT4HtfJsaGfowzQN4Vm
         ANvDHYz+IzgFeB4aZYdvbszsA8PR9BTZKl8RxUAuy4G9DSwLhbwSFtHeahZ/K3MrXShr
         jnVxsCnmZaXpstSDF0O+Z9J9Z4idFDhUP2vuTWmuulXqZYKigfW+/DXmyeUXGHSrJ4dC
         G7xQ==
X-Gm-Message-State: AOJu0Yx8VpsH5hhsZAqMvQfISP8F4K/iRFDx/lzZI/WD4BFOIA+yIqcv
        VKJux0MSVQ9C+a7FpaIqC2FDm55pxF9W4XwDlMU=
X-Google-Smtp-Source: AGHT+IFN1DVLDmj0KO6926C82lwOVs09adWFw1TE8GqB7efKq4l0BjednSUngORngfvmRmj6+fehVg==
X-Received: by 2002:a5d:51d1:0:b0:317:6470:3271 with SMTP id n17-20020a5d51d1000000b0031764703271mr4725013wrv.45.1694083787100;
        Thu, 07 Sep 2023 03:49:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b003fef3180e7asm2143464wmi.44.2023.09.07.03.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 03:49:46 -0700 (PDT)
Date:   Thu, 7 Sep 2023 13:49:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] driver base: slience unused warning
Message-ID: <3b710f6d-05cf-49d5-b004-849ee2a3ca42@kadam.mountain>
References: <20230831073654.1713710-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230831073654.1713710-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 31, 2023 at 03:36:55PM +0800, Su Hui wrote:
> Avoid unused warning with gcc and W=1 option.
> 
> drivers/base/module.c:36:6: error:
> variable ‘no_warn’ set but not used [-Werror=unused-but-set-variable]
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/base/module.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/module.c b/drivers/base/module.c
> index 46ad4d636731..10494336d601 100644
> --- a/drivers/base/module.c
> +++ b/drivers/base/module.c
> @@ -33,7 +33,7 @@ static void module_create_drivers_dir(struct module_kobject *mk)
>  void module_add_driver(struct module *mod, struct device_driver *drv)
>  {
>  	char *driver_name;
> -	int no_warn;
> +	int __maybe_unused no_warn;

Just delete the variable if it isn't used.

regards,
dan carpenter

