Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FE0C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 13:32:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 332D0613EE
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 13:32:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236602AbhEJNdL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 09:33:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43331 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345188AbhEJMWB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 08:22:01 -0400
Received: from mail-qv1-f72.google.com ([209.85.219.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lg4u7-0003Jg-T8
        for kernel-janitors@vger.kernel.org; Mon, 10 May 2021 12:20:56 +0000
Received: by mail-qv1-f72.google.com with SMTP id a6-20020a0ce3460000b02901c4f39aa36aso12335521qvm.21
        for <kernel-janitors@vger.kernel.org>; Mon, 10 May 2021 05:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y+brPHK6z0qfj8MD7JTAIcwTm+x3W3WlQXIOTpGxTZ8=;
        b=TaNREt2h5GF7p0j0C94gRsiXgF2j7x8mzkCMWQ/ZAI1W3LEdYnhaK2dznFXTEAUte1
         dOG0HHLQIaxn3jZnf4TXMQx5o9a985C3l+PjCRYPf47UnsS2PwID+Kt8IhBbhyI9uNGg
         zOdCvySZ7NKjlkMf2HIjNseSq/6SJXCAi2PSEmYOTGyH9gQc4qnI0ZiVhod4F4xtABby
         g8UH3Jpo382S32L8f3UDeSumSADDVqjesQhVjJLCg8zQGhthE8k8qy/rIK5ZFU2x/VKH
         OpR5kW+UCxghZ6j7I9nZm5+DdDFyglLE4gjq6MJu+iaaIg6IubLJW3Q8s/38P/YI68Hm
         F8tA==
X-Gm-Message-State: AOAM530a+oxOkh3jwiTmyG7DgAdnyRfuBtz3HUYgmKNNF6gx7EUZtvNF
        TfswVWGN+UaFhrUw4qSXyrUgDsv8b7igLRgeoHG1vo2Mc4mDnSg745PETVbnGHzghfN1gdTIhgn
        CHdXwK50WsmXBeHVqgqJfMV+2kRzBpCQd9+HA7b60pYEqSw==
X-Received: by 2002:ac8:7dd2:: with SMTP id c18mr22423552qte.301.1620649254826;
        Mon, 10 May 2021 05:20:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMunM+w/xF+r8imk3jOy21ySiyKh1GdRxXlfCXnAc7JoAsdSDDjE6CNw9JyHSGV2p/qnWbyw==
X-Received: by 2002:ac8:7dd2:: with SMTP id c18mr22423538qte.301.1620649254655;
        Mon, 10 May 2021 05:20:54 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.49.2])
        by smtp.gmail.com with ESMTPSA id v65sm11805007qkc.125.2021.05.10.05.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 05:20:54 -0700 (PDT)
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etaUPtJqoH9DBDE72nDW7s7iEZHnaJRpKx9zFow02WOZig@mail.gmail.com>
 <9f34ebcd-0c17-cd7f-eb08-52c6c3dc7b03@wanadoo.fr>
 <CAOc6etYwTvVPnoB3BQfuQEikvsCwSs9AqBWnLFrs9zQ0pJGp1A@mail.gmail.com>
 <YJhO0cEqpbJAdv7s@piout.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <219efcc7-ca05-a7d1-5943-d34a42f0d49f@canonical.com>
Date:   Mon, 10 May 2021 08:20:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJhO0cEqpbJAdv7s@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 09/05/2021 17:06, Alexandre Belloni wrote:
> On 08/05/2021 18:06:03-0600, Edmundo Carmona Antoranz wrote:
>> On Sat, May 8, 2021 at 10:59 AM Christophe JAILLET
>> <christophe.jaillet@wanadoo.fr> wrote:
>>>
>>>>
>>>> Following the recent conversations, I think it might make sense to do
>>>> dev_err(&pdev->dev, "Failed to register RTC device: %pe\n", info->rtc_dev);
>>>>
>>>> Is that right?
>>>>
>>>
>>> Yes, it is right, but it should be done in another patch.
>>>
>>> Would you like to give it a try?
>>>
>> Sure, I'll have the patch ready to send it when I see yours on next.
> 
> Does it make sense to print anything at all? Who would use the output?
> Is anyone actually going to read it?

If the RTC core does not print the message, it should be
dev_err_probe().  However the first is recently preferred - RTC core
should do it for all drivers.  I find such error messages useful - helps
easily spotting regressions via dmesg -l err.


Best regards,
Krzysztof
