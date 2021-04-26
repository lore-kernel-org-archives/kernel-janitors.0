Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597A4C43461
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Apr 2021 18:03:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B66C613BB
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Apr 2021 18:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbhDZSEi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Apr 2021 14:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234466AbhDZSEX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Apr 2021 14:04:23 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12C1C061756
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Apr 2021 11:03:41 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id a22-20020a05600c2256b0290142870824e9so1090933wmm.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Apr 2021 11:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z9wgVVjDAXXSJE2ca33a8jal0v2yahV0C8O37SZcpvQ=;
        b=pFmvfHUw2Xc6IYETlM2LNNtATPOTQ7qOqODeMSW5rpBgjncMHgqe6irSOKEOei9ueF
         8Fg0qy8zm0/2CZeZRz3bPZuNX4PtQZmWvgm2YXiJHd04qhm0nB7gZmZKmjqkhYGK1A+8
         qaA40+XWCDSzNyo3lWRkGVmM5NW8sM/46hVfe3VDrmQkztlWr/gLFmWYkcz6fxRSqlK1
         nk6Xmahbo1ODPRDT3+DUgHsPaPiKMfDQDjVKHjfKghPWBijfyLPPpNN0oFZHKBzVj3Ch
         gAgQlhllqE4dhpHOX/WKq8jycyAfJT1bpXlbw+26SpZuCIhG8KHV0Kpb+nV74Cqbys+7
         /Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=z9wgVVjDAXXSJE2ca33a8jal0v2yahV0C8O37SZcpvQ=;
        b=cwB0bi0TVQWKcRHv5nFSdN9NrOzE/ZbMaYk1WAtTneEtoJQR+AtoLxMZ2zSbRLV1V3
         bdogknXFTiDSj9q3T8aQszxutaJMwhrTzc82LA7GBUHfj2rwGfEDywOwM5jYS3ABe9gD
         GaF+HYrP40U4zHEycaQw6DeTu8dp6YfxjVdYMkNuUCXNLb00a79qe5ISbacDlqkG2Xa7
         Wvv6mikrclb3VBGEhg3bJvwciQer5tFMXmhlV+bvz0PLxcadVxyhaXd0cQR8tDJjluXk
         SwRA5JWi5WXD9edTStICBJvKSQNDg8mco7qBEeW6yqGSEQh9XJbkjzXC4kPao0bYCMWt
         hdBQ==
X-Gm-Message-State: AOAM531UIWBMzeag+Po9JyFdpUyRunRhZxTOuefo2Zma74xcUPF3KRtu
        3OG/3u80Vw9Q4UAgAR/32JsQ/g==
X-Google-Smtp-Source: ABdhPJxJp+6XWXivaWJQgtNlleCFdrEv8YRWrei4fRGW/lK200EqgUguXQtGmn4s4C0b2JUb8aewUA==
X-Received: by 2002:a05:600c:2148:: with SMTP id v8mr236741wml.167.1619460220445;
        Mon, 26 Apr 2021 11:03:40 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b76e:7362:77c0:ddc3? ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
        by smtp.gmail.com with ESMTPSA id l9sm1096913wrz.7.2021.04.26.11.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 11:03:38 -0700 (PDT)
Subject: Re: [PATCH] staging: media/meson: remove redundant dev_err call
To:     Muhammad Usama Anjum <musamaanjum@gmail.com>, hverkuil@xs4all.nl,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" 
        <linux-media@vger.kernel.org>,
        "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" 
        <linux-amlogic@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        "moderated list:ARM/Amlogic Meson SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com
References: <20210407160921.GA1504294@LEGION>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3fac78c4-189f-57cb-ca81-a97c918e2386@baylibre.com>
Date:   Mon, 26 Apr 2021 20:03:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407160921.GA1504294@LEGION>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 07/04/2021 18:09, Muhammad Usama Anjum wrote:
> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.
> 
> Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/vdec.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 5d4db7a5b4b5..e51d69c4729d 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -1008,17 +1008,13 @@ static int vdec_probe(struct platform_device *pdev)
>  
>  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
>  	core->dos_base = devm_ioremap_resource(dev, r);
> -	if (IS_ERR(core->dos_base)) {
> -		dev_err(dev, "Couldn't remap DOS memory\n");
> +	if (IS_ERR(core->dos_base))
>  		return PTR_ERR(core->dos_base);
> -	}
>  
>  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
>  	core->esparser_base = devm_ioremap_resource(dev, r);
> -	if (IS_ERR(core->esparser_base)) {
> -		dev_err(dev, "Couldn't remap ESPARSER memory\n");
> +	if (IS_ERR(core->esparser_base))
>  		return PTR_ERR(core->esparser_base);
> -	}
>  
>  	core->regmap_ao =
>  		syscon_regmap_lookup_by_phandle(dev->of_node,
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
