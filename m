Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99F1C4708F
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 13:07:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B817D613B1
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 13:07:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbhFANJg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 09:09:36 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43740 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233698AbhFANJb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 09:09:31 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lo47Z-0001rJ-Hd
        for kernel-janitors@vger.kernel.org; Tue, 01 Jun 2021 13:07:49 +0000
Received: by mail-wr1-f70.google.com with SMTP id y11-20020adfe6cb0000b0290114d1db9b88so3998302wrm.19
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jun 2021 06:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FpFE3Q169p9I82G663kCNgbGWOU29minA7JKgCHkCBE=;
        b=DZZ3NGRNadsc7IhshmzdrwtzqpCukqTPqzNAEqY32QJ/6GcwQn5nDD+1z+iuaSaFPY
         d6KMGu09eC+SIIrmg7JppkUDpR4K2KtoVYBaag0VQ/SRl59IPK2xwL4I64s0mBpui8s/
         vthQIkEDfEm28ykG5Gayge+/gau4qSaGvngJNTMKDWUq7RwKY1YKDiAOJRTKWpxVGKmU
         s0EyS1GzgOQPYsoxM3vBWrvt1p70IYtUoPy4syObw5uzOaQgMtt4wN2ZWnpO9gpK5U+w
         RpdBV6NyWRW6610zf9hYDyvO+zjS5TLtqeZhpmzGBsqCqqCrD0PDiT3lW0h9aaUcxyk1
         86QA==
X-Gm-Message-State: AOAM531fSjwPdip0etPsq1D0zhu4ykrGkWeqRTKS7/1l80pNdKg6oU2F
        4cuvHbHwtr4oRtIyYXp2lr0fQJCJJgHEj06Qm3jRfQ/8x9HC9BbwMqzwSJ9cfPFSdkOz1p5Vm8t
        3Z/LH/v7hQgLOIjYX/VxwuP/Euoln2Z8T/xhFjxFLJJI4MQ==
X-Received: by 2002:a05:600c:3227:: with SMTP id r39mr26743370wmp.26.1622552868730;
        Tue, 01 Jun 2021 06:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPw71Sl27dDWwQIasNqYQAmTjczXg24B0GI/7daRMIzEBWYFDceWeCW6ZZlV/yvXmg1UM8eA==
X-Received: by 2002:a05:600c:3227:: with SMTP id r39mr26743349wmp.26.1622552868588;
        Tue, 01 Jun 2021 06:07:48 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id e17sm3587959wre.79.2021.06.01.06.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 06:07:48 -0700 (PDT)
Subject: Re: [PATCH] NFC: microread: Pass err variable to async_cb()
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     linux-nfc@lists.01.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YLYvcbjuPg1JFr7/@fedora>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3e2f804b-107a-9f44-2ed2-95e4c2a2e426@canonical.com>
Date:   Tue, 1 Jun 2021 15:07:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLYvcbjuPg1JFr7/@fedora>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 01/06/2021 15:00, Nigel Christian wrote:
> In the case MICROREAD_CB_TYPE_READER_ALL clang reports a dead
> code warning. The error code is being directly passed to 
> async_cb(). Fix this by passing the err variable, which is also
> done in another path.
> 
> Addresses-Coverity: ("Unused value") 
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/nfc/microread/microread.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/microread.c
> index 8d3988457c58..130b0f554016 100644
> --- a/drivers/nfc/microread/microread.c
> +++ b/drivers/nfc/microread/microread.c
> @@ -367,7 +367,7 @@ static void microread_im_transceive_cb(void *context, struct sk_buff *skb,
>  				err = -EPROTO;

Remove this line instead, please. The err is argument passed by value so
assigning it within a function is ugly.

>  				kfree_skb(skb);
>  				info->async_cb(info->async_cb_context, NULL,
> -					       -EPROTO);
> +					       err);
>  				return;
>  			}
>  
> 


Best regards,
Krzysztof
