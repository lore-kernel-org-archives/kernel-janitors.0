Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F97BC432BE
	for <kernel-janitors@archiver.kernel.org>; Mon, 30 Aug 2021 08:13:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4A7961004
	for <kernel-janitors@archiver.kernel.org>; Mon, 30 Aug 2021 08:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234591AbhH3IOl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 30 Aug 2021 04:14:41 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52588
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234166AbhH3IOl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 30 Aug 2021 04:14:41 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 77A873F046
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Aug 2021 08:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630311226;
        bh=eSx3NUMPq83UK+z5+YBa3OObfzdkGkOX4S8bufFEz/Y=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=uEs3c3XaIrWd7WC+tPWJ45z5sYhMy6uLbBtZDqircY0A8aflGyqix0UpTy55CNbpj
         45aX2Ss+RfrlYxXgnNQbrZ1Kn0QFcD74PwEQ10iuFkhD7b8p131hd2pDTeYF42+n2r
         rZ4m3SCR+pn362X/UCMAyPOzTslhAWtLSkbu0WE64R9Dmk5JJPCZBherh2an5phK0+
         FJg4cEwsQ6cyI2bUpczr3/RIO+5LrHvcTjPYYB2ZeHuBS8NikYUFA9/zWeyqQ/Eii9
         Ym6wl+FmlHwKQuksD39x/M2nx1poWX8kqxR7ECN5kzGeMSUBpj/BRDlRqgoYRgqktj
         Q5lgI9kV8NGwQ==
Received: by mail-wm1-f70.google.com with SMTP id u14-20020a7bcb0e0000b0290248831d46e4so4248557wmj.6
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Aug 2021 01:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eSx3NUMPq83UK+z5+YBa3OObfzdkGkOX4S8bufFEz/Y=;
        b=P4OQ6VZM5ARco82VvhkMDtd5TzwRTCbutv0vFbENJIMvhwVOW+zqkDCIsPRbdAA/av
         3+c0ahNZzHlep3+XooZwBc0Kn401IUdIObSHlf6OUaATvT11wImTMTbF2Nynq8eApWq/
         mx8WN+iP7brd8A1WKME+8NPudmu23ybve3IEz2uze7kTtDIYjacuZUvXzyDaCguYf6Bl
         KK2TpdL9Uq0r0ZNJrgtRwiPs1fKvzOjMpgg6+3RjEcr4en56fC5l3Q2/aRzy0ZKeyrEO
         2fuTw+qX7yb0p6gkPzRDpL9RodF4/Kd5PE5xPbSlv6DF3DEvmEr/C9dird3ect5kpX6S
         3IRg==
X-Gm-Message-State: AOAM5303ospTkrHoufi9Xw8deveS9+iOt2bHKOaupmH3hlnELpPwWZw4
        CsPBftxPQQFt2DNrWsH0uQ9uTqc8+HU1JyoRQPR1xqs/u2CzFu6derd8xa6+bkr0Zn1nOWXtN+K
        PCY/xeEML6YnHcjmVoUFRQKJF/jwaHI6M65Jr3iXUUTmu0g==
X-Received: by 2002:a05:600c:428a:: with SMTP id v10mr31271896wmc.25.1630311223532;
        Mon, 30 Aug 2021 01:13:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6olxhDfz1lLDwfzLkp8OUNUr1AoxOLKW23LNJzBGbO3TIlKX5j+QsdumWOsvWLwaJ3ofS5Q==
X-Received: by 2002:a05:600c:428a:: with SMTP id v10mr31271886wmc.25.1630311223430;
        Mon, 30 Aug 2021 01:13:43 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.112.211])
        by smtp.gmail.com with ESMTPSA id l1sm12582917wrb.15.2021.08.30.01.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 01:13:43 -0700 (PDT)
Subject: Re: [PATCH] ASoC: samsung: s3c24xx_simtec: fix spelling mistake
 "devicec" -> "device"
To:     Colin King <colin.king@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210827185003.507006-1-colin.king@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <db203d28-5a90-401a-962a-aaebae5b6cb2@canonical.com>
Date:   Mon, 30 Aug 2021 10:13:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827185003.507006-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 27/08/2021 20:50, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/soc/samsung/s3c24xx_simtec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
