Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A7FC433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 09:15:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9FE9611C2
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 09:15:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235923AbhEQJRK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 May 2021 05:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236174AbhEQJQZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 May 2021 05:16:25 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4688DC06174A
        for <kernel-janitors@vger.kernel.org>; Mon, 17 May 2021 02:15:05 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id h3-20020a05600c3503b0290176f13c7715so1511089wmq.5
        for <kernel-janitors@vger.kernel.org>; Mon, 17 May 2021 02:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f2cHJbnBekXvbg3p/dRwo5sJhCEHlHni5/IUvtFFKrw=;
        b=OtuGEnq8PvAPT3sGrixyuM3Z2KNtXzvEoJkjQL08MY0IW9vhggKGVoYLtYTS6qLNrb
         nIWJOjonKzZGYJc3wdjzYLUvhWafGGiXdFoySB5umesr04C9+6cfquJz1+n9sEI66jI/
         KGlK4ipqBxGYVzCd66XOTCVOk1oFdXiru3EfzR+K5Hr9RoT9/m5kDn2+X8tqxh9dcVG5
         H/BgtLKB1PYxBCwvzfum4/GqWtFZQl5amJI6XsJVdGsBH7g103LLrai/kvQKXBIE8Bb8
         9coUq80SXhvpUvFhxOqqzFTyrNj/5Q9+F5RxVopamH8IxQVJaFA+mDRQnEZWuMZc64Wg
         XhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f2cHJbnBekXvbg3p/dRwo5sJhCEHlHni5/IUvtFFKrw=;
        b=ZRIzsbo/+xCYbr7yQWm367MsEUZa82m8y1LA+bT9l3KJ3/LnweLq/kRKgelMZq5eWF
         dhDQqeS8X/TddmiuEupgDC7XRI4NFpP49hPZpR8Q1YXxaZoUJJFNg4YCKABh5Tc6yMX3
         MXIUTFppnvXbPCIU7E/mAdnovLwaXjeCK6OqLwnwzqlzVALs5WwqdM2oS94rORWf6sGZ
         Sf29aCkuyZQ8g/fufWE/VD/Q3J+ERQ52sQoPbf5PPohPw7rvwKX+tRm0bUXTuVOYmK6d
         GJMbpNsq6cysV0ce5RY9JR8E9/fg9ijCLoPugE2jzzc5RD3sQvr4BixGeKjdhbPnyyuP
         absw==
X-Gm-Message-State: AOAM531FUD7nxO4drkjgTr6f1/sO63rDYCpZCdSORG2cQ0eshUTCNHfA
        4DWwaKmfVv2bVIVM7O19eettw1GdJduQkny1
X-Google-Smtp-Source: ABdhPJyohuqRHJuh1BHyUY1B+IQm1ke6bNYROwDDue84DBAPR+VPmLpGhPo201SFDmU6Rlm6QFQ1+A==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id m14mr8408155wmq.164.1621242903732;
        Mon, 17 May 2021 02:15:03 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id k20sm5466084wrc.1.2021.05.17.02.15.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 May 2021 02:15:03 -0700 (PDT)
Subject: Re: [PATCH] nvmem: sprd: Fix an error message
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com,
        gregkh@linuxfoundation.org, freeman.liu@unisoc.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <5bc44aace2fe7e1c91d8b35c8fe31e7134ceab2c.1620406852.git.christophe.jaillet@wanadoo.fr>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <edd0e50f-22f7-5a38-dd46-4a31909242a7@linaro.org>
Date:   Mon, 17 May 2021 10:15:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5bc44aace2fe7e1c91d8b35c8fe31e7134ceab2c.1620406852.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 07/05/2021 18:02, Christophe JAILLET wrote:
> 'ret' is known to be 0 here.
> The expected error status is stored in 'status', so use it instead.
> 
> Also change %d in %u, because status is an u32, not a int.
> 
> Fixes: 096030e7f449 ("nvmem: sprd: Add Spreadtrum SoCs eFuse support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied thanks,

--srini
>   drivers/nvmem/sprd-efuse.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
> index 5d394559edf2..e3e721d4c205 100644
> --- a/drivers/nvmem/sprd-efuse.c
> +++ b/drivers/nvmem/sprd-efuse.c
> @@ -234,7 +234,7 @@ static int sprd_efuse_raw_prog(struct sprd_efuse *efuse, u32 blk, bool doub,
>   	status = readl(efuse->base + SPRD_EFUSE_ERR_FLAG);
>   	if (status) {
>   		dev_err(efuse->dev,
> -			"write error status %d of block %d\n", ret, blk);
> +			"write error status %u of block %d\n", status, blk);
>   
>   		writel(SPRD_EFUSE_ERR_CLR_MASK,
>   		       efuse->base + SPRD_EFUSE_ERR_CLR);
> 
