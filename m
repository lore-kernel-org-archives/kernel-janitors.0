From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Sep 2018 10:35:29 +0000
Subject: [PATCH] ixgbevf: off by one in ixgbevf_ipsec_tx()
Message-Id: <20180919103529.GC9238@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Shannon Nelson <shannon.nelson@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The ipsec->tx_tbl[] array has IXGBE_IPSEC_MAX_SA_COUNT elements so the >
should be a >=.

Fixes: 0062e7cc955e ("ixgbevf: add VF IPsec offload code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/intel/ixgbevf/ipsec.c b/drivers/net/ethernet/intel/ixgbevf/ipsec.c
index 997cea675a37..4fcbeffce52b 100644
--- a/drivers/net/ethernet/intel/ixgbevf/ipsec.c
+++ b/drivers/net/ethernet/intel/ixgbevf/ipsec.c
@@ -470,7 +470,7 @@ int ixgbevf_ipsec_tx(struct ixgbevf_ring *tx_ring,
 	}
 
 	sa_idx = xs->xso.offload_handle - IXGBE_IPSEC_BASE_TX_INDEX;
-	if (unlikely(sa_idx > IXGBE_IPSEC_MAX_SA_COUNT)) {
+	if (unlikely(sa_idx >= IXGBE_IPSEC_MAX_SA_COUNT)) {
 		netdev_err(tx_ring->netdev, "%s: bad sa_idx=%d handle=%lu\n",
 			   __func__, sa_idx, xs->xso.offload_handle);
 		return 0;
