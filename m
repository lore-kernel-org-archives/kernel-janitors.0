From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 23:31:10 +0000
Subject: [arm-soc:for-next 73/73] arch/arm/mach-omap2/omap_hwmod_33xx_data.c:22:24: fatal error: plat/mcspi.h
Message-Id: <20120919233110.GC5607@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Arnd,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git for-next
head:   8ebc8820187f3c499a55a0faab82292c3db6df54
commit: 8ebc8820187f3c499a55a0faab82292c3db6df54 [73/73] Merge branch 'next/cleanup' into for-next
config: arm-omap2plus_defconfig

arch/arm/mach-omap2/omap_hwmod_33xx_data.c:22:24: fatal error: plat/mcspi.h: No such file or directory

vim +22 arch/arm/mach-omap2/omap_hwmod_33xx_data.c
    12	 * kind, whether express or implied; without even the implied warranty
    13	 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    14	 * GNU General Public License for more details.
    15	 */
    16	
    17	#include <plat/omap_hwmod.h>
    18	#include <plat/cpu.h>
    19	#include <linux/platform_data/gpio-omap.h>
    20	#include <plat/dma.h>
    21	#include <plat/mmc.h>
  > 22	#include <plat/mcspi.h>
    23	#include <plat/i2c.h>
    24	
    25	#include "omap_hwmod_common_data.h"
    26	
    27	#include "control.h"
    28	#include "cm33xx.h"
    29	#include "prm33xx.h"
    30	#include "prm-regbits-33xx.h"
    31	
    32	/*

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
