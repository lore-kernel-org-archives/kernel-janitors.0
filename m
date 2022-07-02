Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E05C433EF
	for <kernel-janitors@archiver.kernel.org>; Sat,  2 Jul 2022 19:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbiGBTh7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 2 Jul 2022 15:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiGBTh6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 2 Jul 2022 15:37:58 -0400
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E967A460
        for <kernel-janitors@vger.kernel.org>; Sat,  2 Jul 2022 12:37:58 -0700 (PDT)
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1o7iwF-0004ry-Vq
        for kernel-janitors@vger.kernel.org; Sat, 02 Jul 2022 21:37:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 2/4] fs/ntfs3: Rename bitmap_size() as ntfs3_bitmap_size()
Date:   Sat, 2 Jul 2022 21:37:51 +0200
Message-ID: <39e65450-eea6-8498-1dcc-a40699b49457@wanadoo.fr>
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
 <56a3cb896ec446ca24e4756042d9f0829afc671a.1656785856.git.christophe.jaillet@wanadoo.fr>
 <YsCVW5Dt3YcE3TLL@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
In-Reply-To: <YsCVW5Dt3YcE3TLL@smile.fi.intel.com>
Cc:     dm-devel@redhat.com, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20220702193751.D8UtA87UNpwJ6Ujt33EVtne6sCJisP88xYIQaIs9ozE@z>

Le 02/07/2022 à 20:58, Andy Shevchenko a écrit :
> On Sat, Jul 02, 2022 at 08:29:27PM +0200, Christophe JAILLET wrote:
>> In order to introduce a bitmap_size() function in the bitmap API, we have
>> to rename functions with a similar name.
> 
> ...
> 
>>   /* NTFS uses quad aligned bitmaps. */
>> -static inline size_t bitmap_size(size_t bits)
>> +static inline size_t ntfs3_bitmap_size(size_t bits)
>>   {
>>   	return ALIGN((bits + 7) >> 3, 8);
> 
> It would be easier to understand in a way
> 
> 	return BITS_TO_BYTES(ALIGN(bits, 64));

This purpose of the patch was only to rename a function, not to modify 
the code itself, even if both version also looks equivalent to me.

So I'll leave it to you or anyone else to change it.

CJ

> 
>>   }
> 



