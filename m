From: Bjorn Helgaas <bhelgaas@google.com>
Date: Tue, 11 Sep 2012 23:09:41 +0000
Subject: Re: [pci:pci/gavin-window-alignment 5/5] arch/powerpc/platforms/powernv/pci-ioda.c:1164:3: error: im
Message-Id: <CAErSpo7Gbf8vGfNpuXvMy5GtA9G1eL5fi7xBpzo3pWMPf-OveA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120911224842.GA11618@localhost>
In-Reply-To: <20120911224842.GA11618@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 11, 2012 at 4:48 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Gavin,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci/gavin-window-alignment
> head:   4814ef2ec1b8ebaabfc54bb50578313c2f94119a
> commit: 4814ef2ec1b8ebaabfc54bb50578313c2f94119a [5/5] powerpc/powernv: I/O and memory alignment for P2P bridges
> config: powerpc-allmodconfig
>
> All related error/warning messages:
>
> arch/powerpc/platforms/powernv/pci-ioda.c: In function 'pnv_pci_window_alignment':
> arch/powerpc/platforms/powernv/pci-ioda.c:1164:3: error: implicit declaration of function 'pci_pcie_type' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors

Sorry, this is my fault.  I fixed this earlier, but I did it the wrong way.

What I did before was just update the patch in the
pci/gavin-window-alignment branch.  But what I should have done was to
rebase that branch on top of pci/jiang-pcie-cap, which the branch it
actually depends on (that's where pci_pcie_type() was added).

So I did that rebase and pushed both pci/gavin-window-alignment and
next again.  I think the result is sensible now.

Sorry for the mess.

Bjorn


> vim +1164 arch/powerpc/platforms/powernv/pci-ioda.c
>   1159          struct pnv_phb *phb = hose->private_data;
>   1160          int num_pci_bridges = 0;
>   1161
>   1162          bridge = bus->self;
>   1163          while (bridge) {
>> 1164                  if (pci_pcie_type(bridge) = PCI_EXP_TYPE_PCI_BRIDGE) {
>   1165                          num_pci_bridges++;
>   1166                          if (num_pci_bridges >= 2)
>   1167                                  return 1;
>   1168                  }
>   1169
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
