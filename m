From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 23 Jun 2020 08:05:21 +0000
Subject: Re: new TODO list item
Message-Id: <20200623080521.GA27583@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200421081257.GA131897@infradead.org>
In-Reply-To: <20200421081257.GA131897@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jun 22, 2020 at 08:32:36PM +0200, Christophe JAILLET wrote:
> Le 21/04/2020 ?? 10:12, Christoph Hellwig a ??crit??:
> > Hi Janitors,
> > 
> > if someone feels like helping with a fairly trivial legacy API, the
> > wrappers in include/linux/pci-dma-compat.h should go away.  This is
> > mostly trivially scriptable, except for dma_alloc_coherent, where
> > the GFP_ATOMIC passed by pci_alloc_consisteny should usually be replaced
> > with GFP_KERNEL when not calling from an atomic context.
> > 
> 
> Hi,
> what would be the best approach to work on, it?
> 
> I've processed the current tree, with the coccinelle script below.
> For 'dma_alloc_coherent' calls, I've left a GFP_ on purpose, so that one
> need to wonder which flag is the best.
> 
> 'make'ing the files before sending patches should spot the places were a
> correct flag has not been defined.
> 
> What puzzles me is that the script below >20k lines file and the diffstat
> is:
>     288 files changed, 3963 insertions(+), 3857 deletions(-)
> 
> 
> 1. Does sending patches one file at a time makes sense?

File is a little too small.  Split on a subsystem, or for subsystems
that have a lot of drivers (e.g. scsi or net) on  per-driver basis.

> 2. Should the PCI_DMA_ --> DMA_ conversion should be handled first? (the
> #defined values are the same, it should be straightforward)

I wouldn't bother.

> 3. Should a huge patch series be sent to fix all at once?

I don't think that is helpful.  Just one series (or single patch)
per subsystem.

> 4. Should we update everything except 'dma_alloc_coherent' all at once, then
> one file at a time for the allocation with correct GFP_ flag?

I don't think so.

Btw, we have an issue with drivers/message/fusion where the GFP_ATOMIC
removal would be really useful as in fixing a regression caused by
another change. Can you do that as a trial ASAP and also Cc
Robin Murphy <robin.murphy@arm.com>, Guenter Roeck <linux@roeck-us.net>
and Geert Uytterhoeven <geert@linux-m68k.org>
