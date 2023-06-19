Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF67EB64D9
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 07:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjFSHAl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 03:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjFSHAj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 03:00:39 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FE11A4
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 00:00:38 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-988c30a540aso58726666b.3
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 00:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687158037; x=1689750037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMrqhOmlYjr3CsiKOPMApGZVFUdNvXXzMH8RRQR9SBo=;
        b=gRNXmtBtp53/JI1qbjCmW/EGDGt/iMPRvcxCm+fL38zqAjrb8riGH6SdDR8ZFXh8+s
         +g9KmmTgErl4NyhYnvAJ226EPktiSPSNPH7DgA7kF3zHw/4mYC/6TQzgP1Xg8FLKtkkD
         CmIj6nnjemehAP5fQhc26wYEzk+3X+5wS5D2qokJe4LU4XJ9go+craozn7QkmOur458L
         pKkVcsO2B6m7Ojk8m+pldwODYC9bdtqPhe1Q1AzT7Pn6IMCqvQxTlD9wONR3f/NJh755
         YyYBEAbG3xw+wjm+Vr1yFatM+lXblh+gTB4hbpQwVDZMtEo0guLFiV35VtZczPcmNRi5
         zO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687158037; x=1689750037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMrqhOmlYjr3CsiKOPMApGZVFUdNvXXzMH8RRQR9SBo=;
        b=dyC2hxdsTMrwz/93qCupY14hOLnOIX68GWm8QfdnPcoLjtvGZr3TVjGHe+pLzg9IWO
         NZIO4PIWynsJtbNSwljtPsVnLUca8SRhtoOyGOsexYQmr51Q1IJxoDXfJofPwVhIf1Fv
         lvcDul8y1Jhl+S6bE3QPM63V9Rbrs2D5LoOhSufT1jlJ4z/eTw1B8h6f0yCEz0Gl4lFc
         YZq5Cq0VCPzLOsFZ3iKVuCHMQt5JsS8r6KzJP/8Ks4r0+3n0KaxNI9XM479zsTYnI/j9
         0zZXr83H1TkhKsmUin5gvi4opg3MyMd8l9sSCzzLY+s13NtxkkLgsrMzvB4l/GQg+SYX
         dK4Q==
X-Gm-Message-State: AC+VfDyj3irRqq5X3mnSZyHQx/Stl5CdKTdJGftjwNTMb9jqMNeb+ioa
        cnxOG1BWyaGyDfnyHErpmfs0bQ==
X-Google-Smtp-Source: ACHHUZ6AlPAXtrfg+1lhoD+C0v75gcko1YN92wwqTA01JUafHGUycqGUdXE3+R8QqBTqZqCD1FCjBg==
X-Received: by 2002:a17:907:7243:b0:986:3783:2949 with SMTP id ds3-20020a170907724300b0098637832949mr8506222ejc.52.1687158036982;
        Mon, 19 Jun 2023 00:00:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n25-20020a05640206d900b0051a594b4eb2sm1103917edy.60.2023.06.19.00.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 00:00:36 -0700 (PDT)
Message-ID: <bd4da934-72b7-67f3-0c9c-c18d3af16e7d@linaro.org>
Date:   Mon, 19 Jun 2023 09:00:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/3] ASoC: Add support for Loongson I2S controller
Content-Language: en-US
To:     Yingkun Meng <mengyingkun@loongson.cn>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        broonie@kernel.org, lgirdwood@gmail.com
Cc:     linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Dan Carpenter <error27@gmail.com>,
        kernel-janitors@vger.kernel.org
References: <20230615122718.3412942-1-mengyingkun@loongson.cn>
 <cf2f3bc9-3141-8d7b-b57d-73eac70a21d2@oracle.com>
 <6901166d-387f-24de-6ffd-1c8eea724718@oracle.com>
 <325dd825-6fa5-0ebc-4b7e-7acf2d2840e4@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <325dd825-6fa5-0ebc-4b7e-7acf2d2840e4@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 19/06/2023 03:45, Yingkun Meng wrote:
>>>> +    tx_data->irq = fwnode_irq_get_byname(fwnode, "tx");
>>>
>>> Smatch detects that tx_data->irq and rx_data->irq are of type 
>>> u32(unsigned) so they can never be negative.
>>>
>>>> +    if (tx_data->irq < 0) {
>>>              ^^^^^^^^ This can never be true.
>>>
>>> Should irq be of type 'int' instead?
>>>
>>>> +        dev_err(&pdev->dev, "dma tx irq invalid\n");
>>>> +        return tx_data->irq;
>>>> +    }
>>>> +
>>>> +    rx_data->irq = fwnode_irq_get_byname(fwnode, "rx");
>>>> +    if (rx_data->irq < 0) {
>>>              ^^^ Same problem here.
>>>
>>> Should irq
>>
>> Should 'irq' be of type int instead?
>>
>> As fwnode_irq_get_byname() returns a integer.
>>
> Yes, you are right. I will add a patch to fix the type of 'irq' to int.

Run smatch and sparse on your code before posting. It would find such
trivial mistakes.

Best regards,
Krzysztof

