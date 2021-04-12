Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC8EC433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 11:17:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C22B6134F
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 11:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239825AbhDLLRb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Apr 2021 07:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237930AbhDLLRb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Apr 2021 07:17:31 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AB8C06174A
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Apr 2021 04:17:13 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id l4so19562430ejc.10
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Apr 2021 04:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kFSe5n5U9BPZPO9futXGhFSddhJ07nAQjfoS59gUsgs=;
        b=o+XvYNQ1zTZilPgHcZqivVQKpCxoQJXtdDkVLCmY23jSw9gPhJZEO34PhRHF3Z1SXT
         ffrztOas+Vg5VpIbU4tM8nGRU8ES3l5FIDYKJvkkQvm4sl8AYS64c3hbHt5/HljjXD+/
         EmP982WNfOGVRjp3/EmPmfedPvqfEq2ykmTTRHvUGMJ4pTZ0tBBA/VnquQlPqYBFZIoa
         EMkiByyVa8nasmk6fLWE+K8+Tmj8tMqSBO9X+iv7JambMiYNdhhz7wrZTJfqkLQ8ilJb
         eNG+PWhFhmQIYV3wxToiysiU0MkXDhY+4+1f+oQjvZHK5rprCrgQ1sV34tMdCFn0Ozwy
         gtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kFSe5n5U9BPZPO9futXGhFSddhJ07nAQjfoS59gUsgs=;
        b=lALEGiFRFxWZkaHDO/0+YcXmEJe7JIRRHS20HKs/lxlS3SlmtLmzMue6Y37LixWKOn
         XTYDHzzuI7+m0yp5rxF2wMtqoEUSdkGHdsim0otcWn+3H7HDvXDVmsSQNRTl3q9I3uL1
         0n8aYR1LDxWEgC8j3XvmZIFPH9Dym9/DJrOgLdMjHKclwHfeK/SjT1kjJqnm6KUqITAS
         ryO9yHPg16Au/QcaEHDWKy2HHRnNdkd/wNvRx6gBRRDByltOYCrQKMOyBgp1hdpMg3py
         Tk4l5tMl9lSq/aA3Pm259P7Y0M5VIVu/WvBdRP3YTOM5aeIG2M7KXINqiYK1ofn0PWGN
         tS8g==
X-Gm-Message-State: AOAM531A9ZlQkic0njLttu4w874FwFsqnr4BfaUxfQNFA2j1YWVAj+b/
        KwgNVn351lUDtM7kDcnVecg6b4T0rNtd/Q==
X-Google-Smtp-Source: ABdhPJwFlOdwJEju3oTC0+kYM3Xg1gSHbdmVF4TlGEHgzvsXZuyvzwYEMT33igKYey3F0ydqPlckDw==
X-Received: by 2002:a17:906:6b91:: with SMTP id l17mr3194984ejr.196.1618226231772;
        Mon, 12 Apr 2021 04:17:11 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id u19sm6456348edy.23.2021.04.12.04.17.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Apr 2021 04:17:11 -0700 (PDT)
Subject: Re: [PATCH -next] nvmem: sprd: Add missing MODULE_DEVICE_TABLE
To:     Bixuan Cui <cuibixuan@huawei.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210410035033.11274-1-cuibixuan@huawei.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1afdb2e8-c4d6-ed8f-4260-2475dd26461c@linaro.org>
Date:   Mon, 12 Apr 2021 12:17:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210410035033.11274-1-cuibixuan@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 10/04/2021 04:50, Bixuan Cui wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---

Applied thanks,

--srini

>   drivers/nvmem/sprd-efuse.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
> index 59523245db8a..5d394559edf2 100644
> --- a/drivers/nvmem/sprd-efuse.c
> +++ b/drivers/nvmem/sprd-efuse.c
> @@ -425,6 +425,7 @@ static const struct of_device_id sprd_efuse_of_match[] = {
>   	{ .compatible = "sprd,ums312-efuse", .data = &ums312_data },
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(of, sprd_efuse_of_match);
>   
>   static struct platform_driver sprd_efuse_driver = {
>   	.probe = sprd_efuse_probe,
> 
