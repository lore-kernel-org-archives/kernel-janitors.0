Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2683FC43600
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 17:12:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFB7F613FC
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 17:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241895AbhELRJE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 May 2021 13:09:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34806 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240861AbhELQZr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 May 2021 12:25:47 -0400
Received: from mail-vs1-f71.google.com ([209.85.217.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lgrf4-0006L0-SD
        for kernel-janitors@vger.kernel.org; Wed, 12 May 2021 16:24:38 +0000
Received: by mail-vs1-f71.google.com with SMTP id g28-20020a67d49c0000b0290226baf5716bso11380009vsj.12
        for <kernel-janitors@vger.kernel.org>; Wed, 12 May 2021 09:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tCtdc0pje3aRjWOj2CAvfE8ROanzD/s4FkZcrRj+uXQ=;
        b=CgkrMKeX9ToRmyZYlChjTUHIOBE0tzlLsVzd5xhmtemwI6+Gd6adE2JACvfvkagZDp
         UaLCwGdMZqr9wVD+KPEKLhjB5XaoFCEr/9fSLIzvrz7R9Tg+OnF72/GpvPYDr8A+r0gS
         UcykCmHNE6aezFodks3RQZg/+1adDyA9pfmHdMhq77sCvF5FAFUUyahLPqKPCDmIDlfd
         MtzdrfwxSo8Moqo1zAHsRDVG/yF1eNbEi+9lzsLyHK6wB2JqLgH1jiNhk8VRe/O/tn1w
         gM3jK1XpnFwifxgge6mxeG17Qc3kjfH7iGkdyMF9Oa00jQHbHOtnj2wC5Bg0WlR9DNYo
         tfKg==
X-Gm-Message-State: AOAM531EfOgQEaI1xZcGfNOb3a5D9YpAWcywcFtrIC6Nmb5MuXoF/l0T
        6FF0AsOAnwGXMyaN3j8hnezG443SeZ3zL1x7H8xQI2AdqICEMo0hR5VTjW6WqtB3wdGEhrFZCMX
        oC6VM3fxe7rbfrCOIAjbDWq9enC8xXj5+iDTcWhs30efuvA==
X-Received: by 2002:a67:edd0:: with SMTP id e16mr32113486vsp.4.1620836674099;
        Wed, 12 May 2021 09:24:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzCIIi7dj9wOhAkajl84mMy9AVmrPa/aYZpWXOGRIFFKYx9xsHaIs2QUJBfiCdoQCk58vghQ==
X-Received: by 2002:a67:edd0:: with SMTP id e16mr32113027vsp.4.1620836670303;
        Wed, 12 May 2021 09:24:30 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id s17sm33710vkk.50.2021.05.12.09.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 09:24:28 -0700 (PDT)
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etaUPtJqoH9DBDE72nDW7s7iEZHnaJRpKx9zFow02WOZig@mail.gmail.com>
 <9f34ebcd-0c17-cd7f-eb08-52c6c3dc7b03@wanadoo.fr>
 <CAOc6etYwTvVPnoB3BQfuQEikvsCwSs9AqBWnLFrs9zQ0pJGp1A@mail.gmail.com>
 <YJhO0cEqpbJAdv7s@piout.net>
 <219efcc7-ca05-a7d1-5943-d34a42f0d49f@canonical.com>
 <YJv+mMRcOuTJxLuk@piout.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9b48e433-4e0b-7334-028d-d700e0cdbff0@canonical.com>
Date:   Wed, 12 May 2021 12:24:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJv+mMRcOuTJxLuk@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12/05/2021 12:13, Alexandre Belloni wrote:
> On 10/05/2021 08:20:52-0400, Krzysztof Kozlowski wrote:
>> On 09/05/2021 17:06, Alexandre Belloni wrote:
>>> On 08/05/2021 18:06:03-0600, Edmundo Carmona Antoranz wrote:
>>>> On Sat, May 8, 2021 at 10:59 AM Christophe JAILLET
>>>> <christophe.jaillet@wanadoo.fr> wrote:
>>>>>
>>>>>>
>>>>>> Following the recent conversations, I think it might make sense to do
>>>>>> dev_err(&pdev->dev, "Failed to register RTC device: %pe\n", info->rtc_dev);
>>>>>>
>>>>>> Is that right?
>>>>>>
>>>>>
>>>>> Yes, it is right, but it should be done in another patch.
>>>>>
>>>>> Would you like to give it a try?
>>>>>
>>>> Sure, I'll have the patch ready to send it when I see yours on next.
>>>
>>> Does it make sense to print anything at all? Who would use the output?
>>> Is anyone actually going to read it?
>>
>> If the RTC core does not print the message, it should be
>> dev_err_probe().  However the first is recently preferred - RTC core
>> should do it for all drivers.  I find such error messages useful - helps
>> easily spotting regressions via dmesg -l err.
>>
> 
> The only error path that will not print a message by default (it is
> dev_dbg) is when rtc-ops is NULL which I don't expect would regress
> anyway.

Then the message in the driver is useless and could be removed.

> A better way to remove the dead code would be to switch to
> devm_rtc_allocate_device/devm_rtc_register_device. And even better would
> be to take that opportunity to set range_min and range_max ;)
> 

The driver already uses devm_rtc_device_register() so I think I don't
follow that part.

Best regards,
Krzysztof
