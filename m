Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CAFC48BE8
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 13:36:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 880EC613EE
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 13:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbhFRNic (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Jun 2021 09:38:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52875 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234088AbhFRNiV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Jun 2021 09:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624023371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dwAv77AeNlMLDZyLBksUycGFC3fX4Q/aI+Elu1Kw5xU=;
        b=OEX/ddlkvtRb1UP6hGDbozHev4F6Ngg/v7TbTCbnhKf9Wh2nAvgWOOjydkOuHRlew4DaQB
        b3jm3c2OwykwbheZKg/kQT+/orv3SG7RcH1gweA7klYb0PVGS1IgHFI3DezC4nz17mhPC+
        IPdY0svIJpo72sHaqOTc/qwezhX8tHI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-j22axUq-PeCdU_bubSum9w-1; Fri, 18 Jun 2021 09:36:10 -0400
X-MC-Unique: j22axUq-PeCdU_bubSum9w-1
Received: by mail-ej1-f72.google.com with SMTP id mh17-20020a170906eb91b0290477da799023so3296758ejb.1
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jun 2021 06:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dwAv77AeNlMLDZyLBksUycGFC3fX4Q/aI+Elu1Kw5xU=;
        b=XYyRwQnLK+4e1RqbweTENYPBHnzxE5GrxAOawEJBsWd0sPQQQ9Y15th0PYY18++wjv
         6z1RP1hq68RtYFvmVlm9IwVCrL08FI4oivBlTnPjYWT6y47+AC0X3dOXEGS6rICO23pa
         NyDVl0o1CD0Mh7KFshAjaUKOzlvXIJvIM79vIadTFtDPL1ahuITs4Bqdo2eymuAjxGPL
         nGf1bkyAiG6Ss2pWpNLugjAjSozbeayXGy1ZMBVaCYTxU4XKXRDwK+6KqEQiGfjXpSe+
         eSmTNzZe3OWgsE8RdF9JnEIWfWJNx2PmML+phBcRdfZApoRf875uYoY4MG9bThCwXZea
         1xfw==
X-Gm-Message-State: AOAM532yIbiniGYMzhx2jW7JKlNfJVaGt0VHGRG+zkqp3G6+Sh5i6lhk
        8WaLytYJZA3hBbLRntMFVwrPro1IakPgRwX8PI11CcGuCz3FPpTswSjm59SEi5R+D6Nb7msRdos
        v2zQ37O8WMp48mDtk2z/sR4r9xZp0
X-Received: by 2002:a17:906:1704:: with SMTP id c4mr11309288eje.182.1624023369338;
        Fri, 18 Jun 2021 06:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR91c6OPYoDNV+ixeXoAS0a4lEBGMZghoM8VLy/9noopvEnzhrLCC5z06NQNHkpEdJHuzVDQ==
X-Received: by 2002:a17:906:1704:: with SMTP id c4mr11309273eje.182.1624023369190;
        Fri, 18 Jun 2021 06:36:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e12sm1047791ejk.99.2021.06.18.06.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 06:36:08 -0700 (PDT)
Subject: Re: [PATCH] power: supply: axp288_fuel_gauge: remove redundant
 continue statement
To:     Colin King <colin.king@canonical.com>,
        Sebastian Reichel <sre@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-pm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210618092924.99722-1-colin.king@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9d482c54-f578-5afb-9661-dbb658471b5d@redhat.com>
Date:   Fri, 18 Jun 2021 15:36:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618092924.99722-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 6/18/21 11:29 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The continue statement at the end of a for-loop has no effect,
> invert the if expression and remove the continue.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/power/supply/axp288_fuel_gauge.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/power/supply/axp288_fuel_gauge.c b/drivers/power/supply/axp288_fuel_gauge.c
> index 39e16ecb7638..20e63609ab47 100644
> --- a/drivers/power/supply/axp288_fuel_gauge.c
> +++ b/drivers/power/supply/axp288_fuel_gauge.c
> @@ -142,9 +142,7 @@ static int fuel_gauge_reg_readb(struct axp288_fg_info *info, int reg)
>  
>  	for (i = 0; i < NR_RETRY_CNT; i++) {
>  		ret = regmap_read(info->regmap, reg, &val);
> -		if (ret == -EBUSY)
> -			continue;
> -		else
> +		if (ret != -EBUSY)
>  			break;
>  	}

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

