Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7312BC4338F
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Jul 2021 16:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E23A6052B
	for <kernel-janitors@archiver.kernel.org>; Sun, 25 Jul 2021 16:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhGYQFL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 25 Jul 2021 12:05:11 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:28787 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhGYQFK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 25 Jul 2021 12:05:10 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d27 with ME
        id ZUlf2500821Fzsu03Ulfxs; Sun, 25 Jul 2021 18:45:40 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 25 Jul 2021 18:45:40 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH 09/18] staging: rtl8188eu: remove unused _HAL_INTF_C_
 define
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Martin Kaiser <martin@kaiser.cx>, linux-staging@lists.linux.dev,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210725155902.32433-1-martin@kaiser.cx>
 <20210725155902.32433-9-martin@kaiser.cx>
 <2bfef837-e8f6-0a89-b0ac-967de12ed067@wanadoo.fr>
 <YP2Te4es2Xa8ygp+@kroah.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <7353fbe5-ee02-dd89-6a8e-221ae4641279@wanadoo.fr>
Date:   Sun, 25 Jul 2021 18:45:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YP2Te4es2Xa8ygp+@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 25/07/2021 à 18:38, Greg Kroah-Hartman a écrit :
> On Sun, Jul 25, 2021 at 06:32:10PM +0200, Christophe JAILLET wrote:
>> Le 25/07/2021 à 17:58, Martin Kaiser a écrit :
>>> This define can be removed.
>>>
>>> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
>>> ---
>>>    drivers/staging/rtl8188eu/hal/hal_intf.c | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/rtl8188eu/hal/hal_intf.c b/drivers/staging/rtl8188eu/hal/hal_intf.c
>>> index f09620c54e69..3e132e00c81c 100644
>>> --- a/drivers/staging/rtl8188eu/hal/hal_intf.c
>>> +++ b/drivers/staging/rtl8188eu/hal/hal_intf.c
>>> @@ -5,7 +5,6 @@
>>>     *
>>>     ******************************************************************************/
>>> -#define _HAL_INTF_C_
>>>    #include <hal_intf.h>
>>>    uint rtw_hal_init(struct adapter *adapt)
>>>
>>
>> Hi,
>>
>> This one looks like an include guard.
>>
>> #ifndef _HAL_INTF_C_
>> #define _HAL_INTF_C_
>> ...
>> #endif /* _HAL_INTF_C_ */
>>
>> ?
> 
> But it really does not do anything, so should be dropped as the patch
> does.
> 
> Unless I am reading the code wrong?
> 
> greg k-h
> 

+1, I thought it was a .h file.

Sorry for the noise.

CJ
