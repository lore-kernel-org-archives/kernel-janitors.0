Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA71C678D7
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Jan 2023 18:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233960AbjAJSLO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 10 Jan 2023 13:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238956AbjAJSKR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Jan 2023 13:10:17 -0500
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8453F1033
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Jan 2023 10:08:40 -0800 (PST)
Received: from [192.168.1.18] ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id FJ34pw6UszUTHFJ34pLghR; Tue, 10 Jan 2023 19:08:38 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 10 Jan 2023 19:08:38 +0100
X-ME-IP: 86.243.100.34
Message-ID: <f4aa7f0d-50a9-b5e0-e980-1e8e779b48bc@wanadoo.fr>
Date:   Tue, 10 Jan 2023 19:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] bit_spinlock: Include <asm/processor.h>
To:     Vineet Gupta <vgupta@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <8b81101d59a31f4927016c17e49be96754a23380.1673204461.git.christophe.jaillet@wanadoo.fr>
 <b5e0bd90-ff29-d301-30ca-2f12028109ce@kernel.org>
Content-Language: fr, en-GB
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <b5e0bd90-ff29-d301-30ca-2f12028109ce@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 10/01/2023 à 08:19, Vineet Gupta a écrit :
> 
> On 1/8/23 11:04, Christophe JAILLET wrote:
>> In an attempt to simplify some includes in <include/dcache.h>, it
>> appeared, when compiling fs/ecryptfs/dentry.c, that 
>> <linux/bit_spinlock.h>
>> was relying on other includes to get the definition of cpu_relax().
>> (see [1])
>>
>> It broke on arc.
> 
> It its just ARC that broke, maybe we can do something there ?

Hi,

It is all what build-bots have spotted so far :)

I don't think that "fixing" it in ARC is the right approach, unless I 
missed something.

<linux/bit_spinlock.h> does use cpu_relax(), so it should include what 
is need for that, and not rely on other black magic.

CJ

> 
>> Include <asm/processor.h> in <linux/bit_spinlock.h> to fix the issue.
>> This will help remove some un-needed includes from <include/dcache.h>.
>>
>> [1]: https://lore.kernel.org/all/202301082130.LXMj5qkD-lkp@intel.com/
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Not sure who to send this to.
>> get_maintainer.pl is of no help, and the file is untouched from a too 
>> long
>> time.
>>
>> Greg? Dan? Any pointer?
>> ---
>>   include/linux/bit_spinlock.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/linux/bit_spinlock.h b/include/linux/bit_spinlock.h
>> index bbc4730a6505..d0fd2a7afca2 100644
>> --- a/include/linux/bit_spinlock.h
>> +++ b/include/linux/bit_spinlock.h
>> @@ -2,6 +2,7 @@
>>   #ifndef __LINUX_BIT_SPINLOCK_H
>>   #define __LINUX_BIT_SPINLOCK_H
>> +#include <asm/processor.h>
>>   #include <linux/kernel.h>
>>   #include <linux/preempt.h>
>>   #include <linux/atomic.h>
> 
> 

