From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 17:22:55 +0000
Subject: [PATCH] net: fec: remove redundant assignment to pointer bdp
Message-Id: <20191025172255.4742-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fugang Duan <fugang.duan@nxp.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer bdp is being assigned with a value that is never
read, so the assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index d4d4c72adf49..608196bdd892 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -2706,7 +2706,6 @@ static void fec_enet_free_buffers(struct net_device *ndev)
 
 	for (q = 0; q < fep->num_tx_queues; q++) {
 		txq = fep->tx_queue[q];
-		bdp = txq->bd.base;
 		for (i = 0; i < txq->bd.ring_size; i++) {
 			kfree(txq->tx_bounce[i]);
 			txq->tx_bounce[i] = NULL;
-- 
2.20.1
