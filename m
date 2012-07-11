From: Fengguang Wu <wfg@linux.intel.com>
Date: Wed, 11 Jul 2012 08:29:44 +0000
Subject: Re: [yinghai:for-pci-pcie-link 104/104] drivers/pci/pcie-sysfs.c:27:25: sparse: symbol 'pcie_link_di
Message-Id: <20120711082944.GA24083@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711082458.GA23164@localhost>
In-Reply-To: <20120711082458.GA23164@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 11, 2012 at 04:24:58PM +0800, wfg@linux.intel.com wrote:
> Hi Yinghai,
> 
> There are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/yinghai/linux-yinghai.git for-pci-pcie-link
> head:   d6396cb3ed85b8a95bd07d9c8f8f70b96a8f3d11
> commit: d6396cb3ed85b8a95bd07d9c8f8f70b96a8f3d11 [104/104] PCI: Add link_disable in /sysfs for pcie device
> 
> All sparse warnings:
> 
> + drivers/pci/pcie-sysfs.c:27:25: sparse: symbol 'pcie_link_disable_attr' was not declared. Should it be static?
>   drivers/pci/pcie-sysfs.c:53:24: sparse: symbol 'pci_dev_pcie_attr_group' was not declared. Should it be static?

Sorry, that 2nd sparse warning is actually false warning.
The full diff won't compile.

Thanks,
Fengguang
