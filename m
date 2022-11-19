Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35514C433FE
	for <kernel-janitors@archiver.kernel.org>; Sat, 19 Nov 2022 09:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbiKSJEz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 19 Nov 2022 04:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiKSJEy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 19 Nov 2022 04:04:54 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3747A3FBAB
        for <kernel-janitors@vger.kernel.org>; Sat, 19 Nov 2022 01:04:53 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id k8so12883918wrh.1
        for <kernel-janitors@vger.kernel.org>; Sat, 19 Nov 2022 01:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oewmiVyAqDoNzR4F6kjfWqI9ITjhYSKJBH5bmhxuH/o=;
        b=PwJny3wyEznPth61g1C3LpyGRMSLQhhZQr9BGw3a250/oOlgXMHPPCyduRhXNDiw7p
         lmiwlPIIU7F9sePqwrWbO9p/iWWd+F5Unu7KqySVLaelNiYUXsBpC+R2K9l/y+j+ZKHP
         k4xYFEFAAk89eaQL/F86xJ1PLu//OA6+iOnijKNFvCzVhQcdRRN/CkbS3Iqc10+22WmH
         aOezRblIyBX6uhEML30bgw/C0Ct8yN1Vtx6thdyf8yScvQsHHDzuslV5iD+D0hm7Y1ru
         MAReeM6gaR1gpEQdLS3eLOlSV8xgOOHWkjHJjQoLebIyUPHO3rzwqagaG+0UzLaID+mD
         ml4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oewmiVyAqDoNzR4F6kjfWqI9ITjhYSKJBH5bmhxuH/o=;
        b=p4I61HItGuzYd9dluN0UWUXIdwmNi4u+N4F7jhpsp1GIV0CrTcVeuM442BMJvSdtB8
         sUdch6XxHWUSe8NXNyF5N9mStB0FlZca98xi6smcCOTNYuhrgq3GwhtEDEMY1RBRhSFM
         T2uauDJuOWz19q18gqG6ltYcrvrqsJv01OgqdazNpMz29ix/dzGrQJSTyHy8zKNh3N/T
         rVCS628V2aPM8MxPJPFCvi1s4A6GfSbJM5irMxVm18Ybke3uoBUqFOWeNNJr51x/2yIs
         0NsjaLrj80RMgRxaE4bE5v5QELHipSeI9OCLEgLsz8hGkkHrIA5aWNrQ5NiEI7WGtWKh
         R9BQ==
X-Gm-Message-State: ANoB5pmOMrmOWXAKCMteCuYQzJkZ7Cja0nBwya8isHC3plOo7sFICMJu
        4s2BMfQS4bjVQmtjsFvdxSi+CQ==
X-Google-Smtp-Source: AA0mqf53S+uGSvtGxuT2VOkQkDqvWVH2OpASf6D3CD1ec9DZPSc7gq/cJtrXeOmvi7gKvmfSrc72kg==
X-Received: by 2002:adf:ed86:0:b0:236:4930:2468 with SMTP id c6-20020adfed86000000b0023649302468mr459384wro.221.1668848691740;
        Sat, 19 Nov 2022 01:04:51 -0800 (PST)
Received: from [10.211.55.3] ([193.115.242.51])
        by smtp.gmail.com with ESMTPSA id p2-20020a1c7402000000b003cfe6fd7c60sm6942227wmc.8.2022.11.19.01.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Nov 2022 01:04:51 -0800 (PST)
Message-ID: <847759a7-9501-194a-0314-2ec3eceb1613@linaro.org>
Date:   Sat, 19 Nov 2022 03:04:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [bug report] net: ipa: reduce arguments to ipa_table_init_add()
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>
Cc:     elder@linaro.org, kernel-janitors@vger.kernel.org
References: <Y3OOP9dXK6oEydkf@kili>
 <b30d04f4-db62-6a65-f35b-de7b979e5e65@linaro.org> <Y3W83708rvg1Krvy@kadam>
From:   Alex Elder <alex.elder@linaro.org>
In-Reply-To: <Y3W83708rvg1Krvy@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/16/22 22:47, Dan Carpenter wrote:
> On Tue, Nov 15, 2022 at 11:00:49AM -0600, Alex Elder wrote:
>>> drivers/net/ipa/ipa_table.c
>>>      413			count = mem->size / sizeof(__le64);
>>>      414			hash_count = hash_mem && hash_mem->size / sizeof(__le64);
>>
>> Line 414 is wrong.  It should be:
>>      hash_count = hash_mem ? hash_mem->size / sizeof(__le64) : 0;
>>
> 
> Heh.  It really feels like this line should have generated a checker
> warning as well.  I've created two versions.  The first complains when
> ever there is a divide used as a condition:

I agree, this is a good case to identify if you can.

> 
> 	if (a / b) {

That seems reasonable.  In a real "if" statement it is
along the lines of an assignment used as a condition,
where a second set of parentheses can be used to indicate
it's intentional.

> The other complains when it's part of a logical && or ||.
> 
> 	if (a && a / b) {

I don't know how Smatch works, but at the C parser level
it seems any divide used in a conditional context might
be worth paying attention to.

> 
> drivers/net/ipa/ipa_table.c:414 ipa_table_init_add() warn: divide condition: 'hash_mem->size / 8'
> drivers/net/ipa/ipa_table.c:414 ipa_table_init_add() warn: divide condition (logical): 'hash_mem->size / 8'
> 
> I'll test them out tonight and see if either gives useful results.

Sounds good.  Sorry I didn't respond a few days ago, I'm away
from home and am not keeping up with everything well.

					-Alex

> 
> regards,
> dan carpenter
> 

