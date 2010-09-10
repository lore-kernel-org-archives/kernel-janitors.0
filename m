From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Sep 2010 11:52:34 +0000
Subject: [patch] ixgbevf: potential NULL dereference on allocation failure
Message-Id: <20100910115234.GB5959@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Rose <gregory.v.rose@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If "rx_ring" is NULL then it will oops when we try:

	memcpy(rx_ring, adapter->rx_ring,
		adapter->num_rx_queues * sizeof(struct ixgbevf_ring));

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
To be honest, I'm not sure why the check for need_tx_update is there.
This change has only been compile tested.

diff --git a/drivers/net/ixgbevf/ethtool.c b/drivers/net/ixgbevf/ethtool.c
index 4680b06..7f194aa 100644
--- a/drivers/net/ixgbevf/ethtool.c
+++ b/drivers/net/ixgbevf/ethtool.c
@@ -385,7 +385,7 @@ static int ixgbevf_set_ringparam(struct net_device *netdev,
 	if (new_rx_count != adapter->rx_ring_count) {
 		rx_ring = kcalloc(adapter->num_rx_queues,
 				  sizeof(struct ixgbevf_ring), GFP_KERNEL);
-		if ((!rx_ring) && (need_tx_update)) {
+		if (!rx_ring) {
 			err = -ENOMEM;
 			goto err_rx_setup;
 		}
