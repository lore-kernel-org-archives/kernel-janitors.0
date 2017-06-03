From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Jun 2017 18:20:28 +0000
Subject: [PATCH 0/9] ARM: OMAP2+: Adjustments for seven function implementations
Message-Id: <e9d44aa5-9208-9ff3-46ec-cd58ac3f4696@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Jun 2017 20:12:34 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (9):
  Delete an error message for a failed memory allocation in omap_mcspi_init()
  Delete an error message for a failed memory allocation in two functions
  Delete an unnecessary variable initialisation in omap_init_mcbsp()
  Improve a size determination in omap_init_mcbsp()
  Delete an error message for a failed memory allocation in omap_init_mcbsp()
  Improve a size determination in sr_dev_init()
  Use kcalloc() in sr_set_nvalues()
  SmartReflex: Delete an error message for a failed memory allocation in two functions
  Delete an error message for a failed memory allocation in omap_timer_init()

 arch/arm/mach-omap2/devices.c   |  4 +---
 arch/arm/mach-omap2/hsmmc.c     |  5 +----
 arch/arm/mach-omap2/mcbsp.c     |  8 +++-----
 arch/arm/mach-omap2/sr_device.c | 15 ++++-----------
 arch/arm/mach-omap2/timer.c     |  4 +---
 5 files changed, 10 insertions(+), 26 deletions(-)

-- 
2.13.0

