From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 04 May 2019 06:53:46 +0000
Subject: [PATCH -next] ARM: ixp4xx: Remove duplicated include from common.c
Message-Id: <20190504070318.56760-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Russell King <linux@armlinux.org.uk>
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/arm/mach-ixp4xx/common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-ixp4xx/common.c b/arch/arm/mach-ixp4xx/common.c
index cc5f15679d29..381f452de28d 100644
--- a/arch/arm/mach-ixp4xx/common.c
+++ b/arch/arm/mach-ixp4xx/common.c
@@ -27,7 +27,6 @@
 #include <linux/cpu.h>
 #include <linux/pci.h>
 #include <linux/sched_clock.h>
-#include <linux/bitops.h>
 #include <linux/irqchip/irq-ixp4xx.h>
 #include <linux/platform_data/timer-ixp4xx.h>
 #include <mach/udc.h>
