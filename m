Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2A2C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 10:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbiKOK4I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 05:56:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbiKOKzl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 05:55:41 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C962613B
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 02:54:23 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id d3so17019020ljl.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 02:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LcdMK6pyq6QRrGL0Z9BG95K8ZsYDf0IuGpvJl7z2gQo=;
        b=SqiVoxqjHssIuk0phQrkPORoueZJcLR/XFveKKnHYiZEi83mz3Yv6iHgpU4fy1ye3t
         wKV28TJiB+5gcqJFbgQLl2KdMhcaJSAyyte7nADjJR3OBwejSeTNCGE3YuKRmWr3P/BR
         Ehnqv/13JgxdeQE4zvqdXrsWf/aajirXtBQMbLIw+m07Bt6Kopdu1MBk7C9zgWWqxkQZ
         CiaRp+OKx9CJsmiUwnbLXZBdggjms9VdnZ887iAfvKWcuy/MgxiKEMQDS8bST53yA9/t
         PIB6cXTFfsJ5K/IcXNg1s2D0t9BxrKrvGsctf5V5DSnvih7KCEs3HwJa00MG2riPYIe6
         jeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcdMK6pyq6QRrGL0Z9BG95K8ZsYDf0IuGpvJl7z2gQo=;
        b=c04WOW7I67xrrdtnzWROD1epzI0lZf2qLFz4JH3oQbfa1Wfyd+shc5w9n0il3JT9nX
         JLVAWekEC0Korii0yqm4+O+8WDumDVcUdhsETdT5a0uXZSu7hGYf7RACPdzRW3+xYSR6
         sODvZiM/8Tt7dPRr0fC2S4BzshcqdhDMqJtmuU5V+fpyCOZKNBwVNIIe4giOP5gNQ+TF
         7BLAnTvJh6DJjNRf3ZVQCjT3eYlxmskbA0uQYP30HN9+M00s/7lTtA0VFiSIaD4EgBkj
         tUYXEVDYtmLJnZjf8uH60gOzITNrbffRoWOSYQO4RyBUkQ2gAr3Fe7myyw2ZYAf62fWV
         Tm2w==
X-Gm-Message-State: ANoB5plHTg7+0AiNaZXnilh5vk/R9P9s9wXqLAmkJjOrTfujXkfPV8Rk
        oT7J9n7OvJD2dW7EYZb3X7Zc8GDUc28lbU+B
X-Google-Smtp-Source: AA0mqf54UoATcbcODLPVTFYROSL09YrLMVi1vrCB9iC5LjPXeUx5nxpm7ns+BmA/Ry7vjKAgLndhYQ==
X-Received: by 2002:a05:651c:17a1:b0:277:f8b:bb4f with SMTP id bn33-20020a05651c17a100b002770f8bbb4fmr6158885ljb.161.1668509661805;
        Tue, 15 Nov 2022 02:54:21 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c8-20020a056512324800b0049a5a59aa68sm2182351lfr.10.2022.11.15.02.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 02:54:21 -0800 (PST)
Message-ID: <0eb1a6a5-771c-6cc1-f95b-9708468f1d90@linaro.org>
Date:   Tue, 15 Nov 2022 11:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] MAINTAINERS: rectify entry for MICROCHIP USB251XB DRIVER
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Richard Leitner <richard.leitner@skidata.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221115103153.28502-1-lukas.bulwahn@gmail.com>
 <c21e0e3d-5970-d905-3b6f-54a1ddacd052@linaro.org>
 <0750d2e8-766b-3c5c-5472-4c9d6e9ec3c4@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0750d2e8-766b-3c5c-5472-4c9d6e9ec3c4@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 15/11/2022 11:52, Marek Vasut wrote:
> On 11/15/22 11:35, Krzysztof Kozlowski wrote:
>> On 15/11/2022 11:31, Lukas Bulwahn wrote:
>>> Commit fff61d4ccf3d ("dt-bindings: usb: usb251xb: Convert to YAML schema")
>>> converts usb251xb.txt to usb251xb.yaml, but misses to adjust its reference
>>> in MAINTAINERS.
>>>
>>> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
>>> broken reference.
>>>
>>> Repair this file reference in MICROCHIP USB251XB DRIVER.
>>>
>> You know this could be just one sentence (instead of three paragraphs)
>> with a Fixes tag...
> 
> On the other hand, the content is educational, e.g. about the usage of 
> get_maintainer.pl script .

Education is good, but I don't see a point to grow commit log with this.
The warning would be useful, but the command? Just store it in
Documentation if the intention is to educate.

Best regards,
Krzysztof

