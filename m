From: walter harms <wharms@bfs.de>
Date: Wed, 21 Mar 2012 10:50:00 +0000
Subject: Re: [PATCH] [SCSI] pm8001: Add error handler in pm8001_init_sas_add() if kzalloc fails.
Message-Id: <4F69B258.9020906@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1332319785.2909.11.camel@dabdike.int.hansenpartnership.com>
In-Reply-To: <1332319785.2909.11.camel@dabdike.int.hansenpartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 21.03.2012 11:11, schrieb James Bottomley:
> On Wed, 2012-03-21 at 11:58 +0300, Dan Carpenter wrote:
>> On Wed, Mar 21, 2012 at 08:49:45AM +0000, James Bottomley wrote:
>>> On Wed, 2012-03-21 at 14:08 +0530, santosh nayak wrote:
>>>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>>>>
>>>> We need to add error handler if kzalloc fails to allocate and initialize.
>>>> Otherwise it may lead to Null derefernce error in 
>>>> 'pm8001_chip_get_nvmd_req()'.
>>>
>>> It's a GFP_KERNEL allocation.  They sleep until memory is available
>>> (__GFP_WAIT).  It's GFP_ATOMIC that can return NULL.
>>>
>>
>> That's not right at all.  Only __GFP_NOFAIL allocations don't need
>> to be checked.
> 
> Ah, right, that's the option I was thinking of.  __GFP_WAIT may fail if
> we're in direct reclaim or the oom killer gets activated.
> 

I think it is ok to do it anytime. It is useles in the __GFP_NOFAIL case,
but it is more easy to check: avoid exceptions from the rule !

re,
 wh
