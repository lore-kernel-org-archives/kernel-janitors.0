Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B305C6FD18
	for <kernel-janitors@archiver.kernel.org>; Wed, 29 Mar 2023 07:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjC2H2B (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 29 Mar 2023 03:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjC2H1J (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Mar 2023 03:27:09 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD9149CC
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Mar 2023 00:25:48 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 721AF1FE00;
        Wed, 29 Mar 2023 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1680074746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ShwHsB/KkELwzyEZDwa4XqP7hPtXAant2Ydr/uTw7CA=;
        b=YWSGZo4L8d9hfQqbPv84f780i+phz4kSgUnkTiwJthtFaSJOCi0tKl9ro/NHEz0+15LQgQ
        6OsC6kGgm9N/ZmWqbEBY+Rj71nXkN8Syul4DM9TrZ7W6GKTjVzC2ERv9DprOY/JCBbgLju
        YczEXF9UUdQu2lsPROcBUQykrNgMIsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1680074746;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ShwHsB/KkELwzyEZDwa4XqP7hPtXAant2Ydr/uTw7CA=;
        b=tumkoantk15bKBa+IjxzbnshcQYtmizWvZ/3amdRGICZosf1qR4Je0p8AVt7Ig4MH3cJO8
        rab7QDWYDJcXE4BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F110138FF;
        Wed, 29 Mar 2023 07:25:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id lP2NFvrnI2SpPgAAMHmgww
        (envelope-from <vbabka@suse.cz>); Wed, 29 Mar 2023 07:25:46 +0000
Message-ID: <4db2129a-835c-9943-c8c2-54d1d6eca898@suse.cz>
Date:   Wed, 29 Mar 2023 09:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [cocci] Reconsidering kfree() calls for null pointers (with SmPL)
To:     Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr,
        kernel-janitors@vger.kernel.org
References: <6cbcf640-55e5-2f11-4a09-716fe681c0d2@web.de>
 <4a7d08d1-7328-047c-52f3-dc62755cdbaf@suse.cz>
 <e4ba5b28-77b6-8013-ed76-e22e090496cb@web.de>
Content-Language: en-US
From:   Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <e4ba5b28-77b6-8013-ed76-e22e090496cb@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/29/23 08:18, Markus Elfring wrote:
>> It is valid to pass a NULL pointer to kfree(), it checks for that.
>>
>>> I imagine that such code should be reconsidered once more and improved accordingly.
>>
>> The only potential downside in the scenario is checking storage == NULL twice.
> 
> Will programming concerns evolve any further?

It's very unlikely that the behavior of kfree(NULL) will change.

>> But this is an error handling path, not a fast path.
> 
> I hope that also exception handling code can become efficient in more use cases.

Nobody will notice the efficiency, and it's not the only goal, code
readability is also important.

>> On the other hand, the code may look like this:
>>
>> storage = call(...);
>> if (!storage)
>>     goto target;
>>
>> if (some_other_condition)
>>     goto target;
>>
>> target:
>> kfree(storage)
>>
>>
>> For some_other_condition, we want the kfree().
> 
> Allocated resources should be properly released.

Sure. They are properly released in the above example.

>> If you changed the code, to remove the extra NULL pointer check, you would have:
>>
>> storage = call(...);
>> if (!storage)
>>     goto target1;
>>
>> if (some_other_condition)
>>     goto target2;
>>
>> target2:
>> kfree(storage)
> 
> A label like “free_this_resource” can be nicer, can't it?

Sure, name was not the point. Just that there are now 2 labels.

>> target1:
>>
>> The extra goto label and larger code is not worth saving the NULL pointer check,
>> because this is error handling path.
> 
> Some code reviewers and programmers represent other development views.

That's the universal truth :)

> 
>>> How do you think about to achieve any adjustments in this design direction?
>>
>> Only in cases where it would not make the code more complex, i.e. if there
>> are no "some_other_condition" that jumps to the same target after allocation
>> to storage is successful.
> 
> Do you find any implementation details worth for another look also according to
> a special information source?
> https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resources#MEM12C.Considerusingagotochainwhenleavingafunctiononerrorwhenusingandreleasingresources-CompliantSolution%28POSIX,GotoChain%29
> 
> 
> Will circumstances evolve in ways so that you would adjust a desire to stick
> to only a single jump label?

Depends on specific code cleanup. But generally, not if the change is only
to add an extra label to skip over kfree() - I will unlikely consider such
patches as useful.

> Regards,
> Markus

