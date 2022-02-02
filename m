Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC1BC433F5
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Feb 2022 12:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344192AbiBBMqA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Feb 2022 07:46:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59498 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232095AbiBBMp7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Feb 2022 07:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643805959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L2MgpqkUcQy8xm2YEczHn5aMWVUVny42CQPa38ApqUo=;
        b=VBp3nBumZQG3y5BnoX/TJeVgV7ojZEiJgWPQPteEpPQVGeGJpsTEWoFLOEYg+/YRSJb25B
        uT4fp4fwhpqVFKc0VJ6jH2Vdn9buQqmTfO8q73JFUutQNEKZakt5g1suy51cpc6k/2k/Ey
        VBfXchn/8ijykm0+MXT5760YX9VhlEE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-TPplXN3bPF-owhJEfhUM8Q-1; Wed, 02 Feb 2022 07:45:58 -0500
X-MC-Unique: TPplXN3bPF-owhJEfhUM8Q-1
Received: by mail-ed1-f70.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso10318674edt.20
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Feb 2022 04:45:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=L2MgpqkUcQy8xm2YEczHn5aMWVUVny42CQPa38ApqUo=;
        b=ECEqDRAvYvfn5t65j/qY24qXDolWXzDIXInReWDZx3o8qZBCWWeraOxqjTT/wBzJQP
         XcQeYH4LPKZuvcWVZweoITkunp+lL287DOUxllYBKApqSTnhSA7fzTRZyimy0CTxavaB
         q8oYtbyEpDczWtNCKM8KQj55tBf3Cgakay40xKQ9aXVq/xQSdeVFH7cyDZAWNZmnhuQ3
         xNT5vUp46GWNYAVTndp7WV7lbj+uwObuTeWLeUu0g2FlM5KybwoiD+PPbjtLMiusIVJm
         058xhHsihZ4aZ9+aAFWH6wtPOtJU143xeKGWze1/GF4JCDB2SCjpYFMINNkePxCzjSzR
         J30Q==
X-Gm-Message-State: AOAM533yq2lUioSdgUrcDoTg9hiJml8uzfRLEQZn0Ls05MRUtxVemQI4
        DYDB6Au9gy3cqqgY+nbl+HJcdFFLhCD2mNKqCe5v34TUOUr3Nwovz6/BB8z6XiK8T1uNuLWfZfu
        efvpRpQedOG0aO9DQN6+Jeyt/ZOwu
X-Received: by 2002:a05:6402:698:: with SMTP id f24mr30447149edy.159.1643805957168;
        Wed, 02 Feb 2022 04:45:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0BOt5vFNLNoU+2m3VvI1dwFENKVK9kPv+3YXwZ4YNAFwj6bqDiewZqYzq9PKmLgXw0q43hA==
X-Received: by 2002:a05:6402:698:: with SMTP id f24mr30447139edy.159.1643805957039;
        Wed, 02 Feb 2022 04:45:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id q6sm15775628ejx.113.2022.02.02.04.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 04:45:56 -0800 (PST)
Message-ID: <8386b5bf-46bd-5927-9119-cdf77e1df082@redhat.com>
Date:   Wed, 2 Feb 2022 13:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH][next] power: supply: axp288_fuel_gauge: Fix spelling
 mistake "resisitor" -> "resistor"
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-pm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220202091246.580091-1-colin.i.king@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220202091246.580091-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 2/2/22 10:12, Colin Ian King wrote:
> There is a spelling mistake in a MODULE_PARM_DESC description. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Oops my bad, patch looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/power/supply/axp288_fuel_gauge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/supply/axp288_fuel_gauge.c b/drivers/power/supply/axp288_fuel_gauge.c
> index dcedbc59732d..13be2c1d6528 100644
> --- a/drivers/power/supply/axp288_fuel_gauge.c
> +++ b/drivers/power/supply/axp288_fuel_gauge.c
> @@ -91,7 +91,7 @@
>  
>  static bool no_current_sense_res;
>  module_param(no_current_sense_res, bool, 0444);
> -MODULE_PARM_DESC(no_current_sense_res, "No (or broken) current sense resisitor");
> +MODULE_PARM_DESC(no_current_sense_res, "No (or broken) current sense resistor");
>  
>  enum {
>  	QWBTU_IRQ = 0,
> 

