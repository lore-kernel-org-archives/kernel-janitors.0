From: Yinghai Lu <yinghai@kernel.org>
Date: Wed, 26 Sep 2012 03:57:24 +0000
Subject: Re: [yinghai:for-pci-kill-pci-root-buses 67/69] arch/powerpc/kernel/pci_64.c:215:20: error: unused v
Message-Id: <CAE9FiQW=sLtnVGs67A9RUP8iAkiR_4V7GTPbC6y5Pjez7vgY7w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926022107.GA12055@localhost>
In-Reply-To: <20120926022107.GA12055@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 25, 2012 at 7:21 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Yinghai,
>
> FYI, kernel build failed on
>
> tree:    for-pci-kill-pci-root-buses
> head:   5e4af90ab778188866399b772ac0c0002c1aa95a
> commit: d77b2c8faf39dd5d0fc1e2fea1a367299ee1282b [67/69] PCI, powerpc: kill pci_root_buses in resources reservations
> config: powerpc-chroma_defconfig
>
> All error/warnings:
>
> arch/powerpc/kernel/pci_64.c: In function 'sys_pciconfig_iobase':
> arch/powerpc/kernel/pci_64.c:215:20: error: unused variable 'ln' [-Werror=unused-variable]
> cc1: all warnings being treated as errors
> --
> arch/powerpc/kernel/pci-common.c: In function 'pcibios_resource_survey':
> arch/powerpc/kernel/pci-common.c:1407:4: error: passing argument 1 of 'pcibios_reserve_legacy_regions' from incompatible pointer type [-Werror]
> arch/powerpc/kernel/pci-common.c:1334:20: note: expected 'struct pci_bus *' but argument is of type 'struct pci_host_bridge *'
> cc1: all warnings being treated as errors
>
> vim +215 arch/powerpc/kernel/pci_64.c
>    209  #define IOBASE_ISA_MEM          4
>    210
>    211  long sys_pciconfig_iobase(long which, unsigned long in_bus,
>    212                            unsigned long in_devfn)
>    213  {
>    214          struct pci_controller* hose;
>  > 215          struct list_head *ln;
>    216          struct pci_bus *bus;
>    217          struct device_node *hose_node;
>    218          struct pci_host_bridge *host_bridge = NULL;
>
Fixed.
