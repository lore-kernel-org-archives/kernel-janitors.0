Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F202AEB64DC
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Jul 2023 11:34:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjGCLeu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jul 2023 07:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjGCLes (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jul 2023 07:34:48 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8008C6
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jul 2023 04:34:47 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51da8a744c4so4835315a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jul 2023 04:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688384086; x=1690976086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=op6mQcm4JLOM9l+53MHx6V+IW+ZpBdMwi+OgBoLHHDo=;
        b=nJbw3EYLLN9fys3o29MLFKjTRT6T/eF0xMNckBtLtj0f7pGU38o2tN0P8IgWMQjO96
         wV9R2G6BHzYrDE5GPXw2omslyV1dG/NmJ6I6iXXq3TNUKWCbfm7G83wgD/P3rNiT8cxV
         7g1+C1MxFH7h5WyrO0Bi3lZgWvfgrim/Qt6em+N57+0dXf53t9TavEMxMH5Sdk8bVsu2
         TZHUxYuxHK8qdu7XmcWmSbVVaCub1vFm74IKzR0G6dgdHd7E2Uimx/wzqpKhoORm+pQq
         Y1253oIa20ZL4bUVlVpOMqETvC6OqPwxY13kZp/NAY3fSQJpI6lLjdLuDmO4Z67F4avV
         wAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688384086; x=1690976086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=op6mQcm4JLOM9l+53MHx6V+IW+ZpBdMwi+OgBoLHHDo=;
        b=Thbj+G84O98msnLEpgyQwaF7SpTKkWjKRLuR105eped6zctUKPOF5lLL2LysFE5nOk
         7RZ6sbyAIuiKNWpq6fubhYA0gjFDzLaS4e9CRq5T1yd07EMIW2scjZZdNa3sBYrle89+
         xq799HWaBn4DbZKLPj1P+Zwxx9TxWMM+9QiHWaGUbhxP5LNP9ces42GqKMhM0aVOkgDG
         yXuESi/QR1Qb/glRGed5yYZ9uaLhkDah3Q006Bmf7Zio5PGzVIEB7EAx0M3P5QyRBw5x
         DIfWjLzEsmkjwZKThQc+aCmsItLzZxs0+Hn+QnSp5OgKiG4czMPFPEQ9K8JBwwN/uEU3
         tAqA==
X-Gm-Message-State: ABy/qLZdgT711Vp4sH75vzJgnw3+D8m/HaCZqb/KaQ+g+7v6+PzgwUPN
        f1/9EZkdrrhreLFdlNVIyatrgQ==
X-Google-Smtp-Source: APBJJlHw9F2VP9lgn05Vy8TBj3boa7p7E1HJ5XSqFNGTAcjnHaRVlL+3f5SWyYttgPyY6M6OCPUkLw==
X-Received: by 2002:aa7:d98e:0:b0:518:721e:f594 with SMTP id u14-20020aa7d98e000000b00518721ef594mr7409699eds.37.1688384086239;
        Mon, 03 Jul 2023 04:34:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d25-20020a50fb19000000b0051ddfb4385asm5229702edq.45.2023.07.03.04.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 04:34:45 -0700 (PDT)
Message-ID: <19a9fcdb-7ac9-c84f-56cc-940fe3548798@linaro.org>
Date:   Mon, 3 Jul 2023 13:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4] arm64: dts: agilex/stratix10: Updated QSPI Flash
 layout for UBIFS
To:     Conor.Dooley@microchip.com, Markus.Elfring@web.de,
        alif.zakuan.yuslaimi@intel.com, kah.jing.lee@intel.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        catalin.marinas@arm.com, conor+dt@kernel.org, dinguyen@kernel.org,
        robh+dt@kernel.org, will@kernel.org
References: <20230703083626.1347969-1-kah.jing.lee@intel.com>
 <59da2f49-706f-0a08-df14-71ad0326da83@web.de>
 <a786b6b9-3923-0138-5738-dc20e14aa0f3@microchip.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a786b6b9-3923-0138-5738-dc20e14aa0f3@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 03/07/2023 11:08, Conor.Dooley@microchip.com wrote:
> On 03/07/2023 10:00, Markus Elfring wrote:
> 
>> …
>>> ---
>>> V4->V3: Drop cover letter & remove unnecessary marker line
>>> V3->V2: Update commit messages
>> …
>>
>> * Do you find the arrow notation helpful for the version identification?
>>
>> * How do you think about to avoid duplicate data in the version history?
>>
>> * Would an other listing style become nicer for the “patch changelog”?
> 
> This is a complete waste of contributor time. Please stop.

Markus is banned from the LKML. Just ignore the comments.

Best regards,
Krzysztof

