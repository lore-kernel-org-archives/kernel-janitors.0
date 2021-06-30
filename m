Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72132C11F65
	for <kernel-janitors@archiver.kernel.org>; Wed, 30 Jun 2021 06:44:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4067D61582
	for <kernel-janitors@archiver.kernel.org>; Wed, 30 Jun 2021 06:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbhF3GrS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 30 Jun 2021 02:47:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56044 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhF3GrR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 30 Jun 2021 02:47:17 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lyTxn-0008Dq-U5; Wed, 30 Jun 2021 06:44:47 +0000
Subject: Re: [PATCH] staging: r8188eu: Fix while-loop that iterates only once
To:     David Laight <David.Laight@ACULAB.COM>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210629163624.41543-1-colin.king@canonical.com>
 <ff4444d1d2204539945ded9bf06c94e6@AcuMS.aculab.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <b989a309-b706-2197-f0f7-51e838f4fcdf@canonical.com>
Date:   Wed, 30 Jun 2021 07:44:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ff4444d1d2204539945ded9bf06c94e6@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 29/06/2021 22:53, David Laight wrote:
> From: Colin King
>> Sent: 29 June 2021 17:36
>>
>> The while-loop only iterates once becase the post increment test of count
>> being non-zero is false on the first iteration because count is zero. Fix
>> this by incrementing count using pre-increment. Static analysis found the
>> issue on the count > POLLING_LLT_THRESHOLD check always being false since
>> the loop currently just iterates once.
> 
> But that is a very strange 'loop bottom'.
> 
> ...
>> diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
>> b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
>> index d1086699f952..db57f04e7e56 100644
>> --- a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
>> +++ b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
>> @@ -185,7 +185,7 @@ static s32 _LLTWrite(struct adapter *padapter, u32 address, u32 data)
>>  			break;
>>  		}
>>  		udelay(5);
>> -	} while (count++);
>> +	} while (++count);
> 
> Unless 'count' is negative that might as well be 'while (1)'
> with count incremented elsewhere.
> Perhaps the loop top should be:
> 	for (count = 0;; count++) {

I'll rework it, thanks for the input.

> 
>    David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

