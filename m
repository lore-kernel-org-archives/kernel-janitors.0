From: Mao Wenan <maowenan@huawei.com>
Date: Fri, 22 Nov 2019 02:52:40 +0000
Subject: [PATCH -next] enetc: make enetc_setup_tc_mqprio static
Message-Id: <20191122025240.8226-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: claudiu.manoil@nxp.com, davem@davemloft.net, vladimir.oltean@nxp.com, po.liu@nxp.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

While using ARCH=mips CROSS_COMPILE=mips-linux-gnu- command to compile,
make C=2 drivers/net/ethernet/freescale/enetc/enetc.o

one warning can be found:
drivers/net/ethernet/freescale/enetc/enetc.c:1439:5:
warning: symbol 'enetc_setup_tc_mqprio' was not declared.
Should it be static?

This patch make symbol enetc_setup_tc_mqprio static.
Fixes: 34c6adf1977b ("enetc: Configure the Time-Aware Scheduler via tc-taprio offload")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index f6b00c6..27f6fd1 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -1436,7 +1436,7 @@ int enetc_close(struct net_device *ndev)
 	return 0;
 }
 
-int enetc_setup_tc_mqprio(struct net_device *ndev, void *type_data)
+static int enetc_setup_tc_mqprio(struct net_device *ndev, void *type_data)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
 	struct tc_mqprio_qopt *mqprio = type_data;
-- 
2.7.4
