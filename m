Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296B2C47082
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 22:43:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CDB661351
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 22:43:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhFHWpY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Jun 2021 18:45:24 -0400
Received: from mail-qk1-f181.google.com ([209.85.222.181]:34615 "EHLO
        mail-qk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhFHWpY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Jun 2021 18:45:24 -0400
Received: by mail-qk1-f181.google.com with SMTP id k11so20299050qkk.1
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Jun 2021 15:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CiEH93oHxFAht+7aZTEKeBrzaSNOlcRE/Xf1r7kSjCA=;
        b=Zc3jz63eFflFy1UVb/XgVYb2q+Oj0swYgmxeHSt/JLKGSZW34UgF8esnYCsF0IP7gx
         YU/1cY18LflhO7EBiqBq0arSQMC9DhTbJaVS19hKY/kQBbib2GHX6bxhfNHBDOMHwXIJ
         +Y02rE+pMr9WPHLdF5yKRUD8W0fLg+DtMssTOi9lc7D4ZF4//Tiwk+ikn8EwHo8ipJQ9
         flXVXYyyE3u00z2Q3B/dYxtT5GP95yXptfiMLCMO+BazRWJv06zJgbfv5owqO+PRtPsJ
         zRe1Pk3TospkQb4K6oZvpsclNPN3Jm7db+KKGFp3PYvPGCLRwFc4/E8NLMJcDNOvAfxL
         ZXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CiEH93oHxFAht+7aZTEKeBrzaSNOlcRE/Xf1r7kSjCA=;
        b=f0hE2jxbF+i5Rvk7BPhX0Nv5cglfknonE/VlbqWIV8L/1eaLDOSXwgIIl4TwoD/JA8
         EFbUfZ5m6o2Rf/TqqF6KShQyBSFvSf6lq+nRjmpnOjBjP/Xc8K8VVwSpuwMLU63Awojc
         OxXIe5zKv4k051IbOY3KM565k2jOeXcoTxmOI/GE+zEtAgyPTPmJb4fDjuMrnH0iLnCm
         Ypd/SDkdUSGSPzKoFlnow1jkJ69nTuvptizYAWS9xCEu/Q2xxTbnU1D5yZrV+8bMJixR
         4HuwReRcTsvdbG+mAQDc57tAHCj2FNjh4daEHhSTw6rC34Txfdo3C0GwpAX4eklM8gUo
         4ULg==
X-Gm-Message-State: AOAM533ic5oweU5mMxxNpXMvwlaOdjn8GKtJnhagM5YLMZkufp/eoWcI
        lsMslYDGNSaOI4hirT7NwOsAfA==
X-Google-Smtp-Source: ABdhPJyU+QIql5Y85Kiw+E7Je6AmK+VfYGY88+WbqGXNVf3BQkCaeLT4cnYJP9HeCybWB7I3sWEiVQ==
X-Received: by 2002:a37:a80e:: with SMTP id r14mr24381754qke.386.1623192138166;
        Tue, 08 Jun 2021 15:42:18 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id p3sm11444145qti.31.2021.06.08.15.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 15:42:17 -0700 (PDT)
Subject: Re: [PATCH -next] crypto: qce: skcipher: fix error return code in
 qce_skcipher_async_req_handle()
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210602113645.3038800-1-weiyongjun1@huawei.com>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <09514ef3-183f-db3d-7525-aefcb1275383@linaro.org>
Date:   Tue, 8 Jun 2021 18:42:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210602113645.3038800-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 6/2/21 7:36 AM, Wei Yongjun wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 1339a7c3ba05 ("crypto: qce: skcipher: Fix incorrect sg count for dma transfers")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>

-- 
Warm Regards
Thara

> ---
>   drivers/crypto/qce/skcipher.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
> index 259418479227..8ff10928f581 100644
> --- a/drivers/crypto/qce/skcipher.c
> +++ b/drivers/crypto/qce/skcipher.c
> @@ -124,13 +124,17 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
>   	rctx->dst_sg = rctx->dst_tbl.sgl;
>   
>   	dst_nents = dma_map_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
> -	if (dst_nents < 0)
> +	if (dst_nents < 0) {
> +		ret = dst_nents;
>   		goto error_free;
> +	}
>   
>   	if (diff_dst) {
>   		src_nents = dma_map_sg(qce->dev, req->src, rctx->src_nents, dir_src);
> -		if (src_nents < 0)
> +		if (src_nents < 0) {
> +			ret = src_nents;
>   			goto error_unmap_dst;
> +		}
>   		rctx->src_sg = req->src;
>   	} else {
>   		rctx->src_sg = rctx->dst_sg;
> 


