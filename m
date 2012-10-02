From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Oct 2012 17:19:20 +0000
Subject: drivers/net/ethernet/3com/3c59x.c:1026:2: error: implicit declaration of function 'pci_iomap'
Message-Id: <20121002171920.GB5431@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi James,

FYI, kernel build failed on

commit: 97a29d59fc222b36bac3ee3a8ae994f65bf7ffdf  [PARISC] fix compile break caused by iomap: make IOPORT/PCI mapping functions conditional
config: mips-allmodconfig

All error/warnings:

drivers/net/ethernet/3com/3c59x.c: In function 'vortex_init_one':
drivers/net/ethernet/3com/3c59x.c:1026:2: error: implicit declaration of function 'pci_iomap' [-Werror=implicit-function-declaration]
drivers/net/ethernet/3com/3c59x.c:1026:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/3com/3c59x.c:1028:10: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/3com/3c59x.c:1038:3: error: implicit declaration of function 'pci_iounmap' [-Werror=implicit-function-declaration]
drivers/net/ethernet/3com/3c59x.c: In function 'vortex_probe1':
drivers/net/ethernet/3com/3c59x.c:1329:18: warning: assignment makes pointer from integer without a cast [enabled by default]
cc1: some warnings being treated as errors

vim +1026 drivers/net/ethernet/3com/3c59x.c

^1da177e drivers/net/3c59x.c (Linus Torvalds   2005-04-16  1014) 
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1015) 	unit = vortex_cards_found;
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1016) 
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1017) 	if (global_use_mmio < 0 && (unit >= MAX_UNITS || use_mmio[unit] < 0)) {
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1018) 		/* Determine the default if the user didn't override us */
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1019) 		vci = &vortex_info_tbl[ent->driver_data];
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1020) 		pci_bar = vci->drv_flags & (IS_CYCLONE | IS_TORNADO) ? 1 : 0;
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1021) 	} else if (unit < MAX_UNITS && use_mmio[unit] >= 0)
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1022) 		pci_bar = use_mmio[unit] ? 1 : 0;
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1023) 	else
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1024) 		pci_bar = global_use_mmio ? 1 : 0;
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1025) 
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07 @1026) 	ioaddr = pci_iomap(pdev, pci_bar, 0);
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1027) 	if (!ioaddr) /* If mapping fails, fall-back to BAR 0... */
900fd17d drivers/net/3c59x.c (John W. Linville 2005-11-07  1028) 		ioaddr = pci_iomap(pdev, 0, 0);
8cd47ea1 drivers/net/3c59x.c (Kulikov Vasiliy  2010-07-21  1029) 	if (!ioaddr) {
8cd47ea1 drivers/net/3c59x.c (Kulikov Vasiliy  2010-07-21  1030) 		pci_disable_device(pdev);
8cd47ea1 drivers/net/3c59x.c (Kulikov Vasiliy  2010-07-21  1031) 		rc = -ENOMEM;
8cd47ea1 drivers/net/3c59x.c (Kulikov Vasiliy  2010-07-21  1032) 		goto out;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
