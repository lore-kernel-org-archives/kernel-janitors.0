From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 29 Jul 2020 02:19:50 +0000
Subject: [PATCH net-next] sfc_ef100: remove duplicated include from ef100_netdev.c
Message-Id: <20200729021950.179850-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Edward Cree <ecree@solarflare.com>, Jakub Kicinski <kuba@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/sfc/ef100_netdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/ef100_netdev.c b/drivers/net/ethernet/sfc/ef100_netdev.c
index 4c3caac2c8cc..ec9ca81fed85 100644
--- a/drivers/net/ethernet/sfc/ef100_netdev.c
+++ b/drivers/net/ethernet/sfc/ef100_netdev.c
@@ -16,7 +16,6 @@
 #include "tx_common.h"
 #include "ef100_netdev.h"
 #include "ef100_ethtool.h"
-#include "efx_common.h"
 #include "nic_common.h"
 #include "ef100_nic.h"
 #include "ef100_tx.h"
