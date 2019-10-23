From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 23 Oct 2019 06:29:00 +0000
Subject: [PATCH -next] ARM: OMAP2+: Remove duplicated include from pmic-cpcap.c
Message-Id: <20191023062900.43576-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Hilman <khilman@kernel.org>, Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>
Cc: kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-arm-kernel@lists.infradead.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/arm/mach-omap2/pmic-cpcap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
index 2c2a178d988d..38b0307dc79d 100644
--- a/arch/arm/mach-omap2/pmic-cpcap.c
+++ b/arch/arm/mach-omap2/pmic-cpcap.c
@@ -15,8 +15,6 @@
 #include "voltage.h"
 
 #include <linux/init.h>
-#include <linux/kernel.h>
-#include "pm.h"
 #include "vc.h"
 
 /**
