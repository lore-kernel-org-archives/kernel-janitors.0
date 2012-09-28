From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 01:15:21 +0000
Subject: ERROR: "pci_find_bus_with" [drivers/pci/hotplug/shpchp.ko] undefined!
Message-Id: <20120928011521.GA5522@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Yinghai,

FYI, kernel build failed on

commit: aba01642c0bab03c32533270b1c1ffe53cc026d8  PCI: add pci_find_bus_with() that with bus hinted info
config: i386-allmodconfig

All error/warnings:

ERROR: "pci_find_bus_with" [drivers/pci/hotplug/shpchp.ko] undefined!
ERROR: "pci_get_next_host_bridge" [drivers/edac/i7core_edac.ko] undefined!

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
