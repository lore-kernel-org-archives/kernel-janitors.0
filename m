From: Bjorn Helgaas <bhelgaas@google.com>
Date: Tue, 11 Sep 2012 14:29:27 +0000
Subject: Re: [pci:next 84/84] arch/powerpc/platforms/powernv/pci-ioda.c:1164:13: error: 'struct pci_dev' has
Message-Id: <CAErSpo58AdDMA0B2is_uLy+LtBhk=ZfY5_EpbigJo1=9gAg6ZQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120911030115.GC23365@localhost>
In-Reply-To: <20120911030115.GC23365@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Sep 10, 2012 at 9:01 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
> head:   488f54cda219cab6e91139b3ba677b4673cdcf20
> commit: 488f54cda219cab6e91139b3ba677b4673cdcf20 [84/84] Merge branch 'pci/gavin-window-alignment' into next
>
> All related error/warning messages:
>
> arch/powerpc/platforms/powernv/pci-ioda.c: In function 'pnv_pci_window_alignment':
> arch/powerpc/platforms/powernv/pci-ioda.c:1164:13: error: 'struct pci_dev' has no member named 'pcie_type'

Fixed, thanks!

> vim +1164 arch/powerpc/platforms/powernv/pci-ioda.c
>   1159          struct pnv_phb *phb = hose->private_data;
>   1160          int num_pci_bridges = 0;
>   1161
>   1162          bridge = bus->self;
>   1163          while (bridge) {
>> 1164                  if (bridge->pcie_type = PCI_EXP_TYPE_PCI_BRIDGE) {
>   1165                          num_pci_bridges++;
>   1166                          if (num_pci_bridges >= 2)
>   1167                                  return 1;
>   1168                  }
>   1169
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
