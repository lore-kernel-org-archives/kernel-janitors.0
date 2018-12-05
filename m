From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 05 Dec 2018 08:11:56 +0000
Subject: Re: [PATCH] powerpc/ipic: Fix a bounds check in ipic_set_priority()
Message-Id: <alpine.DEB.2.21.1812050910030.2670@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203144834.ocxntjflfz2idxrb@kili.mountain>
 <87sgzchcw8.fsf@concordia.ellerman.id.au>
In-Reply-To: <87sgzchcw8.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Kim Phillips <kim.phillips@freescale.com>, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Dan Carpenter <dan.carpenter@oracle.com>



On Wed, 5 Dec 2018, Michael Ellerman wrote:

> Hi Dan,
>
> Thanks for the patch.
>
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> > The ipic_info[] array only has 95 elements so I have made the bounds
> > check smaller to prevent a read overflow.  It was Smatch that found
> > this issue:
> >
> >     arch/powerpc/sysdev/ipic.c:784 ipic_set_priority()
> >     error: buffer overflow 'ipic_info' 95 <= 127
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > I wasn't able to find any callers of this code.  Maybe we removed the
> > last one in commit b9f0f1bb2bca ("[POWERPC] Adapt ipic driver to new
> > host_ops interface, add set_irq_type to set IRQ sense").  So perhaps we
> > should just remove it.  I'm not really comfortable doing that myself,
> > because I don't know the code well enough and can't build test
> > it properly.
>
> Hah wow, last usage removed in 2006!
>
> I don't see any mention of it since then, so I'll remove it. If it
> breaks something we can put it back.
>
> Can smatch help us find things like this that are defined non-static but
> never used?

I wrote a Coccinelle script for this, that just uses grep.  Of course the
results need checking because uses can be constructed within macros using
#.

Are things that are defined static but are never used useful to keep
around?

julia
