Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51811C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 13:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1949C613EE
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 13:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbhEJNdE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 09:33:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43294 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244345AbhEJMT5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 08:19:57 -0400
Received: from mail-qk1-f199.google.com ([209.85.222.199])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lg4s8-00039P-92
        for kernel-janitors@vger.kernel.org; Mon, 10 May 2021 12:18:52 +0000
Received: by mail-qk1-f199.google.com with SMTP id p133-20020a37428b0000b02902de31dd8da3so11484379qka.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 May 2021 05:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qw2xIhE1YQPqR0OG1inwWyXnTht9gARQqIiYkO8Zeek=;
        b=ntLcDQeGvMc18dAKVEad83oZz/O+kGEkC6czY002fRu4e/ue4AfmzP1/IHuzz/KWG6
         rarG+MClOUbVpFW1WjEOimVIgM9B+akNHa7q8fc46ZdPLgWNo/rSuh+O9Ax3y7c1pIWQ
         1Zjm1eBgOkj1mV5/9ULrpPYAmDIhUnWpUWUXgjzI2fOfp8hoqjkst5PG4t7dUYmpRZQE
         SaNaD5KwgoLbk9p9o26M6eWWfbABXA0VkLlgWScVYTCRTnZeCPjByHSePRjxdmMlXjLo
         tQHsbvN9Z/xjedGATh6YM0yS01hRh8sze6k1fxy0pX/qZ6w/1JhLdfpSpkfssaWufdMZ
         P85w==
X-Gm-Message-State: AOAM53335ci6sKpf0UD4N26wVCt2MUcgdIplDuW4GNNFijyzSRO3nGSg
        P0Ljh5d4xZzcEwlvv8ujq6GfhoHJ/qt5jL7mneH7k6X0u7QRj3HX3P0ymkuGo9aUWitAQvriWjZ
        GI7iGw8ognwEUmGR+kufFV1EXczc5OJ1jjtr8Or+IEdYpFQ==
X-Received: by 2002:a37:61cd:: with SMTP id v196mr19056889qkb.454.1620649131209;
        Mon, 10 May 2021 05:18:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyunxzu4B8x+Dts17JtJ41BIvhjuofWIqji9fp6Sm5lxjBnUuVITR4zQbsN+I/u5NwXYtqC6Q==
X-Received: by 2002:a37:61cd:: with SMTP id v196mr19056870qkb.454.1620649131056;
        Mon, 10 May 2021 05:18:51 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.49.2])
        by smtp.gmail.com with ESMTPSA id m205sm4051312qke.2.2021.05.10.05.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 05:18:50 -0700 (PDT)
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d5250408-b899-ab1a-c86c-0366b6b286c3@canonical.com>
Date:   Mon, 10 May 2021 08:18:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 08/05/2021 01:43, Christophe JAILLET wrote:
> 'ret' is known to be an error pointer here, so it can't be 0.
> Remove this dead code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/rtc/rtc-max77686.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index d51cc12114cb..ce089ed934ad 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -764,8 +764,6 @@ static int max77686_rtc_probe(struct platform_device *pdev)
>  	if (IS_ERR(info->rtc_dev)) {
>  		ret = PTR_ERR(info->rtc_dev);
>  		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
> -		if (ret == 0)
> -			ret = -EINVAL;
>  		goto err_rtc;


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
