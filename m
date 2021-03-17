Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569F5C433DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Mar 2021 17:47:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 247A764F0C
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Mar 2021 17:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhCQRrJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 Mar 2021 13:47:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39099 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230045AbhCQRrA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Mar 2021 13:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616003220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qaX90kJ0jKMhI8jGOsNhOtE/1We2a/DpzYlW58HcaFM=;
        b=G2AigI+AWcsJXa4v/e7vXlytwVvL+FyOCWy2u1zNJl2uh3uAGlrzsiCfziuVAcZsHeOaTT
        FouDVeqjKcCj+rVjE+HOR8wIK28rBmpm6XDelbG6GabyblbshMEtX46aHhtSIZgX+jGE7m
        C8P837u5OYBu4sQ6AddSS/ls/x0cCVY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-XQUCO-0JOFi3MRo4r6SaNw-1; Wed, 17 Mar 2021 13:46:56 -0400
X-MC-Unique: XQUCO-0JOFi3MRo4r6SaNw-1
Received: by mail-ej1-f71.google.com with SMTP id kx22so7487817ejc.17
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Mar 2021 10:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qaX90kJ0jKMhI8jGOsNhOtE/1We2a/DpzYlW58HcaFM=;
        b=SdhPtFZ4IHaJYXUmCv6aAYvjOeoygeY7p1tqa26v+zQkxvEpxNg6z5TNqYz9xUNOF5
         zaJHKUSNYB5wuvvNny9a40iRWJ3tVFFLx4f7G0rgYdafxClYHAzn79yfSDz11AlIht/O
         lKGqCkrl0Cg70Cq4gCJu0qadUptRPKh2rpqstG2/1q5CwR8cRz+FqMf77auU6NinWFwf
         M1EKj448wiPM9/tWsesWH8qzNgqC99mU91D/FzRslpNwL7+QE0AaLaKx+GW/3JavLkhq
         bGLXIST1Ewa0GZlfoA3dZ+u60yWDXuyBYDEAhnm5Uj+U6RlKW4a6SjPrDFHq34H8qjRB
         Ifrg==
X-Gm-Message-State: AOAM532giROnX9Ri8e/w/ds+92NQlSgk6UJHTnOOPuXVqf/IxJe4aE5y
        aESZUOC0dqA/C+lofTGfh98EtdFmgecQvi0zFZje+jWHzFrZK6b7DY6wcNlXQMPPOUz7kPG0EZl
        2+M3zeIfLiS7VtQOG0iANeDtHty5L
X-Received: by 2002:aa7:d7da:: with SMTP id e26mr44093967eds.269.1616003214886;
        Wed, 17 Mar 2021 10:46:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5fR7gox4NLViF6kYrZbBcrTsaJtgoP+kGkrzH7XkQsNjoaMKtFr9yuY/Tt4gUhbwt903FLQ==
X-Received: by 2002:aa7:d7da:: with SMTP id e26mr44093952eds.269.1616003214777;
        Wed, 17 Mar 2021 10:46:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a26sm14392972edm.15.2021.03.17.10.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 10:46:54 -0700 (PDT)
Subject: Re: [PATCH -next] platform/surface: aggregator_registry: Make symbol
 'ssam_base_hub_group' static
To:     'Wei Yongjun <weiyongjun1@huawei.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210309131500.1885772-1-weiyongjun1@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <efe7b835-b03e-e945-f164-219d0b5e1147@redhat.com>
Date:   Wed, 17 Mar 2021 18:46:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309131500.1885772-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 3/9/21 2:15 PM, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/platform/surface/surface_aggregator_registry.c:355:30: warning:
>  symbol 'ssam_base_hub_group' was not declared. Should it be static?
> 
> This symbol is not used outside of surface_aggregator_registry.c, so this
> commit marks it static.
> 
> Fixes: 797e78564634 ("platform/surface: aggregator_registry: Add base device hub")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  .../platform/surface/surface_aggregator_registry.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index cdb4a95af3e8..86cff5fce3cd 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -352,7 +352,7 @@ static struct attribute *ssam_base_hub_attrs[] = {
>  	NULL,
>  };
>  
> -const struct attribute_group ssam_base_hub_group = {
> +static const struct attribute_group ssam_base_hub_group = {
>  	.attrs = ssam_base_hub_attrs,
>  };
>  
> 

