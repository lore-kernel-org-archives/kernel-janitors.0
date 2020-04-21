From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 21 Apr 2020 11:26:16 +0000
Subject: Re: new TODO list item
Message-Id: <20200421112616.GA29634@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200421081257.GA131897@infradead.org>
In-Reply-To: <20200421081257.GA131897@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Apr 21, 2020 at 01:53:25PM +0530, Suraj Upadhyay wrote:
> On Tue, Apr 21, 2020 at 10:12:57AM +0200, Christoph Hellwig wrote:
> > Hi Janitors,
> > 
> > if someone feels like helping with a fairly trivial legacy API, the
> > wrappers in include/linux/pci-dma-compat.h should go away.  This is
> > mostly trivially scriptable, except for dma_alloc_coherent, where
> > the GFP_ATOMIC passed by pci_alloc_consisteny should usually be replaced
> > with GFP_KERNEL when not calling from an atomic context.
> 
> Hii Christoph,
> 	This is my first time posting to kernel-janitors. I would be glad to
> help with this task but suggest me if I should get started with
> something else.

Sure, feel free to get started.  A coccinelle script to do the grunt
work might be useful, though.
