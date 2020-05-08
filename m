From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 May 2020 14:37:20 +0000
Subject: [PATCH net] dpaa2-eth: prevent array underflow in update_cls_rule()
Message-Id: <20200508143720.GA410645@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Ioana Radulescu <ruxandra.radulescu@nxp.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "location" is controlled by the user via the ethtool_set_rxnfc()
function.  This update_cls_rule() function checks for array overflows
but it doesn't check if the value is negative.  I have changed the type
to unsigned to prevent array underflows.

Fixes: afb90dbb5f78 ("dpaa2-eth: Add ethtool support for flow classification")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c
index bd13ee48d6230..049afd1d6252d 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c
@@ -635,7 +635,7 @@ static int num_rules(struct dpaa2_eth_priv *priv)
 
 static int update_cls_rule(struct net_device *net_dev,
 			   struct ethtool_rx_flow_spec *new_fs,
-			   int location)
+			   unsigned int location)
 {
 	struct dpaa2_eth_priv *priv = netdev_priv(net_dev);
 	struct dpaa2_eth_cls_rule *rule;
-- 
2.26.2
