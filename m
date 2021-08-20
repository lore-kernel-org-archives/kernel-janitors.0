Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C69C4338F
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Aug 2021 11:00:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14CF66103B
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Aug 2021 11:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237487AbhHTLBR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Aug 2021 07:01:17 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52194
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229847AbhHTLBR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Aug 2021 07:01:17 -0400
X-Greylist: delayed 504 seconds by postgrey-1.27 at vger.kernel.org; Fri, 20 Aug 2021 07:01:17 EDT
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9586C40763
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Aug 2021 10:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629456734;
        bh=bEY0tLoe24jiwQ1BBwb3ntpzUGXLwmR1QkfqwNeab5Q=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NIMqk8+hTRCl41SfiPqxypEjfwN6iwszeo7BvIK4f7272qtohKT6B2D5AFkRQOTg3
         ZGORwjQF92sypjSB2aupREJRpqyymOJaWpqv2HKeOJm0dE108bwIVvzGpHmwsv9g6R
         2ZqN9agHeswTUZdb8ucs9OHuFkJNxWkB1pHikAzZAjWR8Vy+uQNYHGBGgxspUPtiEz
         Vkj7gXtPxBHHX/MgKMtbZu4+SRfqnGldYZAoMLCgfndBXKtdaz3umTRku51yIHXV6d
         fUUNaXzYTIwBwGrBo2PmPmIHLq2M4M4U3WLwUdqtLSsmlZ+IcSsO+YvpDKmH1b+ZUQ
         SVitWDqcS75Ag==
Received: by mail-ed1-f70.google.com with SMTP id bx23-20020a0564020b5700b003bf2eb11718so4328226edb.20
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Aug 2021 03:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bEY0tLoe24jiwQ1BBwb3ntpzUGXLwmR1QkfqwNeab5Q=;
        b=M8EJCmQo4cc3RmA5x2ZfqmkXURmz4E6ia5cMn3vgT9qnZgeJ6SGaK2Mgglfwicj4wV
         DeJSzlZ0VyY6XpqkGSbv12qt0rpYPCN4JE9rX3YBxXmLNyqGxWWW7AcehAMfQmyPSfVC
         /4y49hEv2BHLbzlWPgC+g/YCqFn3oe6AvhZztl6aEeDDP8xuy3MH8Xam67SDzGaw4VNX
         MDbPUdyndyMS9TkvV0LzhBWBuOH8GGWJIlrumID5VlORm5RPgVazJyKm9qdXrZcNSlqH
         urvcQHSCZF1Y6iG7SChUFpF/2FObd4BCTYKvHUKmbt77P0jQWY+Z5xm02qMctg/pTtLz
         daiw==
X-Gm-Message-State: AOAM530kRykD5k3PsjaX7roYknrEOyZk6IXeeaZmkOc3qqu93RQDXk+D
        rEEM8clKH36Qi5CPO9rK8Z7zn3b+FAUCv0LCwmZopQGn0CDb3abUdmpdsBoZgKGKkKTz/Tf9CJG
        Vxyfq0W/hwkd87eBnQlk9g03w+DbAjgensyOYl4kHANaWeg==
X-Received: by 2002:a50:99d9:: with SMTP id n25mr21936499edb.310.1629456734353;
        Fri, 20 Aug 2021 03:52:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwgHZjGv4/G3o//as9FIIt8mx7PidsjndSwA7RNnyaBmG0u7l+H7nGHvlAtxIyexightLogQ==
X-Received: by 2002:a50:99d9:: with SMTP id n25mr21936486edb.310.1629456734250;
        Fri, 20 Aug 2021 03:52:14 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id h8sm3269223edv.30.2021.08.20.03.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 03:52:13 -0700 (PDT)
Subject: Re: [PATCH] memory: tegra: make the array list static const, makes
 object smaller
To:     Colin King <colin.king@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210819133155.10441-1-colin.king@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9ecb8f1b-7e2a-7d5a-c176-07459d0c148f@canonical.com>
Date:   Fri, 20 Aug 2021 12:52:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819133155.10441-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 19/08/2021 15:31, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array list on the stack but instead it
> static const. Makes the object code smaller by 110 bytes:
> 
> Before:
>    text    data     bss     dec     hex filename
>   37713   21992      64   59769    e979 .../tegra/tegra210-emc-cc-r21021.o
> 
> After:
>    text    data     bss     dec     hex filename
>   37539   22056      64   59659    e90b .../tegra/tegra210-emc-cc-r21021.o
> 
> (gcc version 10.3.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Looks good, it's too late for this cycle, so I'll take it after merge
window.


Best regards,
Krzysztof
