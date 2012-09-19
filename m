From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 23:30:46 +0000
Subject: [arm-soc:for-next 71/73] drivers/bus/omap_l3_noc.c:31:17: fatal error: soc.h: No such file or direct
Message-Id: <20120919233046.GB5607@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Arnd,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git for-next
head:   8ebc8820187f3c499a55a0faab82292c3db6df54
commit: cf3e885b8b87587b304e905201a50aee09de187e [71/73] Merge branch 'testing/__iomem' into for-next
config: arm-omap2plus_defconfig

drivers/bus/omap_l3_noc.c:31:17: fatal error: soc.h: No such file or directory

vim +31 drivers/bus/omap_l3_noc.c
    21	 * USA
    22	 */
    23	#include <linux/module.h>
    24	#include <linux/init.h>
    25	#include <linux/io.h>
    26	#include <linux/platform_device.h>
    27	#include <linux/interrupt.h>
    28	#include <linux/kernel.h>
    29	#include <linux/slab.h>
    30	
  > 31	#include "soc.h"
    32	#include "omap_l3_noc.h"
    33	
    34	/*
    35	 * Interrupt Handler for L3 error detection.
    36	 *	1) Identify the L3 clockdomain partition to which the error belongs to.
    37	 *	2) Identify the slave where the error information is logged
    38	 *	3) Print the logged information.
    39	 *	4) Add dump stack to provide kernel trace.
    40	 *
    41	 * Two Types of errors :

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
