From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 21 Apr 2020 08:12:57 +0000
Subject: new TODO list item
Message-Id: <20200421081257.GA131897@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Janitors,

if someone feels like helping with a fairly trivial legacy API, the
wrappers in include/linux/pci-dma-compat.h should go away.  This is
mostly trivially scriptable, except for dma_alloc_coherent, where
the GFP_ATOMIC passed by pci_alloc_consisteny should usually be replaced
with GFP_KERNEL when not calling from an atomic context.
