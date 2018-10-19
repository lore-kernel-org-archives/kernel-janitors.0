From: Colin King <colin.king@canonical.com>
Date: Fri, 19 Oct 2018 18:16:15 +0000
Subject: [PATCH][next] igc: fix error return handling from call to netif_set_real_num_tx_queues
Message-Id: <20181019181615.27528-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sasha Neftin <sasha.neftin@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, "David S . Miller" <davem@davemloft.net>, intel-wired-lan@lists.osuosl.org
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to netif_set_real_num_tx_queues is not assigning the error
return to variable err even though the next line checks err for an
error.  Fix this by adding the missing err assignment.

Detected by CoverityScan, CID#1474551 ("Logically dead code")

Fixes: 3df25e4c1e66 ("igc: Add interrupt support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/intel/igc/igc_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 9d85707e8a81..80ddbd987764 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -3358,7 +3358,7 @@ static int __igc_open(struct net_device *netdev, bool resuming)
 		goto err_req_irq;
 
 	/* Notify the stack of the actual queue counts. */
-	netif_set_real_num_tx_queues(netdev, adapter->num_tx_queues);
+	err = netif_set_real_num_tx_queues(netdev, adapter->num_tx_queues);
 	if (err)
 		goto err_set_queues;
 
-- 
2.19.1
