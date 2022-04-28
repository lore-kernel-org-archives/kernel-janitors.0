Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5BDC433FE
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Apr 2022 09:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbiD1J5Y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 28 Apr 2022 05:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbiD1J4t (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Apr 2022 05:56:49 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDDD419BE
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Apr 2022 02:46:25 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id gh6so8515162ejb.0
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Apr 2022 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YwqsCXJ7JVb0cDlmO2fSQCEvD2i9SDa2reIL1RD24o4=;
        b=jkPXkgWoDMspMJID8QOz7PTAiGzURkbzX6udqYQhdIklSx0H6ZKLRBzsGAFZjxPo/7
         WoTU++jJ7H7+Bzu42fAWiedTZozqAgLEQpS3GgRyKKXuHKXxlLiE43PRUfvhClEyZvAm
         mG0c4LIWM4ahdEyfPnL1sWzohseB44eOM52ms+GdXTwEEoU7Nd5irdiHSv2MJjkqBEVx
         gTSk9nUDHY2jwjoblA53pfAft1JDc/DbjSBn6EAoFys7W6t4LX7UCqvx+f6bPVOwGwTM
         eZt8BJYJTGteFzlbF9rQYg1ru8zl4PUaiHsehfwTmnHm9F/29+sd0f5uB63hchBc0xAa
         d+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YwqsCXJ7JVb0cDlmO2fSQCEvD2i9SDa2reIL1RD24o4=;
        b=r3g0dabEKefDiGvS56NOG+IjSUzjTAs9B2/2+A+lgWvXtV4W7brjQ10kb2IN18++oM
         VrUzP2MLWoebd7uURKiFD4goohmJdPtva1XosaG+tFY4qFwR0vFWdKe9Rcpmmsts4/Mc
         Ah8X27gb1VYYZTLLKAAGCH0e7azoK+AdpjplkHTpboM8cH0Jq67NwYmBGV6YcvlhgRxP
         hvJ1e0RGhSC9D7QnqOU5xZ9jjHIcg69D58NAKZ7z5BAqRxtTrvTgH9CSHFI8ZT5BOMKC
         yR1uzqCf6Yo9MffZLzCYdbFBQKgZ2wbJmmIRppAh9XpV1dz+mmNnfQyctWADkCR9UF9k
         f2kA==
X-Gm-Message-State: AOAM532HRzZpVJM1k/rfFFFOOp0pJ6tvCCNAr9TR4BgdhNeGSMi1FAwb
        uCkmA6WY0xTJW1oqrOFISSlREw==
X-Google-Smtp-Source: ABdhPJyXeYX5YsaN0AL8rgEW+AjBgzU+kgmQlS6dSdB2e2LZFEj26lU1LZiHxK3Ro443TZ3KLTs6Mw==
X-Received: by 2002:a17:907:7f0b:b0:6f3:5ed1:d296 with SMTP id qf11-20020a1709077f0b00b006f35ed1d296mr28729391ejc.177.1651139183914;
        Thu, 28 Apr 2022 02:46:23 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k13-20020a05640212cd00b0042617ba63d6sm1275971edx.96.2022.04.28.02.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 02:46:23 -0700 (PDT)
Message-ID: <f2f69e12-ce3b-d9e7-0771-362e748d8ae4@linaro.org>
Date:   Thu, 28 Apr 2022 11:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] rpmsg: qcom_smd: fix error code if irq_of_parse_and_map()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YmpgTNlE/niOL8E6@kili>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YmpgTNlE/niOL8E6@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 28/04/2022 11:37, Dan Carpenter wrote:
> The irq_of_parse_and_map() returns zero on failure but we want to return
> a negative error code.
> 
> Fixes: 1a358d350664 ("rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, I already sent a fix for this:
https://lore.kernel.org/all/20220423093932.32136-1-krzysztof.kozlowski@linaro.org/


Best regards,
Krzysztof
