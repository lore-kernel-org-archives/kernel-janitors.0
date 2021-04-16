Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170C5C433ED
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 16:51:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7D106124B
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 16:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237525AbhDPQvh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Apr 2021 12:51:37 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:18738 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235697AbhDPQvg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Apr 2021 12:51:36 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d18 with ME
        id tUr92400N21Fzsu03Ur9Kq; Fri, 16 Apr 2021 18:51:10 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 16 Apr 2021 18:51:10 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH] checkpatch: Improve ALLOC_ARRAY_ARGS test
To:     Joe Perches <joe@perches.com>, apw@canonical.com,
        dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <a1ac975aaabc9f71397b75254f833920428411e0.1618588673.git.christophe.jaillet@wanadoo.fr>
 <decdb749f0192bd886faa7e8470795fb2644e4f8.camel@perches.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <ec273f46-6709-a1cd-7871-1e1d67fab7dd@wanadoo.fr>
Date:   Fri, 16 Apr 2021 18:51:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <decdb749f0192bd886faa7e8470795fb2644e4f8.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 16/04/2021 à 18:11, Joe Perches a écrit :
> On Fri, 2021-04-16 at 17:58 +0200, Christophe JAILLET wrote:
>> The devm_ variant of 'kcalloc()' and 'kmalloc_array()' are not tested
>> Add the corresponding check.
> []
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
>> @@ -7006,9 +7006,9 @@ sub process {
>>   		}
>>   
>>
>>   # check for alloc argument mismatch
>> -		if ($line =~ /\b(kcalloc|kmalloc_array)\s*\(\s*sizeof\b/) {
>> +		if ($line =~ /\b(devm_|)(kcalloc|kmalloc_array)\s*\(\s*sizeof\b/) {
> 
> Perhaps nicer using
Indeed, much better.
I'll send a V2.

Thx for the feedback.

CJ

> 
> 		if ($line =~ /\b((?:devm_)?(?:kcalloc|kmalloc_array))\s*\*\s*sizeof\b/) {
> 
>>   			WARN("ALLOC_ARRAY_ARGS",
>> -			     "$1 uses number as first arg, sizeof is generally wrong\n" . $herecurr);
>> +			     "$1$2 uses number as first arg, sizeof is generally wrong\n" . $herecurr);
> 
> So there's only one capture group and this line doesn't need to be changed.
> 
> 
> 

