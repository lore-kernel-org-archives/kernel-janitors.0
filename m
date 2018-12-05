From: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 05 Dec 2018 03:26:47 +0000
Subject: Re: [PATCH] powerpc/ipic: Fix a bounds check in ipic_set_priority()
Message-Id: <87sgzchcw8.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203144834.ocxntjflfz2idxrb@kili.mountain>
In-Reply-To: <20181203144834.ocxntjflfz2idxrb@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kim Phillips <kim.phillips@freescale.com>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>

Hi Dan,

Thanks for the patch.

Dan Carpenter <dan.carpenter@oracle.com> writes:
> The ipic_info[] array only has 95 elements so I have made the bounds
> check smaller to prevent a read overflow.  It was Smatch that found
> this issue:
>
>     arch/powerpc/sysdev/ipic.c:784 ipic_set_priority()
>     error: buffer overflow 'ipic_info' 95 <= 127
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I wasn't able to find any callers of this code.  Maybe we removed the
> last one in commit b9f0f1bb2bca ("[POWERPC] Adapt ipic driver to new
> host_ops interface, add set_irq_type to set IRQ sense").  So perhaps we
> should just remove it.  I'm not really comfortable doing that myself,
> because I don't know the code well enough and can't build test
> it properly.

Hah wow, last usage removed in 2006!

I don't see any mention of it since then, so I'll remove it. If it
breaks something we can put it back.

Can smatch help us find things like this that are defined non-static but
never used?

cheers
