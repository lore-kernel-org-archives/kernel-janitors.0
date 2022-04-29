Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20113C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 29 Apr 2022 09:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356643AbiD2JhG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 29 Apr 2022 05:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbiD2JhF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 29 Apr 2022 05:37:05 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D27C614D
        for <kernel-janitors@vger.kernel.org>; Fri, 29 Apr 2022 02:33:48 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id q20so4316506wmq.1
        for <kernel-janitors@vger.kernel.org>; Fri, 29 Apr 2022 02:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EW/toHLb6y+1M7wLI94NJ4Z/BFmxHWRzQqK5HO/iHI8=;
        b=uMv4LJwlp1CHsz9bkWvP66hloIn6RRCqdUsl//CCAHqumM8BFgKtW2CMSAwnXWFqcZ
         qr8AXKUU4zoOn2wuk0Y9EN3VCqoB0hMbr+ww7RWhj72WzFiyJxRuNa4qJLLGzXof7Kt6
         uVF7kL97EORzwrBUL+WKvQgMsS2R6jNQgbGSWrMp+SrakmiKGfP599C280s1tC0RZNMU
         l5Xkp/RwlHwJS5sJ0H46KNB9m7nAZgi5g8uC4kPUav4qGnT2pz1nZZz9wIPUuo8Nzsvg
         Dtptg/EGxm4+A+TqyshcEV13c05PLxBpwHkjLcs60DOkEV52erhZKJl4O28wR/ybZuy5
         7+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EW/toHLb6y+1M7wLI94NJ4Z/BFmxHWRzQqK5HO/iHI8=;
        b=Z7e9NbC5BKmRo1SeybrEBXcdJh5i0ELHhaXJ66eqhc9sDIn79yHStXKvxzVG9kctmu
         /6XexHBnqjeSdRbj4ZNF/fQto+461UO47wIBw/2HaC64oWvLEx+NzGS6L6aodts6gDku
         MaurrXZENrOHiyxaOHoYG6A4DVG60t4exxCAfNxLFumabV2MejBTLUGIWyH36AHzmV3l
         2aP5RBuFxZuosUV5hQqMSdHLGYJ3SNKZFAT/XqXKNV4mxJnAn4YiyzvXBeHoaXdTDpoa
         TVJHU6xgzkQJwjJCPYyRcikPaj3BdK0MBipRSisYXR6AiSaCYWKGqr9n5mrSDcAUIejL
         pKqA==
X-Gm-Message-State: AOAM532cemZbPEqIlnUtjgx8bo6rilyiMRwNHfnR9oK25e37CBTqNIYf
        zbm3aJDDIRdzDFX52Fc+gzSz/QteQGQrAg==
X-Google-Smtp-Source: ABdhPJzy/BNNBTkrtGebfsbySOLNkOjsDUHjdDXcPHUjik0w14dHHGfJttoILyklCQF5MYBbdUzawQ==
X-Received: by 2002:a1c:4d0d:0:b0:394:4de:539 with SMTP id o13-20020a1c4d0d000000b0039404de0539mr2319445wmh.124.1651224826589;
        Fri, 29 Apr 2022 02:33:46 -0700 (PDT)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id n2-20020a1ca402000000b003942429cd1esm261251wme.10.2022.04.29.02.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 02:33:46 -0700 (PDT)
Message-ID: <996eb652-8a18-184b-c163-85e67d67b530@linaro.org>
Date:   Fri, 29 Apr 2022 10:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] nvmem: check for allocation failure
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20220301081127.GC17375@kili>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220301081127.GC17375@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 01/03/2022 08:11, Dan Carpenter wrote:
> Check for if the kcalloc() fails.
> 
> Fixes: 299dc152721f ("nvmem: brcm_nvram: parse NVRAM content into NVMEM cells")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---


Applied after changing subject line to "nvmem: brcm_nvram: check for 
allocation failure"


--srini
>   drivers/nvmem/brcm_nvram.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/nvmem/brcm_nvram.c b/drivers/nvmem/brcm_nvram.c
> index 439f00b9eef6..c80af8a31eba 100644
> --- a/drivers/nvmem/brcm_nvram.c
> +++ b/drivers/nvmem/brcm_nvram.c
> @@ -95,6 +95,8 @@ static int brcm_nvram_parse(struct brcm_nvram *priv)
>   	len = le32_to_cpu(header.len);
>   
>   	data = kcalloc(1, len, GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
>   	memcpy_fromio(data, priv->base, len);
>   	data[len - 1] = '\0';
>   
