From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 11 Sep 2012 22:48:42 +0000
Subject: [pci:pci/gavin-window-alignment 5/5] arch/powerpc/platforms/powernv/pci-ioda.c:1164:3: error: implic
Message-Id: <20120911224842.GA11618@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Gavin,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci/gavin-window-alignment
head:   4814ef2ec1b8ebaabfc54bb50578313c2f94119a
commit: 4814ef2ec1b8ebaabfc54bb50578313c2f94119a [5/5] powerpc/powernv: I/O and memory alignment for P2P bridges
config: powerpc-allmodconfig

All related error/warning messages:

arch/powerpc/platforms/powernv/pci-ioda.c: In function 'pnv_pci_window_alignment':
arch/powerpc/platforms/powernv/pci-ioda.c:1164:3: error: implicit declaration of function 'pci_pcie_type' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +1164 arch/powerpc/platforms/powernv/pci-ioda.c
  1159		struct pnv_phb *phb = hose->private_data;
  1160		int num_pci_bridges = 0;
  1161	
  1162		bridge = bus->self;
  1163		while (bridge) {
> 1164			if (pci_pcie_type(bridge) = PCI_EXP_TYPE_PCI_BRIDGE) {
  1165				num_pci_bridges++;
  1166				if (num_pci_bridges >= 2)
  1167					return 1;
  1168			}
  1169	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
