Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6705C38A2D
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Oct 2022 15:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbiJXPEu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Oct 2022 11:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbiJXPEX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Oct 2022 11:04:23 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76235B448C
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Oct 2022 06:41:22 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d24so8476084pls.4
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Oct 2022 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Vr0nqHCGrm+b68s/C4QPay7OOdjkPPEqnfDL2I3xZ0=;
        b=A1zile5aaiGOv1/6LYGIIS7rWZdNf/REZ+C9UBtfg9OfpCOGjXnhycbBfjdSe0JOyu
         v5qzJjdxIPLQzNoFIOLcH8aiLZMksx3Tj6Nur9hpg9fEaWvP7WH1gT5ar8GPUQpgA5lJ
         DioVkGo5QA/KPc7eezM0ezSfhiofM6Pb9FiueqjTZj7jQ/qNViyLM0EuJoUXoo8FQbGG
         N7zpmFdBC9U18lnuezv9+We3fEpYv6ZvxzaOMEglGMbyGuOucIIcEoZ1vQEwbdbY0HRA
         4C9EJiEr8dTf62+r9YQ3C5gn+n6uMmjDlqJSHPRWR60LM6ro/3Du7SUX9hoCoCevjEWv
         qhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Vr0nqHCGrm+b68s/C4QPay7OOdjkPPEqnfDL2I3xZ0=;
        b=Le2ho9hPCK3RH12XmIDQaFKBPx8ep8C4fHT/Tk4Do8wCPkPADQuRUXA7sUZbI/X2Z3
         V1MgdRmgpAETmZDkO4e9SMpuUtZrUScQScrW6OUkuDsUlYM0jQjhFquP8gG0So+4SfoC
         52zXpowfyS2RCQ2ZPAr8chpz3QQf3LAkuahldq+NEwpoVxxQZljDrbt4ZswO/y6JzR2G
         yJTgzE9sBZowiQBpzi2GUL7e89zZ72AhBGyZZJ5lZJI/bDM2fo1s46DmAN0hX2OQXvX2
         T9LB4bix8Q1zCxml2lhoXbjP1hUl0C+ean/fuxltCHidRUsat556mgpNyh66ZNFJLHem
         yGkA==
X-Gm-Message-State: ACrzQf2cCJWv9doc6Ugf1a0aW6uws+IvW0LYzzOJsdKRC78WOUrmjj0I
        afIgrkF5x01HC9Mw4F27u3/MGeGZg7bg7A==
X-Google-Smtp-Source: AMsMyM5X+kIBxudaeRFmJTdkoXGBmNzB+x8RZi8q9kq8BLojbo3cknAZE5oULo3K676hCYZUJgRcwQ==
X-Received: by 2002:a0c:9151:0:b0:4b1:8375:46d3 with SMTP id q75-20020a0c9151000000b004b1837546d3mr28530283qvq.122.1666618142903;
        Mon, 24 Oct 2022 06:29:02 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id cn15-20020a05622a248f00b0034305a91aaesm12586522qtb.83.2022.10.24.06.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:29:02 -0700 (PDT)
Message-ID: <a7693e48-f16f-9577-8685-417f21706d1b@linaro.org>
Date:   Mon, 24 Oct 2022 09:29:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] pinctrl: samsung: remove variable pin
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024131527.2156810-1-colin.i.king@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024131527.2156810-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 24/10/2022 09:15, Colin Ian King wrote:
> Variable pin is just being incremented and it's never used
> anywhere else. The variable and the increment are redundant so
> remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks for the patch. The file is being in process of dropping (patchset
is being reviewed), so I think we can skip all the fixes.

Best regards,
Krzysztof

