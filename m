From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Sep 2012 04:23:00 +0000
Subject: [arm-soc:next/soc 45/53] arch/arm/mach-omap2/omap_hwmod_33xx_data.c:20:49: fatal error:
Message-Id: <20120921042300.GB26280@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Kevin,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git next/soc
head:   3aec092eed5d8d2b19a62b0aeed3acea9471099a
commit: aa817b2e68af8753bb95777255e22164610342c7 [45/53] ARM: OMAP: AM33xx hwmod: fixup SPI after platform_data move
config: arm-omap2plus_defconfig

All related error/warning messages:

arch/arm/mach-omap2/omap_hwmod_33xx_data.c:20:49: fatal error: linux/platform_data/spi-omap2-mcspi.h: No such file or directory
compilation terminated.

vim +20 arch/arm/mach-omap2/omap_hwmod_33xx_data.c
    14	 * GNU General Public License for more details.
    15	 */
    16	
    17	#include <plat/omap_hwmod.h>
    18	#include <plat/cpu.h>
    19	#include <linux/platform_data/gpio-omap.h>
  > 20	#include <linux/platform_data/spi-omap2-mcspi.h>
    21	#include <plat/dma.h>
    22	#include <plat/mmc.h>
    23	#include <plat/i2c.h>

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
