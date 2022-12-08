Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72ECC10F1E
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Dec 2022 18:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiLHScB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Dec 2022 13:32:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiLHSb2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Dec 2022 13:31:28 -0500
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83231AE4E5
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Dec 2022 10:31:13 -0800 (PST)
Received: from [192.168.1.18] ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id 3LfhpT2ds1uKA3Lfhpfwkn; Thu, 08 Dec 2022 19:31:02 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 08 Dec 2022 19:31:02 +0100
X-ME-IP: 86.243.100.34
Message-ID: <fbd0748f-9f22-42bb-c388-ce1ea10ef60c@wanadoo.fr>
Date:   Thu, 8 Dec 2022 19:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] mfd: qcom_rpm: Fix an error handling path in
 qcom_rpm_probe()
To:     Lee Jones <lee@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, linux-arm-msm@vger.kernel.org
References: <e39752476d02605b2be46cab7115f71255ce13a8.1668949256.git.christophe.jaillet@wanadoo.fr>
 <Y5HYzzwdWCrpWOTv@google.com>
Content-Language: fr, en-US
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <Y5HYzzwdWCrpWOTv@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 08/12/2022 à 13:30, Lee Jones a écrit :
> On Sun, 20 Nov 2022, Christophe JAILLET wrote:
> 
>> If an error occurs after the clk_prepare_enable() call, a corresponding
>> clk_disable_unprepare() should be called.
>>
>> Simplify code and switch to devm_clk_get_enabled() to fix it.
>>
>> Fixes: 3526403353c2 ("mfd: qcom_rpm: Handle message RAM clock")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> This changes the order of the clean-ups if the .remove() function is called
>> but it looks fine to me.
>> ---
>>   drivers/mfd/qcom_rpm.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> Something funny going on here.
> 
> I received 3 identical versions of the same patch.
> 

Yes, was my fault.

Sorry for the inconvenience.

CJ


