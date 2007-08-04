From: Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 04 Aug 2007 16:47:02 +0000
Subject: Re: [PATCH 72] drivers/mmc/core/sdio_bus.c: kmalloc + memset
Message-Id: <20070804094702.9f968b27.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
	<200708010005.25352.m.kozlowski@tuxland.pl>
	<20070804150334.75faf362@poseidon.drzeus.cx>
In-Reply-To: <20070804150334.75faf362@poseidon.drzeus.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Ossman <drzeus-mmc@drzeus.cx>
Cc: Mariusz Kozlowski <m.kozlowski@tuxland.pl>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 4 Aug 2007 15:03:34 +0200 Pierre Ossman <drzeus-mmc@drzeus.cx> wrote:

> On Wed, 1 Aug 2007 00:05:24 +0200
> Mariusz Kozlowski <m.kozlowski@tuxland.pl> wrote:
> 
> > Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
> > 
> >  drivers/mmc/core/sdio_bus.c | 5528 -> 5483 (-45 bytes)
> >  drivers/mmc/core/sdio_bus.o | 70044 -> 69876 (-168 bytes)
> > 
> >  drivers/mmc/core/sdio_bus.c |    4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> 
> Acked-by: Pierre Ossman <drzeus@drzeus.cx>
> 
> Although this is code that only lives in my -mm tree. Should I carry
> this patch instead, perhaps?
> 

Yes please.  I always get confused when a git-tree maintainer says
"Acked-by" rather than "applied, thanks".

But I have these queued in my to-send-to-Pierre-regularly queue,
so things will sort themselves out.
