Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16778C3DA78
	for <kernel-janitors@archiver.kernel.org>; Sat, 14 Jan 2023 13:29:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjANN35 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 14 Jan 2023 08:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjANN3z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 14 Jan 2023 08:29:55 -0500
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C856E5241
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Jan 2023 05:29:54 -0800 (PST)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id GgbSpJmw5dQkSGgbTppFc9; Sat, 14 Jan 2023 14:29:49 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 14 Jan 2023 14:29:49 +0100
X-ME-IP: 86.243.2.178
Message-ID: <c039de1b-0412-320c-8e91-d74ab1ffbc02@wanadoo.fr>
Date:   Sat, 14 Jan 2023 14:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 24/30] arm64: cpufeature: Use kstrtobool() instead of
 strtobool()
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
 <5a1b329cda34aec67615c0d2fd326eb0d6634bf7.1667336095.git.christophe.jaillet@wanadoo.fr>
 <Y2J0xJ61iclx6WZG@arm.com>
Content-Language: fr, en-US
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <Y2J0xJ61iclx6WZG@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 02/11/2022 à 14:46, Catalin Marinas a écrit :
> On Tue, Nov 01, 2022 at 10:14:12PM +0100, Christophe JAILLET wrote:
>> strtobool() is the same as kstrtobool().
>> However, the latter is more used within the kernel.
>>
>> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
>> the other function name.
>>
>> While at it, include the corresponding header file (<linux/kstrtox.h>)
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> 

Hi,

This has been A-b 2 months ago, and I've just resent patches in this 
serie that have neither been merged in -next, nor A-b or R-b.

So for this one, it is just a polite reminder. :)

Do you have visibility on when it should be merged?

CJ
