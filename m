Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FF1C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 25 Apr 2022 16:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243340AbiDYQYg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 25 Apr 2022 12:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243333AbiDYQYf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Apr 2022 12:24:35 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86EE6D1B7
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Apr 2022 09:21:30 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id h83so16391805iof.8
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Apr 2022 09:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m8zyZFhgZtJWBx1ewY9EOqVFGvVP4XffFDuTR4TMpZg=;
        b=MQGT7rHPHJlegzzdydwoJhuaK1pG/0OJnThzowwuLn6x+cXtb77D9y87kJTDstyih4
         YK/CNOa++pAeVSwwTe6cUUrtkx09oMp5w3WBMvA1GfvwY0vxBhcovOYOaasRLYY1ARbM
         OngZjpYsSL2SXEYYNa/u687tdECwchngQQkWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m8zyZFhgZtJWBx1ewY9EOqVFGvVP4XffFDuTR4TMpZg=;
        b=2UhzOwPha0SVQ2swFALIoglFw57I8bfy1BJXU7shcQcIeJFU5ChyrFBfoH/pDDotMh
         fJYJIWu0E5DI9w1Cd1BELEXZo9bHeVKTu9mfxhchkkAX2DQb63Tg4vlkebpN7IIWEzJ0
         ClSpW2AzF5Avfru9c3SHavLyIclvyEC4vQkfBvVfg3b6LQP85eeoBZM1XQRDrLzEKljx
         G/gVU/Z+YWPPj6OP4bdf8eKiN2kA6LJKIG1TPzO/aazRe3GIirsSEOiemT6GIMf2H2Dm
         JGCeeiPS34K8iM0PJ0s7xP+g5vBNIHMjB9Rf8R+tMGyA31Ci3ppXsSWXdHO29UpZ7bvO
         ioKQ==
X-Gm-Message-State: AOAM5319Xl+Pvio+DOJRtvypciaPB/xJyETxxAKPY+zm/+LtMPxNMsOO
        CePOyMauDgx0Xv7AaZ4b+606jQ==
X-Google-Smtp-Source: ABdhPJyMkwLOWnY1zix4ts8sFxUiiA+CSi4WCWiBdfUop6aOA7TnBZaYztTUMenPZ4hB53BjOvzegw==
X-Received: by 2002:a05:6638:41a0:b0:32a:90ae:f7a1 with SMTP id az32-20020a05663841a000b0032a90aef7a1mr7963693jab.101.1650903690100;
        Mon, 25 Apr 2022 09:21:30 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id m8-20020a92cac8000000b002ca9d826c3fsm6495170ilq.34.2022.04.25.09.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 09:21:29 -0700 (PDT)
Subject: Re: [PATCH] selftests/resctrl: Fix null pointer dereference on open
 failed
To:     "Colin King (gmail)" <colin.i.king@gmail.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Shuah Khan <shuah@kernel.org>, Babu Moger <babu.moger@amd.com>,
        Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
        linux-kselftest@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220424211536.1373878-1-colin.i.king@gmail.com>
 <04a35a47-d83a-67a1-5ed4-ba314c6e1ecf@linuxfoundation.org>
 <604ea061-c566-e032-67cf-9bc622aa76ae@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a238cdbb-e5fd-64f1-ea18-8ef2e7481d33@linuxfoundation.org>
Date:   Mon, 25 Apr 2022 10:21:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <604ea061-c566-e032-67cf-9bc622aa76ae@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 4/25/22 10:06 AM, Colin King (gmail) wrote:
> On 25/04/2022 16:51, Shuah Khan wrote:
>> On 4/24/22 3:15 PM, Colin Ian King wrote:
>>> Currently if opening /dev/null fails to open then file pointer fp
>>> is null and further access to fp via fprintf will cause a null
>>> pointer dereference. Fix this by returning a negative error value
>>> when a null fp is detected.
>>>
>>
>> How did you find this problem and how can it be reproduced? Is there
>> a case where test fails to open "/dev/null"?
> 
> Found with static analysis, cppcheck. Open on /dev/null is unlikely to fail, but it's good to fail reliably rather than have a SIGSEGV :-)
> 

I don't see how /dev/null open could fail here in this test.
However, I will take this fix. Please add information how
you found it and include the cppheck log in the commit log
and send me v2.

thanks,
-- Shuah
