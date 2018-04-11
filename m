From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 11 Apr 2018 14:17:59 +0000
Subject: Re: [PATCH][next] afs: fix integer overflow when shifting 1 more than 32 places
Message-Id: <1b2c5c1b-0089-5790-6c3a-ff86645a5ec0@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <62e9abc2-b639-419c-afa7-e89054f7dce9@canonical.com>
 <20180411132613.18974-1-colin.king@canonical.com>
 <23535.1523453966@warthog.procyon.org.uk>
 <24493.1523455816@warthog.procyon.org.uk>
In-Reply-To: <24493.1523455816@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/04/18 15:10, David Howells wrote:
> Colin Ian King <colin.king@canonical.com> wrote:
> 
>>>> -	mask = (1 << nr_slots) - 1;
>>>> +	mask = (1ULL << nr_slots) - 1;
>>>
>>> nr_slots cannot be larger than 9, so what I wrote is actually fine and is
>>> more efficient on a 32-bit machine.
>>
>> ok, sorry about the noise.
> 
> It would be possible to cast the value to u64 before assigning it, I suppose.
> Would that help?  E.g.:
> 
> 	mask = (u64)((1 << nr_slots) - 1);
> 
> It looks a bit odd, though, since the cast is made implicitly anyway.

I'm not sure that actually helps,  1 << nr_slots is still evaluating as
a 32 bit value, so that final cast does not may any difference.  Anyhow,
since nr_slots is less than 32 then keeping it the way it was is fine.

> 
> David
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

