From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Jul 2015 19:51:38 +0000
Subject: [PATCH] net: qlcnic: Deletion of unnecessary memset
Message-Id: <fad6a2ad1e78d8e2624903524548f8d806bf1ef0.1436816968.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shahed.shaikh@qlogic.com, Dept-GELinuxNICDev@qlogic.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to memset memory allocated with vzalloc.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index 2f6cc42..7dbab3c 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -2403,7 +2403,6 @@ int qlcnic_alloc_tx_rings(struct qlcnic_adapter *adapter,
 			qlcnic_free_tx_rings(adapter);
 			return -ENOMEM;
 		}
-		memset(cmd_buf_arr, 0, TX_BUFF_RINGSIZE(tx_ring));
 		tx_ring->cmd_buf_arr = cmd_buf_arr;
 		spin_lock_init(&tx_ring->tx_clean_lock);
 	}
-- 
2.1.4

