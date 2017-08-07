From: Geoff Levand <geoff@infradead.org>
Date: Mon, 07 Aug 2017 18:28:12 +0000
Subject: Re: block/ps3vram: Delete an error message for a failed memory allocation in ps3vram_cache_init()
Message-Id: <8d140d00-935c-da0a-ff2e-167abe642bda@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e22ee16a-5f34-46bd-577f-9b7ca75e9035@users.sourceforge.net>
 <b6b5f2f0-bbfe-8471-d8fc-e236ea0b1ea4@infradead.org>
 <dd16f28c-1613-cfb2-5349-07aaac2f2f5a@users.sourceforge.net>
In-Reply-To: <dd16f28c-1613-cfb2-5349-07aaac2f2f5a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 08/07/2017 09:27 AM, SF Markus Elfring wrote:
>>> Omit an extra message for a memory allocation failure in this function.
>>>
>>> This issue was detected by using the Coccinelle software.
>>
>> NACK
>>
>> When a user asks me for help I would certainly like to get 
>> 'Could not allocate cache tags' as apposed to nothing,
> 
> Do you find the default allocation failure report insufficient?

The default is OK.  I didn't consider one would be triggered by
the kzalloc failure.

>> since the return value of ps3vram_cache_init() is not checked.
> 
> Are there any more update candidates to consider for better exception handling?

The return of ps3vram_cache_init() should be checked.  Feel
free to propose others.

-Geoff
