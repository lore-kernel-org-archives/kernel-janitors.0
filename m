Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF98C43334
	for <kernel-janitors@archiver.kernel.org>; Sat,  2 Jul 2022 19:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbiGBTYe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 2 Jul 2022 15:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiGBTYd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 2 Jul 2022 15:24:33 -0400
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1824261F
        for <kernel-janitors@vger.kernel.org>; Sat,  2 Jul 2022 12:24:32 -0700 (PDT)
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1o7ijF-0009O3-LO
        for kernel-janitors@vger.kernel.org; Sat, 02 Jul 2022 21:24:29 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 1/4] s390/cio: Rename bitmap_size() as idset_bitmap_size()
Date:   Sat, 2 Jul 2022 21:24:24 +0200
Message-ID: <6063ee97-1bbe-2391-78cb-57572851a52c@wanadoo.fr>
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
 <3f2ad7fb91948525f6c52e0d36ec223cd3049c88.1656785856.git.christophe.jaillet@wanadoo.fr>
 <YsCUW6vT7LlAv2UE@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-GB
In-Reply-To: <YsCUW6vT7LlAv2UE@smile.fi.intel.com>
Cc:     dm-devel@redhat.com, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20220702192424.BohNPE9Wzq2P8I_WRneWN2GHxfs60U44zlLl2jtDyC8@z>

Le 02/07/2022 à 20:54, Andy Shevchenko a écrit :
> On Sat, Jul 02, 2022 at 08:29:09PM +0200, Christophe JAILLET wrote:
>> In order to introduce a bitmap_size() function in the bitmap API, we have
>> to rename functions with a similar name.
>>
>> Add a "idset_" prefix and change bitmap_size() into idset_bitmap_size().
>>
>> No functional change.
> 
> ...
> 
>> -		memset(set->bitmap, 0, bitmap_size(num_ssid, num_id));
>> +		memset(set->bitmap, 0, idset_bitmap_size(num_ssid, num_id));
> 
> Why not to use bitmap_zero()?
> 
> ...
> 
>> -	memset(set->bitmap, 0xff, bitmap_size(set->num_ssid, set->num_id));
>> +	memset(set->bitmap, 0xff, idset_bitmap_size(set->num_ssid, set->num_id));
> 
> Why not to use bitmap_fill() ?
> 
> 

Hi,

For this initial step, I wanted to keep changes as minimal as possible 
(i.e just function renaming)

In fact, I plan to send a follow-up patch on this file.
This would remove the newly renamed idset_bitmap_size() function, use 
the bitmap API directly (as you pointed-out) with
"set->num_ssid * set->num_id" as size.

It is already done this way in idset_is_empty(), so it would be more 
consistent.

If the serie needs a v2 (or if required), I can add an additional 5th 
patch for it. Otherwise it will send separatly later.

CJ

