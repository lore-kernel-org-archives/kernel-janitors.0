From: Matthew Wilcox <willy@infradead.org>
Date: Thu, 08 Aug 2019 11:24:35 +0000
Subject: Re: [PATCH] net: ethernet: et131x: Use GFP_KERNEL instead of GFP_ATOMIC when allocating tx_ring->tcb
Message-Id: <20190808112435.GF5482@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731073842.16948-1-christophe.jaillet@wanadoo.fr>
 <20190807222346.00002ba7@intel.com>
In-Reply-To: <20190807222346.00002ba7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Brandeburg <jesse.brandeburg@intel.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mark.einon@gmail.com, davem@davemloft.net, f.fainelli@gmail.com, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 07, 2019 at 10:23:46PM -0700, Jesse Brandeburg wrote:
> On Wed, 31 Jul 2019 09:38:42 +0200
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
> > There is no good reason to use GFP_ATOMIC here. Other memory allocations
> > are performed with GFP_KERNEL (see other 'dma_alloc_coherent()' below and
> > 'kzalloc()' in 'et131x_rx_dma_memory_alloc()')
> > 
> > Use GFP_KERNEL which should be enough.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Sure, but generally I'd say GFP_ATOMIC is ok if you're in an init path
> and you can afford to have the allocation thread sleep while memory is
> being found by the kernel.

That's not what GFP_ATOMIC means.  GFP_ATOMIC _will not_ sleep.  GFP_KERNEL
will.
