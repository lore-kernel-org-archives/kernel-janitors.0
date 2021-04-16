Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587F8C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 18:03:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37E006115B
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 18:03:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244174AbhDPSEU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Apr 2021 14:04:20 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:59928 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243844AbhDPSEU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Apr 2021 14:04:20 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d61 with ME
        id tW3u2400221Fzsu03W3u6H; Fri, 16 Apr 2021 20:03:54 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 16 Apr 2021 20:03:54 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH] checkpatch: Improve ALLOC_ARRAY_ARGS test
To:     Joe Perches <joe@perches.com>, apw@canonical.com,
        dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <a1ac975aaabc9f71397b75254f833920428411e0.1618588673.git.christophe.jaillet@wanadoo.fr>
 <decdb749f0192bd886faa7e8470795fb2644e4f8.camel@perches.com>
 <ec273f46-6709-a1cd-7871-1e1d67fab7dd@wanadoo.fr>
 <698f8bef0fccd425a0f8d1928bc05dfc13787bbe.camel@perches.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <9f1339ba-624c-9975-cd7e-d8fcab1da158@wanadoo.fr>
Date:   Fri, 16 Apr 2021 20:03:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <698f8bef0fccd425a0f8d1928bc05dfc13787bbe.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 16/04/2021 à 19:03, Joe Perches a écrit :
> On Fri, 2021-04-16 at 18:51 +0200, Christophe JAILLET wrote:
>> Le 16/04/2021 à 18:11, Joe Perches a écrit :
>>> On Fri, 2021-04-16 at 17:58 +0200, Christophe JAILLET wrote:
>>>> The devm_ variant of 'kcalloc()' and 'kmalloc_array()' are not tested
>>>> Add the corresponding check.
>>> []
>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> []
>>>> @@ -7006,9 +7006,9 @@ sub process {
>>>>    		}
>>>>    
>>>>
>>>>
>>>>    # check for alloc argument mismatch
>>>> -		if ($line =~ /\b(kcalloc|kmalloc_array)\s*\(\s*sizeof\b/) {
>>>> +		if ($line =~ /\b(devm_|)(kcalloc|kmalloc_array)\s*\(\s*sizeof\b/) {
>>>
>>> Perhaps nicer using
>> I'll send a V2.
>>
>> Thx for the feedback.
>>
>> CJ
>>
>>>
>>> 		if ($line =~ /\b((?:devm_)?(?:kcalloc|kmalloc_array))\s*\*\s*sizeof\b/) {
> 
> The \* above should be \(.
> 

Yes I've seen it when I tested the updated test case.

> I can't type and apparently I don't proofread either.
> I offer the excuse that the * and ( are adjacent on my keyboard...
> 

Well, you should try with a French keyboard :)
Anyway, thanks for taking time for the update.

CJ

> cheers, Joe
> 
> 
> 

