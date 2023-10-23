Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AB5C25B46
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 20:47:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbjJWUrj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 16:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjJWUrj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 16:47:39 -0400
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371DCD7B
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 13:47:36 -0700 (PDT)
Received: from [10.0.2.15] ([141.170.221.62])
        by smtp.orange.fr with ESMTPA
        id v1plqFHg92JzKv1plqvzZr; Mon, 23 Oct 2023 22:47:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1698094053;
        bh=axaS6ut7d56FpTEPyDiqjzHMIYdmhnFm0+byT96QM+k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=jV5C5uNRPvwY/NxxIpi5P6zV931uG8HU4B1xUejSPAp6pdKR/S2PWRgbI5X2TrDno
         oqcNhLrwy8Wb3cOdvqVf77ZT6UKFSDR3rLchUuqv2Cfan2YXgs8hiFYexbA5blRYZ2
         /lWyZHMcrJZ3SiOTnOel5CpOpsJV03erxSCK0m34lnSaFFu/3Rf1sDsQIICeA6zZ4x
         9SaHgJW65ueK6LEiO4i3h49YsL4/cLFpAnRPv5wXiiNcwdsKb44H2vgFeqmRcPZmVQ
         n1LyrXScmgTc0pMlCZtzBIHJ4RasgPo8YKtT0wMF9QAOfpFk47psgph9+Li1IpiLS1
         BFdR2+5nnh5bw==
X-ME-Helo: [10.0.2.15]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 23 Oct 2023 22:47:33 +0200
X-ME-IP: 141.170.221.62
Message-ID: <34f67950-f35c-02f2-b93a-306ee14457ac@wanadoo.fr>
Date:   Mon, 23 Oct 2023 22:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/4] ACPI: sysfs: Fix some issues in create_of_modalias()
 and create_pnp_modalias()
Content-Language: en-US
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Newsgroups: gmane.linux.kernel,gmane.linux.acpi.devel,gmane.linux.kernel.janitors
References: <cover.1698081019.git.christophe.jaillet@wanadoo.fr>
 <CAJZ5v0h9mfQoiok6URGaw7OHjHCFxPWDxiP68NGe9Ow-8PY0jA@mail.gmail.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CAJZ5v0h9mfQoiok6URGaw7OHjHCFxPWDxiP68NGe9Ow-8PY0jA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 23/10/2023 à 22:09, Rafael J. Wysocki a écrit :
> On Mon, Oct 23, 2023 at 7:32 PM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>
>> All issues have been introduced by the same commit, 8765c5ba1949 ("ACPI
>> / scan: Rework modalias creation when "compatible" is present")
>>
>> The first 2 patches fixe some issues related to string truncation checks
>> and to computation of the available space in the output buffer.
>>
>> The 2 others are just some clean-ups.
>>
>> Christophe JAILLET (4):
>>    ACPI: sysfs: Fix the check for a potential string truncation
>>    ACPI: sysfs: Fix a potential out-of-bound write in
>>      create_of_modalias()
>>    ACPI: sysfs: Remove some useless trailing NULL writes
>>    ACPI: sysfs: Remove some dead code
>>
>>   drivers/acpi/device_sysfs.c | 18 ++++++++----------
>>   1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> --
> 
> Thanks for the fixes!
> 
> I would combine patch [1/4] with patch [2/4] and patch [3/4] with
> patch [4/4], though.
> 
> If that's OK, I can do that while applying the patches.
> 

Hi,

up to you.
Either way is fine for me.

CJ
