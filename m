From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 26 Oct 2019 02:51:09 +0000
Subject: [PATCH net-next] net: aquantia: remove unused including <linux/version.h>
Message-Id: <20191026025109.75721-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Egor Pomozov <epomozov@marvell.com>, Igor Russkikh <igor.russkikh@aquantia.com>, "David S . Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_ptp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.h b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.h
index 3de4682f7c06..61486757c789 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.h
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.h
@@ -9,7 +9,6 @@
 #define AQ_PTP_H
 
 #include <linux/net_tstamp.h>
-#include <linux/version.h>
 
 /* Common functions */
 int aq_ptp_init(struct aq_nic_s *aq_nic, unsigned int idx_vec);
