Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97622C7618A
	for <kernel-janitors@archiver.kernel.org>; Mon, 20 Mar 2023 07:37:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbjCTHhA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 20 Mar 2023 03:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjCTHg7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Mar 2023 03:36:59 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2B5B477
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Mar 2023 00:36:58 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w9so42977091edc.3
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Mar 2023 00:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679297817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1u1keNrwlSxZAkuogiDlSpUUhe7tlydyWOAQpr6eUZQ=;
        b=i5YWulF8A13Hk2/Fuq9ts3lAKcaK4to9nIq9nroeit9Akcy3epLW2uJ5w6it25FK43
         Z6ENW1Ns41950R96kAqJGRu4St5J2XdKp85FN92vs4n4dnh531BCajjP9pjuFyu0KAhN
         ZVvAyIXF+P3/rjgBe3KMOzh5j9TjUG0n4a2w5czc9jafFeaX2Q9jooBYLcJBO1xVrhXY
         HZl2hj2Gpnkj7+n41E1J1YsV+FjgEgKwHU905b0UzVAn+kl4PlECIaRMpMYrpnAKbZq6
         SxwD9pBjPns94eiENlpOj8SXXHCMmUDBxm7EtXrDNsHNB0yzbBqJkRRsMzA+tVH1ZJiC
         v3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679297817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1u1keNrwlSxZAkuogiDlSpUUhe7tlydyWOAQpr6eUZQ=;
        b=DxOP0ebtNGD+U3kHe+H4LqxuNTgdDbsAW+oYaUlTL2WSwaynaV5MRWXKimMdLopwU3
         4M1HkcvP/vX+DQJDoz/7PS8pfO2+Q32luDowNLurvOyluMotp7Vu22s7n8vhdrjaKC9I
         Vvu4ds0tj75Lf/Z2G8HyLVCIg9gNhhjJ8FVQNP0W6Y4p4pjP8SfCvvtSN9/ijd1wIFnA
         qfyg1CyC2isoZlviOWONicTipiaBmH4sJzuYZuIz4sWDiS0vON8vw6O0clqSEClQJmL1
         iwVWlWTZ2k6GoTV/KL2z3I9UwARZ5Q2XMQ4OmiWsDiSdPmviIN1fwSGzuRD4j1b6dZ3D
         hPtA==
X-Gm-Message-State: AO0yUKWae8G3Gsm3hzYSqS2KMuy5O5TBZ204x5zAtIyKPJSQ4rn74QCU
        8u1Oyh9kz2sOsuQ5Y4LrYmhrkA==
X-Google-Smtp-Source: AK7set/t+53oOOD8eIyQPbZd6RDd9nOYzNrI9c5ak3LVckOfd3cTjKFbFUi1el1Yx5F45xPvoX28uw==
X-Received: by 2002:aa7:c858:0:b0:4fd:2a29:ceac with SMTP id g24-20020aa7c858000000b004fd2a29ceacmr11280938edt.14.1679297816830;
        Mon, 20 Mar 2023 00:36:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4428:8354:afb6:2992? ([2a02:810d:15c0:828:4428:8354:afb6:2992])
        by smtp.gmail.com with ESMTPSA id u27-20020a50951b000000b004bf999f8e57sm4426183eda.19.2023.03.20.00.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 00:36:56 -0700 (PDT)
Message-ID: <34cb347f-17cf-3da1-b484-0c793ae8c5db@linaro.org>
Date:   Mon, 20 Mar 2023 08:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] MAINTAINERS: remove file entry in NFC SUBSYSTEM after
 platform_data movement
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <simon.horman@corigine.com>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc:     linux-nfc@lists.01.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230320073201.32401-1-lukas.bulwahn@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320073201.32401-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 20/03/2023 08:32, Lukas Bulwahn wrote:
> Commit 053fdaa841bd ("nfc: mrvl: Move platform_data struct into driver")
> moves the nfcmrvl.h header file from include/linux/platform_data to the
> driver's directory, but misses to adjust MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

