Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E00FC47097
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 08:47:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 026F5613B1
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 08:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbhFAIti (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 04:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbhFAItd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 04:49:33 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8D6C0613ED
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Jun 2021 01:47:51 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id z17so13388270wrq.7
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jun 2021 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=322dbtM46O3QcTbghSB7BeJYNbqpaIfGRgomGDZ93iE=;
        b=zH0nyqnHcnGVmdTu3YEei5B5TuCrVSjv8yvMBbEalGkFR9tLH/LZP64768STt5ZyEy
         alL2aGOrrCgn7j9jDB44WS3AlW46a7JY3VRBxQBQnN9AhUqAZfZ37HZNLygt4a9pHaJl
         ZWMv0eoBWY5M7Zj1/uYTb2ixvr6IuGnbHs37wnikhRwNeJrcp9C/gaZEDS6eiWspZB78
         tLbPWi92pLFxpM1rBmsLdIl9dQjycXqIEucDR+eeKJtZpPUwfciXOE5SQSQvLNyAOc+u
         GTCqgIsq31lHP/Y8M/J+rDxluTNF5HgsTCs/mjqZZtC41wwqFxlGjqc849Iw7fhljdTy
         bfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=322dbtM46O3QcTbghSB7BeJYNbqpaIfGRgomGDZ93iE=;
        b=mNKcYrWvPMh8BJ6qELPtQRHPdfR8++rdN5+ci6Z1o+75NmFjmdZtv8LMglnPhcTu2L
         rzJIW1/fqD4AWWHurg9yxB9FuOChUfWPoz8W/zjYF4pdREhEdMnfoWbMVw61eeoyqdzO
         3Z70N3leG2s8VldYXScWz4fnkxztrQMoM/sX/XB90qNMuIdlzxc9CBJfkOQD4mrwvjb8
         IqpSAaH2STZ515NTEfr9vKNTeKesms1SYTrRPQzMKqnEMG8+HcjrIfSPbZJ1nCsPph+/
         CF4T2+CgvYf2N6+Vcb4Al/pDotJrdkQ6SK026eJhoj1NSYUC+adqmLvmiFdRowkkKgwp
         9x+A==
X-Gm-Message-State: AOAM5325zPee8g+FMd3OZmMMdckleSV8DhEJUe9SQE/6YzFfK53rGv20
        fU7Erko34L0bl62fyTjLUszo6S0cYa0nwIk9
X-Google-Smtp-Source: ABdhPJwHfm4W7Jg6jHlyp2IqpSdMFmvjQnAuGssRjqPaBcl0npzMlEISc9JhfpSSb8BQzxgFoo0xMw==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr26184792wrz.256.1622537269671;
        Tue, 01 Jun 2021 01:47:49 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:a3a:d001:6a80:207a? ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
        by smtp.gmail.com with ESMTPSA id t1sm2438670wrx.28.2021.06.01.01.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 01:47:49 -0700 (PDT)
Subject: Re: [PATCH] usb: dwc3: meson-g12a: Disable the regulator in the error
 handling path of the probe
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, khilman@baylibre.com,
        jbrunet@baylibre.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <79df054046224bbb0716a8c5c2082650290eec86.1621616013.git.christophe.jaillet@wanadoo.fr>
 <CAFBinCCBo4fYoO=2NiWTEixPuJo2Q=J1o1+yfi4Oc32SLi=GAw@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <455790a9-250d-ff00-6304-fd933409b1fb@baylibre.com>
Date:   Tue, 1 Jun 2021 10:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCCBo4fYoO=2NiWTEixPuJo2Q=J1o1+yfi4Oc32SLi=GAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 23/05/2021 18:03, Martin Blumenstingl wrote:
> Hi Christophe,
> 
> On Fri, May 21, 2021 at 6:55 PM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>
>> If an error occurs after a successful 'regulator_enable()' call,
>> 'regulator_disable()' must be called.
>>
>> Fix the error handling path of the probe accordingly.
>>
>> The remove function doesn't need to be fixed, because the
>> 'regulator_disable()' call is already hidden in 'dwc3_meson_g12a_suspend()'
>> which is called via 'pm_runtime_set_suspended()' in the remove function.
>>
>> Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> for me this makes sense so:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

> 
>> ---
>> Please review carefully.
>>
>> I'm not that sure about:
>>    The remove function doesn't need to be fixed, because the
>>    'regulator_disable()' call is already hidden in 'dwc3_meson_g12a_suspend()'
>>    which is called via 'pm_runtime_set_suspended()' in the remove function.
>>
>> This is more a guess than anything else!
> I am not 100% sure about the suspend code-path, so I am hoping that
> someone else (for example Neil) can also review your patch

Not 100% sure aswell, but the probe function is wrong anyway and must be fixed by this patch, so LGTM.

Neil

> 
> 
> Best regards,
> Martin
> 

