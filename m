From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Jan 2020 13:11:43 +0000
Subject: [PATCH net-next] enetc: Fix an off by one in enetc_setup_tc_txtime()
Message-Id: <20200107131143.jqytedvewberqp5c@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Claudiu Manoil <claudiu.manoil@nxp.com>, Po Liu <po.liu@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The priv->tx_ring[] has 16 elements but only priv->num_tx_rings are
set up, the rest are NULL.  This ">" comparison should be ">=" to avoid
a potential crash.

Fixes: 0d08c9ec7d6e ("enetc: add support time specific departure base on the qos etf")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/freescale/enetc/enetc_qos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_qos.c b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
index e910aaf0f5ec..00382b7c5bd8 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_qos.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
@@ -315,7 +315,7 @@ int enetc_setup_tc_txtime(struct net_device *ndev, void *type_data)
 
 	tc = qopt->queue;
 
-	if (tc < 0 || tc > priv->num_tx_rings)
+	if (tc < 0 || tc >= priv->num_tx_rings)
 		return -EINVAL;
 
 	/* Do not support TXSTART and TX CSUM offload simutaniously */
-- 
2.11.0
