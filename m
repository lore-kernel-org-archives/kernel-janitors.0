Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55335C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Apr 2021 09:30:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20AA9611CD
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Apr 2021 09:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241786AbhDWJbI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Apr 2021 05:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbhDWJbH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Apr 2021 05:31:07 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9D8C06174A
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Apr 2021 02:30:31 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id sd23so64287891ejb.12
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Apr 2021 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oMjiyMiBGJc+0Yh9uCgxQ9jHi5K1btCkWBwEdFw4f1g=;
        b=YkD+B9KZnDRgs9vlUZ7dzrcUSi899GK1f/nEMD2SCHEkDAWVePAj/u7fNMcAx3GcAy
         hWau99URfYonvON5t9PNa5PnPAMBgWf/qz/4LbCodbM7sLg8C5v1qDQCTuZYaIXqeAlT
         r7sB2wpJB1pZAxWbnoVve6+bV8M7otlhxFVDkSseJpcoLTiGsbYidbRTDdgVUkACsgBN
         5gzryhdLSUc35W02vPY4/xWID/Z3XgDro1RukdKqNm6uuDuTHzx9qE1usg5hX8Og0lmM
         YsWWk4rq2BVQX7B5+Kx4z9czaWbxFELj+5QD8fEiaYYE65Jiny1eI4M3pM3n4NKG8Sj8
         dfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oMjiyMiBGJc+0Yh9uCgxQ9jHi5K1btCkWBwEdFw4f1g=;
        b=c0CYv8MJ+1NtAVAmeJriIgyB1rD4LIrRwSV7jwbS/xRnLKxQLndEulbbj+VT0jYdC9
         0BQF1sqPJlvuQcHvFjVO9X5zYsJnSREuTLrWnyBqUna3YtPtZGDQtWQKbdtpUg9xYq9M
         AHccaPF4YnUdpgojNagO7vNKvP+OhklJb/t5RtIfk7zZ+h8CXg0U4ZB/TGiCgbMSqPJJ
         Kckqoz9EyttnwZvpGJXpQkWf8j0mM1Or7ldc0h2Rq3/X3jNbW3who4irBa6BTChrJSw1
         s7cYl2FKch3/u1xV1qUNwS94Xa6iA1jfkhH3P5OytOilR4gin4A124tA57G9Mb9+WHzC
         mgKw==
X-Gm-Message-State: AOAM532QAP1SBg8B0d5rkUNRDrO/yA/bvyz5vAi6O1yOfue3a83JyvLu
        VskCX7TV415o4PtoQbg3fTnSnxCgihyzJN20
X-Google-Smtp-Source: ABdhPJwdepM1uqbgLJTgk6NWV1jHk5422Xe4Gg57pb7hFN0aaJfr+8r5WhbWOuyrzuxI0sAQvJaX2w==
X-Received: by 2002:a17:906:eb09:: with SMTP id mb9mr3148206ejb.452.1619170230021;
        Fri, 23 Apr 2021 02:30:30 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id o20sm4248614eds.65.2021.04.23.02.30.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Apr 2021 02:30:29 -0700 (PDT)
Subject: Re: [PATCH] nvmem: core: add a missing of_node_put
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        bgolaszewski@baylibre.com, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <2ebc18d9da622afe8681c18349b501a516253041.1618949512.git.christophe.jaillet@wanadoo.fr>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <93e8b92c-8f4e-9990-ac4d-9688bbaaa6f6@linaro.org>
Date:   Fri, 23 Apr 2021 10:30:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2ebc18d9da622afe8681c18349b501a516253041.1618949512.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 20/04/2021 21:12, Christophe JAILLET wrote:
> 'for_each_child_of_node' performs an of_node_get on each iteration, so a
> return from the middle of the loop requires an of_node_put.
> 
> Fixes: e888d445ac33 ("nvmem: resolve cells from DT at registration time")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/nvmem/core.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index bca671ff4e54..4375e52ba6c2 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -686,12 +686,15 @@ static int nvmem_add_cells_from_of(struct nvmem_device *nvmem)
>   			continue;
>   		if (len < 2 * sizeof(u32)) {
>   			dev_err(dev, "nvmem: invalid reg on %pOF\n", child);
> +			of_node_put(child);
>   			return -EINVAL;
>   		}
>   
>   		cell = kzalloc(sizeof(*cell), GFP_KERNEL);
> -		if (!cell)
> +		if (!cell) {
> +			of_node_put(child);
>   			return -ENOMEM;
> +		}
>   
>   		cell->nvmem = nvmem;
>   		cell->np = of_node_get(child);
> @@ -717,6 +720,7 @@ static int nvmem_add_cells_from_of(struct nvmem_device *nvmem)
>   			kfree_const(cell->name);
>   			of_node_put(cell->np);
>   			kfree(cell);
> +			of_node_put(child);

two of_node_put looks bit confusing to the reader, can you move the

cell->np = of_node_get(child); just before nvmem_cell_add(cell);
so that we can remove extra put.

Was this reported by some kind of static analysis tool?

--srini



>   			return -EINVAL;
>   		}
>   
> 
