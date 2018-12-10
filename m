From: Christophe Leroy <christophe.leroy@c-s.fr>
Date: Mon, 10 Dec 2018 12:05:40 +0000
Subject: Re: [PATCH] powerpc/ipic: Fix a bounds check in ipic_set_priority()
Message-Id: <9182f885-5773-d42e-20eb-26923a34e011@c-s.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203144834.ocxntjflfz2idxrb@kili.mountain>
 <87sgzchcw8.fsf@concordia.ellerman.id.au>
 <f570563c-1cc7-fecf-2ed2-58164047ec9d@c-s.fr>
 <878t12ks3f.fsf@concordia.ellerman.id.au>
In-Reply-To: <878t12ks3f.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Michael Ellerman <mpe@ellerman.id.au>, Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kim Phillips <kim.phillips@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>

Le 07/12/2018 à 03:07, Michael Ellerman a écrit :
> Christophe LEROY <christophe.leroy@c-s.fr> writes:
>> Le 05/12/2018 à 04:26, Michael Ellerman a écrit :
>>> Hi Dan,
>>>
>>> Thanks for the patch.
>>>
>>> Dan Carpenter <dan.carpenter@oracle.com> writes:
>>>> The ipic_info[] array only has 95 elements so I have made the bounds
>>>> check smaller to prevent a read overflow.  It was Smatch that found
>>>> this issue:
>>>>
>>>>       arch/powerpc/sysdev/ipic.c:784 ipic_set_priority()
>>>>       error: buffer overflow 'ipic_info' 95 <= 127
>>>>
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>> ---
>>>> I wasn't able to find any callers of this code.  Maybe we removed the
>>>> last one in commit b9f0f1bb2bca ("[POWERPC] Adapt ipic driver to new
>>>> host_ops interface, add set_irq_type to set IRQ sense").  So perhaps we
>>>> should just remove it.  I'm not really comfortable doing that myself,
>>>> because I don't know the code well enough and can't build test
>>>> it properly.
>>>
>>> Hah wow, last usage removed in 2006!
>>>
>>> I don't see any mention of it since then, so I'll remove it. If it
>>> breaks something we can put it back.
>>>
>>> Can smatch help us find things like this that are defined non-static but
>>> never used?
>>>
>>
>> I think we have to do that carrefully. Some of those functions might be
>> used by out-of-tree boards.
> 
> We don't keep unused code around for out-of-tree boards.
> 
> Either the out-of-tree code should be merged upstream, or you can
> maintain whatever extra functions you need as part of your out-of-tree
> code base.
> 
>> I'm thinking especially at ipic_get_mcp_status() and
>> ipic_set_mcp_status(). They are used in my 832x boards's machine check
>> handler to know when a machine check is a timeout from the 832x watchdog.
> 
> Thanks for pointing them out, I'll send a patch to remove them :)

Lol :)

If you are doing the housework, you can remove 
ipic_set_highest_priority() ipic_enable_mcp() and ipic_disable_mcp()


> 
> But seriously, why is your machine check code not in-tree, is there some
> reason you can't merge it?

Maybe because you haven't merged it yet allthough I sent it more than 
three minutes ago. :)

Seriously, that was just left over with other priorities, and also 
because I'm not too happy about it because what I would really like is 
that it kills the userland app if any but don't crash the system when it 
is in interrupt or in idle.

But due to b96672dd840f ("powerpc: Machine check interrupt is a 
non-maskable interrupt"), die_will_crash() doesn't work anymore. So for 
the time being, the patch I sent is not killing anybody, just doing an 
Oops for notification (note that die_will_crash() is used in the Opal 
machine check handler, so it probably doesn't work anymore there either).

Christophe
