From: walter harms <wharms@bfs.de>
Date: Wed, 04 Jul 2007 09:01:00 +0000
Subject: Re: [KJ] [PATCH] cris/arch-v32: Remove unnecessary cast of	return
Message-Id: <468B61CC.8040205@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46857CC8020000F40000AA4A@lucius.provo.novell.com>
In-Reply-To: <46857CC8020000F40000AA4A@lucius.provo.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Suresh Jayaraman wrote:
> On Tue, 2007-07-03 at 12:32 +0000, walter harms wrote:
>> Suresh Jayaraman wrote:
>>> Remove unnecessary cast of return value of kmalloc() in
>>> cris/arch-v32/mm/intmem.c
>>>
>>> Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
>>> ---
>>>
>>> diff --git a/arch/cris/arch-v32/mm/intmem.c b/arch/cris/arch-v32/mm/intmem.c
>>> index 41ee7f7..d1e0bf4 100644
>>> --- a/arch/cris/arch-v32/mm/intmem.c
>>> +++ b/arch/cris/arch-v32/mm/intmem.c
>>> @@ -27,8 +27,8 @@ static void crisv32_intmem_init(void)
>>>  {
>>>  	static int initiated = 0;
>>>  	if (!initiated) {
>>> -		struct intmem_allocation* alloc >>> -		  (struct intmem_allocation*)kmalloc(sizeof *alloc, GFP_KERNEL);
>>> +		struct intmem_allocation *alloc = kmalloc(sizeof *alloc,
>>> +							  GFP_KERNEL);
>> IMHO every kmalloc() should check if it worked at all
>>
>> 	if (!alloc) {
>> 	  kprintf("no memory panic !\n");
>> 	   return;
> 
>>           }
> 
> If we all agree that kmalloc() checks should be done everwhere, this
> probably can be a separate Kernel Janitor task.
> 

you are right, normaly it would better to have two patches. IMHO for this special case
(since removing a case is small change) you add the check.

The important point is to look not only for "the task" - like removing the cast - but also
for other errors. i may take some time before the next will check that file again.

re,
 wh


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
