Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A26FC4332F
	for <kernel-janitors@archiver.kernel.org>; Sat, 19 Nov 2022 09:21:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiKSJVz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 19 Nov 2022 04:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiKSJVx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 19 Nov 2022 04:21:53 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0D27461F
        for <kernel-janitors@vger.kernel.org>; Sat, 19 Nov 2022 01:21:51 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id g12so12813537wrs.10
        for <kernel-janitors@vger.kernel.org>; Sat, 19 Nov 2022 01:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUzIPxlxra6DljK9tSe6IPcPHBmaOhu/eScFMsp8Ve8=;
        b=uDjcHBPAg95+IzHyuT8NVXJo6TR2ZCEsufUeOlaDYdN3SaJbFKqMrTguXHu+30gRg3
         uK/xkILEHjG59+nyNinDmkw8i+VxaywMf0ptWmfrCaCfO6Y1bT69e8jLKSLrDdwCwl/S
         9F9Xp5SwM3vDOMM+//OEZsttYCtDrQJvGWhHY2o0zZcTcfCeiB8peMbjjCkQlGlxo/T9
         HGzMbOCN9s3Oxsx7Cx0tMhFygOMidhR57BC4m5IjATn0VvqjCNRDDu4QtDc6dsdOfAH2
         mObKu5Ad7a4oXz5KSy6fBEg+GVGzDlgJIiFrx6gRpJFybKo7Kgi9ZlWZhGs1hZHvgGWa
         4oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUzIPxlxra6DljK9tSe6IPcPHBmaOhu/eScFMsp8Ve8=;
        b=zPqCPI0xdMGeaeuviCppnPIIZpBgJYij/lJ3/q+W1wXDKQKCuR/5JrODoTFHWvVgzi
         KSbw2ihHupleKioRiNMoDhoY1tcqXscQ0kYU7yLy7XZd3gObQbH8HnkblJf0uUYS39R6
         aMNs4sjyEBdqmqNL/yttnbs6NNiEYy2b76ewZ1Ih/MOdPj8u/bmeHtjmggOH4+2dMbCy
         cqK7hLMqKJJJMQoptmUEV+ejOpbAVJnCQaP/AsJxlPni3jK6wt2SKBOVbyZ4+Dv+kxCE
         Q4FfFcPf+muZA91I3ris1B4FbrY+syo/OTGMmfb0s8bggepQN1+S+E3t46ZI/3Ka+zfm
         ye0w==
X-Gm-Message-State: ANoB5pmb81EGzI5h7sQD/HX2mhDF3pGIA6MSR1q7dhxnztQdTQPRhkJ3
        hdJgW/F2bJE8XQxLwj55NG4G/rXmj34gH8LbO4c=
X-Google-Smtp-Source: AA0mqf7OY4J8uc3oUtDD7OZPDbOp0AWli9BHTMjXwd8dT3y5c4O2q+23HAcOABdGlywkjYbI/hyVAQ==
X-Received: by 2002:a05:6000:883:b0:22c:d6c7:562 with SMTP id ca3-20020a056000088300b0022cd6c70562mr6283967wrb.8.1668849709883;
        Sat, 19 Nov 2022 01:21:49 -0800 (PST)
Received: from [10.211.55.3] ([193.115.242.51])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm18423799wms.3.2022.11.19.01.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Nov 2022 01:21:49 -0800 (PST)
Message-ID: <8d3eba21-7950-7179-91f1-75a2529117e0@linaro.org>
Date:   Sat, 19 Nov 2022 03:21:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [bug report] net: ipa: reduce arguments to ipa_table_init_add()
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>
Cc:     elder@linaro.org, kernel-janitors@vger.kernel.org
References: <Y3OOP9dXK6oEydkf@kili>
 <b30d04f4-db62-6a65-f35b-de7b979e5e65@linaro.org> <Y3W83708rvg1Krvy@kadam>
 <Y3dVcNt32yPgP3EC@kadam>
From:   Alex Elder <alex.elder@linaro.org>
In-Reply-To: <Y3dVcNt32yPgP3EC@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/18/22 03:50, Dan Carpenter wrote:
> On Thu, Nov 17, 2022 at 07:47:27AM +0300, Dan Carpenter wrote:
>> Heh.  It really feels like this line should have generated a checker
>> warning as well.  I've created two versions.  The first complains when
>> ever there is a divide used as a condition:
>>
>> 	if (a / b) {
>>
>> The other complains when it's part of a logical && or ||.
>>
>> 	if (a && a / b) {
>>
>> drivers/net/ipa/ipa_table.c:414 ipa_table_init_add() warn: divide condition: 'hash_mem->size / 8'
>> drivers/net/ipa/ipa_table.c:414 ipa_table_init_add() warn: divide condition (logical): 'hash_mem->size / 8'
>>
>> I'll test them out tonight and see if either gives useful results.
> 
> I modified the test to ignore macros.  Otherwise we get warnings where
> macros are trying to avoid divide by zero bugs.  There was no advantage
> in treating logicals as special so I dropped that.
> 
> The results are kind of mind bending.  I think maybe people sometimes
> accidentally write "if (a / b) {" meaning does it divide cleanly?  When
> that should be written as: "if ((a % b) == 0) {".

Interesting.  I looked at the first few.  I think the nvdimm ones
might be using "if (cleared / 512)" to mean "if (cleared >= 512",
and in that case, the >= might actually be more efficient than the
divide.  On the real-time clock one it looked like a similar usage.
Regardless, it's not a typical idiom so I don't think it's
straightforward to understand.

And you're right, I saw at least one example that looked like
it was using divide when modulo was intended.

It's not trivial to understand the intent where this occurs
either.  Maybe that's what you mean by "mind bending".

I'm glad to have helped identify this case.  I hope it leads
to a few things getting fixed (or improving).

					-Alex

> 
> Anyway, attached.
> 
> regards,
> dan carpenter

