From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 30 Oct 2020 06:33:02 +0000
Subject: Re: new TODO list item
Message-Id: <d9e3c0f2-a2ea-a279-9df4-0c8a908bba14@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200421081257.GA131897@infradead.org>
In-Reply-To: <20200421081257.GA131897@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Le 21/04/2020 à 10:12, Christoph Hellwig a écrit :
> Hi Janitors,
> 
> if someone feels like helping with a fairly trivial legacy API, the
> wrappers in include/linux/pci-dma-compat.h should go away.  This is
> mostly trivially scriptable, except for dma_alloc_coherent, where
> the GFP_ATOMIC passed by pci_alloc_consistent should usually be replaced
> with GFP_KERNEL when not calling from an atomic context.
> 

Hi,
just a small update on the work on progress:

https://elixir.bootlin.com/linux/v5.8/A/ident/pci_alloc_consistent
    --> 88 files
https://elixir.bootlin.com/linux/v5.9/A/ident/pci_alloc_consistent
    --> 62 files
https://elixir.bootlin.com/linux/v5.10-rc1/A/ident/pci_alloc_consistent
    --> 32 files

https://elixir.bootlin.com/linux/v5.8/A/ident/pci_zalloc_consistent
    --> 26 files
https://elixir.bootlin.com/linux/v5.9/A/ident/pci_zalloc_consistent
    --> 19 files
https://elixir.bootlin.com/linux/v5.10-rc1/A/ident/pci_zalloc_consistent
    --> 11 files


None of the drivers/media/pci/* patches has been accepted yet.


CJ
