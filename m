From: Christophe LEROY <christophe.leroy@c-s.fr>
Date: Thu, 06 Dec 2018 07:18:10 +0000
Subject: Re: [PATCH] powerpc/ipic: Fix a bounds check in ipic_set_priority()
Message-Id: <f570563c-1cc7-fecf-2ed2-58164047ec9d@c-s.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203144834.ocxntjflfz2idxrb@kili.mountain>
 <87sgzchcw8.fsf@concordia.ellerman.id.au>
In-Reply-To: <87sgzchcw8.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Michael Ellerman <mpe@ellerman.id.au>, Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kim Phillips <kim.phillips@freescale.com>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>



Le 05/12/2018 à 04:26, Michael Ellerman a écrit :
> Hi Dan,
> 
> Thanks for the patch.
> 
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>> The ipic_info[] array only has 95 elements so I have made the bounds
>> check smaller to prevent a read overflow.  It was Smatch that found
>> this issue:
>>
>>      arch/powerpc/sysdev/ipic.c:784 ipic_set_priority()
>>      error: buffer overflow 'ipic_info' 95 <= 127
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> I wasn't able to find any callers of this code.  Maybe we removed the
>> last one in commit b9f0f1bb2bca ("[POWERPC] Adapt ipic driver to new
>> host_ops interface, add set_irq_type to set IRQ sense").  So perhaps we
>> should just remove it.  I'm not really comfortable doing that myself,
>> because I don't know the code well enough and can't build test
>> it properly.
> 
> Hah wow, last usage removed in 2006!
> 
> I don't see any mention of it since then, so I'll remove it. If it
> breaks something we can put it back.
> 
> Can smatch help us find things like this that are defined non-static but
> never used?
> 

I think we have to do that carrefully. Some of those functions might be 
used by out-of-tree boards.

I'm thinking especially at ipic_get_mcp_status() and 
ipic_set_mcp_status(). They are used in my 832x boards's machine check 
handler to know when a machine check is a timeout from the 832x watchdog.

Christophe
