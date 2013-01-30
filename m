From: Joe Perches <joe@perches.com>
Date: Wed, 30 Jan 2013 08:29:23 +0000
Subject: Re: coccinelle and bitmask arithmetic
Message-Id: <1359534563.32305.6.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130127194039.GA18787@elgon.mountain>
 <1359317078.14406.12.camel@joe-AO722> <20130127201947.GO16282@mwanda>
 <9561.1359474916@turing-police.cc.vt.edu>
 <1359475998.4196.26.camel@joe-AO722>
 <alpine.DEB.2.02.1301291847070.3339@hadrien>
 <1359482637.15135.7.camel@joe-AO722> <5108D808.6010405@bfs.de>
In-Reply-To: <5108D808.6010405@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Wed, 2013-01-30 at 09:21 +0100, walter harms wrote:
> Am 29.01.2013 19:03, schrieb Joe Perches:
> > On Tue, 2013-01-29 at 18:49 +0100, Julia Lawall wrote:
> >> How about the following (from today's linux-next).  They appear to be
> >> trying to do the same calculation, once with + and once with |.
> > 
> > (cc'ing the original developer and Russell King)
> > 
> > Likely the it8152_pci_platform_notify uses should use +
> > 
> >> arch/arm/common/it8152.c
> >>
> >> int dma_set_coherent_mask(struct device *dev, u64 mask)
> >> {
> >>         if (mask >= PHYS_OFFSET + SZ_64M - 1)
> >>                 return 0;
> >>
> >>         return -EIO;
> >> }
> >>
> 
> Great hit Joe :)

Julia and the others in the coccinelle group are the ones
with the whizzy program.


