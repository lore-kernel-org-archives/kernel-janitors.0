From: Paul Mackerras <paulus@samba.org>
Date: Sun, 07 Dec 2008 02:31:00 +0000
Subject: Re: [PATCH linux-next] powerpc/powermac: Add missing of_node_put
Message-Id: <18747.13668.304923.709761@cargo.ozlabs.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200812021445.18670.npalix@diku.dk>
	<20081206163449.60757c4a.akpm@linux-foundation.org>
In-Reply-To: <20081206163449.60757c4a.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nicolas Palix <npalix@diku.dk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Julia Lawall <julia@diku.dk>

Andrew Morton writes:

> This still misses a path - if that `return 0' is taken, we still leak
> the reference.
> 
> This is reason #345 why sprinkling return statements all over your code
> is bad.
> 
> I fixed it up thusly.  Please check.

I'm really in two minds about applying any of the of_node_put patches
that only affect powermacs.  The reference counts only matter on
platforms where we update the OF device tree at runtime, which is
currently only IBM pSeries machines.  Since we don't have any hotplug
on powermacs, and never will have, the OF device tree is completely
static and we don't actually need refcounts on the nodes at all, so
who cares if they're a bit higher than they might be?

In particular, the VIA whose node we're looking for here is built-in
on the motherboard, and there can never be more than one, and it can
never be removed.

Paul.
