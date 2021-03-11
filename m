Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4595CC433E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 17:51:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9CDE64FE2
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 17:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhCKRvF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Mar 2021 12:51:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhCKRui (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Mar 2021 12:50:38 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5620AC061760
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 09:50:38 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo13395324wmq.4
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 09:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HthGmN6OoEPOkH3BUjgeaUShU2h31+ENbwr8NaXHKZ4=;
        b=nyz24We35BGpHCczqy7X4dlSaTal3kCH6WmbMotRZv8th6gh9Mx010oWwScQbSt3Nk
         5OCCxe83VgW99MUBnVuNBYe92Z7KFWJVtcTpv/ZbnCPlgclkGuZrDIYwlNSmvICQD34O
         E8hyH5YWCeU/wocbV5w/Qf/bNPCrLAi0ztM+cyecnKU+g74B731lpvf2Iabd7pMi2SNa
         pFnPzC+FL4tF6W3mrivdtJ6hBCdONz0QvFhs3sMmv4NZYlmPTQaxrHyi4lAAstQMrMl1
         FRSZuZk/tII5v6mkQdGx3tBQngYLp1QDeJi7G3dlU9mBY0c+dcr3LoU94rjBQBBjZKzf
         X/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HthGmN6OoEPOkH3BUjgeaUShU2h31+ENbwr8NaXHKZ4=;
        b=cVZss4k98RZWTUAm40S9+/+UuQvdJkJ41UBxL8sErRdo9gdSh6Q96XQs6g8wxRJ4ts
         LteDnGD1UpjsU9ZQ2chYdAl+4/iZ9LP836fy1bxWg8Om4CtyiairZy7fsl/HMIE2eEmS
         bUSw1pxbydFa1oSqc6ahPuhtRdB6g00uINp+zrAXxQu6Edp//JMM4WPGiXV+XX+LGQh+
         vuwbpcgpq1ygGdcb9S2vMt7eeHuTtwte6OiYOM0OK9Ds7NN12hASMCYt8D3MDlP0SoPj
         WaBwZ/pNeEPYKdRcjKMvLfbagTVwF7EzKsoDwPaGQH38KdKzU5oSpPUbOrtWMD1Rx3Kd
         AXnA==
X-Gm-Message-State: AOAM530EEB5MPZhx9zKNa2s3x1NwldDnujMvD+4duu1NL1L3CY+0sVmJ
        vg4jcKKqC5rFHQeHre+rtnrKpIyiAIFXQw==
X-Google-Smtp-Source: ABdhPJxT6GAKDrraNaBEENyQ6zcJio4amNKi9uZm5C0XC3l5j4HTKLluXN7nY0KmqRu4CKB1MPgbXQ==
X-Received: by 2002:a05:600c:2d42:: with SMTP id a2mr9431760wmg.77.1615485036685;
        Thu, 11 Mar 2021 09:50:36 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id g202sm4559157wme.20.2021.03.11.09.50.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 09:50:35 -0800 (PST)
Subject: Re: [PATCH][next] nvmem: core: Fix unintentional sign extension issue
To:     Colin King <colin.king@canonical.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org
References: <20210311095316.6480-1-colin.king@canonical.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e0c2b730-7ec2-590d-975c-f515c5b48e2e@linaro.org>
Date:   Thu, 11 Mar 2021 17:50:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210311095316.6480-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 11/03/2021 09:53, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The shifting of the u8 integer buf[3] by 24 bits to the left will
> be promoted to a 32 bit signed int and then sign-extended to a
> u64. In the event that the top bit of buf[3] is set then all
> then all the upper 32 bits of the u64 end up as also being set
> because of the sign-extension. Fix this by casting buf[i] to
> a u64 before the shift.
> 
> Addresses-Coverity: ("Unintended sign extension")
> Fixes: 097eb1136ebb ("nvmem: core: Add functions to make number reading easy")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied thanks,

--srini

>   drivers/nvmem/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 635e3131eb5f..bca671ff4e54 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -1693,7 +1693,7 @@ int nvmem_cell_read_variable_le_u64(struct device *dev, const char *cell_id,
>   	/* Copy w/ implicit endian conversion */
>   	*val = 0;
>   	for (i = 0; i < len; i++)
> -		*val |= buf[i] << (8 * i);
> +		*val |= (uint64_t)buf[i] << (8 * i);
>   
>   	kfree(buf);
>   
> 
