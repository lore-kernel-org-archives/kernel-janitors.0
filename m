From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 14 Oct 2012 02:24:57 +0000
Subject: [pci:bug/kbz46481 2/2] (.text+0x17196): undefined reference to `bh_check_bridge'
Message-Id: <20121014022457.GA6795@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Bjorn,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git bug/kbz46481
head:   54a2804aaa64648d842486ec49237583b198b41c
commit: 54a2804aaa64648d842486ec49237583b198b41c [2/2] debug
config: x86_64-allmodconfig # make ARCH=x86_64 
branch date: 3 days ago
commit date: 3 days ago

All error/warnings:

drivers/built-in.o: In function `pci_create_slot':
(.text+0x17196): undefined reference to `bh_check_bridge'
drivers/built-in.o: In function `pci_create_slot':
(.text+0x1730d): undefined reference to `bh_check_bridge'
drivers/built-in.o: In function `pci_create_slot':
(.text+0x173f3): undefined reference to `bh_check_bridge'
drivers/built-in.o: In function `pci_create_slot':
(.text+0x1749d): undefined reference to `bh_check_bridge'
drivers/built-in.o: In function `pci_create_slot':
(.text+0x1752e): undefined reference to `bh_check_bridge'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
