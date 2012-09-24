From: Bjorn Helgaas <bhelgaas@google.com>
Date: Mon, 24 Sep 2012 21:31:17 +0000
Subject: Re: [pci:pci/taku-acpi-pci-host-bridge-v3 7/7] pci_root.c:(.text+0x37830): undefined reference to `p
Message-Id: <CAErSpo5rDnKNf7jj+o_GAwCG8zHb-rQgRCbRHQ-z0O+OVPPn8g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120922003642.GG5959@localhost>
In-Reply-To: <20120922003642.GG5959@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 21, 2012 at 6:36 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Taku,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci/taku-acpi-pci-host-bridge-v3
> head:   e3faec8ea9c8aa683c56fa20ff2c58a4c5857960
> commit: e3faec8ea9c8aa683c56fa20ff2c58a4c5857960 [7/7] PCI/ACPI: Add resource-assign code for devices under hot-added hostbridge
> config: i386-randconfig-b051 (attached as .config)
>
> All related error/warning messages:
>
> drivers/built-in.o: In function `acpi_pci_root_start':
> pci_root.c:(.text+0x37830): undefined reference to `pci_configure_slot'

I dropped this patch ("PCI/ACPI: Add resource-assign code for devices
under hot-added hostbridge") for now.
