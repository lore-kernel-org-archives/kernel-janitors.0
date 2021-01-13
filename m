From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 13 Jan 2021 20:01:37 +0000
Subject: Re: new TODO list item
Message-Id: <df8bd5f1-fdd0-97be-4fc7-d003faf83af6@wanadoo.fr>
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
> wrappers in include/linux/pci-dma-compat.h should go away.  This is
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
  https://elixir.bootlin.com/linux/v5.10-rc1/A/ident/pci_alloc_consistent
      --> 20 files

  https://elixir.bootlin.com/linux/v5.8/A/ident/pci_zalloc_consistent
      --> 26 files
  https://elixir.bootlin.com/linux/v5.9/A/ident/pci_zalloc_consistent
      --> 19 files
  https://elixir.bootlin.com/linux/v5.10-rc1/A/ident/pci_zalloc_consistent
      --> 11 files
  https://elixir.bootlin.com/linux/v5.11-rc1/A/ident/pci_zalloc_consistent
      --> 4 files


  CJ
