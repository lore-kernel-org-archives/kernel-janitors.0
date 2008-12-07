From: Nicolas Palix <npalix@diku.dk>
Date: Sun, 07 Dec 2008 14:09:08 +0000
Subject: Re: [PATCH linux-next] powerpc/powermac: Add missing of_node_put
Message-Id: <200812071509.09091.npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200812021445.18670.npalix@diku.dk>
	<18747.13668.304923.709761@cargo.ozlabs.ibm.com>
	<20081207164333.78b69d16.sfr@canb.auug.org.au>
In-Reply-To: <20081207164333.78b69d16.sfr@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Julia Lawall <julia@diku.dk>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>

On Sunday 07 December 2008 06:43:33 Stephen Rothwell wrote:
> Hi Paul,
> 
> On Sun, 7 Dec 2008 13:31:00 +1100 Paul Mackerras <paulus@samba.org> wrote:
> >
> > I'm really in two minds about applying any of the of_node_put patches
> > that only affect powermacs.  The reference counts only matter on
> > platforms where we update the OF device tree at runtime, which is
> > currently only IBM pSeries machines.  Since we don't have any hotplug
> > on powermacs, and never will have, the OF device tree is completely
> > static and we don't actually need refcounts on the nodes at all, so
> > who cares if they're a bit higher than they might be?
> > 
> > In particular, the VIA whose node we're looking for here is built-in
> > on the motherboard, and there can never be more than one, and it can
> > never be removed.
> 
> I my mind it is about consistent use of the API and good examples for
> people to copy.  Also, in about a year you will be presented with the
> same set of patches when a new pair of eyes looks at the same code and
> notices the discrepancy ...
> 
Hi Andrew,

Indeed, there is an updated version of this patch in my second mail
which fixes this issue.
 
http://lkml.org/lkml/2008/12/3/88
 
Moreover, there is still a reference count unbalanced with your patch in the
case where the function returns 1.

Regards,
-- 
Nicolas Palix
