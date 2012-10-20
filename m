From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 20 Oct 2012 11:08:33 +0000
Subject: [staging:staging-next 15/18] drivers/staging/ipack/carriers/tpci200.c:190:2: error: implicit declara
Message-Id: <20121020110833.GF5714@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Jens,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
head:   1bc7c1c71d7f84baff254868222312bf14915128
commit: 052c4cfc92f5ce6334fdaf6926e7c177bc1cc099 [15/18] staging: ipack: Rename bridges to carriers.
config: parisc-allyesconfig # make ARCH=parisc allyesconfig

Probably need a

        #include <linux/slab.h>

All error/warnings:

drivers/staging/ipack/carriers/tpci200.c: In function 'tpci200_free_irq':
drivers/staging/ipack/carriers/tpci200.c:190:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
drivers/staging/ipack/carriers/tpci200.c: In function 'tpci200_request_irq':
drivers/staging/ipack/carriers/tpci200.c:217:2: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
drivers/staging/ipack/carriers/tpci200.c:217:11: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/staging/ipack/carriers/tpci200.c: In function 'tpci200_install':
drivers/staging/ipack/carriers/tpci200.c:457:17: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/staging/ipack/carriers/tpci200.c: In function 'tpci200_create_device':
drivers/staging/ipack/carriers/tpci200.c:482:3: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/staging/ipack/carriers/tpci200.c: In function 'tpci200_pci_probe':
drivers/staging/ipack/carriers/tpci200.c:505:10: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/staging/ipack/carriers/tpci200.c:509:16: warning: assignment makes pointer from integer without a cast [enabled by default]
cc1: some warnings being treated as errors

vim +190 drivers/staging/ipack/carriers/tpci200.c

40733ed7 drivers/staging/ipack/bridges/tpci200.c Jens Taprogge 2012-09-12  184  
40733ed7 drivers/staging/ipack/bridges/tpci200.c Jens Taprogge 2012-09-12  185  	tpci200_disable_irq(tpci200, dev->slot);
40733ed7 drivers/staging/ipack/bridges/tpci200.c Jens Taprogge 2012-09-12  186  	slot_irq = tpci200->slots[dev->slot].irq;
40733ed7 drivers/staging/ipack/bridges/tpci200.c Jens Taprogge 2012-09-12  187  	/* uninstall handler */
40733ed7 drivers/staging/ipack/bridges/tpci200.c Jens Taprogge 2012-09-12  188  	RCU_INIT_POINTER(tpci200->slots[dev->slot].irq, NULL);
40733ed7 drivers/staging/ipack/bridges/tpci200.c Jens Taprogge 2012-09-12  189  	synchronize_rcu();
40733ed7 drivers/staging/ipack/bridges/tpci200.c Jens Taprogge 2012-09-12 @190  	kfree(slot_irq);
40733ed7 drivers/staging/ipack/bridges/tpci200.c Jens Taprogge 2012-09-12  191  	mutex_unlock(&tpci200->mutex);
40733ed7 drivers/staging/ipack/bridges/tpci200.c Jens Taprogge 2012-09-12  192  	return 0;
40733ed7 drivers/staging/ipack/bridges/tpci200.c Jens Taprogge 2012-09-12  193  }

The code at line 190 was first introduced by commit:
40733ed Staging: ipack/bridges/tpci200: move tpci200_free_irq() and tpci200_request_irq()


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
