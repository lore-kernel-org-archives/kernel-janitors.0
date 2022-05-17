Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1D8C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 May 2022 20:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352893AbiEQUMq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 May 2022 16:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350965AbiEQUMj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 May 2022 16:12:39 -0400
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60ED43ED27
        for <kernel-janitors@vger.kernel.org>; Tue, 17 May 2022 13:12:37 -0700 (PDT)
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1nr3YX-00028E-5c
        for kernel-janitors@vger.kernel.org; Tue, 17 May 2022 22:12:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 2/2] octeon_ep: Fix irq releasing in the error handling
 path of octep_request_irqs()
Date:   Tue, 17 May 2022 22:12:26 +0200
Message-ID: <f59200c5-c720-fe66-f395-31ea096dc300@wanadoo.fr>
References: <cover.1652629833.git.christophe.jaillet@wanadoo.fr>
 <a1b6f082fff4e68007914577961113bc452c8030.1652629833.git.christophe.jaillet@wanadoo.fr>
 <20220517052859.GN4009@kadam>
 <eec880be771e75d60ead01cbf71d83fe070ccde8.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
In-Reply-To: <eec880be771e75d60ead01cbf71d83fe070ccde8.camel@redhat.com>
Cc:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org
Message-ID: <20220517201226.4BHU4KHAnknXsBm7LH6RGBvAgaEEr9Ii1oq1XHz0nzs@z>

Le 17/05/2022 à 10:35, Paolo Abeni a écrit :
> On Tue, 2022-05-17 at 08:28 +0300, Dan Carpenter wrote:
>> On Sun, May 15, 2022 at 05:56:45PM +0200, Christophe JAILLET wrote:
>>> For the error handling to work as expected, the index in the
>>> 'oct->msix_entries' array must be tweaked because, when the irq are
>>> requested there is:
>>> 	msix_entry = &oct->msix_entries[i + num_non_ioq_msix];
>>>
>>> So in the error handling path, 'i + num_non_ioq_msix' should be used
>>> instead of 'i'.
>>>
>>> The 2nd argument of free_irq() also needs to be adjusted.
>>>
>>> Fixes: 37d79d059606 ("octeon_ep: add Tx/Rx processing and interrupt support")
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>> I think that the wording above is awful, but I'm sure you get it.
>>> Feel free to rephrase everything to have it more readable.
>>> ---
>>>   drivers/net/ethernet/marvell/octeon_ep/octep_main.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/ethernet/marvell/octeon_ep/octep_main.c b/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
>>> index 6b60a03574a0..4dcae805422b 100644
>>> --- a/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
>>> +++ b/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
>>> @@ -257,10 +257,12 @@ static int octep_request_irqs(struct octep_device *oct)
>>>   
>>>   	return 0;
>>>   ioq_irq_err:
>>> +	i += num_non_ioq_msix;
>>>   	while (i > num_non_ioq_msix) {
>>
>> This makes my mind hurt so badly.  Can we not just have two variables
>> for the two different loops instead of re-using i?
>>
>>>   		--i;
>>>   		irq_set_affinity_hint(oct->msix_entries[i].vector, NULL);
>>> -		free_irq(oct->msix_entries[i].vector, oct->ioq_vector[i]);
>>> +		free_irq(oct->msix_entries[i].vector,
>>> +			 oct->ioq_vector[i - num_non_ioq_msix]);
>>>   	}
>>
>> ioq_irq_err:
>>          while (--j >= 0) {
>>                  ioq_vector = oct->ioq_vector[j];
>>                  msix_entry = &oct->msix_entries[j + num_non_ioq_msix];
>>
>>                  irq_set_affinity_hint(msix_entry->vector, NULL);
>>                  free_irq(msix_entry->vector, ioq_vector);
>>          }
>>
>> regards,
>> dan carpenter
> 
> I agree the above would be more readable. @Christophe: could you please
> refactor the code as per Dan's suggestion?

Will do.

I was sure that Dan would comment on this unusual pattern :)

CJ

> 
> Thanks!
> 
> Paolo
> 
> 


