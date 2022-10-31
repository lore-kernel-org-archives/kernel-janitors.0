Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE9EECAAA1
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 Oct 2022 20:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiJaUks (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 31 Oct 2022 16:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiJaUkr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 Oct 2022 16:40:47 -0400
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15A0C39
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Oct 2022 13:40:43 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id pbaKoCMnqsfCIpbaKoU2C5; Mon, 31 Oct 2022 21:40:41 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 31 Oct 2022 21:40:41 +0100
X-ME-IP: 86.243.100.34
Message-ID: <788db74a-f3fd-4685-82b9-3257106c6260@wanadoo.fr>
Date:   Mon, 31 Oct 2022 21:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] firmware: ti_sci: Use devm_bitmap_zalloc when applicable
Content-Language: fr
To:     Nishanth Menon <nm@ti.com>
Cc:     kristo@kernel.org, ssantosh@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <1bd77909ff75f62a2228a39db208c4c6d1b3e0e2.1632659746.git.christophe.jaillet@wanadoo.fr>
 <20210927133807.rtkfjkxxlwpdqcnf@scouring>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210927133807.rtkfjkxxlwpdqcnf@scouring>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 27/09/2021 à 15:38, Nishanth Menon a écrit :
> On 14:36-20210926, Christophe JAILLET wrote:
>> 'xfer_alloc_table' is a bitmap. So use 'devm_bitmap_zalloc()' to simplify
>> code and improve the semantic of the code.
>>
>> While at it, remove a redundant 'bitmap_zero()' call.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/firmware/ti_sci.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index 235c7e7869aa..a33eb884102f 100644
>> --- a/drivers/firmware/ti_sci.c
>> +++ b/drivers/firmware/ti_sci.c
>> @@ -3352,13 +3352,11 @@ static int ti_sci_probe(struct platform_device *pdev)
>>   	if (!minfo->xfer_block)
>>   		return -ENOMEM;
>>   
>> -	minfo->xfer_alloc_table = devm_kcalloc(dev,
>> -					       BITS_TO_LONGS(desc->max_msgs),
>> -					       sizeof(unsigned long),
>> -					       GFP_KERNEL);
>> +	minfo->xfer_alloc_table = devm_bitmap_zalloc(dev,
>> +						     desc->max_msgs,
>> +						     GFP_KERNEL);
>>   	if (!minfo->xfer_alloc_table)
>>   		return -ENOMEM;
>> -	bitmap_zero(minfo->xfer_alloc_table, desc->max_msgs);
>>   
>>   	/* Pre-initialize the buffer pointer to pre-allocated buffers */
>>   	for (i = 0, xfer = minfo->xfer_block; i < desc->max_msgs; i++, xfer++) {
>> -- 
>> 2.30.2
>>
> 
> Reviewed-by: Nishanth Menon <nm@ti.com>
> 

Hi,

another similar patch has been merged against 
'drivers/firmware/ti_sci.c' just a few days ago, so this one could also 
be applied.

Let me know if I need to rebase and/or resend it.

CJ
