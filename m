Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA6CC433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 12:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53E3561ABD
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 12:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344805AbhKRMtD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Nov 2021 07:49:03 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:47237 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344816AbhKRMsu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Nov 2021 07:48:50 -0500
Received: from [79.2.93.196] (port=41154 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mngnU-0003dY-VQ; Thu, 18 Nov 2021 13:45:49 +0100
Subject: Re: [bug report] mfd: lp87565: Handle optional reset pin
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org
References: <20211117111701.GA23355@kili> <YZYQ9KtYvsP7RfzX@google.com>
 <20211118084731.GL27562@kadam> <YZYWS0N7nluXjfKA@google.com>
 <ca9ee8e3-b996-5703-ffe0-81ccab93b872@lucaceresoli.net>
 <20211118104056.GM27562@kadam>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <44df2169-0666-87db-16ff-270fffa10029@lucaceresoli.net>
Date:   Thu, 18 Nov 2021 13:45:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118104056.GM27562@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 18/11/21 11:40, Dan Carpenter wrote:
> On Thu, Nov 18, 2021 at 10:22:52AM +0100, Luca Ceresoli wrote:
>>
>> As the author of the code to blame, I wrote this patch, but just needed
>> a little time to test it before sending:
>>
>>     lp87565->reset_gpio = devm_gpiod_get_optional(lp87565->dev, "reset",
>>                                                   GPIOD_OUT_LOW);
>>     if (IS_ERR(lp87565->reset_gpio))
>>         return dev_err_probe(lp87565->dev, PTR_ERR(lp87565->reset_gpio),
>>                              "Failed getting reset GPIO");
>>
>>     if (lp87565->reset_gpio) {
>>     ...
>>
>> I prefer to exit on any error as it would be either -EPROBE_DEFER of a
>> _real_ error (e.g. GPIO already in use). If there's no GPIO specified,
>> then devm_gpiod_get_optional() returns NULL and libgpio ignores NULL
>> pointers gracefully.
>>
>> Would that work?
> 
> I generally prefer that as well, because to me optional means it's up to
> the user not that it's up to the kernel.  But it depends on if the
> system can boot without it etc...
> 
> I guess in this case we know that no one was relying on the old behavior
> because that would have crashed so returning errors is safe.

I sent a patch using this approach. I hope it's OK, otherwise I can send
a v2.

Last but not least: thanks Dan for finding and reporting!

-- 
Luca
