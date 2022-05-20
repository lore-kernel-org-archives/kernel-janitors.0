Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC215C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 May 2022 15:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237528AbiETP0b (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 May 2022 11:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350848AbiETP0L (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 May 2022 11:26:11 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6552312081
        for <kernel-janitors@vger.kernel.org>; Fri, 20 May 2022 08:26:08 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id n124-20020a1c2782000000b003972dfca96cso2744315wmn.4
        for <kernel-janitors@vger.kernel.org>; Fri, 20 May 2022 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IIqtgCzNSeqKw8j48M0jMnpUd6n4sTNC1dQh3wc63iM=;
        b=AfEwR7pD0jiCCW/0Ra5X7F+iAknaRwE2El2kpNq0r1TQLVYXYO1U5mqTfazW1BxM85
         +VVyEPU/5CDpIACcvIUJ7foobxlepMPbMy5zoAO7IhKgAHz6o7wGtckAIJyGXE7ODVaZ
         2mPd1SNBm7wVuDg1LNjXPZgluibOzeMvY7Ioxs/7S7UGdSI37HkySCA31QeSa+Q7/UYG
         hkig0XWzejvYcRbFPP1dz9rDdlyTThVpjgC1LzJFccUPXjjHZ7fIcDL5ETQR6E3dnOkj
         FdXSKlHPspNxCLQxRPcH/MisMNidn2QWmLJuFyCkWMnQdEGzJ050rxvfLu0pLoWHYCYK
         AMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IIqtgCzNSeqKw8j48M0jMnpUd6n4sTNC1dQh3wc63iM=;
        b=DIDZ86XCVLfsftBc0A3XAG8kCm2zm8y5sRm4QvztEJ9RstorOd7VWhjuzfzLthdM2j
         x4SC0uHS9K3LBz5VHHlfr5METqaJQ7+yumnF8tDgdZsuUKePuKklw0eIprKcJxSzhWly
         OWJMSPrnP7mhiukxHAtRYk5wm0po9f/9IS9K3A34+PlrppQJgLqdKa9Yg/eLuYrPpGN6
         mEHMmVi1Iw1oVJP6KgV8MppDKNt7786tu7fw/jwE0QajgZBu0ilLGsCogO0L4fK04nh1
         4lxHj3RiIwYRQrqrIt+P+j/8Vwu8iwzl20XUWSoPF975BHj+WjLGRZ36SoPbRT6266RJ
         Y2fQ==
X-Gm-Message-State: AOAM533Cfd0sWyrdAk9YzjuuipK34nKtLYAUzhhuYtahnOg2EwI4dMXG
        ASn2esLxiU4oQJGhLuybChudSg==
X-Google-Smtp-Source: ABdhPJzTQTpTppVCBw61PgXQnzBb6wQCNtBUQhcsbLYozX3ugc7CSUicW5bRgHzt3QN12dgJ3bmTcg==
X-Received: by 2002:a05:600c:1d23:b0:394:685b:c18b with SMTP id l35-20020a05600c1d2300b00394685bc18bmr9129228wms.121.1653060366523;
        Fri, 20 May 2022 08:26:06 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ed2f:f020:b8:a290:ff05:e4c4? ([2a01:e34:ed2f:f020:b8:a290:ff05:e4c4])
        by smtp.googlemail.com with ESMTPSA id o4-20020a05600c338400b00394708a3d7dsm2242616wmp.15.2022.05.20.08.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 08:26:05 -0700 (PDT)
Message-ID: <3061a9fd-5301-4d91-2d60-b85a5d4910e9@linaro.org>
Date:   Fri, 20 May 2022 17:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] thermal: k3_j72xx_bandgap: Fix array underflow in
 prep_lookup_table()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>
Cc:     Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YoetjwcOEzYEFp9b@kili>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <YoetjwcOEzYEFp9b@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 20/05/2022 17:02, Dan Carpenter wrote:
> This while loop exits with "i" set to -1 and so then it sets:

Won't it exit with 'i' set to '0' ?


> 	derived_table[-1] = derived_table[0] - 300;
> 
> There is no need for this assignment at all.  Just delete it.
> 
> Fixes: 72b3fc61c752 ("thermal: k3_j72xx_bandgap: Add the bandgap driver support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/thermal/k3_j72xx_bandgap.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/thermal/k3_j72xx_bandgap.c b/drivers/thermal/k3_j72xx_bandgap.c
> index 64e323158952..a9789b17513b 100644
> --- a/drivers/thermal/k3_j72xx_bandgap.c
> +++ b/drivers/thermal/k3_j72xx_bandgap.c
> @@ -151,8 +151,6 @@ static int prep_lookup_table(struct err_values *err_vals, int *ref_table)
>   		/* 300 milli celsius steps */
>   		while (i--)
>   			derived_table[i] = derived_table[i + 1] - 300;
> -		/* case 0 */
> -		derived_table[i] = derived_table[i + 1] - 300;
>   	}
>   
>   	/*


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
