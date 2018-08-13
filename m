From: Yue Haibing <yuehaibing@huawei.com>
Date: Mon, 13 Aug 2018 06:39:21 +0000
Subject: [PATCH net-next] lan743x: lan743x: Remove duplicated include from lan743x_ptp.c
Message-Id: <1534142361-92174-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Whitehead <bryan.whitehead@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, "David S. Miller" <davem@davemloft.net>
Cc: Yue Haibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/microchip/lan743x_ptp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_ptp.c b/drivers/net/ethernet/microchip/lan743x_ptp.c
index 42064fd..029a2af 100644
--- a/drivers/net/ethernet/microchip/lan743x_ptp.c
+++ b/drivers/net/ethernet/microchip/lan743x_ptp.c
@@ -6,7 +6,6 @@
 
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/netdevice.h>
 #include <linux/net_tstamp.h>
 
 #include "lan743x_ptp.h"
