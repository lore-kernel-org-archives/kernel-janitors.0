From: Bjorn Helgaas <bhelgaas@google.com>
Date: Sat, 08 Sep 2012 20:59:32 +0000
Subject: Re: [pci:next 76/77] WARNING: vmlinux.o(.text+0x17fdfe): Section mismatch in reference from the func
Message-Id: <CAErSpo4xE=nfPFUAVGF5mDfY7tDpzbztFXb=aCmgC2OgMCkRQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120908122717.GA24182@localhost>
In-Reply-To: <20120908122717.GA24182@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Matthew Garrett <mjg@redhat.com>, kernel-janitors@vger.kernel.org, linux-pci@vger.kernel.org

Thanks, I dropped pci/mjg-pci-roms-from-efi from my "next" branch for now.

On Sat, Sep 8, 2012 at 6:27 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Matthew,
>
> FYI, there are new compile warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
> head:   97ac9d1f363964dec7fbb20cf3c2e88336b4d801
> commit: 86153d6c3a2ad02b89e10346b116e9ab2a81f1a7 [76/77] x86: Use PCI setup data
> config: i386-randconfig-m021 (attached as .config)
>
> All error/warnings:
>
>
> WARNING: vmlinux.o(.text+0x17fdfe): Section mismatch in reference from the function pcibios_add_device() to the variable .init.data:boot_params
> The function pcibios_add_device() references
> the variable __initdata boot_params.
> This is often because pcibios_add_device lacks a __initdata
> annotation or the annotation of boot_params is wrong.
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
