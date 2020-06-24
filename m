From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 24 Jun 2020 07:18:21 +0000
Subject: [PATCH net-next] lan743x: Remove duplicated include from lan743x_main.c
Message-Id: <20200624071821.175075-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Whitehead <bryan.whitehead@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, "David S . Miller" <davem@davemloft.net>, Tim Harvey <tharvey@gateworks.com>, Jakub Kicinski <kuba@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 9585467cf11c..2373e72d2d29 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -15,7 +15,6 @@
 #include <linux/rtnetlink.h>
 #include <linux/iopoll.h>
 #include <linux/crc16.h>
-#include <linux/of_net.h>
 #include "lan743x_main.h"
 #include "lan743x_ethtool.h"
