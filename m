Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97507E7F14E
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 13:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbjI0NES (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 09:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbjI0NER (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 09:04:17 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0CDF4
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 06:04:16 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-533d9925094so9682886a12.2
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695819854; x=1696424654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5FGMCXjK97t0KDbkIydKrPdt/exqLdjKSR8JkGnaWE=;
        b=JYQdty17dED8Z2ALyny+iyYKPa7/bh92uuuwy8LcqK2oZmiPSbF+6i9OCSYTTxL+38
         eqLzt/EqkUQLYosrzSahfCuxCSkJyRvsjiKr7dn3paaTyz2lVrAzNqluy8DefeVElrtB
         BGJT68rmslVBedTKW4N+SD0S4LkGIsz9cOXMIowvq2i5gKSq8KjxEi01oyuAGVE42rCo
         x0G6+/BT50pDomwL55tm5a2YFA1NvrMzhSN2XcOcOzVpPPkUw1kuH6ouEUfjOLf+8vpP
         USsiZ7Ow5e+JXUWG8MZk9BDcn4Fmn/Lkv49Q00fEQg2oKzCFPBGGIqcuPxW6XplCwH4T
         skdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695819854; x=1696424654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5FGMCXjK97t0KDbkIydKrPdt/exqLdjKSR8JkGnaWE=;
        b=Dg+SlL7ri+s3q4LokhJHc4aLicEE+OZH9bSmydG0ZbBwKVbuF/dMBhC3CH2gDydJEc
         BZUIPFKlAPK9MmoaPb7Q/K4HLgiIBPomVcnGUdokF8VnZwBIt+1/PH2KYOTn4RWU4rpi
         NRzP6INkLlAovHhjPiql/And4qjFClHPfNpyGn92GZFhzH80W90/5aKBJB3AxSu+bU4D
         Q47aEKt0N20GFrI4OKWq5dfwlXAhO/cf9u3vw6Z/7BqVk414aW6WtW5L9wxMF5I6cgB1
         hgrnq+99yUxj9uYzatXO/E6ky6ZBqI8fBNvSZn+ydZKLCcLFe/NvIfKU8jDt2dECy0Oz
         XzaA==
X-Gm-Message-State: AOJu0YyVQjMaJ8l7Q4KaTQMjJ7djXgd/dT3rknRqgG+CO3OplWdlgSpz
        J14HHhPn8ZgVmcuQIk7vmwY2jfZ+mIBz7mSVb7PlyA==
X-Google-Smtp-Source: AGHT+IFzaiXwnn9wT5Q5UHNUWK97GxPHYiYyPx70BVxAhmgwGPV5b/9KqR6AsJlHUGpT0+Bnk5ZDLg==
X-Received: by 2002:aa7:c684:0:b0:533:f22:17b9 with SMTP id n4-20020aa7c684000000b005330f2217b9mr2195451edq.19.1695819854493;
        Wed, 27 Sep 2023 06:04:14 -0700 (PDT)
Received: from [192.168.33.189] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id o5-20020a50c905000000b0053448f23b33sm912616edh.93.2023.09.27.06.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 06:04:14 -0700 (PDT)
Message-ID: <c17d93d6-72cf-4ce3-8927-b99be3c53bb5@linaro.org>
Date:   Wed, 27 Sep 2023 15:04:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: mm8013: Fix an error checking issue in
 mm8013_checkdevice()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Konrad Dybcio <konradybcio@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <c46b4408-bf1d-408d-9e6b-16b0ad272532@moroto.mountain>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <c46b4408-bf1d-408d-9e6b-16b0ad272532@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 27.09.2023 14:41, Dan Carpenter wrote:
> There is a missing "ret = " assignment so this checks the same "ret"
> value twice.
> 
> Fixes: c75f4bf6800b ("power: supply: Introduce MM8013 fuel gauge driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
Oh that's a funny mistake

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Thanks!
Konrad
