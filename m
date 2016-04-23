From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Apr 2016 09:07:02 +0000
Subject: [PATCH] net: tsi108: use NULL for pointer-typed argument
Message-Id: <1461402422-10879-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The first argument of pci_free_consistent has type struct pci_dev *, so use
NULL instead of 0.

The semantic patch that performs this transformation is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@
pci_free_consistent(
- 0
+ NULL
  , ...)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/ethernet/tundra/tsi108_eth.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -u -p a/drivers/net/ethernet/tundra/tsi108_eth.c b/drivers/net/ethernet/tundra/tsi108_eth.c
--- a/drivers/net/ethernet/tundra/tsi108_eth.c
+++ b/drivers/net/ethernet/tundra/tsi108_eth.c
@@ -1314,7 +1314,8 @@ static int tsi108_open(struct net_device
 	data->txring = dma_zalloc_coherent(NULL, txring_size, &data->txdma,
 					   GFP_KERNEL);
 	if (!data->txring) {
-		pci_free_consistent(0, rxring_size, data->rxring, data->rxdma);
+		pci_free_consistent(NULL, rxring_size, data->rxring,
+				    data->rxdma);
 		return -ENOMEM;
 	}
 

