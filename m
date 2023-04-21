Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFEEC77B76
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Apr 2023 11:53:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbjDULxO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Apr 2023 07:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjDULxM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Apr 2023 07:53:12 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386E946B4
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 04:53:04 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso1651142e87.0
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 04:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682077982; x=1684669982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Tctvi1T7uWRNiQ9tzC4LHci30BlviPi5BuTXmg+G4U=;
        b=tZuo84f7ymjDqoKsocYpW1UiwisOAs9s8vL4UPa2z/pupNzmkoPcomnrieemcNkMR1
         yMXB59H/cCQ0i9pd7J9DYv2lJwSRxMimsi5QpHAGcDn+rPPSUJYqA+eZHZJCQ5gruBkg
         DXZzq1iJJOZyJ2kPKVQhpYn942GqMdPrwzLF51MeTfH9Jx1zQlmDr5CJmQG27/xhdhQE
         chFdxCKTMDURYGGEA1uD/+9JTdJIAW188cKB0bQq40BfeS2z7L3zok8gAGP/mMoHQd9q
         ORvQhH+klLTbB/+o6QolHgewRnICtyTDyeobKgaO4MXHa7oLCaXo4s3MO9IzCWCFBF32
         8iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682077982; x=1684669982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Tctvi1T7uWRNiQ9tzC4LHci30BlviPi5BuTXmg+G4U=;
        b=f3wGu4HH5JRz9hFWLTlF3W5ThX8E+JSPZi/1a9ghogb80Dlg792WsPa6RoupT1UJnp
         vtV65EubV4ZLPKY7bHLJkCHOtZQlmx0sECCv3Myzfj38+pz9Ka7Rqz8U+blR6xdeHUhA
         mct6NvdsNjJVtoIWNXM9h/FfKZLLpljtkQ9XxsJGssdcFvpyuukPKBr6KZMRVMz03cqj
         hq+hbEXcNVLsK2BWela07JNJy88DuVOjpeDEq321Wi4v8t5Ccgcl2ockCeyfSUhbOTd/
         3BeRIF5IIM3u+uexaGC9NnbMVrWdCDOQ9vZ4IxCRb6UEQQe9QWvT8LXNR+/p14rxFX97
         16hg==
X-Gm-Message-State: AAQBX9ebB8EmI7Xk4q46R9FjS2OxvwVhvyVGuIwLOTk9E3A6OKE6W5vU
        Ot6EN65JgRSi1mFA68rh6azdHg==
X-Google-Smtp-Source: AKy350YMZLWzfe50czDUO5u26OQGGazQcsnJZc/FPugk3HRL4VBFH9MHyC3EfxlYvfGWvSWoTQT7vA==
X-Received: by 2002:ac2:41d0:0:b0:4ed:ca92:87f2 with SMTP id d16-20020ac241d0000000b004edca9287f2mr1334279lfi.20.1682077982416;
        Fri, 21 Apr 2023 04:53:02 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id z2-20020ac25de2000000b004ec89c94f04sm534673lfq.155.2023.04.21.04.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 04:53:02 -0700 (PDT)
Message-ID: <bec64668-f6bf-c41a-58b2-6ca25b1b3668@linaro.org>
Date:   Fri, 21 Apr 2023 13:53:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] soc: qcom: rmtfs: Fix error code in probe()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <76b21a14-70ff-4ca9-927d-587543c6699c@kili.mountain>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <76b21a14-70ff-4ca9-927d-587543c6699c@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 21.04.2023 12:44, Dan Carpenter wrote:
> Return an error code if of_property_count_u32_elems() fails.  Don't
> return success.
> 
> Fixes: e656cd0bcf3d ("soc: qcom: rmtfs: Optionally map RMTFS to more VMs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/rmtfs_mem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
> index ce48a9f3b4c8..f83811f51175 100644
> --- a/drivers/soc/qcom/rmtfs_mem.c
> +++ b/drivers/soc/qcom/rmtfs_mem.c
> @@ -233,6 +233,7 @@ static int qcom_rmtfs_mem_probe(struct platform_device *pdev)
>  		num_vmids = 0;
>  	} else if (num_vmids < 0) {
>  		dev_err(&pdev->dev, "failed to count qcom,vmid elements: %d\n", num_vmids);
> +		ret = num_vmids;
>  		goto remove_cdev;
>  	} else if (num_vmids > NUM_MAX_VMIDS) {
>  		dev_warn(&pdev->dev,
