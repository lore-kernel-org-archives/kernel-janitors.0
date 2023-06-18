Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182FCEB64D8
	for <kernel-janitors@archiver.kernel.org>; Sun, 18 Jun 2023 08:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjFRIAE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 18 Jun 2023 04:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFRIAC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 18 Jun 2023 04:00:02 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EF710F5
        for <kernel-janitors@vger.kernel.org>; Sun, 18 Jun 2023 01:00:01 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f90b8ace97so6340855e9.2
        for <kernel-janitors@vger.kernel.org>; Sun, 18 Jun 2023 01:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687075199; x=1689667199;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpH7soYjZvM77RERx/MOosU4hmkZgNMVHlOhKQrkCCE=;
        b=BzXRjipSOBn/qZjPJHyPfEk4seHo6gkrRv0NIlncTSvDqxtzEHVhVoQz3UVkEdszir
         NIkuGzIJ010PjCDsenmIe0Gtd9P7foW8obo2eWqcn8t9b/7Q7DD7XQ74h52uA8+0AzUm
         /egHR6SQVZ2v7yDB97FyiyFD6/VMOVSuw1Vm/mGDKfaSbE+7kqjDYOn6IreCX0uHgCLr
         QSVceqyr/2cnkrAiM7oNk4wDqv/WCwLADu5e3eM9U9ynOB3znvob/pFODvV/W65hsa9H
         6+F3fXGCeGSAGRFzd4lGcgRGdvPhmeGlxYf8kalRWBjWMMcx/m50Hi7VoeWR4iDT8WYA
         mbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687075199; x=1689667199;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dpH7soYjZvM77RERx/MOosU4hmkZgNMVHlOhKQrkCCE=;
        b=WRqQj/xRpMao6pZoAqDrn/+2fXMfeWWwPPq90I5JzQXDaBxaaHdMae4Y7zdmT5uL86
         EjTjW2+wL0QexN81QYnRwC1CS5MNC9s73+xAf45wpkho82F5IvS3FH9bVsZcW/EuzOlV
         Q7wpkdA+ZoTjXwbqvHL1YcPfca7NABMqZuW6TNS/P1pP7rZyD/X/kZfCtrU60GHgxgFF
         tnaAFBb0yhjePuWW8XYIMdCTmXnE4uD/EYZfxwgL2+JOAdm9W/mOuC3rcf5je/7R/mUS
         DENFxbDtdIpKM1d8LA5l6wtJxgnJzTmrEFqgu6H3nDjq6rpuuWEYwBEybdGT81uNwUMQ
         lHfw==
X-Gm-Message-State: AC+VfDzBYH4fVbFwMkfVYE+Di+/+DtUVVzc/goDs6sYs6O4gg9LgSAfB
        3jiQC90zD80SunKl9Fn4X51LpQ==
X-Google-Smtp-Source: ACHHUZ5Y9STNFgg5ks1RsYRVVxGur5Zs9+djrPWC8XF4xIEQvgI6/3qm5R1z5bA6XnrtYKUuG0NlfA==
X-Received: by 2002:a05:6000:1008:b0:30f:c1f5:e91e with SMTP id a8-20020a056000100800b0030fc1f5e91emr5853992wrx.27.1687075199414;
        Sun, 18 Jun 2023 00:59:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id x22-20020aa7cd96000000b0050bca43ff55sm11862998edv.68.2023.06.18.00.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 00:59:59 -0700 (PDT)
Message-ID: <95c66851-e570-353a-a174-7a885f7fea01@linaro.org>
Date:   Sun, 18 Jun 2023 09:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8150: Fix OSM L3 interconnect
 cells
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
References: <20230617204118.61959-1-krzysztof.kozlowski@linaro.org>
 <78cc123f-3899-5102-09bf-b00d95311475@web.de>
 <b00a058b-035a-a792-cd3b-e1501e824b47@linaro.org>
In-Reply-To: <b00a058b-035a-a792-cd3b-e1501e824b47@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 18/06/2023 09:58, Krzysztof Kozlowski wrote:
> On 18/06/2023 07:47, Markus Elfring wrote:
>>> Qualcomm Operating State Manager (OSM) L3 Interconnect does not take
>>> path (third) argument. …
>>
>> Can such a small patch series become a bit nicer also with a corresponding cover letter?
>>
> No need.

Ah, I forgot you are banned.

Best regards,
Krzysztof

