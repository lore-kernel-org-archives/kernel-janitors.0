From: walter harms <wharms@bfs.de>
Date: Fri, 02 Mar 2012 19:20:59 +0000
Subject: Re: [patch] edac i5000: fix pointer math in i5000_get_mc_regs()
Message-Id: <4F511D9B.10401@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302065441.GB24508@elgon.mountain> <4F508C16.30900@bfs.de> <20120302190932.GI22598@mwanda>
In-Reply-To: <20120302190932.GI22598@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 02.03.2012 20:09, schrieb Dan Carpenter:
> On Fri, Mar 02, 2012 at 10:00:06AM +0100, walter harms wrote:
>>> diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
>>> index 4dc3ac2..fcdc4ab 100644
>>> --- a/drivers/edac/i5000_edac.c
>>> +++ b/drivers/edac/i5000_edac.c
>>> @@ -1130,7 +1130,7 @@ static void i5000_get_mc_regs(struct mem_ctl_info *mci)
>>>  	pci_read_config_dword(pvt->system_address, AMBASE,
>>>  			(u32 *) & pvt->ambase);
>>>  	pci_read_config_dword(pvt->system_address, AMBASE + sizeof(u32),
>>> -			((u32 *) & pvt->ambase) + sizeof(u32));
>>> +			(u32 *)((char *) &pvt->ambase + sizeof(u32)));
>>>  
>>>  	maxdimmperch = pvt->maxdimmperch;
>>>  	maxch = pvt->maxch;
>>
>> i think this is hard to understand. personally i would prefer a union or other
>> more obvious solutions. my suggestion would be to get rid of this.
>>
>> u32 bottom,top;
>>  	pci_read_config_dword(pvt->system_address, AMBASE,
>>   			&bottom);
>> 	pci_read_config_dword(pvt->system_address, AMBASE+ sizeof(u32),
>>   			&top);
>> 	maxdimmperch=(u64)top<<32|bottom;
>> 	
>> you can find this pattern in other parts of the kernel also.
>>
> 
> Sure.  I want to do this again anyway because I see I've missed some
> other parts which have the same bug.  I'll resend a patch later.
> 
> regards,
> dan carpenter

I have no idea how ofter a64bit value is need but perhaps is pci_read_config_qword()
an option ?

re,
 wh
