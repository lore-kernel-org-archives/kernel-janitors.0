Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF698C6FA90
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Sep 2022 09:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbiIVJXv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Sep 2022 05:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiIVJXt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Sep 2022 05:23:49 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D1EFB863
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Sep 2022 02:23:47 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l8so6361270wmi.2
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Sep 2022 02:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=0oW+9yt7498h+lO2a1DaBWCIJgwtJERfgviB79Lo1Y4=;
        b=HuDw6Ts7eqn9+FpWBXdFfI+MNIEPh+9HPz7+HdbnjkBZfpVoEQddP7F2EOtfZTGjE+
         2LkLxtbLKi5jgOUmsGj0KaYMIgu70XgDZzuO2alqnNNcm1Hub/itYoO87sIpWrD1VXnq
         qb76RFr9VeA6Wb64HlQu2dFTI8ZHJT08fXAmWwnolzgg7Pkp/tcixNdw/NA28sQicNF2
         ICNtwHkZNjh0+CNNvVdagVtAh2DfhJD0s6BmXLxf7pPrvXT+95LCNAfgN92A+2RbqG47
         IPIYuvwGQ5Jr+lORDt7OQeKvUT/7omdB+kAPR90SDmEcrJUpd05yVdK4UEWuXhTTQbb5
         G4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=0oW+9yt7498h+lO2a1DaBWCIJgwtJERfgviB79Lo1Y4=;
        b=nemN9g4L5gEpeniB58j8POdkU00pwKTmb0pJ2E7AS+4PwlKwghWGpGYvtwN1E8K4ti
         p5U8Eo75Rhi/XVPjmjE3Q8yyhkua8IiRL57FpLASVXdWS9f7xzZLgCSZXGEnaitcXmc/
         uDlYYrk+2iev50C7jHHDVXm3sPLJwjhz5M6Cruu/tPfVxzEVWW+qKBWkV2a6ex8AxND1
         8QedqzjR1vAJXstyakNjE7rsiL9L4zRBPnd8QD2qFJpdRv5Jo6TuttCNo8pzhrlHD97O
         sxoU7noj0ddtZv9AK/eLeQUjVOjz0jU+Iv13HVR6Ny6wROdSUyLW+a7KkDQtBWyFq6AE
         ttPA==
X-Gm-Message-State: ACrzQf2SmWntPYOTJCZYSDtYQWBObY9iQ6jHcEhTGLYu+DYt4/97rO8T
        TCC/YrWMGKMEdfL40SXMr7CQqg==
X-Google-Smtp-Source: AMsMyM4hzQ6OpNA16zPCO4R6+e1l10Orii3c1e9BAA5rpjZ3q22Jf9I0uZigmmUKMzK54QW8tXXupg==
X-Received: by 2002:a7b:c398:0:b0:3b4:9308:ffee with SMTP id s24-20020a7bc398000000b003b49308ffeemr8947146wmj.51.1663838626144;
        Thu, 22 Sep 2022 02:23:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6aa5:ee77:c3d6:a9d6? ([2a01:e0a:982:cbb0:6aa5:ee77:c3d6:a9d6])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b003b491f99a25sm6896559wmq.22.2022.09.22.02.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 02:23:45 -0700 (PDT)
Message-ID: <19f10c64-efec-e2c7-a39d-0f346d6936fa@linaro.org>
Date:   Thu, 22 Sep 2022 11:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH -next] spi: meson-spicc: make symbol
 'meson_spicc_pow2_clk_ops' static
Content-Language: en-US
To:     Wei Yongjun <weiyongjun@huaweicloud.com>,
        Mark Brown <broonie@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>, linux-spi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20220922040807.1409540-1-weiyongjun@huaweicloud.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220922040807.1409540-1-weiyongjun@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 22/09/2022 06:08, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/spi/spi-meson-spicc.c:570:22: warning:
>   symbol 'meson_spicc_pow2_clk_ops' was not declared. Should it be static?
> 
> This symbol is not used outside of spi-meson-spicc.c, so marks it static.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   drivers/spi/spi-meson-spicc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index e4cb52e1fe26..85b4b9b267b1 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -567,7 +567,7 @@ static int meson_spicc_pow2_set_rate(struct clk_hw *hw, unsigned long rate,
>   	return clk_divider_ops.set_rate(hw, rate, parent_rate);
>   }
>   
> -const struct clk_ops meson_spicc_pow2_clk_ops = {
> +static const struct clk_ops meson_spicc_pow2_clk_ops = {
>   	.recalc_rate = meson_spicc_pow2_recalc_rate,
>   	.determine_rate = meson_spicc_pow2_determine_rate,
>   	.set_rate = meson_spicc_pow2_set_rate,
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
