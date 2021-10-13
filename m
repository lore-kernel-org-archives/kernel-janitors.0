Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91735C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 13 Oct 2021 11:49:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 704FD610D0
	for <kernel-janitors@archiver.kernel.org>; Wed, 13 Oct 2021 11:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbhJMLv3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 13 Oct 2021 07:51:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56030 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229535AbhJMLv2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Oct 2021 07:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634125765;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eJjX6iP5jQlCHxnRLEuZ4AA4AtdWwT375BFtLCNF4AE=;
        b=O3H2rzr0SJbNM3ep6YcGVFfvAFOvtwkIJjWjDey4s4m0VB6h9NuYgFQK6syJrn3IhCpxUX
        t9uaukF8jbeAsIaLQnqKJDyUuuNWX1iIkgtVuqicb3KZsc2bA+LR9z3bW4GvX12Ivr7l6y
        b7SIiIBb7eo2RWpA1cDMhRHCUI/dZB8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-B4QaC5zHN9i-XHBCivhjYA-1; Wed, 13 Oct 2021 07:49:21 -0400
X-MC-Unique: B4QaC5zHN9i-XHBCivhjYA-1
Received: by mail-ed1-f71.google.com with SMTP id c30-20020a50f61e000000b003daf3955d5aso1997271edn.4
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Oct 2021 04:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eJjX6iP5jQlCHxnRLEuZ4AA4AtdWwT375BFtLCNF4AE=;
        b=x/EewWEu4TPOCerIkzDWIq38Oy9jS5L8XW91VQscS3TC0mQZ3HF4x/XD5A8yH84Vgs
         77kpxB/FHzITk8BjiHrOiVy1lfCGUUWF/+x1hOmAFI84A1uay0fOCUKWll0vU8k33wid
         DtMohSZMtVaCzeo1s9ghurq18Rrqh3VH6/EMGiO4Vj1CkOvHF9Gn4EztfQe8fNGjX8QL
         bz8yk79KrCSoCQ2W1Q5QElfteZoHY8iqO+4d94cFc/5tzqZwi7md03011Wii+7dsI+2a
         1R8kBtIjb6/72vH/ITB4Y4WQOlL98abuhM8oWAtJ1YRnd70ubYZvZOPzkigxuihOB4Zm
         lFjA==
X-Gm-Message-State: AOAM5309QQfku6MYTbBL6EwZEQ7IoOP8kDsKKNpLtjrgzy/UEtgGenmq
        eSREaihNxfCQhLuwYDfHQGGNgdE4rlR+wGBxyabpplyIT9Jtc4VhHJSHaNCkfRWvAECZggg+9E9
        5hh0F0VIqH7WeBettReZOPQTiYHbe
X-Received: by 2002:a17:906:7ac9:: with SMTP id k9mr18502109ejo.411.1634125760828;
        Wed, 13 Oct 2021 04:49:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZvpsePPQnw9IhyB+5gS1lX/EreOcYLH7NI6W+AjHXoDk1vgsss7IWIJ/DRWo5XsSsfEGzFg==
X-Received: by 2002:a17:906:7ac9:: with SMTP id k9mr18502094ejo.411.1634125760635;
        Wed, 13 Oct 2021 04:49:20 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ke24sm6427207ejc.73.2021.10.13.04.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 04:49:20 -0700 (PDT)
Subject: Re: [PATCH -next] power: supply: axp288_charger: Fix missing
 mutex_init()
To:     Wei Yongjun <weiyongjun1@huawei.com>, Kate Hsuan <hpa@redhat.com>,
        Sebastian Reichel <sre@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20211013093115.2841167-1-weiyongjun1@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d3690325-9d55-607b-cf51-048f634ef7b5@redhat.com>
Date:   Wed, 13 Oct 2021 13:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013093115.2841167-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 10/13/21 11:31 AM, Wei Yongjun wrote:
> The driver allocates the mutex but not initialize it.
> Use mutex_init() on it to initialize it correctly.
> 
> Fixes: ed229454856e ("power: supply: axp288-charger: Optimize register reading method")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks, patch looks good to me
(I should have catched this myself during review...) :

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/power/supply/axp288_charger.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/power/supply/axp288_charger.c b/drivers/power/supply/axp288_charger.c
> index fd4983c98fd9..9987b1731e38 100644
> --- a/drivers/power/supply/axp288_charger.c
> +++ b/drivers/power/supply/axp288_charger.c
> @@ -865,6 +865,7 @@ static int axp288_charger_probe(struct platform_device *pdev)
>  	if (!info)
>  		return -ENOMEM;
>  
> +	mutex_init(&info->lock);
>  	info->pdev = pdev;
>  	info->regmap = axp20x->regmap;
>  	info->regmap_irqc = axp20x->regmap_irqc;
> 

