From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 13 Jun 2019 19:54:12 +0000
Subject: [PATCH net-next] hinic: Use devm_kasprintf instead of hard coding it
Message-Id: <20190613195412.1702-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aviad.krawczyk@huawei.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'devm_kasprintf' is less verbose than:
   snprintf(NULL, 0, ...);
   devm_kzalloc(...);
   sprintf
so use it instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/huawei/hinic/hinic_rx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_rx.c b/drivers/net/ethernet/huawei/hinic/hinic_rx.c
index 9b4082557ad5..95b09fd110d3 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_rx.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_rx.c
@@ -493,7 +493,7 @@ int hinic_init_rxq(struct hinic_rxq *rxq, struct hinic_rq *rq,
 		   struct net_device *netdev)
 {
 	struct hinic_qp *qp = container_of(rq, struct hinic_qp, rq);
-	int err, pkts, irqname_len;
+	int err, pkts;
 
 	rxq->netdev = netdev;
 	rxq->rq = rq;
@@ -502,13 +502,11 @@ int hinic_init_rxq(struct hinic_rxq *rxq, struct hinic_rq *rq,
 
 	rxq_stats_init(rxq);
 
-	irqname_len = snprintf(NULL, 0, "hinic_rxq%d", qp->q_id) + 1;
-	rxq->irq_name = devm_kzalloc(&netdev->dev, irqname_len, GFP_KERNEL);
+	rxq->irq_name = devm_kasprintf(&netdev->dev, GFP_KERNEL,
+				       "hinic_rxq%d", qp->q_id);
 	if (!rxq->irq_name)
 		return -ENOMEM;
 
-	sprintf(rxq->irq_name, "hinic_rxq%d", qp->q_id);
-
 	pkts = rx_alloc_pkts(rxq);
 	if (!pkts) {
 		err = -ENOMEM;
-- 
2.20.1
