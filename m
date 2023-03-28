Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF76FC76196
	for <kernel-janitors@archiver.kernel.org>; Tue, 28 Mar 2023 16:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjC1QFq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 28 Mar 2023 12:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjC1QFp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Mar 2023 12:05:45 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884E6122
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Mar 2023 09:05:43 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2844B21A09;
        Tue, 28 Mar 2023 16:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1680019542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OKOOocGOd7AWllOsBVjHI/ZVfeO3uqy+Vk/EDmJpFwQ=;
        b=LGkiHQPJn1sutNLT89SqgtBJJFQU+hisWQV2b3R9NFWrVHY9h3tDY8K57NHr0BkonRjFT6
        WEvR3aAv3v6uD5WiKDCjwt6fz7FHwvRlrO6TCD8uX9KI9YLxgY8KcMK2Y5rilPoxX1Gu4H
        BFVssSaQe+C/C8trfSWIxvcleBeE2ZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1680019542;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OKOOocGOd7AWllOsBVjHI/ZVfeO3uqy+Vk/EDmJpFwQ=;
        b=q92Gq+wjQHBf1ColWL71T694h0oi/jXyYRTWKHHU2C6of8vVz6wISU5CRpLk0wvfsbfm5O
        xv6WYXkNa4QD+SCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16B6D1390B;
        Tue, 28 Mar 2023 16:05:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id baLaBFYQI2SpMAAAMHmgww
        (envelope-from <vbabka@suse.cz>); Tue, 28 Mar 2023 16:05:42 +0000
Message-ID: <4a7d08d1-7328-047c-52f3-dc62755cdbaf@suse.cz>
Date:   Tue, 28 Mar 2023 18:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [cocci] Reconsidering kfree() calls for null pointers (with SmPL)
Content-Language: en-US
To:     Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr,
        kernel-janitors@vger.kernel.org
References: <6cbcf640-55e5-2f11-4a09-716fe681c0d2@web.de>
From:   Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <6cbcf640-55e5-2f11-4a09-716fe681c0d2@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/28/23 17:55, Markus Elfring wrote:
> Hello,
> 
> I tried the following SmPL script out also on the source files from
> the software “Linux next-20230324”.
> 
> @display@
> expression call, storage;
> identifier target;
> @@
> *storage = call(...);
> *if (!storage)
>     goto target;
>  ...
> *target:
> *kfree(storage)
> 
> 
> 119 source files were found where a check was performed for a failed function call
> and a kfree() call is immediately performed for the same variable.
> Thus a null pointer is probably passed at these source code places.

It is valid to pass a NULL pointer to kfree(), it checks for that.

> I imagine that such code should be reconsidered once more and improved accordingly.

The only potential downside in the scenario is checking storage == NULL
twice. But this is an error handling path, not a fast path. On the other
hand, the code may look like this:

storage = call(...);
if (!storage)
    goto target;

if (some_other_condition)
    goto target;

target:
kfree(storage)


For some_other_condition, we want the kfree(). If you changed the code, to
remove the extra NULL pointer check, you would have:

storage = call(...);
if (!storage)
    goto target1;

if (some_other_condition)
    goto target2;

target2:
kfree(storage)
target1:

The extra goto label and larger code is not worth saving the NULL pointer
check, because this is error handling path.

> How do you think about to achieve any adjustments in this design direction?

Only in cases where it would not make the code more complex, i.e. if there
are no "some_other_condition" that jumps to the same target after allocation
to storage is successful.

Vlastimil

> Regards,
> Markus

