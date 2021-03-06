Return-Path: <SRS0=552U=IE=vger.kernel.org=kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00580C433DB
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 Mar 2021 18:18:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCD5865015
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 Mar 2021 18:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbhCFSR7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 6 Mar 2021 13:17:59 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:60967 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhCFSRm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 6 Mar 2021 13:17:42 -0500
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lIbUj-0005gp-1e
        for kernel-janitors@vger.kernel.org; Sat, 06 Mar 2021 18:17:41 +0000
Received: by mail-ed1-f70.google.com with SMTP id l23so2743248edt.23
        for <kernel-janitors@vger.kernel.org>; Sat, 06 Mar 2021 10:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g6bMYZr4IYJb49CfbN85Rd9NqLc1iESc8dgtSRtoAGo=;
        b=iawFRrolx5VmeJmuwJW4T+109dy3XnjvGD6/8+eoebhejG5O26lOnyxZ8Fba7Ymg6P
         LUg8Z42K/4dgtMrRmppGK5IN+KbrBAtQ2xDe9uUom2umnLL8ukYiDKpQwoo5RI5fEzqf
         Di7YNjIyrZw1PQTfOF9QpYqjPUdsWTsE74eCK739QHwHKUiauFyse8rshCp9AJmb9IFo
         A7eW9lmrZ/x/2c2hFflNzmKsn5jrDFz0onuFGFjGD4sH/Ze9oL/oSucWBpWQXsk6P39o
         k6L80nOwy2r7AT+78/sZnZH4ZOEVw0wKn8dSfrYIe8wvLKCdY/gJfcD2f/4vCe+5Gr8v
         3Icg==
X-Gm-Message-State: AOAM532SPBqd26CvsYFFmc24EF8vJJlKtP10zL5+lT1ooC8ihUCpWqzE
        FqhbK9hxwM+WBUkUNtR8RYIYOqMCRx4PFKh/0bxCOvLf87W40PsTYzvDlxUMKDipUvf7SUBvxhu
        gUJiA6dCdQCmWNRBa63wmXOHxqPBGilVcX+OPZHDwlKe45w==
X-Received: by 2002:a17:906:ae96:: with SMTP id md22mr7580993ejb.409.1615054660383;
        Sat, 06 Mar 2021 10:17:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzyGs+Nxo2sFfxp1gHm5M91NoaPL/OtuRamdi2dx6jcRPRH0A02SzA8eLG1btGURV9Y6QD4A==
X-Received: by 2002:a17:906:ae96:: with SMTP id md22mr7580976ejb.409.1615054660202;
        Sat, 06 Mar 2021 10:17:40 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id m7sm3696800ejk.52.2021.03.06.10.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 10:17:39 -0800 (PST)
Subject: Re: [PATCH 2/2 v2] usb: gadget: s3c: Fix the error handling path in
 's3c2410_udc_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        balbi@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
        gustavoars@kernel.org, arnd@arndb.de, ben-linux@fluff.org
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210306142145.3490-1-christophe.jaillet@wanadoo.fr>
 <64c3ca58-639f-95af-35e1-7d5ba240a7c9@canonical.com>
 <1fb088c0-c94c-908e-e607-796f834f45f3@wanadoo.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6b73a1cd-b4b7-baec-1062-b9f1a1634cbd@canonical.com>
Date:   Sat, 6 Mar 2021 19:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1fb088c0-c94c-908e-e607-796f834f45f3@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 06/03/2021 18:22, Christophe JAILLET wrote:
> Le 06/03/2021 à 17:16, Krzysztof Kozlowski a écrit :
>> On 06/03/2021 15:21, Christophe JAILLET wrote:
>>> Some 'clk_prepare_enable()' and 'clk_get()' must be undone in the error
>>> handling path of the probe function, as already done in the remove
>>> function.
>>>
>>> Fixes: 3fc154b6b813 ("USB Gadget driver for Samsung s3c2410 ARM SoC")
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>> v2: Fix a stupid error in the hash in Fixes:
>>> ---
>>>   drivers/usb/gadget/udc/s3c2410_udc.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>
>> Do not ignore received tags but add them before sending a new version of patch.
>> https://lore.kernel.org/linux-samsung-soc/36ef897b-aedc-fcc3-89c8-c602d9733a9b@canonical.com/T/#t
>>
>> Also somehow your 2nd patch is not in-reply to first one. Don't change
>> the settings of sending patches. git format-patch and
>> git send-email default settings are correct. Look here:
>> https://lore.kernel.org/linux-samsung-soc/
>> Only your patches are not threaded.
>>
>> Best regards,
>> Krzysztof
>>
> Hi,
> 
> sorry for missing the typo in the first patch.
> 
> For your other comments above, however, I use standard settings only.
> My patches are generated by commands like:
>     git format-patch -2
> 
> I use cover letter only if it looks useful. In such a case, I use:
>     git format-patch --thread --cover-letter -2
> 
> I've never seen that threading series was the rule and/or that cover 
> letters were a must have. If I'm wrong, sorry, I was not aware of that.

The cover letter is not needed. The threading was missing which is a
default so you had to configure it to that.


Best regards,
Krzysztof
